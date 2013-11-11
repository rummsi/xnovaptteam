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
 * @ShowFleet1Page.php
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 0.01  11/Nov/2013 16:12:51
 */

/**
 * Description of ShowFleet1Page
 *
 * @author author XNovaPT Team <xnovaptteam@gmail.com>
 */
class ShowFleet1Page extends AbstractGamePage
{
    function __construct()
    {
        parent::__construct();
        $this->tplObj->compile_id = 'fleet1';
        includeLang('fleet');
    }

    function show()
    {
        global $user, $planetrow, $lang, $resource, $pricelist, $reslist;
        
	$maxfleet  = doquery("SELECT COUNT(fleet_owner) AS `actcnt` FROM {{table}} WHERE `fleet_owner` = '".$user['id']."';", 'fleets', true);
	$MaxFlyingFleets     = $maxfleet['actcnt'];
        //Compteur de flotte en expéditions et nombre d'expédition maximum
        $MaxExpedition      = $user[$resource[124]];
        $maxexpde  = doquery("SELECT COUNT(fleet_owner) AS `expedi` FROM {{table}} WHERE `fleet_owner` = '".$user['id']."' AND `fleet_mission` = '15';", 'fleets', true);
	$ExpeditionEnCours  = $maxexpde['expedi'];
        $EnvoiMaxExpedition = 1 + floor( $MaxExpedition / 3 );
	$MaxFlottes         = 1 + $user[$resource[108]];
	CheckPlanetUsedFields($planetrow);
	$missiontype = array(
            1 => $lang['type_mission'][1],
            2 => $lang['type_mission'][2],
            3 => $lang['type_mission'][3],
            4 => $lang['type_mission'][4],
            5 => $lang['type_mission'][5],
            6 => $lang['type_mission'][6],
            7 => $lang['type_mission'][7],
            8 => $lang['type_mission'][8],
            9 => $lang['type_mission'][9],
            15 => $lang['type_mission'][15]
	);
	// Histoire de recuperer les infos passées par galaxy
	$galaxy         = @$_GET['galaxy'];
	$system         = @$_GET['system'];
	$planet         = @$_GET['planet'];
	$planettype     = @$_GET['planettype'];
	$target_mission = @$_GET['target_mission'];
	if (!$galaxy)
        {
            $this->tplObj->assign('galaxy', $planetrow['galaxy']);
	}
	if (!$system)
        {
            $this->tplObj->assign('system', $planetrow['system']);
	}
	if (!$planet)
        {
            $this->tplObj->assign('planet', $planetrow['planet']);
	}
	if (!$planettype)
        {
            $this->tplObj->assign('planet_type', $planetrow['planet_type']);
	}
	if (!$planetrow)
        {
            message($lang['fl_noplanetrow'], $lang['fl_error']);
	}
	// Prise des coordonnées sur la ligne de commande
	$galaxy         = intval(@$_GET['galaxy']);
	$system         = intval(@$_GET['system']);
	$planet         = intval(@$_GET['planet']);
	$planettype     = intval(@$_GET['planettype']);
	$target_mission = intval(@$_GET['target_mission']);
	$ShipData       = "";
        $page = "";
	foreach ($reslist['fleet'] as $n => $i)
        {
            if ($planetrow[$resource[$i]] > 0)
            {
                $page .= "<tr height=\"20\">";
		$page .= "<th><a title=\"". $lang['fl_fleetspeed'] . @$CurrentShipSpeed ."\">" . $lang['tech'][$i] . "</a></th>";
		$page .= "<th>". pretty_number ($planetrow[$resource[$i]]);
		$ShipData .= "<input type=\"hidden\" name=\"maxship". $i ."\" value=\"". $planetrow[$resource[$i]] ."\" />";
		$ShipData .= "<input type=\"hidden\" name=\"consumption". $i ."\" value=\"". GetShipConsumption ( $i, $user ) ."\" />";
		$ShipData .= "<input type=\"hidden\" name=\"speed" .$i ."\" value=\"" . GetFleetMaxSpeed ("", $i, $user) . "\" />";
		$ShipData .= "<input type=\"hidden\" name=\"capacity". $i ."\" value=\"". $pricelist[$i]['capacity'] ."\" />";
		$page .= "</th>";
                $this->tplObj->assign('ShipData', $ShipData);
		// Satelitte Solaire (eux ne peuvent pas bouger !)
		if ($i == 212)
                {
                    $page .= "<th></th><th></th>";
		} else {
                    $page .= "<th><a href=\"javascript:maxShip('ship". $i ."'); shortInfo();\">".$lang['fl_selmax']."</a> </th>";
                    $page .= "<th><input name=\"ship". $i ."\" size=\"10\" value=\"0\" onfocus=\"javascript:if(this.value == '0') this.value='';\" onblur=\"javascript:if(this.value == '') this.value='0';\" alt=\"". $lang['tech'][$i] . $planetrow[$resource[$i]] ."\" onChange=\"shortInfo()\" onKeyUp=\"shortInfo()\" /></th>";
		}
		$page .= "</tr>";
            }
            $have_ships = true;
            $this->tplObj->assign('have_ships', $have_ships);
	}

        $this->tplObj->assign(array(
            'title'                 => $lang['fl_title'],
            'fl_title'              => $lang['fl_title'],
            'MaxFlyingFleets'       => $MaxFlyingFleets,
            'fl_sur'                => $lang['fl_sur'],
            'MaxFlottes'            => $MaxFlottes,
            'ExpeditionEnCours'     => $ExpeditionEnCours,
            'EnvoiMaxExpedition'    => $EnvoiMaxExpedition,
            'fl_expttl'             => $lang['fl_expttl'],
            'fl_noslotfree'         => $lang['fl_noslotfree'],
            'fl_new_miss'           => $lang['fl_new_miss'],
            'fl_fleet_typ'          => $lang['fl_fleet_typ'],
            'fl_fleet_disp'         => $lang['fl_fleet_disp'],
            'page'                  => $page,
            'fl_noships'            => $lang['fl_noships'],
            'fl_continue'           => $lang['fl_continue'],
            'fl_unselectall'        => $lang['fl_unselectall'],
            'fl_selectall'          => $lang['fl_selectall'],
            'planettype'            => $planettype,
            'target_mission'        => $target_mission,
        ));
        $this->render('fleet.default.tpl');
    }
}
