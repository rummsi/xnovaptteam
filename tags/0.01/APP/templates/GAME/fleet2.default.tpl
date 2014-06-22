{block name="title" prepend}{/block}
{block name="content"}
            <center>
                <script type="text/javascript" src="scripts/flotten.js"></script>
                <script type="text/javascript">
                    function getStorageFaktor()
                    {
                        return 1
                    }
                </script>
                <form action="game.php?page=fleet3" method="POST">
                    {$FleetHiddenBlock}
                    <input type="hidden" name="speedallsmin" value="{$speedallsmin}" />
                    <input type="hidden" name="usedfleet" value="{$fleetarray}" />
                    <input type="hidden" name="thisgalaxy" value="{$galaxy}" />
                    <input type="hidden" name="thissystem" value="{$system}" />
                    <input type="hidden" name="thisplanet" value="{$planet}" />
                    <input type="hidden" name="galaxyend" value="{$Pgalaxy}" />
                    <input type="hidden" name="systemend" value="{$Psystem}" />
                    <input type="hidden" name="planetend" value="{$Pplanet}" />
                    <input type="hidden" name="speedfactor" value="{$GetGameSpeedFactor}" />
                    <input type="hidden" name="thisplanettype" value="{$planet_type}" />
                    <input type="hidden" name="thisresource1" value="{$fmetal}" />
                    <input type="hidden" name="thisresource2" value="{$fcrystal}" />
                    <input type="hidden" name="thisresource3" value="{$fdeuterium}" />
                    <br>
                    <div>
                        <table width="519" border="0" cellpadding="0" cellspacing="1">
                            <tr height="20">
                                <td colspan="2" class="c">
                                    {$lang['fl_floten1_ttl']}
                                </td>
                            </tr>
                            <tr height="20">
                                <th width=\"50%\">
                                    {$lang['fl_dest']}
                                </th>
                                <th>
                                    <input name="galaxy" size="3" maxlength="2" onChange="shortInfo()" onKeyUp="shortInfo()" value="{$g}" />
                                    <input name="system" size="3" maxlength="3" onChange="shortInfo()" onKeyUp="shortInfo()" value="{$s}" />
                                    <input name="planet" size="3" maxlength="2" onChange="shortInfo()" onKeyUp="shortInfo()" value="{$p}" />
                                    <select name="planettype" onChange="shortInfo()" onKeyUp="shortInfo()">
                                        <option value="1"{$t1}>{$lang['fl_planet']} </option>
                                        <option value="2"{$t2}>{$lang['fl_ruins']}</option>
                                        <option value="3"{$t3}>{$lang['fl_moon']} </option>
                                    </select>
                                </th>
                            </tr>
                            <tr height="20">
                                <th>{$lang['fl_speed']}</th>
                                <th>
                                    <select name="speed" onChange="shortInfo()" onKeyUp="shortInfo()">
                                        {foreach $speed as $a => $b}
                                            <option value="{$a}">{$b}</option>
                                        {/foreach}
                                    </select> %
                                </th>
                            </tr>
                            <tr height="20">
                                <th>
                                    {$lang['fl_dist']}
                                </th>
                                <th>
                                    <div id="distance">-</div>
                                </th>
                            </tr>
                            <tr height="20">
                                <th>
                                    {$lang['fl_fltime']}
                                </th>
                                <th>
                                    <div id="duration">-</div>
                                </th>
                            </tr>
                            <tr height="20">
                                <th>
                                    {$lang['fl_deute_need']}
                                </th>
                                <th>
                                    <div id="consumption">-</div>
                                </th>
                            </tr>
                            <tr height="20">
                                <th>
                                    {$lang['fl_speed_max']}
                                </th>
                                <th>
                                    <div id="maxspeed">-</div>
                                </th>
                            </tr>
                            <tr height="20">
                                <th>
                                    {$lang['fl_max_load']}
                                </th>
                                <th>
                                    <div id="storage">-</div>
                                </th>
                            </tr>
                            <tr height="20">
                                <td colspan="2" class="c">
                                    {$lang['fl_shortcut']}
                                    <a href="fleetshortcut.php">
                                        {$lang['fl_shortlnk']}
                                    </a>
                                </td>
                            </tr>
                            {$page}
                            <tr height="20">
                                <td colspan="2" class="c">
                                    {$lang['fl_myplanets']}
                                </td>
                            </tr>
                            {$page1}
                            </tr>
                            <tr height="20">
                                <td colspan="2" class="c">{$lang['fl_grattack']}</td>
                            </tr>
                            <tr height="20">
                                <th colspan="2">-</th>
                            </tr>
                            <tr height="20">
                                <th colspan="2">
                                    <input type="submit" value="{$lang['fl_continue']}" />
                                </th>
                            </tr>
                        </table>
                    </div>
                    <input type="hidden" name="maxepedition" value="{$Pmaxepedition}" />
                    <input type="hidden" name="curepedition" value="{$Pcurepedition}" />
                    <input type="hidden" name="target_mission" value="{$target_mission}" />
                </form>
                <script>javascript:shortInfo(); </script>
            </center>
{/block}