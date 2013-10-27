<?php

/*
 * XNovaPT
 * Copyright (C) 2012
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should read the GNU General Public License, see <http://www.gnu.org/licenses/>.
 * 
 * XNovaPT
 * @author XNovaPT Team <xnovaptteam@gmail.com>
 * @ShowBuildingsPage.php
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 0.01  05/Out/2013 14:24:19
 */

/**
 * Description of ShowBuildingsPage
 *
 * @author author XNovaPT Team <xnovaptteam@gmail.com>
 */
class ShowBuildingsPage extends AbstractGamePage
{
    function __construct()
    {
        parent::__construct();
        $this->tplObj->compile_id = 'buildings';
    }

    function show()
    {
        global $lang, $resource, $reslist, $dpath, $game_config, $_GET, $planetrow, $user ;
	includeLang('buildings');
	includeLang('leftmenu');
	CheckPlanetUsedFields($planetrow);
	// Tables des batiments possibles par type de planete
	$Allowed['1'] = array(  1,  2,  3,  4, 12, 14, 15, 21, 22, 23, 24, 31, 33, 34, 44);
	$Allowed['3'] = array( 12, 14, 21, 22, 23, 24, 34, 41, 42, 43);
	// Boucle d'interpretation des eventuelles commandes
	if (isset($_GET['cmd']))
        {
            // On passe une commande
            $bThisIsCheated = false;
            $bDoItNow       = false;
            if (isset($_GET['cmd']))
            {
                $TheCommand     = $_GET['cmd'];
            }
            if (isset($_GET['building']))
            {
                $Element        = $_GET['building'];
            }
            if (isset($_GET['listid']))
            {
                $ListID         = $_GET['listid'];
            }
            if (isset($Element))
            {
		if (!strchr($Element, " "))
                {
                    if (!strchr($Element, ","))
                    {
                        if (!strchr($Element, ";"))
                        {
                            if (in_array(trim($Element), $Allowed[$planetrow['planet_type']]))
                            {
				$bDoItNow = true;
                            } else {
				$bThisIsCheated = true;
                            }
			} else {
                            $bThisIsCheated = true;
			}
                    } else {
                        $bThisIsCheated = true;
                    }
		} else {
                    $bThisIsCheated = true;
		}
            } elseif (isset($ListID)){
		$bDoItNow = true;
            }
            if ($bDoItNow == true)
            {
		switch($TheCommand)
                {
                    case 'cancel':
			// Interrompre le premier batiment de la queue
			CancelBuildingFromQueue ( $planetrow, $user );
			break;
                    case 'remove':
                        // Supprimer un element de la queue (mais pas le premier)
			// $RemID -> element de la liste a supprimer
			RemoveBuildingFromQueue ( $planetrow, $user, $ListID );
			break;
                    case 'insert':
			// Insere un element dans la queue
			AddBuildingToQueue ( $planetrow, $user, $Element, true );
			break;
                    case 'destroy':
			// Detruit un batiment deja construit sur la planete !
			AddBuildingToQueue ( $planetrow, $user, $Element, false );
			break;
                    default:
			break;
		} // switch
            } elseif ($bThisIsCheated == true) {
		ResetThisFuckingCheater ( $user['id'] );
            }
	}
	SetNextQueueElementOnTop ($planetrow, $user);
	$Queue = ShowBuildingQueue ($planetrow, $user);
	// On enregistre ce que l'on a modifi� dans planet !
	BuildingSavePlanetRecord($planetrow);
	// On enregistre ce que l'on a eventuellement modifi� dans users
	BuildingSaveUserRecord($user);
	if ($Queue['lenght'] < MAX_BUILDING_QUEUE_SIZE)
        {
            $CanBuildElement = true;
	} else {
            $CanBuildElement = false;
	}
	foreach($lang['tech'] as $Element => $ElementName)
        {
            if (in_array($Element, $Allowed[$planetrow['planet_type']]))
            {
		$CurrentMaxFields      = CalculateMaxPlanetFields($planetrow);
		if ($planetrow["field_current"] < ($CurrentMaxFields - $Queue['lenght']))
                {
                    $RoomIsOk = true;
		} else {
                    $RoomIsOk = false;
		}
		if (IsTechnologieAccessible($user, $planetrow, $Element))
                {
                    $HaveRessources        = IsElementBuyable ($user, $planetrow, $Element, true, false);
                    $parse                 = array();
		}
            }
	}
        
        $this->tplObj->assign(array(
            'title'                 => $lang['Buildings'],
            'bld_usedcells'         => $lang['bld_usedcells'],
            'bld_theyare'           => $lang['bld_theyare'],
            'bld_cellfree'          => $lang['bld_cellfree'],
            'Queue_lenght'          => $Queue['lenght'],
            'BuildListScript'       => InsertBuildListScript ("buildings"),
            'BuildList'             => $Queue['buildlist'],
            'planet_field_current'  => $planetrow["field_current"],
            'planet_field_max'      => $planetrow['field_max'] + ($planetrow[$resource[33]] * 5),
            'field_libre'           => ($planetrow['field_max'] + ($planetrow[$resource[33]] * 5)) - $planetrow['field_current'],
            'RoomIsOk'              => $RoomIsOk,
            'Allowed'               => $Allowed,
            'BuildingLevel'         => @$planetrow[$resource[$Element]],
            'resource'              => $resource,
            'CanBuildElement'       => $CanBuildElement,
            'Queue'                 => ShowBuildingQueue ($planetrow, $user),
            'NextBuildLevel'        => @$planetrow[$resource[$Element]] + 1,
            'HaveRessources'        => $HaveRessources,
        ));
        $this->render('buildings.default.tpl');
    }
}

?>