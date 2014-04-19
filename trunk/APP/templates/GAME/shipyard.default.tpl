{block name="title" prepend}{/block}
{block name="content"}
        <center>
            <br />
            <table align="top">
                <tr>
                    <td>
                        <form action="game.php?page=shipyard" method="post">
                            <table width=530>
                                {$tableIndex = 0}
                                {foreach $types[Legacies_Empire::TYPE_SHIP] as $shipId}
                                    {if $shipyard->checkAvailability($shipId)}
                                        {$CanBuildOne         = IsElementBuyable($user, $planetrow, $shipId, false)}
                                        {$BuildOneElementTime = $shipyard->getBuildTime($shipId, 1)}
                                <tr>
                                    <th class=l>
                                        <a href=game.php?page=infos&gid={$shipId}>
                                            <img border=0 src="{$dpath}gebaeude/{$shipId}.gif" align=top width=120 height=120>
                                        </a>
                                    </th>
                                    <td class=l>
                                        <a href=game.php?page=infos&gid={$shipId}>{$lang['info'][$shipId]['name']}</a>
                                        {if $planetrow[$resource[$shipId]] > 0}
                                            ({$lang['dispo']}: {pretty_number($planetrow[$resource[$shipId]])})
                                        {/if}<br />
                                        {$lang['res']['descriptions'][$shipId]}<br />
                                        {GetElementPrice($user, $planetrow, $shipId, false)}
                                        {ShowBuildTime($BuildOneElementTime)}
                                    </td>
                                    <th class=k>
                                        {if $CanBuildOne}
                                            <input type=text id="fmenge:{$shipId}" name=fmenge[{$shipId}] alt='{$lang['tech'][$shipId]}' value=0 tabindex={$tableIndex}>
                                        {/if}
                                        {$maxElements = $shipyard->getMaximumBuildableElementsCount($shipId)}
                                        {if (MAX_FLEET_OR_DEFS_PER_ROW > 0 && $maxElements > MAX_FLEET_OR_DEFS_PER_ROW)}
                                            {$maxElements = MAX_FLEET_OR_DEFS_PER_ROW}
                                        {/if}
                                        {if ($CanBuildOne)}
                                            <br />
                                            <a onclick="document.getElementById('fmenge:{$shipId}').value='{strval($maxElements)}';" style="cursor:pointer;">Nombre max ({number_format($maxElements, 0, ',', '.')})</a>
                                        {/if}
                                    </th>
                                </tr>
                                    {/if}
                                {/foreach}
                                <tr>
                                    <td class="c" colspan=2 align="center">
                                        <input type="submit" value="{$lang['Construire']}">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </td>
                    <td valign="top"></td>
                </tr>
            </table>
            {if (!empty($planetrow['b_hangar_id']))}
                {$buildinglist}
            {/if}
        </center>
{/block}