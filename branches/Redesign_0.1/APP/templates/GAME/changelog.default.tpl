{block name="title" prepend}{/block}
{block name="content"}{*
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
        </center>*}
        
        
                        <div id="inhalt">
                            <dl id="changelog" class="major">{foreach $changelog as $main_version => $update_version}
                                <dt class="header {cycle values="even,odd"}">
                                    {$Version} {$main_version}
                                </dt>
                                <dd style="display: block;">
                                    <dl class="minor">{foreach $update_version as $version_number => $description}
                                        <dt class="version {cycle values="odd,even"} open">
                                            {$version_number}
                                        </dt>
                                        <dd class="{cycle values="odd,even"}" style="display: block;">
                                            <ul>
                                                {$description|nl2br}
                                            </ul>
                                        </dd>{/foreach}
                                    </dl>
                                </dd>{/foreach}
                            </dl>
                        </div>
{/block}