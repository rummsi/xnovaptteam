{block name="title" prepend}{/block}
{block name="content"}
            <center>
                <script type="text/javascript" src="scripts/flotten.js"></script>
                <script type="text/javascript">
                    function getStorageFaktor()
                    {
                        return 1;
                    }
                </script>
                <br>
                <form action="game.php?page=fleet4" method="post">
                    <input type="hidden" name="thisresource1"  value=\"{$pmetal}" />
                    <input type="hidden" name="thisresource2"  value=\"{$pcrystal}" />
                    <input type="hidden" name="thisresource3"  value=\"{$pdeuterium}" />
                    <input type="hidden" name="consumption"    value=\"{$consumption}" />
                    <input type="hidden" name="dist"           value=\"{$distance}" />
                    <input type="hidden" name="speedfactor"    value=\"{$Pspeedfactor}" />
                    <input type="hidden" name="thisgalaxy"     value=\"{$Pthisgalaxy}" />
                    <input type="hidden" name="thissystem"     value=\"{$Pthissystem}" />
                    <input type="hidden" name="thisplanet"     value=\"{$Pthisplanet}" />
                    <input type="hidden" name="galaxy"         value=\"{$Pgalaxy}" />
                    <input type="hidden" name="system"         value=\"{$Psystem}" />
                    <input type="hidden" name="planet"         value=\"{$Pplanet}" />
                    <input type="hidden" name="thisplanettype" value=\"{$Pthisplanettype}" />
                    <input type="hidden" name="planettype"     value=\"{$Pplanettype}" />
                    <input type="hidden" name="speedallsmin"   value=\"{$Pspeedallsmin}" />
                    <input type="hidden" name="speed"          value=\"{$Pspeed}" />
                    <input type="hidden" name="speedfactor"    value=\"{$Pspeedfactor}" />
                    <input type="hidden" name="usedfleet"      value=\"{$Pusedfleet}" />
                    <input type="hidden" name="maxepedition"   value=\"{$Pmaxepedition}" />
                    <input type="hidden" name="curepedition"   value=\"{$Pcurepedition}" />
                    {$page1}
                    <table border="0" cellpadding="0" cellspacing="1" width="519">
                        <tbody>
                            <tr align="left" height="20">
                                <td class="c" colspan="2">
                                    {if {$Pplanettype} == 1}
                                        {$Pgalaxy}:{$Psystem}:{$Pplanet} - {$fl_planet}
                                    {elseif {$Pplanettype} == 3}
                                        {$Pgalaxy}:{$Psystem}:{$Pplanet} - {$fl_moon}
                                    {/if}
                                    <!--{$TableTitle}-->
                                </td>
                            </tr>
                            <tr align="left" valign="top">
                                <th width="50%">
                                    <table border="0" cellpadding="0" cellspacing="0" width="259">
                                        <tbody>
                                            <tr height="20">
                                                <td class="c" colspan="2">
                                                    {$fl_mission}
                                                </td>
                                            </tr>
                                            {if count($missiontype) > 0}
                                                {if $planet == 16}
                                                    <tr height="20">
                                                        <th>
                                                            <input type="radio" name="mission" value="15" checked="checked">
                                                                {$typemission15}
                                                            <br/>
                                                            <br/>
                                                            <font color=\"red\">
                                                                {$fl_expe_warning}
                                                            </font>
                                                        </th>
                                                    </tr>
                                                {else}
                                                    {foreach $missiontype as $a => $b}
                                                        <tr height="20">
                                                            <th>
                                                                <input id="inpuT_{$i}" type="radio" name="mission" value="{$a}"{$mission_cheked}>
                                                                <label for="inpuT_{$i}">
                                                                    {$b}
                                                                </label>
                                                                <br>
                                                            </th>
                                                        </tr>
                                                    {/foreach}
                                                {/if}
                                            {else}
                                                <tr height="20">
                                                    <th>
                                                        <font color="red">
                                                            {$fl_bad_mission}
                                                        </font>
                                                    </th>
                                                </tr>
                                            {/if}
                                            <!--{$MissionSelector}-->
                                        </tbody>
                                    </table>
                                </th>
                                <th>
                                    <table border="0" cellpadding="0" cellspacing="0" width="259">
                                        <tbody>
                                            <tr height="20">
                                                <td colspan="3" class="c">
                                                    {$fl_ressources}
                                                </td>
                                            </tr>
                                            <tr height="20">
                                                <th>
                                                    {$Metal}
                                                </th>
                                                <th>
                                                    <a href="javascript:maxResource('1');">
                                                        {$fl_selmax}
                                                    </a>
                                                </th>
                                                <th>
                                                    <input name="resource1" alt="{$Metal} {$fmetal}" size="10" onchange="calculateTransportCapacity();" type="text">
                                                </th>
                                            </tr>
                                            <tr height="20">
                                                <th>
                                                    {$Crystal}
                                                </th>
                                                <th>
                                                    <a href="javascript:maxResource('2');">
                                                        {$fl_selmax}
                                                    </a>
                                                </th>
                                                <th>
                                                    <input name="resource2" alt="{$Crystal} {$fcrystal}" size="10" onchange="calculateTransportCapacity();" type="text">
                                                </th>
                                            </tr>
                                            <tr height="20">
                                                <th>
                                                    {$Deuterium}
                                                </th>
                                                <th>
                                                    <a href="javascript:maxResource('3');">
                                                        {$fl_selmax}
                                                    </a>
                                                </th>
                                                <th>
                                                    <input name="resource3" alt="{$Deuterium} {$fdeuterium}" size="10" onchange="calculateTransportCapacity();" type="text">
                                                </th>
                                            </tr>
                                            <tr height=\"20\">
                                                <th>{$fl_space_left}</th>
                                                <th colspan="2">
                                                    <div id="remainingresources">-</div>
                                                </th>
                                            </tr>
                                            <tr height="20">
                                                <th colspan="3">
                                                    <a href="javascript:maxResources()">
                                                        {$fl_allressources}
                                                    </a>
                                                </th>
                                            </tr>
                                            <tr height="20">
                                                <th colspan="3">
                                                </th>
                                            </tr>
                                            {$page}
                                        </tbody>
                                    </table>
                                </th>
                            </tr>
                            <tr height="20">
                                <th colspan="2">
                                    <input accesskey="z" value="{$fl_continue}" type="submit">
                                </th>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </center>
{/block}