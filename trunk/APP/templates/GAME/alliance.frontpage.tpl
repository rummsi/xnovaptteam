{block name="title" prepend}{/block}
{block name="content"}
        <center>
            <br>
            <table width=519>
                <tr>
                    <td class=c colspan=2>{$your_alliance}</td>
                </tr>
                {$ally_image}
                <tr>
                    <th>{$Tag}</th>
                    <th>{$ally_tag}</th>
                </tr>
                <tr>
                    <th>{$Name}</th>
                    <th>{$ally_name}</th>
                </tr>
                <tr>
                    <th>{$Members}</th>
                    <th>{$ally_members} 
                        {if $ally['ally_owner'] == $user['id'] || $ally_ranks[$user['ally_rank_id']-1]['memberlist'] != 0}
                            (<a href="game.php?page=alliance&mode=memberslist">
                                {$Members_list}
                            </a>)
                        {/if}
                    </th>
                </tr>
                <tr>
                    <th>{$Range}</th>
                    <th>{$range}
                        {if ($ally['ally_owner'] == $user['id'] || $ally_ranks[$user['ally_rank_id']-1]['administrieren'] != 0)}
                             (<a href="game.php?page=alliance&mode=admin&edit=ally">{$Alliance_admin}</a>)
                        {/if}
                    </th>
                </tr>
                {if $request_count != 0}
                    {if ($ally['ally_owner'] == $user['id'] || $ally_ranks[$user['ally_rank_id']-1]['bewerbungen'] != 0)}
                        <tr>
                            <th>{$Requests}</th>
                            <th>
                                <a href="game.php?page=alliance&mode=admin&edit=requests">
                                    {$request_count} {$Requests}
                                </a>
                            </th>
                        </tr>
                    {/if}
                {/if}
                {if $ally['ally_owner'] == $user['id'] || $ally_ranks[$user['ally_rank_id']-1]['mails'] != 0}
                    <tr>
                        <th>{$Circular_message}</th>
                        <th>
                            <a href="game.php?page=alliance&mode=circular">
                                {$Send_circular_mail}
                            </a>
                        </th>
                    </tr>
                {/if}
                <tr>
                    <th colspan=2 height=100>{$ally_description}</th>
                </tr>
                <tr>
                    <th>{$Main_Page}</th>
                    <th>
                        <a href="{$ally_web}">
                            {$ally_web}
                        </a>
                    </th>
                </tr>
                <tr>
                    <td class=c colspan=2>{$Inner_section}</th>
                </tr>
                <tr>
                    <th colspan=2 height=100>{$ally_text}</th>
                </tr>
            </table>
            {if $ally['ally_owner'] != $user['id']}
                {$ally_owner}
            {/if}
        </center>
{/block}