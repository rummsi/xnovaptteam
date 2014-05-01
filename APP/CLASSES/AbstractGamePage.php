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
 * @AbstractGamePage.php
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 0.01  22/Set/2013 14:22:23
 */

/**
 * Description of AbstractGamePage
 *
 * @author author XNovaPT Team <xnovaptteam@gmail.com>
 */
abstract class AbstractGamePage {

    protected $tplObj;
    protected $window;
    public $defaultWindow = 'full';

    function __construct() {
        if (!AJAX_REQUEST) {
            $this->setWindow($this->defaultWindow);
            $this->initTemplate();
        } else {
            $this->setWindow('ajax');
        }
    }

    protected function setWindow($window) {
        $this->window = $window;
    }

    protected function initTemplate() {
        if (isset($this->tplObj)) {
            return true;
        }
        $this->tplObj = new template;
        list($tplDir) = $this->tplObj->getTemplateDir();
        $this->tplObj->setTemplateDir($tplDir . 'game/');
        return true;
    }

    protected function render($file) {
        global $langInfos, $user, $planetrow;

        if ($this->getWindow() !== 'ajax') {
            $this->ShowNavigationMenus($user, $planetrow);
        }

        $this->tplObj->assign(array(
            'dpath' => DEFAULT_SKINPATH,
            'encoding' => $langInfos['ENCODING'],
        ));

        $this->tplObj->display('extends:layout.' . $this->getWindow() . '.tpl|' . $file);
        exit;
    }

    protected function getWindow() {
        return $this->window;
    }

    protected function getQueryString() {
        $queryString = array();
        $page = HTTP::_GP('page', '');
        if (!empty($page)) {
            $queryString['page'] = $page;
        }
        $mode = HTTP::_GP('mode', '');
        if (!empty($mode)) {
            $queryString['mode'] = $mode;
        }
        return http_build_query($queryString);
    }

    function ShowNavigationMenus() {
        global $lang, $user, $game_config, $planetrow;

        includeLang('leftmenu');
        includeLang('topnav');

        $rank = doquery("SELECT `total_rank` FROM {{table}} WHERE `stat_code` = '1' AND `stat_type` = '1' AND `id_owner` = '" . $user['id'] . "';", 'statpoints', true);
        $this->tplObj->assign(array(
            'XNovaRelease' => VERSION,
            'user_rank' => $rank['total_rank'],
            'lm_tx_game' => $game_config['game_speed'] / 2500,
            'lm_tx_fleet' => $game_config['fleet_speed'] / 2500,
            'lm_tx_queue' => MAX_FLEET_OR_DEFS_PER_ROW,
            'user' => $user,
            'lang' => $lang,
            'game_config' => $game_config,
            'lm_tx_queue' => MAX_FLEET_OR_DEFS_PER_ROW,
        ));

        if ($user) {
            if (!$planetrow) {
                $planetrow = doquery("SELECT * FROM {{table}} WHERE `id` = '" . $user['current_planet'] . "';", 'planets', true);
            }

            $this->tplObj->assign(array(
                'planetrow' => $planetrow,
                'ThisUsersPlanets' => SortUserPlanets($user),
                'page' => filter_input(INPUT_GET, 'page'),
                'mode' => HTTP::_GP('mode', ''),
            ));
        }

        if ($user['id'] != '') {
            // -----------------------------------------------------------------------------------------------
            // --- Gestion de la liste des planetes ----------------------------------------------------------
            // Planetes ...
            $Order = ($user['planet_sort_order'] == 1) ? "DESC" : "ASC";
            $Sort = $user['planet_sort'];
            $QryPlanets = "SELECT * FROM {{table}} WHERE `id_owner` = '" . $user['id'] . "' ORDER BY ";
            if ($Sort == 0) {
                $QryPlanets .= "`id` " . $Order;
            } elseif ($Sort == 1) {
                $QryPlanets .= "`galaxy`, `system`, `planet`, `planet_type` " . $Order;
            } elseif ($Sort == 2) {
                $QryPlanets .= "`name` " . $Order;
            }
            $planets_query = doquery($QryPlanets, 'planets');
            $Colone = 1;
            $AllPlanets = "<tr>";
            while ($UserPlanet = mysql_fetch_array($planets_query)) {
                PlanetResourceUpdate($user, $UserPlanet, time());
                if ($UserPlanet["id"] != $user["current_planet"] && $UserPlanet['planet_type'] != 3) {
                    $AllPlanets .= "<th>" . $UserPlanet['name'] . "<br>";
                    @$AllPlanets .= "<a href=\"?page=overview&cp=" . $UserPlanet['id'] . "&re=0\" title=\"" . $UserPlanet['name'] . "\"><img src=\"" . $dpath . "planeten/small/s_" . $UserPlanet['image'] . ".jpg\" height=\"50\" width=\"50\"></a><br>";
                    $AllPlanets .= "<center>";
                    if ($UserPlanet['b_building'] != 0) {
                        UpdatePlanetBatimentQueueList($UserPlanet, $user);
                        if ($UserPlanet['b_building'] != 0) {
                            $BuildQueue = $UserPlanet['b_building_id'];
                            $QueueArray = explode(";", $BuildQueue);
                            $CurrentBuild = explode(",", $QueueArray[0]);
                            $BuildElement = $CurrentBuild[0];
                            $BuildLevel = $CurrentBuild[1];
                            $BuildRestTime = pretty_time($CurrentBuild[3] - time());
                            $AllPlanets .= '' . $lang['tech'][$BuildElement] . ' (' . $BuildLevel . ')';
                            $AllPlanets .= "<br><font color=\"#7f7f7f\">(" . $BuildRestTime . ")</font>";
                        } else {
                            CheckPlanetUsedFields($UserPlanet);
                            $AllPlanets .= $lang['Free'];
                        }
                    } else {
                        $AllPlanets .= $lang['Free'];
                    }
                    $AllPlanets .= "</center></th>";
                    if ($Colone <= 1) {
                        $Colone++;
                    } else {
                        $AllPlanets .= "</tr><tr>";
                        $Colone = 1;
                    }
                }
            }
            $getcoords = ($UserPlanet['galaxy']&&$UserPlanet['system']&&$UserPlanet['planet']);
            $this->tplObj->assign(array(
                'planets_query' => doquery($QryPlanets, 'planets'),
                'getcoords'=> $getcoords,
            ));
        }
    }

    function getTemplate($templateName) {
        $filename = realpath(ROOT_PATH . '/APP/templates/GAME') . "/{$templateName}";
        return ReadFromFile($filename);
    }

}
