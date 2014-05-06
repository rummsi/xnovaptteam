
                        <ul id="resources">
                            <li id="metal_box" class="metal tooltipHTML"
                                title="Metal:| &lt;table class=&quot;resourceTooltip&quot;&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Disponível:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;overmark&quot;&gt;7.573.482&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Capacidade de Armazenamento:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;overmark&quot;&gt;2.920.000&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Produção actual:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;overmark&quot;&gt;0&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Capacidade Den:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;overermark&quot;&gt;0&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;/table&gt;">
                                <div class="resourceIcon metal"></div>
                                <span class="value">
                                    <span id="resources_metal" class="{if $planetrow["metal"] > $planetrow["metal_max"]}overmark{/if}">{pretty_number($planetrow["metal"])}</span>
                                </span>
                            </li>
                            <li id="crystal_box" class="crystal tooltipHTML"
                                title="Cristal:| &lt;table class=&quot;resourceTooltip&quot;&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Disponível:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;&quot;&gt;2.207.837&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Capacidade de Armazenamento:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;&quot;&gt;2.920.000&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Produção actual:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;undermark&quot;&gt;+9.922&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Capacidade Den:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;overermark&quot;&gt;0&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;/table&gt;">
                                <div class="resourceIcon crystal"></div>
                                <span class="value">
                                    <span id="resources_crystal" class="{if $planetrow["crystal"] > $planetrow["crystal_max"]}overmark{/if}">{pretty_number($planetrow["crystal"])}</span>
                                </span>
                            </li>
                            <li id="deuterium_box" class="deuterium tooltipHTML"
                                title="Deutério:| &lt;table class=&quot;resourceTooltip&quot;&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Disponível:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;&quot;&gt;1.102.616&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Capacidade de Armazenamento:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;&quot;&gt;1.590.000&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Produção actual:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;undermark&quot;&gt;+2.903&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Capacidade Den:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;overermark&quot;&gt;0&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;/table&gt;">
                                <div class="resourceIcon deuterium"></div>
                                <span class="value">
                                    <span id="resources_deuterium" class="{if $planetrow["deuterium"] > $planetrow["deuterium_max"]}overmark{/if}">{pretty_number($planetrow["deuterium"])}</span>
                                </span>
                            </li>
                            <li id="energy_box" class="energy tooltipHTML"
                                title="Energia:| &lt;table class=&quot;resourceTooltip&quot;&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Disponível:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;overmark&quot;&gt;-2.644&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Produção actual:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;undermark&quot;&gt;+8.075&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Consumo:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;overmark&quot;&gt;-10.719&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;/table&gt;">
                                <div class="resourceIcon energy"></div>
                                <span class="value">
                                    <span id="resources_energy" class="{if $planetrow["energy_max"] > $planetrow["energy_used"]}overmark{/if}">{pretty_number($planetrow["energy_used"])}</span>
                                </span>
                            </li>
                            <li id="darkmatter_box" class="darkmatter dark_highlight_tablet{* tooltipHTML*}"
                            {*    title="Matéria Negra:| &lt;table class=&quot;resourceTooltip&quot;&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Disponível:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;&quot;&gt;4.158&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Comprado:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;&quot;&gt;500&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;tr&gt;
                                &lt;th&gt;Encontrado:&lt;/th&gt;
                                &lt;td&gt;&lt;span class=&quot;&quot;&gt;3.658&lt;/span&gt;&lt;/td&gt;
                                &lt;/tr&gt;
                                &lt;/table&gt;"
                                data-tooltip-button="Comprar Matéria Negra"*}>
                             {*   <a href="http://s114-pt.ogame.gameforge.com/game/index.php?page=premium&openDetail=1">*}
                                    <img src="http://gf1.geo.gfsrv.net/cdnc5/401d1a91ff40dc7c8acfa4377d3d65.gif" />
                             {*       <span class="value">
                                        <span id="resources_darkmatter">
                                            4.158                        </span>
                                    </span>
                                </a>*}
                            </li>
                        </ul>{*
        <div id="header_top">
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
                                    <table border="0" width="100%" id="eventtype" style="border-collapse: collapse;">
                                        <tr>
                                            <td width="152" class="friendly col1">Próprias Missões: <span id="eventFriendly"></span></td>
                                            <td width="156" class="neutral col2">Missões Amigáveis: <span id="eventNeutral"></span></td>
                                            <td width="152" class="hostile col3">Missões Hostis: <span id="eventHostile"></span></td>
                                        </tr>
                                    </table>
                                    <table border="0" width="100%" id="eventdetails" style="border-collapse: collapse;">
                                        <tr id="eventClass" class="">
                                            <td width="152" class="col1"><div class="countdown" id="tempcounter" name="countdown"></div></td>
                                            <td width="208" class="col2"><div class="text" id="eventContent"></div></td>
                                            <td width="100" class="col3">
                                                <a id="js_eventDetailsClosed" class="tooltipRight js_hideTipOnMobile"
                                                   href="javascript:void(0);"
                                                   title="Mais detalhes"></a>
                                                <a id="js_eventDetailsOpen" class="tooltipRight open js_hideTipOnMobile"
                                                   href="javascript:void(0);"
                                                   title="Menos detalhes"></a>

                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div id="eventboxLoading" class="textCenter textBeefy" style="display: block;">
                                    <img height="16" width="16" src="http://gf3.geo.gfsrv.net/cdne3/3f9884806436537bdec305aa26fc60.gif" />A carregar...
                                </div>*}
                                <div id="eventboxBlank" class="textCenter" style="">
                                    Sem movimentos de frota
                                </div>
                            </div>
                            <div id="attack_alert" class="tooltip eventToggle noAttack" title="Ataque!">
                                <a href="game.php?page=eventList"></a>
                            </div>
                            <br class="clearfloat" />
                        </div><!-- #message-wrapper -->
                        <div id="helper">
                            <a class="tooltip" href="game.php?page=tutorial" title="Vista geral do Tutorial">
                            </a>
                        </div>
                        <div id="selectedPlanetName" class="textCenter">{$planetrow['name']}</div>
                    </div><!-- Info -->
                    <!-- END HEADER -->
