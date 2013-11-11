{block name="title" prepend}{/block}
{block name="content"}
        <script language="JavaScript" src="scripts/flotten.js"></script>
        <script language="JavaScript" src="scripts/ocnt.js"></script>
        <br>
        <center>
            <table width='519' border='0' cellpadding='0' cellspacing='1'>
                <tr height='20'>
                    <td colspan='9' class='c'>
                        <table border="0" width="100%">
                            <tbody>
                                <tr>
                                    <td style="background-color: transparent;">
                                        {$fl_title} {$MaxFlyingFleets} {$fl_sur} {$MaxFlottes}
                                    </td>
                                    <td style="background-color: transparent;" align="right">
                                        {$ExpeditionEnCours}/{$EnvoiMaxExpedition} {$fl_expttl}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                {if $MaxFlottes == $MaxFlyingFleets}
                    <tr height="20">
                        <th colspan="9">
                            <font color="red">
                                {$fl_noslotfree}
                            </font>
                        </th>
                    </tr>
                {/if}
            </table>
        </center>
            <center>
                <form action="floten1.php" method="post">
                    <table width="519" border="0" cellpadding="0" cellspacing="1">
                        <tr height="20">
                            <td colspan="4" class="c">{$fl_new_miss}</td>
                        </tr>
                        <tr height="20">
                            <th>{$fl_fleet_typ}</th>
                            <th>{$fl_fleet_disp}</th>
                            <th>-</th>
                            <th>-</th>
                        </tr>
                        {$page}
                        <tr height="20">
                            {if !$have_ships}
                                <th colspan="4">{$fl_noships}</th>
                            </tr>
                            <tr height="20">
                                <th colspan="4">
                                    <input type="submit" value="{$fl_continue}"/>
                                </th>
                            {else}
                                <th colspan="2">
                                    <a href="javascript:noShips();shortInfo();noResources();" >
                                        {$fl_unselectall}
                                    </a>
                                </th>
                                <th colspan="2">
                                    <a href="javascript:maxShips();shortInfo();" >
                                        {$fl_selectall}
                                    </a>
                                </th>
                            </tr>
                                {if $MaxFlottes > $MaxFlyingFleets}
                                    <tr height="20">
                                        <th colspan="4">
                                            <input type="submit" value="{$fl_continue}"/>
                                        </th>
                                {/if}
                            {/if}
                        </tr>
                    </table>
                    {$ShipData}
                    <input type="hidden" name="galaxy" value="{$galaxy}" />
                    <input type="hidden" name="system" value="{$system}" />
                    <input type="hidden" name="planet" value="{$planet}" />
                    <input type="hidden" name="planet_type" value="{$planettype}" />
                    <input type="hidden" name="mission" value="{$target_mission}" />
                    <input type="hidden" name="maxepedition" value="{$EnvoiMaxExpedition}" />
                    <input type="hidden" name="curepedition" value="{$ExpeditionEnCours}" />
                    <input type="hidden" name="target_mission" value="{$target_mission}" />
                </form>
            </center>
{/block}