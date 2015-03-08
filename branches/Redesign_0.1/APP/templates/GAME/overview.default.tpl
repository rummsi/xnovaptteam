{block name="title" prepend}{/block}
{block name="content"}
                        <div id="inhalt">
                            <div id="planet" style="background-image:url(http://gf1.geo.gfsrv.net/cdnff/05df4f7e0949c840c02a0aee2f30be.jpg);">
                          {*  <div id="planet" style="background-image:url({$dpath}planeten/{$planetrow['image']}.jpg);">
                            *}    <div id="detailWrapper">
                                    <div id="header_text">
                                        <h2>
                                            <a href="javascript:void(0);" class="openPlanetRenameGiveupBox">
                                                <p class="planetNameOverview">{$lang['Overview']} -</p>
                                                <span id="planetNameHeader">{$planetrow['name']}</span>
                                                <img class="hinted tooltip" title="{$lang['Planet_menu']}" src="images/settings.gif" width="16" height="16">
                                            </a>
                                        </h2>
                                    </div>
                                    <div id="detail" class="detail_screen">
                                        <div id="techDetailLoading"></div>
                                    </div>
                                    <div id="planetdata">
                                        <div class="overlay"></div>
                                        <div id="planetDetails">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tbody>
                                                    <tr>
                                                        <td class="desc">
                                                            <span id="diameterField"></span>
                                                        </td>
                                                        <td class="data">
                                                            <span id="diameterContentField"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="desc">
                                                            <span id="temperatureField"></span>
                                                        </td>
                                                        <td class="data">
                                                            <span id="temperatureContentField"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="desc">
                                                            <span id="positionField"></span>
                                                        </td>
                                                        <td class="data">
                                                            <span id="positionContentField"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="desc">
                                                            <span id="scoreField"></span></td>
                                                        <td class="data">
                                                            <span id="scoreContentField"></span>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div id="planetOptions">
                                            <a class="dark_highlight_tablet float_right openPlanetRenameGiveupBox" href="javascript:void(0);">
                                                <span class="planetMoveOverviewGivUpLink">{$lang['Planet_menu']}</span>
                                                <span class="planetMoveIcons settings planetMoveGiveUp icon"></span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="c-left"></div>
                            <div class="c-right"></div>
                            <div id="overviewBottom">
                                <div class="content-box-s">
                                    <div class="header">
                                        <h3>{$lang['lft_Buildings']}</h3>
                                    </div>
                                    <div class="content">
                                        <table cellpadding="0" cellspacing="0" class="construction active">
                                            <tbody>
                                                <tr>
                                                    <td colspan="2" class="idle">
                                                        <a class="tooltip js_hideTipOnMobile
                                                           " title="De momento não há nenhum edifício a ser construído. Carrega aqui para ir para o menu Recursos." href="http://s114-pt.ogame.gameforge.com/game/index.php?page=resources">
                                                            Não existem edifícios em construção!<br>(Para os Recursos)
                                                        </a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="footer"></div>
                                </div>
                                <div class="content-box-s">
                                    <div class="header">
                                        <h3>{$lang['lft_Research']}</h3>
                                    </div>
                                    <div class="content">    
                                        <table cellspacing="0" cellpadding="0" class="construction active">
                                            <tbody>
                                                <tr>
                                                    <td colspan="2" class="idle">
                                                        <a class="tooltip js_hideTipOnMobile
                                                           " title="Não há nenhuma pesquisa a ser efectuada de momento. Carrega aqui para entrar no Menu do Laboratório de Pesquisas." href="http://s114-pt.ogame.gameforge.com/game/index.php?page=research">
                                                            De momento não existem pesquisas em progresso.<br>(Para as Pesquisas)
                                                        </a>
                                                    </td>
                                                </tr>   
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="footer"></div>
                                </div>
                                <div class="content-box-s">
                                    <div class="header">
                                        <h3>{$lang['lft_Shipyard']}</h3>
                                    </div>
                                    <div class="content">    
                                        <table cellspacing="0" cellpadding="0" class="construction active">
                                            <tbody>
                                                <tr>
                                                    <td colspan="2" class="idle">
                                                        <a class="tooltip js_hideTipOnMobile
                                                           " title="Não há naves ou defesas a serem construídas neste planeta. Carrega aqui para ir para o Menu Hangar." href="http://s114-pt.ogame.gameforge.com/game/index.php?page=shipyard">
                                                            De momento não existem naves/defesas em construção.<br>(Para o Hangar)
                                                        </a>
                                                    </td>
                                                </tr>   
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="footer"></div>
                                </div>
                                <div class="clearfloat"></div>
                                <div class="clearfloat"></div>
                            </div><!-- #overviewBottom -->
                        </div>
        <center>
            <br>
            <table width="519">
		<tr>
                    <th>{$lang['MembersOnline']}</th>
                    <th colspan="3">{$OnlineUsers[0]}</th>
		</tr>
		<tr>
                    <th>
                        {if $lunarow['id'] <> 0}
                            {if $planetrow['planet_type'] == 1}
                                <a href="?page=overview&cp={$lune['id']}&re=0" title="{$lune['name']}">
                                    <img src="{$dpath}planeten/{$lune['image']}.jpg" height="50" width="50">
                                </a>
                                <br>
                                {$lune['name']}
                            {/if}
                        {/if}
                    </th>
                    <th colspan="2">
                        <img src="{$dpath}planeten/{$planetrow['image']}.jpg" height="200" width="200">
                        <br>
                        {if $planetrow['b_building'] != 0}
                            {*UpdatePlanetBatimentQueueList($planetrow, $user)*}
                            {if $planetrow['b_building'] != 0}
                                {InsertBuildListScript("overview")}
                                {$lang['tech'][$CurrBuild[0]]} ({$CurrBuild[1]})
                                <br />
                                <div id="blc" class="z">{pretty_time($RestTime)}</div>
                                <!--<script language="JavaScript">
                                    pp = "{$RestTime}";
                                    pk = "{1}";
                                    pm = "cancel";
                                    pl = "{$PlanetID}";
                                    t();
                                </script>-->
                            {else}
                                {$lang['Free']}
                            {/if}
                        {else}
                            {$lang['Free']}
                        {/if}
                    </th>
                    <th class="s">
                        <table class="s" align="top" border="0">
                            <tr>{$anothers_planets}</tr>
			</table>
                    </th>
		</tr>
		<tr>
                    <th>{$lang['Developed_fields']}</th>
                    <th colspan="3" align="center">
                        <div  style="border: 1px solid rgb(153, 153, 255); width: 400px;">
			<div  id="CaseBarre" style="background-color: {if (floor($planetrow["field_current"] / CalculateMaxPlanetFields($planetrow) * 100) * 4.0) > (100 * 4.0)}
                                                                        #C00000
                                                                      {elseif (floor($planetrow["field_current"] / CalculateMaxPlanetFields($planetrow) * 100) * 4.0) > (80 * 4.0)}
                                                                        #C0C000
                                                                      {else}
                                                                        #00C000
                                                                      {/if}; width: {floor($planetrow['field_current'] / CalculateMaxPlanetFields($planetrow) * 100) * 4.0}px;">
                            <font color="#CCF19F">{floor($planetrow['field_current'] / CalculateMaxPlanetFields($planetrow) * 100)} {$lang['o/o']}</font>
			</div>
                    </th>
                </tr>
                    <tr>
			<th>{$lang['ov_off_level']}</th>
			<th colspan="3" align="center">
                            <table border="0" width="100%">
                                <tbody>
                                    <tr>
					<td align="center" width="50%" style="background-color: transparent;">
                                            <b>{$lang['ov_off_mines']} : {$user['lvl_minier']}</b>
                                        </td>
					<td align="center" width="50%" style="background-color: transparent;">
                                            <b>{$lang['ov_off_raids']} : {$user['lvl_raid']}</b>
                                        </td>
                                    </tr>
				</tbody>
                            </table>
			</th>
                    </tr>
                    <tr>
                        <th>{$lang['ov_off_expe']}</th>
			<th colspan="3" align="center">
                            <table border="0" width="100%">
                                <tbody>
                                    <tr>
                                        <td align="center" width="50%" style="background-color: transparent;">
                                            <b>{$lang['ov_off_mines']} : {$user['xpminier']} / {$lvl_up_minier}</b>
                                        </td>
					<td align="center" width="50%" style="background-color: transparent;">
                                            <b>{$lang['ov_off_raids']} : {$user['xpraid']} / {$lvl_up_raid}</b>
                                        </td>
                                    </tr>
				</tbody>
                            </table>
			</th>
                    </tr>
                    <tr>
			<th>{$lang['ov_local_cdr']}</th>
			<th colspan="3">
                            {$lang['Metal']} : {pretty_number($galaxyrow['metal'])} / {$lang['Crystal']} : {pretty_number($galaxyrow['crystal'])}
                            {if ($galaxyrow['metal'] != 0 || $galaxyrow['crystal'] != 0) && $planetrow[$resource[209]] != 0}
                                (<a href="quickfleet.php?mode=8&g={$galaxyrow['galaxy']}&s={$galaxyrow['system']}&p={$galaxyrow['planet']}&t=2">
                                    {$lang['type_mission'][8]}
                                </a>)
                            {/if}
                        </th>
                    </tr>
                    <tr>
			<th>{$lang['Points']}</th>
			<th colspan="3">
                            <table border="0" width="100%">
				<tbody>
                                    <tr>
					<td align="right" width="50%" style="background-color: transparent;">
                                            <b>{$lang['ov_pts_build']} :</b>
                                        </td>
					<td align="left" width="50%" style="background-color: transparent;">
                                            <b>{pretty_number($StatRecord['build_points'])}</b>
                                        </td>
                                    </tr>
                                    <tr>
					<td align="right" width="50%" style="background-color: transparent;">
                                            <b>{$lang['ov_pts_fleet']} :</b>
                                        </td>
					<td align="left" width="50%" style="background-color: transparent;">
                                            <b>{pretty_number($StatRecord['fleet_points'])}</b>
                                        </td>
                                    </tr>
                                    <tr>
					<td align="right" width="50%" style="background-color: transparent;">
                                            <b>{$lang['ov_pts_reche']} :</b>
                                        </td>
					<td align="left" width="50%" style="background-color: transparent;">
                                            <b>{pretty_number($StatRecord['tech_points'])}</b>
                                        </td>
                                    </tr>
                                    <tr>
					<td align="right" width="50%" style="background-color: transparent;">
                                            <b>{$lang['ov_pts_total']} :</b>
                                        </td>
					<td align="left" width="50%" style="background-color: transparent;">
                                            <b>{pretty_number($StatRecord['total_points'])}</b>
                                        </td>
                                    </tr>
				</tbody>
                            </table>
			</th>
                    </tr>
                    <th>{$lang['Raids']}</th>
                    <th colspan="3">
			<table border="0" width="100%">
                            <tbody>
				<tr>
                                    <td align="right" width="50%" style="background-color: transparent;">
                                        <b>{$lang['NumberOfRaids']} :</b>
                                    </td>
                                    <td align="left" width="50%" style="background-color: transparent;">
                                        <b>{$user['raids']}</b>
                                    </td>
				</tr>
				<tr>
                                    <td align="right" width="50%" style="background-color: transparent;">
                                        <b>{$lang['RaidsWin']} :</b>
                                    </td>
                                    <td align="left" width="50%" style="background-color: transparent;">
                                        <b>{$user['raidswin']}</b>
                                    </td>
                                </tr>
				<tr>
                                    <td align="right" width="50%" style="background-color: transparent;">
                                        <b>{$lang['RaidsLoose']} :</b>
                                    </td>
                                    <td align="left" width="50%" style="background-color: transparent;">
                                        <b>{$user['raidsloose']}</b>
                                    </td>
				</tr>
                            </tbody>
			</table>
                    </th>
                    {if $game_config['ForumBannerFrame'] == '1'}
                        <tr>
                            <th colspan="4">
                                <img src="scripts/createbanner.php?id={$user['id']}">
                                <br>{$lang['InfoBanner']}<br>
                                <input name="bannerlink" type="text" id="bannerlink" value="[img]/scripts/createbanner.php?id={$user['id']}[/img]" size="62">
                            </th>
                        </tr>
                    {/if}
                    {if $game_config['OverviewExternChat'] == '1'}
                        <tr>
                            <th colspan="4">{stripslashes($game_config['OverviewExternChatCmd'])}</th>
                        </tr>
                    {/if}
		</table>
		<br>
		{if $game_config['OverviewClickBanner'] != ''}
                    {stripslashes($game_config['OverviewClickBanner'])}
                {/if}
		<br>
        </center>
{/block}