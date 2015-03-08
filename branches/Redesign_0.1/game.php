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
 * @game.php
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 0.01  22/Set/2013 13:54:02
 */

define('INSIDE', true);
define('INSTALL', false);
require_once dirname(__FILE__) . '/common.php';
include 'APP/CLASSES/AbstractGamePage.php';
include 'APP/PAGES/ERROR/ShowErrorPage.php';

$page = HTTP::_GP('page', 'index');
$mode = HTTP::_GP('mode', 'show');
$mode = str_replace(array('_', '\\', '/', '.', "\0"), '', $mode);

$pageClass = 'Show' . ucwords($page) . 'Page';

includeLang('login');

if (!file_exists('APP/PAGES/GAME/' . $pageClass . '.php')) {
    ShowErrorPage::message('A página ' . ucwords($page) . ' não existe', $lang['Login_Error']);
}

// Added Autoload in feature Versions
require(ROOT_PATH . 'APP/PAGES/GAME/' . $pageClass . '.php');

$pageObj = new $pageClass;

$pageObj->{$mode}();
