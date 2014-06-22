{block name="title" prepend}{/block}
{block name="content"}
        <center>
            <br />
            <table align="top">
                <tr>
                    <td>
                        <form action="game.php?page=defense" method="post">
                            <table width=530>
                                {$tableIndex = 0}
                                {foreach $types[Legacies_Empire::TYPE_DEFENSE] as $shipId}
                                    {if ($shipyard->checkAvailability($shipId))}
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
                                                {$maxElements = $shipyard->getMaximumBuildableElementsCount($shipId)}
                                                {if bccomp($maxElements, 0) > 0}
                                                    <input type=text id="fmenge:{$shipId}" name=fmenge[{$shipId}] alt='{$lang['tech'][$shipId]}' size=5 maxlength=5 value=0 tabindex={$tableIndex}>
                                                    {if (MAX_FLEET_OR_DEFS_PER_ROW > 0 && $maxElements > MAX_FLEET_OR_DEFS_PER_ROW)}
                                                        {$maxElements = MAX_FLEET_OR_DEFS_PER_ROW}
                                                    {/if}
                                                    <br /><a onclick="document.getElementById('fmenge:{$shipId}').value='{strval($maxElements)}';" style="cursor:pointer;">Nombre max ({number_format($maxElements, 0, ',', '.')})</a>
                                                {else if (in_array($shipId, array(Legacies_Empire::ID_DEFENSE_SMALL_SHIELD_DOME, Legacies_Empire::ID_DEFENSE_LARGE_SHIELD_DOME)))}
                                                    <span style="color:red">Limite de construction atteinte.</span>
                                                {else if (in_array($shipId, array(Legacies_Empire::ID_DEFENSE_SMALL_SHIELD_DOME, Legacies_Empire::ID_DEFENSE_LARGE_SHIELD_DOME)))}
                                                    <span style="color:red">Silo plein.</span>
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
            {$buildinglist}
        </center>
{/block}