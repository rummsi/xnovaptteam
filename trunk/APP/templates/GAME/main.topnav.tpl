
                        <ul id="resources">
                            <li id="metal_box" class="metal tooltipHTML" title="">
                                <div class="resourceIcon metal"></div>
                                <span class="value">
                                    <span id="resources_metal" class=""></span>
                                </span>
                            </li>
                            <li id="crystal_box" class="crystal tooltipHTML" title="">
                                <div class="resourceIcon crystal"></div>
                                <span class="value">
                                    <span id="resources_crystal" class=""></span>
                                </span>
                            </li>
                            <li id="deuterium_box" class="deuterium tooltipHTML" title="">
                                <div class="resourceIcon deuterium"></div>
                                <span class="value">
                                    <span id="resources_deuterium" class=""></span>
                                </span>
                            </li>
                            <li id="energy_box" class="energy tooltipHTML"
                                title="">
                                <div class="resourceIcon energy"></div>
                                <span class="value">
                                    <span id="resources_energy" class=""></span>
                                </span>
                            </li>
                            <li id="darkmatter_box" class="darkmatter dark_highlight_tablet tooltipHTML"
                                title="">
                                <a href="game.php?page=officier">
                                    <img src="http://gf1.geo.gfsrv.net/cdnc5/401d1a91ff40dc7c8acfa4377d3d65.gif" />
                                    <span class="value">
                                        <span id="resources_darkmatter"></span>
                                    </span>
                                </a>
                            </li>
                        </ul>
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
