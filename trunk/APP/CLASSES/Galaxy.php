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
 * @Galaxy.php
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 0.01  29/Jul/2013 12:48:01
 */

/**
 * Description of Galaxy
 *
 * @author author XNovaPT Team <xnovaptteam@gmail.com>
 */
class Galaxy {

    static function GalaxyRowPos($Planet, $GalaxyRow) {
        // Pos
        $Result = "<th width=30>";
        $Result .= "<a href=\"#\"";
        if ($GalaxyRow) {
            $Result .= " tabindex=\"" . ($Planet + 1) . "\"";
        }
        $Result .= ">" . $Planet . "</a>";
        $Result .= "</th>";

        return $Result;
    }

    static function GalaxyRowPlanet($GalaxyRow, $GalaxyRowPlanet, $GalaxyRowUser, $Galaxy, $System, $Planet, $PlanetType) {
        global $lang, $dpath, $user, $HavePhalanx, $CurrentSystem, $CurrentGalaxy;
        // Planete (Image)
        $Result = "<th width=30>";
        $GalaxyRowUser = doquery("SELECT * FROM {{table}} WHERE id='" . $GalaxyRowPlanet['id_owner'] . "';", 'users', true);
        if ($GalaxyRow && $GalaxyRowPlanet["destruyed"] == 0 && $GalaxyRow["id_planet"] != 0) {
            if ($HavePhalanx <> 0) {
                if ($GalaxyRowUser['id'] != $user['id']) {
                    if ($GalaxyRowPlanet["galaxy"] == $CurrentGalaxy) {
                        $Range = GetPhalanxRange($HavePhalanx);
                        if ($SystemLimitMin < 1) {
                            $SystemLimitMin = 1;
                        }
                        $SystemLimitMax = $CurrentSystem + $Range;
                        if ($System <= $SystemLimitMax) {
                            if ($System >= $SystemLimitMin) {
                                $PhalanxTypeLink = "<a href=# onclick=fenster(&#039;phalanx.php?galaxy=" . $Galaxy . "&amp;system=" . $System . "&amp;planet=" . $Planet . "&amp;planettype=" . $PlanetType . "&#039;) >" . $lang['gl_phalanx'] . "</a><br />";
                            } else {
                                $PhalanxTypeLink = "";
                            }
                        } else {
                            $PhalanxTypeLink = "";
                        }
                    } else {
                        $PhalanxTypeLink = "";
                    }
                } else {
                    $PhalanxTypeLink = "";
                }
            } else {
                $PhalanxTypeLink = "";
            }
            if ($GalaxyRowUser['id'] != $user['id']) {
                $MissionType6Link = "<a href=# onclick=&#039javascript:doit(6, " . $Galaxy . ", " . $System . ", " . $Planet . ", " . $PlanetType . ", " . $user["spio_anz"] . ");&#039 >" . $lang['type_mission'][6] . "</a><br /><br />";
            } elseif ($GalaxyRowUser['id'] == $user['id']) {
                $MissionType6Link = "";
            }
            if ($GalaxyRowUser['id'] != $user['id']) {
                $MissionType1Link = "<a href=game.php?page=fleet1&galaxy=" . $Galaxy . "&amp;system=" . $System . "&amp;planet=" . $Planet . "&amp;planettype=" . $PlanetType . "&amp;target_mission=1>" . $lang['type_mission'][1] . "</a><br />";
            } elseif ($GalaxyRowUser['id'] == $user['id']) {
                $MissionType1Link = "";
            }
            if ($GalaxyRowUser['id'] != $user['id']) {
                $MissionType5Link = "<a href=game.php?page=fleet1&galaxy=" . $Galaxy . "&system=" . $System . "&planet=" . $Planet . "&planettype=" . $PlanetType . "&target_mission=5>" . $lang['type_mission'][5] . "</a><br />";
            } elseif ($GalaxyRowUser['id'] == $user['id']) {
                $MissionType5Link = "";
            }
            if ($GalaxyRowUser['id'] == $user['id']) {
                $MissionType4Link = "<a href=game.php?page=fleet1&galaxy=" . $Galaxy . "&system=" . $System . "&planet=" . $Planet . "&planettype=" . $PlanetType . "&target_mission=4>" . $lang['type_mission'][4] . "</a><br />";
            } elseif ($GalaxyRowUser['id'] != $user['id']) {
                $MissionType4Link = "";
            }
            $MissionType3Link = "<a href=game.php?page=fleet1&galaxy=" . $Galaxy . "&system=" . $System . "&planet=" . $Planet . "&planettype=" . $PlanetType . "&target_mission=3>" . $lang['type_mission'][3] . "</a>";
            $Result .= "<a style=\"cursor: pointer;\"";
            $Result .= " onmouseover='return overlib(\"";
            $Result .= "<table width=240>";
            $Result .= "<tr>";
            $Result .= "<td class=c colspan=2>";
            $Result .= $lang['gl_planet'] . " " . stripslashes($GalaxyRowPlanet["name"]) . " [" . $Galaxy . ":" . $System . ":" . $Planet . "]";
            $Result .= "</td>";
            $Result .= "</tr>";
            $Result .= "<tr>";
            $Result .= "<th width=80>";
            $Result .= "<img src=" . $dpath . "planeten/small/s_" . $GalaxyRowPlanet["image"] . ".jpg height=75 width=75 />";
            $Result .= "</th>";
            $Result .= "<th align=left>";
            $Result .= $MissionType6Link;
            $Result .= $PhalanxTypeLink;
            $Result .= $MissionType1Link;
            $Result .= $MissionType5Link;
            $Result .= $MissionType4Link;
            $Result .= $MissionType3Link;
            $Result .= "</th>";
            $Result .= "</tr>";
            $Result .= "</table>\"";
//          $Result .= ", STICKY, MOUSEOFF, DELAY, ". ($user["settings_tooltiptime"] * 1000) .", CENTER, OFFSETX, -40, OFFSETY, -40 );'";
            $Result .= ", STICKY, MOUSEOFF, DELAY, 750, CENTER, OFFSETX, -40, OFFSETY, -40 );'";
            $Result .= " onmouseout='return nd();'>";
            $Result .= "<img src=" . $dpath . "planeten/small/s_" . $GalaxyRowPlanet["image"] . ".jpg height=30 width=30>";
//          $Result .= $GalaxyRowPlanet["name"];
            $Result .= "</a>";
        }
        $Result .= "</th>";

        return $Result;
    }

    static function GalaxyRowPlanetName($GalaxyRow, $GalaxyRowPlanet, $GalaxyRowUser, $Galaxy, $System, $Planet, $PlanetType) {
        global $lang, $user, $HavePhalanx, $CurrentSystem, $CurrentGalaxy;
        // Planete (Nom)
        $Result = "<th style=\"white-space: nowrap;\" width=130>";
        if ($GalaxyRowUser['ally_id'] == $user['ally_id'] AND $GalaxyRowUser['id'] != $user['id'] AND $user['ally_id'] != '') {
            $TextColor = "<font color=\"green\">";
            $EndColor = "</font>";
        } elseif ($GalaxyRowUser['id'] == $user['id']) {
            $TextColor = "<font color=\"red\">";
            $EndColor = "</font>";
        } else {
            $TextColor = '';
            $EndColor = "";
        }
        if ($GalaxyRowPlanet['last_update'] > (time() - 59 * 60) AND $GalaxyRowUser['id'] != $user['id']) {
            $Inactivity = pretty_time_hour(time() - $GalaxyRowPlanet['last_update']);
        }
        if ($GalaxyRow && $GalaxyRowPlanet["destruyed"] == 0) {
            if ($HavePhalanx <> 0) {
                if ($GalaxyRowPlanet["galaxy"] == $CurrentGalaxy) {
                    $Range = GetPhalanxRange($HavePhalanx);
                    if ($CurrentGalaxy + $Range <= $CurrentSystem AND $CurrentSystem >= $CurrentGalaxy - $Range) {
                        $PhalanxTypeLink = "<a href=# onclick=fenster('phalanx.php?galaxy=" . $Galaxy . "&amp;system=" . $System . "&amp;planet=" . $Planet . "&amp;planettype=" . $PlanetType . "')  title=\"" . $lang['gl_phalanx'] . "\">" . $GalaxyRowPlanet['name'] . "</a><br />";
                    } else {
                        $PhalanxTypeLink = stripslashes($GalaxyRowPlanet['name']);
                    }
                } else {
                    $PhalanxTypeLink = stripslashes($GalaxyRowPlanet['name']);
                }
            } else {
                $PhalanxTypeLink = stripslashes($GalaxyRowPlanet['name']);
            }
            $Result .= $TextColor . $PhalanxTypeLink . $EndColor;
            if ($GalaxyRowPlanet['last_update'] > (time() - 59 * 60) AND $GalaxyRowUser['id'] != $user['id']) {
                if ($GalaxyRowPlanet['last_update'] > (time() - 10 * 60) AND $GalaxyRowUser['id'] != $user['id']) {
                    $Result .= "(*)";
                } else {
                    $Result .= " (" . $Inactivity . ")";
                }
            }
        } elseif ($GalaxyRowPlanet["destruyed"] != 0) {
            $Result .= $lang['gl_destroyedplanet'];
        }
        $Result .= "</th>";
        return $Result;
    }

    static function GalaxyRowMoon($GalaxyRow, $GalaxyRowPlanet, $GalaxyRowUser, $Galaxy, $System, $Planet, $PlanetType) {
        global $lang, $user, $dpath, $HavePhalanx, $CurrentSystem, $CurrentGalaxy, $CanDestroy;
        // Lune
        $Result = "<th style=\"white-space: nowrap;\" width=30>";
        if ($GalaxyRowUser['id'] != $user['id']) {
            $MissionType6Link = "<a href=# onclick=&#039javascript:doit(6, " . $Galaxy . ", " . $System . ", " . $Planet . ", " . $PlanetType . ", " . $user["spio_anz"] . ");&#039 >" . $lang['type_mission'][6] . "</a><br /><br />";
        } elseif ($GalaxyRowUser['id'] == $user['id']) {
            $MissionType6Link = "";
        }
        if ($GalaxyRowUser['id'] != $user['id']) {
            $MissionType1Link = "<a href=game.php?page=fleet1&galaxy=" . $Galaxy . "&amp;system=" . $System . "&amp;planet=" . $Planet . "&amp;planettype=" . $PlanetType . "&amp;target_mission=1>" . $lang['type_mission'][1] . "</a><br />";
        } elseif ($GalaxyRowUser['id'] == $user['id']) {
            $MissionType1Link = "";
        }
        if ($GalaxyRowUser['id'] != $user['id']) {
            $MissionType5Link = "<a href=game.php?page=fleet1&galaxy=" . $Galaxy . "&system=" . $System . "&planet=" . $Planet . "&planettype=" . $PlanetType . "&target_mission=5>" . $lang['type_mission'][5] . "</a><br />";
        } elseif ($GalaxyRowUser['id'] == $user['id']) {
            $MissionType5Link = "";
        }
        if ($GalaxyRowUser['id'] == $user['id']) {
            $MissionType4Link = "<a href=game.php?page=fleet1&galaxy=" . $Galaxy . "&system=" . $System . "&planet=" . $Planet . "&planettype=" . $PlanetType . "&target_mission=4>" . $lang['type_mission'][4] . "</a><br />";
        } elseif ($GalaxyRowUser['id'] != $user['id']) {
            $MissionType4Link = "";
        }
        if ($GalaxyRowUser['id'] != $user['id']) {
            if ($CanDestroy > 0) {
                $MissionType9Link = "<a href=game.php?page=fleet1&galaxy=" . $Galaxy . "&system=" . $System . "&planet=" . $Planet . "&planettype=" . $PlanetType . "&target_mission=9>" . $lang['type_mission'][9] . "</a>";
            } else {
                $MissionType9Link = "";
            }
        } elseif ($GalaxyRowUser['id'] == $user['id']) {
            $MissionType9Link = "";
        }
        $MissionType3Link = "<a href=game.php?page=fleet1&galaxy=" . $Galaxy . "&system=" . $System . "&planet=" . $Planet . "&planettype=" . $PlanetType . "&target_mission=3>" . $lang['type_mission'][3] . "</a><br />";
        if ($GalaxyRow && $GalaxyRowPlanet["destruyed"] == 0 && $GalaxyRow["id_luna"] != 0) {
            $Result .= "<a style=\"cursor: pointer;\"";
            $Result .= " onmouseover='return overlib(\"";
            $Result .= "<table width=240>";
            $Result .= "<tr>";
            $Result .= "<td class=c colspan=2>";
            $Result .= $lang['Moon'] . ": " . $GalaxyRowPlanet["name"] . " [" . $Galaxy . ":" . $System . ":" . $Planet . "]";
            $Result .= "</td>";
            $Result .= "</tr><tr>";
            $Result .= "<th width=80>";
            $Result .= "<img src=" . $dpath . "planeten/mond.jpg height=75 width=75 />";
            $Result .= "</th>";
            $Result .= "<th>";
            $Result .= "<table>";
            $Result .= "<tr>";
            $Result .= "<td class=c colspan=2>" . $lang['caracters'] . "</td>";
            $Result .= "</tr><tr>";
            $Result .= "<th>" . $lang['diameter'] . "</th>";
            $Result .= "<th>" . number_format($GalaxyRowPlanet['diameter'], 0, '', '.') . "</th>";
            $Result .= "</tr><tr>";
            $Result .= "<th>" . $lang['temperature'] . "</th><th>" . number_format($GalaxyRowPlanet['temp_min'], 0, '', '.') . "</th>";
            $Result .= "</tr><tr>";
            $Result .= "<td class=c colspan=2>" . $lang['Actions'] . "</td>";
            $Result .= "</tr><tr>";
            $Result .= "<th colspan=2 align=center>";
            $Result .= $MissionType6Link;
            $Result .= $MissionType3Link;
            $Result .= $MissionType4Link;
            $Result .= $MissionType1Link;
            $Result .= $MissionType5Link;
            $Result .= $MissionType9Link;
            $Result .= "</tr>";
            $Result .= "</table>";
            $Result .= "</th>";
            $Result .= "</tr>";
            $Result .= "</table>\"";
//          $Result .= ", STICKY, MOUSEOFF, DELAY, ". ($user["settings_tooltiptime"] * 1000) .", CENTER, OFFSETX, -40, OFFSETY, -40 );'";
            $Result .= ", STICKY, MOUSEOFF, DELAY, 750, CENTER, OFFSETX, -40, OFFSETY, -40 );'";
            $Result .= " onmouseout='return nd();'>";
            $Result .= "<img src=" . $dpath . "planeten/small/s_mond.jpg height=22 width=22>";
            $Result .= "</a>";
        }
        $Result .= "</th>";

        return $Result;
    }

    static function GalaxyRowDebris($GalaxyRow, $GalaxyRowPlanet, $GalaxyRowUser, $Galaxy, $System, $Planet, $PlanetType) {
        global $lang, $dpath, $CurrentRC, $user, $pricelist;
        // Cdr
        $Result = "<th style=\"white-space: nowrap;\" width=30>";
        if ($GalaxyRow) {
            if ($GalaxyRow["metal"] != 0 || $GalaxyRow["crystal"] != 0) {
                $RecNeeded = ceil(($GalaxyRow["metal"] + $GalaxyRow["crystal"]) / $pricelist[209]['capacity']);
                if ($RecNeeded < $CurrentRC) {
                    $RecSended = $RecNeeded;
                } elseif ($RecNeeded >= $CurrentRC) {
                    $RecSended = $CurrentRC;
                } else {
                    $RecSended = $RecyclerCount;
                }
                $Result = "<th style=\"";
                if (($GalaxyRow["metal"] + $GalaxyRow["crystal"]) >= 10000000) {
                    $Result .= "background-color: rgb(100, 0, 0);";
                } elseif (($GalaxyRow["metal"] + $GalaxyRow["crystal"]) >= 1000000) {
                    $Result .= "background-color: rgb(100, 100, 0);";
                } elseif (($GalaxyRow["metal"] + $GalaxyRow["crystal"]) >= 100000) {
                    $Result .= "background-color: rgb(0, 100, 0);";
                }
                $Result .= "background-image: none;\" width=30>";
                $Result .= "<a style=\"cursor: pointer;\"";
                $Result .= " onmouseover='return overlib(\"";
                $Result .= "<table width=240>";
                $Result .= "<tr>";
                $Result .= "<td class=c colspan=2>";
                $Result .= $lang['Debris'] . " [" . $Galaxy . ":" . $System . ":" . $Planet . "]";
                $Result .= "</td>";
                $Result .= "</tr><tr>";
                $Result .= "<th width=80>";
                $Result .= "<img src=" . $dpath . "planeten/debris.jpg height=75 width=75 />";
                $Result .= "</th>";
                $Result .= "<th>";
                $Result .= "<table>";
                $Result .= "<tr>";
                $Result .= "<td class=c colspan=2>" . $lang['gl_ressource'] . "</td>";
                $Result .= "</tr><tr>";
                $Result .= "<th>" . $lang['Metal'] . " </th><th>" . number_format($GalaxyRow['metal'], 0, '', '.') . "</th>";
                $Result .= "</tr><tr>";
                $Result .= "<th>" . $lang['Crystal'] . " </th><th>" . number_format($GalaxyRow['crystal'], 0, '', '.') . "</th>";
                $Result .= "</tr><tr>";
                $Result .= "<td class=c colspan=2>" . $lang['gl_action'] . "</td>";
                $Result .= "</tr><tr>";
                $Result .= "<th colspan=2 align=left>";
                $Result .= "<a href= # onclick=&#039javascript:doit (8, " . $Galaxy . ", " . $System . ", " . $Planet . ", " . $PlanetType . ", " . $RecSended . ");&#039 >" . $lang['type_mission'][8] . "</a>";
                $Result .= "</tr>";
                $Result .= "</table>";
                $Result .= "</th>";
                $Result .= "</tr>";
                $Result .= "</table>\"";
//		$Result .= ", STICKY, MOUSEOFF, DELAY, ". ($user["settings_tooltiptime"] * 1000) .", CENTER, OFFSETX, -40, OFFSETY, -40 );'";
                $Result .= ", STICKY, MOUSEOFF, DELAY, 750, CENTER, OFFSETX, -40, OFFSETY, -40 );'";
                $Result .= " onmouseout='return nd();'>";
                $Result .= "<img src=" . $dpath . "planeten/debris.jpg height=22 width=22></a>";
            }
        }
        $Result .= "</th>";

        return $Result;
    }

    static function GalaxyRowUser($GalaxyRow, $GalaxyRowPlanet, $GalaxyRowUser, $Galaxy, $System, $Planet, $PlanetType) {
        global $lang, $user;
        // Joueur
        $Result = "<th width=150>";
        if ($GalaxyRowUser && $GalaxyRowPlanet["destruyed"] == 0) {
            $NoobProt = doquery("SELECT * FROM {{table}} WHERE `config_name` = 'noobprotection';", 'config', true);
            $NoobTime = doquery("SELECT * FROM {{table}} WHERE `config_name` = 'noobprotectiontime';", 'config', true);
            $NoobMulti = doquery("SELECT * FROM {{table}} WHERE `config_name` = 'noobprotectionmulti';", 'config', true);
            $UserPoints = doquery("SELECT * FROM {{table}} WHERE `stat_type` = '1' AND `stat_code` = '1' AND `id_owner` = '" . $user['id'] . "';", 'statpoints', true);
            $User2Points = doquery("SELECT * FROM {{table}} WHERE `stat_type` = '1' AND `stat_code` = '1' AND `id_owner` = '" . $GalaxyRowUser['id'] . "';", 'statpoints', true);
            $CurrentPoints = $UserPoints['total_points'];
            $RowUserPoints = $User2Points['total_points'];
            $CurrentLevel = $CurrentPoints * $NoobMulti['config_value'];
            $RowUserLevel = $RowUserPoints * $NoobMulti['config_value'];
            if ($GalaxyRowUser['bana'] == 1 AND $GalaxyRowUser['urlaubs_modus'] == 1) {
                $Systemtatus2 = $lang['vacation_shortcut'] . " <a href=\"banned.php\"><span class=\"banned\">" . $lang['banned_shortcut'] . "</span></a>";
                $Systemtatus = "<span class=\"vacation\">";
            } elseif ($GalaxyRowUser['bana'] == 1) {
                $Systemtatus2 = "<a href=\"game.php?page=banned\"><span class=\"banned\">" . $lang['banned_shortcut'] . "</span></a>";
                $Systemtatus = "";
            } elseif ($GalaxyRowUser['urlaubs_modus'] == 1) {
                $Systemtatus2 = "<span class=\"vacation\">" . $lang['vacation_shortcut'] . "</span>";
                $Systemtatus = "<span class=\"vacation\">";
            } elseif ($GalaxyRowUser['onlinetime'] < (time() - 60 * 60 * 24 * 7) AND $GalaxyRowUser['onlinetime'] > (time() - 60 * 60 * 24 * 28)) {
                $Systemtatus2 = "<span class=\"inactive\">" . $lang['inactif_7_shortcut'] . "</span>";
                $Systemtatus = "<span class=\"inactive\">";
            } elseif ($GalaxyRowUser['onlinetime'] < (time() - 60 * 60 * 24 * 28)) {
                $Systemtatus2 = "<span class=\"inactive\">" . $lang['inactif_7_shortcut'] . "</span><span class=\"longinactive\"> " . $lang['inactif_28_shortcut'] . "</span>";
                $Systemtatus = "<span class=\"longinactive\">";
            } elseif ($RowUserLevel < $CurrentPoints AND $NoobProt['config_value'] == 1 AND $NoobTime['config_value'] * 1000 > $RowUserPoints) {
                $Systemtatus2 = "<span class=\"noob\">" . $lang['weak_player_shortcut'] . "</span>";
                $Systemtatus = "<span class=\"noob\">";
            } elseif ($RowUserPoints > $CurrentLevel AND $NoobProt['config_value'] == 1 AND $NoobTime['config_value'] * 1000 > $CurrentPoints) {
                $Systemtatus2 = $lang['strong_player_shortcut'];
                $Systemtatus = "<span class=\"strong\">";
            } else {
                $Systemtatus2 = "";
                $Systemtatus = "";
            }
            $Systemtatus4 = $User2Points['total_rank'];
            if ($Systemtatus2 != '') {
                $Systemtatus6 = "<font color=\"white\">(</font>";
                $Systemtatus7 = "<font color=\"white\">)</font>";
            }
            if ($Systemtatus2 == '') {
                $Systemtatus6 = "";
                $Systemtatus7 = "";
            }
            $admin = "";
            if ($GalaxyRowUser['authlevel'] == LEVEL_ADMIN) {
                $admin = "<font color=\"red\"><blink>A</blink></font>";
            } else if ($GalaxyRowUser['authlevel'] == LEVEL_OPERATOR) {
                $admin = "<font color=\"lime\"><blink>O</blink></font>";
            } else if ($GalaxyRowUser['authlevel'] == LEVEL_MODERATOR) {
                $admin = "<font color=\"skyblue\"><blink>M</blink></font>";
            }
            $Systemtart = $User2Points['total_rank'];
            if (strlen($Systemtart) < 3) {
                $Systemtart = 1;
            } else {
                $Systemtart = (floor($User2Points['total_rank'] / 100) * 100) + 1;
            }
            $Result .= "<a style=\"cursor: pointer;\"";
            $Result .= " onmouseover='return overlib(\"";
            $Result .= "<table width=190>";
            $Result .= "<tr>";
            $Result .= "<td class=c colspan=2>" . $lang['Player'] . " " . $GalaxyRowUser['username'] . " " . $lang['Place'] . " " . $Systemtatus4 . "</td>";
            $Result .= "</tr><tr>";
            if ($GalaxyRowUser['id'] != $user['id']) {
                $Result .= "<td><a href=game.php?page=messages&mode=write&id=" . $GalaxyRowUser['id'] . ">" . $lang['gl_sendmess'] . "</a></td>";
                $Result .= "</tr><tr>";
                $Result .= "<td><a href=game.php?page=buddy&a=2&u=" . $GalaxyRowUser['id'] . ">" . $lang['gl_buddyreq'] . "</a></td>";
                $Result .= "</tr><tr>";
            }
            $Result .= "<td><a href=stat.php?who=player&start=" . $Systemtart . ">" . $lang['gl_stats'] . "</a></td>";
            $Result .= "</tr>";
            $Result .= "</table>\"";
            $Result .= ", STICKY, MOUSEOFF, DELAY, 750, CENTER, OFFSETX, -40, OFFSETY, -40 );'";
            $Result .= " onmouseout='return nd();'>";
            $Result .= $Systemtatus;
            $Result .= $GalaxyRowUser["username"] . "</span>";
            $Result .= $Systemtatus6;
            $Result .= $Systemtatus;
            $Result .= $Systemtatus2;
            $Result .= $Systemtatus7 . " " . $admin;
            $Result .= "</span></a>";
        }
        $Result .= "</th>";

        return $Result;
    }

    static function GalaxyRowAlly($GalaxyRow, $GalaxyRowPlanet, $GalaxyRowUser, $Galaxy, $System, $Planet, $PlanetType) {
        global $lang, $user;
        // Alliances
        $Result = "<th width=80>";
        if ($GalaxyRowUser['ally_id'] && $GalaxyRowUser['ally_id'] != 0) {
            $allyquery = doquery("SELECT * FROM {{table}} WHERE id=" . $GalaxyRowUser['ally_id'], "alliance", true);
            if ($allyquery) {
                $members_count = doquery("SELECT COUNT(DISTINCT(id)) FROM {{table}} WHERE ally_id=" . $allyquery['id'] . ";", "users", true);
                if ($members_count[0] > 1) {
                    $add = "s";
                } else {
                    $add = "";
                }
                $Result .= "<a style=\"cursor: pointer;\"";
                $Result .= " onmouseover='return overlib(\"";
                $Result .= "<table width=240>";
                $Result .= "<tr>";
                $Result .= "<td class=c>" . $lang['Alliance'] . " " . $allyquery['ally_name'] . " " . $lang['gl_with'] . " " . $members_count[0] . " " . $lang['gl_membre'] . $add . "</td>";
                $Result .= "</tr>";
                $Result .= "<th>";
                $Result .= "<table>";
                $Result .= "<tr>";
                $Result .= "<td><a href=game.php?page=alliance&mode=ainfo&a=" . $allyquery['id'] . ">" . $lang['gl_ally_internal'] . "</a></td>";
                $Result .= "</tr><tr>";
                $Result .= "<td><a href=stat.php?start=101&who=ally>" . $lang['gl_stats'] . "</a></td>";
                if ($allyquery["ally_web"] != "") {
                    $Result .= "</tr><tr>";
                    $Result .= "<td><a href=" . $allyquery["ally_web"] . " target=_new>" . $lang['gl_ally_web'] . "</td>";
                }
                $Result .= "</tr>";
                $Result .= "</table>";
                $Result .= "</th>";
                $Result .= "</table>\"";
                $Result .= ", STICKY, MOUSEOFF, DELAY, 750, CENTER, OFFSETX, -40, OFFSETY, -40 );'";
                $Result .= " onmouseout='return nd();'>";
                if ($user['ally_id'] == $GalaxyRowPlayer['ally_id']) {
                    $Result .= "<span class=\"allymember\">" . $allyquery['ally_tag'] . "</span></a>";
                } else {
                    $Result .= $allyquery['ally_tag'] . "</a>";
                }
            }
        }
        $Result .= "</th>";

        return $Result;
    }

    static function GalaxyRowActions($GalaxyRow, $GalaxyRowPlanet, $GalaxyRowPlayer, $Galaxy, $System, $Planet, $PlanetType) {
        global $lang, $user, $dpath, $CurrentMIP, $CurrentSystem, $CurrentGalaxy;
        // Icones action
        $Result = "<th style=\"white-space: nowrap;\" width=125>";
        if ($GalaxyRowPlayer['id'] != $user['id']) {
            if ($CurrentMIP <> 0) {
                if ($GalaxyRowUser['id'] != $user['id']) {
                    if ($GalaxyRowPlanet["galaxy"] == $CurrentGalaxy) {
                        $Range = GetMissileRange();
                        $SystemLimitMin = $CurrentSystem - $Range;
                        if ($SystemLimitMin < 1) {
                            $SystemLimitMin = 1;
                        }
                        $SystemLimitMax = $CurrentSystem + $Range;
                        if ($System <= $SystemLimitMax) {
                            if ($System >= $SystemLimitMin) {
                                $MissileBtn = true;
                            } else {
                                $MissileBtn = false;
                            }
                        } else {
                            $MissileBtn = false;
                        }
                    } else {
                        $MissileBtn = false;
                    }
                } else {
                    $MissileBtn = false;
                }
            } else {
                $MissileBtn = false;
            }
            if ($GalaxyRowPlayer && $GalaxyRowPlanet["destruyed"] == 0) {
                if ($user["settings_esp"] == "1" && $GalaxyRowPlayer['id']) {
                    $Result .= "<a href=# onclick=\"javascript:doit(6, " . $Galaxy . ", " . $System . ", " . $Planet . ", 1, " . $user["spio_anz"] . ");\" >";
                    $Result .= "<img src=" . $dpath . "img/e.gif alt=\"" . $lang['gl_espionner'] . "\" title=\"" . $lang['gl_espionner'] . "\" border=0></a>";
                    $Result .= "&nbsp;";
                }
                if ($user["settings_wri"] == "1" && $GalaxyRowPlayer['id']) {
                    $Result .= "<a href=game.php?page=messages&mode=write&id=" . $GalaxyRowPlayer["id"] . ">";
                    $Result .= "<img src=" . $dpath . "img/m.gif alt=\"" . $lang['gl_sendmess'] . "\" title=\"" . $lang['gl_sendmess'] . "\" border=0></a>";
                    $Result .= "&nbsp;";
                }
                if ($user["settings_bud"] == "1" && $GalaxyRowPlayer['id']) {
                    $Result .= "<a href=game.php?page=buddy&a=2&amp;u=" . $GalaxyRowPlayer['id'] . " >";
                    $Result .= "<img src=" . $dpath . "img/b.gif alt=\"" . $lang['gl_buddyreq'] . "\" title=\"" . $lang['gl_buddyreq'] . "\" border=0></a>";
                    $Result .= "&nbsp;";
                }
                if ($user["settings_mis"] == "1" AND $MissileBtn == true && $GalaxyRowPlayer['id']) {
                    $Result .= "<a href=game.php?page=galaxy&action=2&galaxy=" . $Galaxy . "&system=" . $System . "&planet=" . $Planet . "&current=" . $user['current_planet'] . " >";
                    $Result .= "<img src=" . $dpath . "img/r.gif alt=\"" . $lang['gl_mipattack'] . "\" title=\"" . $lang['gl_mipattack'] . "\" border=0></a>";
                }
            }
        }
        $Result .= "</th>";

        return $Result;
    }

}
