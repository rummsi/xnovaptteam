{block name="title" prepend}{/block}
{block name="content"}
        <center>
            <script language="JavaScript" type="text/javascript" src="scripts/time.js"></script>
            <br>
            <table width="519">
                <tr>
                    <td class="c" colspan="4">
                        <a href="game.php?page=renameplanet" title="{$lang['Planet_menu']}">{$lang['Planet']} "{$planet_name}"</a> ({$user_username})
                    </td>
		</tr>
                {if $user['id'] != ''}
                    {if $user['new_message'] != 0}
                        <tr>
                            {if $user['new_message'] == 1}
                                <th colspan=4><a href=game.php?page=messages>{$lang['Have_new_message']}</a></th>
                            {elseif $user['new_message'] > 1}
                                <th colspan=4><a href=game.php?page=messages>
                                    {str_replace('%m', pretty_number($user['new_message']), $lang['Have_new_messages'])}
                                </a></th>
                            {/if}
                        </tr>
                    {/if}
                {/if}
                {if ($LvlUpMinier + $LvlUpRaid) <= 100}
                    {if $XpMinier >= $XpMinierUp}
                        <tr>
                            <th colspan=4><a href=officier.php>{$lang['Have_new_level_mineur']}</a></th>
                        </tr>
                    {/if}
                    {if $XPRaid >= $XpRaidUp}
                        <tr>
                            <th colspan=4><a href=officier.php>{$lang['Have_new_level_raid']}</a></th>
                        </tr>
                    {/if}
                {/if}
		<tr>
                    <th>{$lang['Server_time']}</th>
                    <th colspan="3"><div id="dateheure"></div></th>
		</tr>
		<tr>
                    <th>{$lang['MembersOnline']}</th>
                    <th colspan="3">{$NumberMembersOnline}</th>
		</tr>
                {if ($game_config['OverviewNewsFrame'] == '1')}
                    <tr>
                        <th>{$lang['ov_news_title']}</th>
                        <th colspan="3">{stripslashes($game_config['OverviewNewsText'])}</th>
                    </tr>
                {/if}
		<tr>
                    <td colspan="4" class="c">{$lang['Events']}</td>
		</tr>
		{$fleet_list}
		<tr>
                    <th>{$moon_img}<br>{$moon}</th>
                    <th colspan="2"><img src="{$dpath}planeten/{$planet_image}.jpg" height="200" width="200"><br>{$building}</th>
                    <th class="s">
                        <table class="s" align="top" border="0">
                            <tr>{$anothers_planets}</tr>
			</table>
                    </th>
		</tr>
		<tr>
                    <th>{$lang['Diameter']}</th>
                    <th colspan="3">{$planet_diameter} km (<a title="{$lang['Developed_fields']}">{$planet_field_current}</a> / <a title="{$lang['max_eveloped_fields']}">{$planet_field_max}</a> {$lang['fields']})</th>
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
					<td align="center" width="50%" style="background-color: transparent;"><b>{$lang['ov_off_mines']} : {$lvl_minier}</b></td>
					<td align="center" width="50%" style="background-color: transparent;"><b>{$lang['ov_off_raids']} : {$lvl_raid}</b></td>
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
                                        <td align="center" width="50%" style="background-color: transparent;"><b>{$lang['ov_off_mines']} : {$xpminier} / {$lvl_up_minier}</b></td>
					<td align="center" width="50%" style="background-color: transparent;"><b>{$lang['ov_off_raids']} : {$xpraid} / {$lvl_up_raid}</b></td>
                                    </tr>
				</tbody>
                            </table>
			</th>
                    </tr>
                    <tr>
			<th>{$lang['Temperature']}</th>
			<th colspan="3">{$lang['ov_temp_from']} {$planet_temp_min}{$lang['ov_temp_unit']} {$lang['ov_temp_to']} {$planet_temp_max}{$lang['ov_temp_unit']}</th>
                    </tr>
                    <tr>
			<th>{$lang['Position']}</th>
			<th colspan="3">
                            <a href="galaxy.php?mode=0&galaxy={$galaxy_galaxy}&system={$galaxy_system}">
                                [{$galaxy_galaxy}:{$galaxy_system}:{$galaxy_planet}]
                            </a>
			</th>
                    </tr>
                    <tr>
			<th>{$lang['ov_local_cdr']}</th>
			<th colspan="3">{$lang['Metal']} : {$metal_debris} / {$lang['Crystal']} : {$crystal_debris}{if (($galaxyrow['metal'] != 0 || $galaxyrow['crystal'] != 0) && $planetrow[$resource[209]] != 0)}
                                                                                                                     (<a href="quickfleet.php?mode=8&g={$galaxyrow['galaxy']}&s={$galaxyrow['system']}&p={$galaxyrow['planet']}&t=2">{$lang['type_mission'][8]}</a>)
                                                                                                                   {/if}
                        </th>
                    </tr>
                    <tr>
			<th>{$lang['Points']}</th>
			<th colspan="3">
                            <table border="0" width="100%">
				<tbody>
                                    <tr>
					<td align="right" width="50%" style="background-color: transparent;"><b>{$lang['ov_pts_build']} :</b></td>
					<td align="left" width="50%" style="background-color: transparent;"><b>{$user_points}</b></td>
                                    </tr>
                                    <tr>
					<td align="right" width="50%" style="background-color: transparent;"><b>{$lang['ov_pts_fleet']} :</b></td>
					<td align="left" width="50%" style="background-color: transparent;"><b>{$user_fleet}</b></td>
                                    </tr>
                                    <tr>
					<td align="right" width="50%" style="background-color: transparent;"><b>{$lang['ov_pts_reche']} :</b></td>
					<td align="left" width="50%" style="background-color: transparent;"><b>{$player_points_tech}</b></td>
                                    </tr>
                                    <tr>
					<td align="right" width="50%" style="background-color: transparent;"><b>{$lang['ov_pts_total']} :</b></td>
					<td align="left" width="50%" style="background-color: transparent;"><b>{$total_points}</b></td>
                                    </tr>
                                    <tr>
					<td colspan="2" align="center" width="100%" style="background-color: transparent;">
                                            <b>({$lang['Rank']} <a href="stat.php?range={$u_user_rank}">{$user_rank}</a> {$lang['of']} {$game_config['users_amount']})</b>
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
                                    <td align="right" width="50%" style="background-color: transparent;"><b>{$lang['NumberOfRaids']} :</b></td>
                                    <td align="left" width="50%" style="background-color: transparent;"><b>{$raids}</b></td>
				</tr>
				<tr>
                                    <td align="right" width="50%" style="background-color: transparent;"><b>{$lang['RaidsWin']} :</b></td>
                                    <td align="left" width="50%" style="background-color: transparent;"><b>{$raidswin}</b></td>
                                </tr>
				<tr>
                                    <td align="right" width="50%" style="background-color: transparent;"><b>{$lang['RaidsLoose']} :</b></td>
                                    <td align="left" width="50%" style="background-color: transparent;"><b>{$raidsloose}</b></td>
				</tr>
                            </tbody>
			</table>
                    </th>
                    {if ($game_config['ForumBannerFrame'] == '1')}
                        <tr>
                            <th colspan="4">
                                <img src="scripts/createbanner.php?id={$user['id']}"><br>{$lang['InfoBanner']}<br>
                                <input name="bannerlink" type="text" id="bannerlink" value="[img]/scripts/createbanner.php?id={$user['id']}[/img]" size="62">
                            </th>
                        </tr>
                    {/if}
                    {if ($game_config['OverviewExternChat'] == '1')}
                        <tr><th colspan="4">{stripslashes($game_config['OverviewExternChatCmd'])}</th></tr>
                    {/if}
		</table>
		<br>
		{if ($game_config['OverviewClickBanner'] != '')}
                    {stripslashes($game_config['OverviewClickBanner'])}
                {/if}
		<br>
        </center>
{/block}