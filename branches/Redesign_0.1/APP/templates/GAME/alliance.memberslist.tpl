{block name="title" prepend}{/block}
{block name="content"}
        <center>
            <br>
            <table width=519>
                <tr>
                    <td class=c colspan=8>{$lang['Members_list']} ({$lang['Ammount']}: {$i})</td>
                </tr>
                <tr>
                    <th>{$lang['Number']}</th>
                    <th><a href="?page=alliance&mode=memberslist&sort1=1&sort2={$s}">{$lang['Name']}</a></th>
                    <th></th>
                    <th><a href="?page=alliance&mode=memberslist&sort1=2&sort2={$s}">{$lang['Position']}</a></th>
                    <th><a href="?page=alliance&mode=memberslist&sort1=3&sort2={$s}">{$lang['Points']}</a></th>
                    <th><a href="?page=alliance&mode=memberslist&sort1=0&sort2={$s}">{$lang['Coordinated']}</a></th>
                    <th><a href="?page=alliance&mode=memberslist&sort1=4&sort2={$s}">{$lang['Member_from']}</a></th>
                    <th><a href="?page=alliance&mode=memberslist&sort1=5&sort2={$s}">{$lang['Online']}</a></th>
                </tr>
                {while $u = mysql_fetch_array($listuser)}
                    <!--{$i++}-->
                    <tr>
                        <th>{$i}</th>
                        <th>{$u['username']}</th>
                        <th>
                            <a href="game.php?page=messages&mode=write&id={$u['id']}">
                                <img src="{$dpath}img/m.gif" border=0 title="{$lang['Write_a_message']}">
                            </a>
                        </th>
                        <th>{if ($ally['ally_owner'] == $u['id'])}
                                {($ally['ally_owner_range'] == '') ? "Leader" : $ally['ally_owner_range']}
                            {elseif (isset($allianz_raenge[$u['ally_rank_id']]['name']))}
                                {$allianz_raenge[$u['ally_rank_id']]['name']}
                            {else}
                                {$lang['Novate']}
                            {/if}
                        </th>
                        <th>{pretty_number($UserPoints['total_points'])}</th>
                        <th>
                            <a href="game.php?page=galaxy&action=0&galaxy={$u['galaxy']}&system={$u['system']}">
                                {$u['galaxy']}:{$u['system']}:{$u['planet']}
                            </a>
                        </th>
                        <th>
                            {if ($u['ally_register_time'] > 0)}
                                {date("Y-m-d h:i:s", $u['ally_register_time'])}
                            {/if}
                        </th>
                        <th>
                            <font color={if $u["onlinetime"] + 60 * 10 >= time() && $user_can_watch_memberlist_status}
                                            lime>{$lang['On']}
                                        {elseif ($u["onlinetime"] + 60 * 20 >= time() && $user_can_watch_memberlist_status)}
                                            yellow>{$lang['15_min']}
                                        {elseif ($user_can_watch_memberlist_status)}
                                            red>{$lang['Off']}
                                        {else}
                                            orange>-
                                        {/if}
                            </font>
                        </th>
                {/while}
                <tr>
                    <td class="c" colspan="9">
                        <a href="game.php?page=alliance">
                            {$lang['Return_to_overview']}
                        </a>
                    </td>
                </tr>
            </table>
        </center>
{/block}