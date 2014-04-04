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
        $this->setWindow($this->defaultWindow);
        $this->initTemplate();
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
        global $langInfos, $game_config, $user, $planetrow;

        if ($this->getWindow() !== 'ajax') {
            $this->ShowLeftMenu($user, $planetrow);
        }

        $this->tplObj->assign(array(
            'dpath' => DEFAULT_SKINPATH,
            'style' => "<link rel=\"stylesheet\" type=\"text/css\" href=\"" . DEFAULT_SKINPATH . "/default.css\" />
                                <link rel=\"stylesheet\" type=\"text/css\" href=\"" . DEFAULT_SKINPATH . "/formate.css\" />",
            'ENCODING' => $langInfos['ENCODING'],
            'body' => "<body>",
            'servername' => $game_config['game_name'],
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

    function ShowLeftMenu() {
        global $lang, $user, $game_config;

        includeLang('leftmenu');

        $this->ShowTopNavigationBar();

        $rank = doquery("SELECT `total_rank` FROM {{table}} WHERE `stat_code` = '1' AND `stat_type` = '1' AND `id_owner` = '" . $user['id'] . "';", 'statpoints', true);
        $Level = $user['authlevel'];
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
            'devlp' => $lang['devlp'],
            'Overview' => $lang['Overview'],
            'Buildings' => $lang['Buildings'],
            'Research' => $lang['Research'],
            'Shipyard' => $lang['Shipyard'],
            'Defense' => $lang['Defense'],
            'Officiers' => $lang['Officiers'],
            'navig' => $lang['navig'],
            'Alliance' => $lang['Alliance'],
            'Fleet' => $lang['Fleet'],
            'Messages' => $lang['Messages'],
            'observ' => $lang['observ'],
            'Galaxy' => $lang['Galaxy'],
            'Imperium' => $lang['Imperium'],
            'Resources' => $lang['Resources'],
            'Technology' => $lang['Technology'],
            'Records' => $lang['Records'],
            'Statistics' => $lang['Statistics'],
            'Search' => $lang['Search'],
            'blocked' => $lang['blocked'],
            'commun' => $lang['commun'],
            'Buddylist' => $lang['Buddylist'],
            'Chat' => $lang['Chat'],
            'Board' => $lang['Board'],
            'multi' => $lang['multi'],
            'Rules' => $lang['Rules'],
            'Contact' => $lang['Contact'],
            'Options' => $lang['Options'],
            'Logout' => $lang['Logout'],
            'infog' => $lang['infog'],
            'lm_ifo_game' => $lang['lm_ifo_game'],
            'lm_ifo_fleet' => $lang['lm_ifo_fleet'],
            'lm_ifo_serv' => $lang['lm_ifo_serv'],
            'lm_ifo_queue' => $lang['lm_ifo_queue'],
            'Admin_Level' => $lang['user_level'][$Level],
        ));
    }

    function ShowTopNavigationBar() {
        global $user, $planetrow, $lang;

        includeLang('topnav');

        if ($user) {
            if (!$planetrow) {
                $planetrow = doquery("SELECT * FROM {{table}} WHERE `id` = '" . $user['current_planet'] . "';", 'planets', true);
            }
            // Actualisation des ressources de la planete
            $dpath = (!$user["dpath"]) ? DEFAULT_SKINPATH : $user["dpath"];
            // Genearation de la combo des planetes du joueur
            $parse['planetlist'] = '';
            $ThisUsersPlanets = SortUserPlanets($user);
            while ($CurPlanet = mysql_fetch_array($ThisUsersPlanets)) {
                if ($planetrow["destruyed"] == 0) {
                    $parse['planetlist'] .= "\n<option ";
                    if ($CurPlanet['id'] == $user['current_planet']) {
                        // Bon puisque deja on s'y trouve autant le marquer
                        $parse['planetlist'] .= "selected=\"selected\" ";
                    }
                    $parse['planetlist'] .= "value=\"?page=" . filter_input(INPUT_GET, 'page') . "&cp=" . $CurPlanet['id'] . "";
                    $parse['planetlist'] .= "&amp;mode=" . HTTP::_GP('mode', '');
                    $parse['planetlist'] .= "&amp;re=0\">";
                    // Nom et coordonnées de la planete
                    $parse['planetlist'] .= "" . $CurPlanet['name'];
                    $parse['planetlist'] .= "&nbsp;[" . $CurPlanet['galaxy'] . ":";
                    $parse['planetlist'] .= "" . $CurPlanet['system'] . ":";
                    $parse['planetlist'] .= "" . $CurPlanet['planet'];
                    $parse['planetlist'] .= "]&nbsp;&nbsp;</option>";
                }
            }

            $this->tplObj->assign(array(
                'image' => $planetrow['image'],
                'planetlist' => $parse['planetlist'],
                'metal' => pretty_number($planetrow["metal"]),
                'crystal' => pretty_number($planetrow["crystal"]),
                'deuterium' => pretty_number($planetrow["deuterium"]),
                'energy' => pretty_number($planetrow["energy_used"]),
                'energy_max' => pretty_number($planetrow["energy_max"]),
                'planetrow' => $planetrow,
                'dpath' => $dpath,
                'Metal' => $lang['Metal'],
                'Crystal' => $lang['Crystal'],
                'Deuterium' => $lang['Deuterium'],
                'Energy' => $lang['Energy'],
                'Message' => $lang['Message'],
            ));
        }
    }

    function getTemplate($templateName) {
        $filename = realpath(ROOT_PATH . '/APP/templates/GAME') . "/{$templateName}";
        return ReadFromFile($filename);
    }

}
