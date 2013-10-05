<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
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
            $TheCommand     = $_GET['cmd'];
            $Element        = $_GET['building'];
            $ListID         = $_GET['listid'];
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
        
/*	if ($planetrow["field_current"] < ($CurrentMaxFields - $Queue['lenght']))
        {
            $RoomIsOk = true;
	} else {
            $RoomIsOk = false;
	}
                    $BuildingLevel         = $planetrow[$resource[$Element]];
                    $ElementBuildTime      = GetBuildingTime($user, $planetrow, $Element);
        $this->tplObj->assign(array(
            'tech' => $lang['tech'],
            'Allowed_planet_type' => $Allowed[$planetrow['planet_type']],
            'CurrentMaxFields' => CalculateMaxPlanetFields($planetrow),
            'user' => $user,
            'planetrow' => $planetrow,
            'HaveRessources' => IsElementBuyable ($user, $planetrow, $Element, true, false),
            'BuildingLevel' => $planetrow[$resource[$Element]],
            'descriptions' => $lang['res']['descriptions'],
            'time' => ShowBuildTime($ElementBuildTime),
            'price' => GetElementPrice($user, $planetrow, $Element),
            'rest_price' => GetRestPrice($user, $planetrow, $Element),
            'click' => $parse['click'],
            'level' => $lang['level'],
        ));*/
                    
	$BuildingPage        = "";
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
                    $parse['dpath']        = $dpath;
                    $parse['i']            = $Element;
                    $BuildingLevel         = $planetrow[$resource[$Element]];
                    $parse['nivel']        = ($BuildingLevel == 0) ? "" : " (". $lang['level'] ." ". $BuildingLevel .")";
                    $parse['n']            = $ElementName;
                    $parse['descriptions'] = $lang['res']['descriptions'][$Element];
                    $ElementBuildTime      = GetBuildingTime($user, $planetrow, $Element);
                    $parse['time']         = ShowBuildTime($ElementBuildTime);
                    $parse['price']        = GetElementPrice($user, $planetrow, $Element);
                    $parse['rest_price']   = GetRestPrice($user, $planetrow, $Element);
                    $parse['click']        = '';
                    $NextBuildLevel        = $planetrow[$resource[$Element]] + 1;
                    if ($Element == 31)
                    {
			// Sp�cial Laboratoire
			if ($user["b_tech_planet"] != 0 &&     // Si pas 0 y a une recherche en cours
			$game_config['BuildLabWhileRun'] != 1) {  // Variable qui contient le parametre
                            // On verifie si on a le droit d'evoluer pendant les recherches (Setting dans config)
                            $parse['click'] = "<font color=#FF0000>". $lang['in_working'] ."</font>";
			}
                    }
                    if ($parse['click'] != '')
                    {
			// Bin on ne fait rien, vu que l'on l'a deja fait au dessus !!
                    } elseif ($RoomIsOk && $CanBuildElement) {
			if ($Queue['lenght'] == 0)
                        {
                            if ($NextBuildLevel == 1)
                            {
				if ( $HaveRessources == true )
                                {
                                    $parse['click'] = "<a href=\"game.php?page=buildings&cmd=insert&building=". $Element ."\"><font color=#00FF00>". $lang['BuildFirstLevel'] ."</font></a>";
				} else {
                                    $parse['click'] = "<font color=#FF0000>". $lang['BuildFirstLevel'] ."</font>";
				}
                            } else {
				if ( $HaveRessources == true )
                                {
                                    $parse['click'] = "<a href=\"game.php?page=buildings&cmd=insert&building=". $Element ."\"><font color=#00FF00>". $lang['BuildNextLevel'] ." ". $NextBuildLevel ."</font></a>";
				} else {
                                    $parse['click'] = "<font color=#FF0000>". $lang['BuildNextLevel'] ." ". $NextBuildLevel ."</font>";
				}
                            }
			} else {
                            $parse['click'] = "<a href=\"game.php?page=buildings&cmd=insert&building=". $Element ."\"><font color=#00FF00>". $lang['InBuildQueue'] ."</font></a>";
			}
                    } elseif ($RoomIsOk && !$CanBuildElement) {
			if ($NextBuildLevel == 1)
                        {
                            $parse['click'] = "<font color=#FF0000>". $lang['BuildFirstLevel'] ."</font>";
			} else {
                            $parse['click'] = "<font color=#FF0000>". $lang['BuildNextLevel'] ." ". $NextBuildLevel ."</font>";
			}
                    } else {
			$parse['click'] = "<font color=#FF0000>". $lang['NoMoreSpace'] ."</font>";
                    }
                    $BuildingPage .= parsetemplate(gettemplate('buildings_builds_row'), $parse);
		}
            }
	}

	$parse                         = $lang;
        
        $this->tplObj->assign(array(
            'title' => $lang['Buildings'],
            'bld_usedcells' => $lang['bld_usedcells'],
            'bld_theyare' => $lang['bld_theyare'],
            'bld_cellfree' => $lang['bld_cellfree'],
            'Queue_lenght' => $Queue['lenght'],
            'BuildListScript' => InsertBuildListScript ("buildings"),
            'BuildList' => $Queue['buildlist'],
            'planet_field_current' => $planetrow["field_current"],
            'planet_field_max' => $planetrow['field_max'] + ($planetrow[$resource[33]] * 5),
            'field_libre' => ($planetrow['field_max'] + ($planetrow[$resource[33]] * 5)) - $planetrow['field_current'],
            'BuildingsList' => $BuildingPage,
        ));
        $this->render('buildings.default.tpl');
    }
}

?>