{block name="title" prepend}{/block}
{block name="content"}
        <center>
            <br><br>
            <table width="569">
                <tbody>
                    <tr>
                        <td colspan="3" class="c"><b>{$ctc_title}</b></td>
                    </tr>
                    <tr>
                        <th colspan="3">
                            <font color="orange">{$ctc_intro}</font>
                        </th>
                    </tr>
                    <tr>
                        <th><font color="lime">{$ctc_name}</font></th>
                        <th><font color="lime">{$ctc_rank}</font></th>
                        <th><font color="lime">{$ctc_mail}</font></th>
                    </tr>
                    {$ctc_admin_list}
                    <tr>
                    </tr>
                    <tr>
                        <th colspan="3">
                            <a href="index.php">
                                Retour a l'accueil
                            </a>
                        </th>
                    </tr>
                </tbody>
            </table>
        </center>
{/block}