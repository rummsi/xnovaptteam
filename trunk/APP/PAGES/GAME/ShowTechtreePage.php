<?php

/*
 * Expression package is undefined on line 4, column 19 in file:///C:/UniServerZ/www/xnovaptteam/nbproject/licenseheader.txt.
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
 * Expression package is undefined on line 19, column 19 in file:///C:/UniServerZ/www/xnovaptteam/nbproject/licenseheader.txt.
 * @Rui Silva
 * @ShowTechtreePage.php
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @Expression version is undefined on line 23, column 20 in file:///C:/UniServerZ/www/xnovaptteam/nbproject/licenseheader.txt.  26/Mar/2014 13:57:20
 */

/**
 * Description of ShowTechtreePage
 *
 * @author Rui Silva
 */
class ShowTechtreePage extends AbstractGamePage
{
    function __construct()
    {
        parent::__construct();
        $this->tplObj->compile_id = 'techtree';
    }

    function show()
    {
        global $lang, $title, $resource, $requirements, $planetrow,$user;
        includeLang('tech');
        
        $this->tplObj->assign(array(
            'title'             => $lang['Tech'],
            'requirements'           => $requirements,
            'resource'       => $resource,
            'planetrow'=>$planetrow,
            'user'=>$user,
        ));
        
        $this->render('techtree.default.tpl');
    }
}
