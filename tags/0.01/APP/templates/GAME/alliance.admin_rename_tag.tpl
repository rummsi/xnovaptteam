{block name="title" prepend}{/block}
{block name="content"}
        <center>
            <br>
            <form action="" method=POST>
                <table width=519>
                    <tr>
                        <td class=c colspan=2>{$question}</td>
                    </tr>
                    <tr>
                        <th>{$New_name}</th>
                        <th>
                            <input type=text name=newtag>
                            <input type=submit value="{$Change}">
                        </th>
                    </tr>
                    <tr>
                        <td class="c" colspan="9">
                            <a href="game.php?page=alliance&mode=admin&edit=ally">
                                {$Return_to_overview}
                            </a>
                        </td>
                    </tr>
                </table>
            </form>
        </center>
{/block}
