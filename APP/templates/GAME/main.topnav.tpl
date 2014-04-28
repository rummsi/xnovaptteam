
                        <ul id="resources">
                            <li id="metal_box" class="metal tooltipHTML" title="">
                                <div class="resourceIcon metal"></div>
                                <span class="value">
                                    <span id="resources_metal" class="{if $planetrow["metal"] > $planetrow["metal_max"]}overmark{/if}">{pretty_number($planetrow["metal"])}</span>
                                </span>
                            <li id="crystal_box" class="crystal tooltipHTML" title="">
                                <div class="resourceIcon crystal"></div>
                                <span class="value">
                                    <span id="resources_crystal" class="{if $planetrow["crystal"] > $planetrow["crystal_max"]}overmark{/if}">{pretty_number($planetrow["crystal"])}</span>
                                </span>
                            </li>
                            <li id="deuterium_box" class="deuterium tooltipHTML" title="">
                                <div class="resourceIcon deuterium"></div>
                                <span class="value">
                                    <span id="resources_deuterium" class="{if $planetrow["deuterium"] > $planetrow["deuterium_max"]}overmark{/if}">{pretty_number($planetrow["deuterium"])}</span>
                                </span>
                            </li>
                            <li id="energy_box" class="energy tooltipHTML" title="">
                                <div class="resourceIcon energy"></div>
                                <span class="value">
                                    <span id="resources_energy" class="{if $planetrow["energy_max"] > $planetrow["energy_used"]}overmark{/if}">{pretty_number($planetrow["energy_used"])}</span>
                                </span>
                            </li>
                            <li id="darkmatter_box" class="darkmatter dark_highlight_tablet">
                                {*<a href="game.php?page=messages" class="tooltipHTML " title="" data-tooltip-button="Purchase Dark Matter">*}
                                    <img src="http://gf1.geo.gfsrv.net/cdnc5/401d1a91ff40dc7c8acfa4377d3d65.gif">
                                {*    <span class="value">
                                        <span class="" id="resources_darkmatter">{if $user['new_message'] > 0}[ {$user['new_message']} ]{else}[ 0 ]{/if}</span>
                                    </span>
                                </a>*}
                            </li>
                            </li>
                        </ul>
                        <div id="officers" class="one">
                            <table class="header">
                                <tbody>
                                    <tr class="header">
                                        <td class="header">
                                            <img src="{$dpath}planeten/small/s_{$planetrow['image']}.jpg" height="50" width="50">
                                        </td>
                                        <td  class="header" valign="middle">
                                            <select size="1" onChange="eval('location=\''+this.options[this.selectedIndex].value+'\'');">{while $CurPlanet = mysql_fetch_array($ThisUsersPlanets)}{if ($planetrow["destruyed"] == 0)}
                                                <option {if $CurPlanet['id'] == $user['current_planet']}selected="selected" {/if}value="?page={$page}&cp={$CurPlanet['id']}&mode={$mode}&re=0">
                                                    {$CurPlanet['name']}&nbsp;[{$CurPlanet['galaxy']}:{$CurPlanet['system']}:{$CurPlanet['planet']}]&nbsp;&nbsp;
                                                </option>{/if}{/while}
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                                
      {*  <div id="header_top">
            <center>
                <table class="header">
                    <tbody>
                        <tr class="header">
                            <td class="header">
                                <center>
                                    <table class="header">
                                        <tbody>
                                            <tr class="header">
                                                <td class="header">
                                                    <img src="{$dpath}planeten/small/s_{$planetrow['image']}.jpg" height="50" width="50">
                                                </td>
                                                <td  class="header" valign="middle">
                                                    <select size="1" onChange="eval('location=\''+this.options[this.selectedIndex].value+'\'');">{while $CurPlanet = mysql_fetch_array($ThisUsersPlanets)}{if ($planetrow["destruyed"] == 0)}
                                                        <option {if $CurPlanet['id'] == $user['current_planet']}selected="selected" {/if}value="?page={$page}&cp={$CurPlanet['id']}&mode={$mode}&re=0">
                                                            {$CurPlanet['name']}&nbsp;[{$CurPlanet['galaxy']}:{$CurPlanet['system']}:{$CurPlanet['planet']}]&nbsp;&nbsp;
                                                        </option>{/if}{/while}
                                                    </select>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </center>
                            </td>
                            <td class="header">
                                <table style="width: 508px;" class="header" id="resources" padding-right="30" border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr class="header">
                                            <td class="header" align="center" width="140"><img src="{$dpath}images/metall.gif" border="0" height="22" width="42"></td>
                                            <td class="header" align="center" width="140"><img src="{$dpath}images/kristall.gif" border="0" height="22" width="42"></td>
                                            <td class="header" align="center" width="140"><img src="{$dpath}images/deuterium.gif" border="0" height="22" width="42"></td>
                                            <td class="header" align="center" width="140"><img src="{$dpath}images/energie.gif" border="0" height="22" width="42"></td>
                                            <td class="header" align="center" width="140"><img src="{$dpath}images/message.gif" border="0" height="22" width="42"></td>
                                        </tr>
                                        <tr class="header">
                                            <td class="header" align="center" width="140"><i><b><font color="#ffffff">{$lang['Metal']}</font></b></i></td>
                                            <td class="header" align="center" width="140"><i><b><font color="#ffffff">{$lang['Crystal']}</font></b></i></td>
                                            <td class="header" align="center" width="140"><i><b><font color="#ffffff">{$lang['Deuterium']}</font></b></i></td>
                                            <td class="header" align="center" width="140"><i><b><font color="#ffffff">{$lang['Energy']}</font></b></i></td>
                                            <td class="header" align="center" width="140"><i><b><font color="#ffffff">{$lang['Message']}</font></b></i></td>
                                        </tr>
                                        <tr class="header">
                                            <td class="header" align="center" width="140"><font>{if $planetrow["metal"] > $planetrow["metal_max"]}
                                                                                                    {colorRed(pretty_number($planetrow["metal"]))}
                                                                                                {else}
                                                                                                    {pretty_number($planetrow["metal"])}
                                                                                                {/if}</font></td>
                                            <td class="header" align="center" width="140"><font>{if $planetrow["crystal"] > $planetrow["crystal_max"]}
                                                                                                    {colorRed(pretty_number($planetrow["crystal"]))}
                                                                                                {else}
                                                                                                    {pretty_number($planetrow["crystal"])}
                                                                                                {/if}</font></td>
                                            <td class="header" align="center" width="140"><font>{if $planetrow["deuterium"] > $planetrow["deuterium_max"]}
                                                                                                    {colorRed(pretty_number($planetrow["deuterium"]))}
                                                                                                {else}
                                                                                                    {pretty_number($planetrow["deuterium"])}
                                                                                                {/if}</font></td>
                                            <td class="header" align="center" width="140"><font>{if $planetrow["energy_max"] > $planetrow["energy_used"]}
                                                                                                    {colorRed(pretty_number($planetrow["energy_used"]))}
                                                                                                {else}
                                                                                                    {pretty_number($planetrow["energy_used"])}
                                                                                                {/if}/{pretty_number($planetrow["energy_max"])}</font></td>
                                            <td class="header" align="center" width="140"><font>{if $user['new_message'] > 0}
                                                                                                    <a href="game.php?page=messages">[ {$user['new_message']} ]</a>
                                                                                                {else}
                                                                                                    0
                                                                                                {/if}</font></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </center>
        </div>*}
                        <div id="message-wrapper">
                            <div>
                                <a href="game.php?page=messages" {if $user['new_message'] > 0}id="message_alert_box" class="tooltip js_hideTipOnMobile"{else}id="message_alert_box_default" class="tooltip js_hideTipOnMobile emptyMessage"{/if} title="{if $user['id'] != ''}
                                                                                                                                                                                                                                                            {if $user['new_message'] != 0}
                                                                                                                                                                                                                                                                {if $user['new_message'] == 1}
                                                                                                                                                                                                                                                                    {$lang['Have_new_message']}
                                                                                                                                                                                                                                                                {elseif $user['new_message'] > 1}
                                                                                                                                                                                                                                                                    {str_replace('%m', pretty_number($user['new_message']), $lang['Have_new_messages'])}
                                                                                                                                                                                                                                                                {/if}
                                                                                                                                                                                                                                                            {/if}
                                                                                                                                                                                                                                                        {/if}">
                                    {if $user['new_message'] > 0}<span>{$user['new_message']}</span>{/if}
                                </a>
                            </div>
                            <div id="messages_collapsed" style="position:relative;">
                            {*    <div id="eventboxFilled" class="eventToggle" style="display: none;">
                                    <table id="eventtype" style="border-collapse: collapse;" border="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td class="friendly col1" width="152">Own Missions: <span id="eventFriendly"></span></td>
                                                <td class="neutral col2" width="156">Friendly Missions: <span id="eventNeutral"></span></td>
                                                <td class="hostile col3" width="152">Hostile Missions: <span id="eventHostile"></span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table id="eventdetails" style="border-collapse: collapse;" border="0" width="100%">
                                        <tbody>
                                            <tr id="eventClass" class="">
                                                <td class="col1" width="152"><div class="countdown" id="tempcounter" name="countdown"></div></td>
                                                <td class="col2" width="208"><div class="text" id="eventContent"></div></td>
                                                <td class="col3" width="100">
                                                    <a id="js_eventDetailsClosed" class="tooltipRight js_hideTipOnMobile open" href="javascript:void(0);" title="More details"></a>
                                                    <a id="js_eventDetailsOpen" class="tooltipRight open js_hideTipOnMobile" href="javascript:void(0);" title="Less detail"></a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="eventboxLoading" class="textCenter textBeefy" style="display: none;">
                                    <img src="overview_moon_ficheiros/3f9884806436537bdec305aa26fc60.gif" height="16" width="16">load...
                                </div>*}
                                <div id="eventboxBlank" class="textCenter" style="">
                                    No fleet movement
                                </div>
                            </div>
                            <div id="attack_alert" style="visibility:hidden;">
                                <a href="game.php?page=eventList" class="tooltip eventToggle" title="Attack!">
                                    <img src="{$dpath}img/blackpixel.gif" height="13" width="25">
                                </a>
                            </div>
                            <br class="clearfloat">
                        </div><!-- #message-wrapper -->
                        <div id="helper">
                            <a class="tooltip" href="game.php?page=tutorial" title="">
                            </a>
                        </div>
                        <div id="selectedPlanetName" class="textCenter">{$planetrow['name']}</div>
                    </div><!-- Info -->
                    <!-- END HEADER -->
                    