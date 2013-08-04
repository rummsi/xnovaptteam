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
 * @Display.php
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 0.01  2/Ago/2013 20:57:49
 */

/**
 * Description of Display
 *
 * @author author XNovaPT Team <xnovaptteam@gmail.com>
 */
class Display
{
    static function login($page, $title = '', $metatags = '')
    {
        global $link, $game_config, $debug, $user, $planetrow;
        
        $DisplayPage  = self::loginHeader ($title, $metatags);
        $DisplayPage .= "<center>\n". $page ."\n</center>\n";
        $DisplayPage .= StdFooter();
        if (isset($link))
        {
            mysql_close($link);
        }
        echo $DisplayPage;
        die();
    }
    static function login2($page, $title = '', $metatags = '')
    {
        global $link, $game_config, $debug, $user, $planetrow;
        
        $DisplayPage  = self::outerHeader ($title, $metatags);
        $DisplayPage .= "<center>\n". $page ."\n</center>\n";
        $DisplayPage .= StdFooter();
        if (isset($link))
        {
            mysql_close($link);
        }
        echo $DisplayPage;
        die();
    }
    
    static function loginHeader($title = '', $metatags = '')
    {
        global $user, $langInfos;
        
        $parse             = $langInfos;
	$parse['title']    = $title;
	$parse['dpath']    = "skins/xnova/";
	$parse['-style-']  = "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/styles.css\">\n";
	$parse['-style-'] .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/about.css\">\n";
	$parse['-meta-']  = ($metatags) ? $metatags : "";
	$parse['-body-']  = "<body>";
	return parsetemplate(gettemplate('simple_header'), $parse);
    }
    
    static function outerHeader($title = '', $metatags = '')
    {
        global $user, $langInfos;
        
        $parse             = $langInfos;
	$parse['title']    = $title;
	$parse['dpath']    = DEFAULT_SKINPATH;
	$parse['-style-']  = "<link rel=\"stylesheet\" type=\"text/css\" href=\"". DEFAULT_SKINPATH ."/default.css\" />";
	$parse['-style-'] .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"". DEFAULT_SKINPATH ."/formate.css\" />";
	$parse['-meta-']  = ($metatags) ? $metatags : "";
	$parse['-body-']  = "<body>";
	return parsetemplate(gettemplate('simple_header'), $parse);
    }
}

?>