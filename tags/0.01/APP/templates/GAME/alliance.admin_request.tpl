{block name="title" prepend}{/block}
{block name="content"}
        <center>
            <br>
            <table width=519>
                <tr>
                    <td class=c colspan=2>{$Apply_ally_overview} [{$ally_tag}]</td>
                </tr>
                {$request}
                <tr>
                    <th colspan=2>{$There_is_hanging_request}</th>
                </tr>
                <tr>
                    <td class=c>
                        <center>
                            <a href="game.php?page=alliance&mode=admin&edit=requests&show=0&sort=1">
                                {$Candidate}
                            </a>
                        </center>
                    </td>
                    <td class=c>
                        <center>
                            <a href="game.php?page=alliance&mode=admin&edit=requests&show=0&sort=0">
                                {$Date_of_the_request}
                            </a>
                        </center>
                    </td>
                </tr>
                {$list}
                <tr>
                    <td class=c colspan=2>
                        <a href="game.php?page=alliance">
                            {$Back}
                        </a>
                    </td>
                </tr>
            </table>
        </center>
{/block}