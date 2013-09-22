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
 * @ShowIndexPage.php
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 0.01  22/Set/2013 11:04:15
 */

/**
 * Description of ShowIndexPage
 *
 * @author author XNovaPT Team <xnovaptteam@gmail.com>
 */
class ShowIndexPage extends AbstractPage
{
    public function __construct()
    {
        parent::__construct();
        $this->tplObj->compile_id = 'login';
    }

    function show()
    {
	global $langInfos, $dpath, $title, $lang, $game_config;
        
        if (!empty($_POST))
        {
            $userData = array(
                'username' => mysql_real_escape_string($_POST['username']),
                'password' => mysql_real_escape_string($_POST['password'])
            );
            $sql =<<<EOF
                SELECT
                    users.id,
                    users.username,
                    users.banaday,
                    (CASE WHEN MD5("{$userData['password']}")=users.password THEN 1 ELSE 0 END) AS login_success,
                    CONCAT((@salt:=MID(MD5(RAND()), 0, 4)), SHA1(CONCAT(users.username, users.password, @salt))) AS login_rememberme
                    FROM {{table}}users AS users
                    WHERE users.username="{$userData['username']}"
                    LIMIT 1
EOF;
            $login = doquery($sql, '', true);
            if($login['banaday'] <= time() & $login['banaday'] !='0' )
            {
                doquery("UPDATE {{table}} SET `banaday` = '0', `bana` = '0', `urlaubs_modus` ='0'  WHERE `username` = '".$login['username']."' LIMIT 1;", 'users');
                doquery("DELETE FROM {{table}} WHERE `who` = '".$login['username']."'",'banned');
            }
            if ($login)
            {
                if (intval($login['login_success']))
                {
                    if (isset($_POST["rememberme"]))
                    {
                        setcookie('nova-cookie', serialize(array('id' => $login['id'], 'key' => $login['login_rememberme'])), time() + 2592000);
                    }
                    $sql =<<<EOF
                        UPDATE {{table}} AS users
                        SET users.onlinetime=UNIX_TIMESTAMP()
                        WHERE users.id={$login['id']}
EOF;
                    doquery($sql, 'users');
                    $_SESSION['user_id'] = $login['id'];
                    header("Location: game.php?page=overview");
                    exit(0);
                } else {
                    ShowErrorPage::message($lang['Login_FailPassword']);
                }
            } else {
                ShowErrorPage::message($lang['Login_FailUser']);
            }
        } else {
            $PlayersOnline  = doquery("SELECT COUNT(DISTINCT id) AS `onlinenow` FROM {{table}} AS users WHERE `onlinetime` > (UNIX_TIMESTAMP()-900) AND users.authlevel < 3", 'users', true);
            $LastPlayer     = doquery('SELECT users.`username` FROM {{table}} AS users ORDER BY `register_time` DESC LIMIT 1', 'users', true);
            $Count          = doquery('SELECT COUNT(DISTINCT users.id) AS `players` FROM {{table}} AS users WHERE users.authlevel < 3', 'users', true);
            
            $this->tplObj->assign(array(
                'title'         => $lang['Login'],
                'User_name'     => $lang['User_name'],
                'Password'      => $lang['Password'],
                'Remember_me'   => $lang['Remember_me'],
                'Login'         => $lang['Login'],
                'PasswordLost'  => $lang['PasswordLost'],
                'log_reg'       => $lang['log_reg'],
                'log_welcome'   => $lang['log_welcome'],
                'log_desc'      => $lang['log_desc'],
                'log_toreg'     => $lang['log_toreg'],
                'log_online'    => $lang['log_online'],
                'log_lastreg'   => $lang['log_lastreg'],
                'log_numbreg'   => $lang['log_numbreg'],
                'users_amount'  => $Count['players'],
                'log_univ'      => $lang['log_univ'],
                'forum_url'     => $game_config['forum_url'],
                'online_users'  => $PlayersOnline['onlinenow'],
                'last_user'     => $LastPlayer['username'],
            ));

            // Test pour prendre le nombre total de joueur et le nombre de joueurs connectés
            if (isset($_GET['ucount']) && $_GET['ucount'] == 1)
            {
                $page = $PlayersOnline['onlinenow']."/".$Count['players'];
                die ( $page );
            } else {
                define('LOGIN', true);
                
                $this->render('default.index.tpl');
            }
        }
    }
}

?>