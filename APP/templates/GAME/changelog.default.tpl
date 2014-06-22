{block name="title" prepend}{/block}
{block name="content"}
        <center>
            <table width="668">
                <tr>
                    <td class="c">{$Version}</td>
                    <td class="c">{$Description}</td>
                </tr>
                {foreach $changelog as $version_number => $description}
                    <tr>
                        <th width="42">{$version_number}</th>
                        <td style="text-align:left" class=b>{$description|nl2br}</td>
                    </tr>
                {/foreach}
            </table>
        </center>
{/block}