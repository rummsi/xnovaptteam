{block name="title" prepend}{/block}
{block name="content"}
        <center>
            <br>
            <h1>{$Send_Apply}</h1>
            <table width=519>
                <form action="game.php?page=alliance&mode=apply&allyid={$allyid}" method=POST>
                    <tr>
                        <td class=c colspan=2>{$Write_to_alliance}</td>
                    </tr>
                    <tr>
                        <th>{$Message} (<span id="cntChars">{$chars_count}</span> / 6000 {$characters})</th>
                        <th>
                            <textarea name="text" cols=40 rows=10 onkeyup="javascript:cntchar(6000)">
                                {$text_apply}
                            </textarea>
                        </th>
                    </tr>
                    <tr>
                        <th>{$Help}</th>
                        <th>
                            <input type=submit name="further" value="{$Reload}">
                        </th>
                    </tr>
                    <tr>
                        <th colspan=2>
                            <input type=submit name="further" value="{$lang['Send']}">
                        </th>
                    </tr>
                </form>
            </table>
            <script language="JavaScript" src="scripts/wz_tooltip.js"></script>
        </center>
{/block}