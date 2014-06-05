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
 * @ShowLogoutPage.php
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 0.01  19/Mar/2014 22:55:30
 */

/**
 * Description of ShowLogoutPage
 *
 * @author author XNovaPT Team <xnovaptteam@gmail.com>
 */
class ShowLogoutPage extends AbstractIndexPage {

    function __construct() {
        parent::__construct();
        $this->tplObj->compile_id = 'logout';
    }

    function show() {
        global $lang;

        includeLang('logout');

        session_destroy();
        setcookie('nova-cookie', NULL, 0);

        self::errorPage($lang['see_you'], $lang['session_closed'], header("Refresh: 3;url=index.php"));
    }

    function errorPage($mes, $title = 'Error', $color = 'orange') {
        global $lang;

        $this->tplObj->assign(array(
            'color' => $color,
            'title' => $title,
            'mes' => $mes,
        ));
        $this->render('default.error.tpl');
    }

}
