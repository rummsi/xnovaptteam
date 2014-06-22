{block name="title" prepend}{/block}
{block name="content"}
        <center>
            <br><br>
            <table border="0" cellpadding="0" cellspacing="1" width="750">
                <tbody>
                    <tr height="20" valign="left">
                        <td class="c" colspan="{count($planet) + 1}">{$lang['imperium_vision']}</td>
                    </tr>
                    <tr height="75">
                        <th width="75"></th>
                        {foreach $planet as $p}
                            <th style="padding: 20px;">
                                <a href="overview.php?cp={$p['id']}&amp;re=0">
                                    <img src="{$dpath}planeten/small/s_{$p['image']}.jpg" border="0" height="71" width="75">
                                </a>
                            </th>
                        {/foreach}
                    </tr>
                    <tr height="20">
                        <th width="75">{$lang['name']}</th>
                        {foreach $planet as $p}
                            <th width="75">
                                {$p['name']}
                            </th>
                        {/foreach}
                    </tr>
                    <tr height="20">
                        <th width="75">{$lang['coordinates']}</th>
                        {foreach $planet as $p}
                            <th width="75">
                                [<a href="galaxy.php?mode=3&galaxy={$p['galaxy']}&system={$p['system']}">{$p['galaxy']}:{$p['system']}:{$p['planet']}</a>]
                            </th>
                        {/foreach}
                    </tr>
                    <tr height="20">
                        <th width="75">{$lang['fields']}</th>
                        {foreach $planet as $p}
                            <th width="75">
                                {$p['field_current']}/{$p['field_max']}
                            </th>
                        {/foreach}
                    </tr>
                    <tr height="20">
                        <td class="c" colspan="{count($planet) + 1}" align="left">{$lang['resources']}</td>
                    </tr>
                    <tr height="20">
                        <th width="75">{$lang['metal']}</th>
                        {foreach $planet as $p}
                            <th width="75">
                                <a href="resources.php?cp={$p['id']}&amp;re=0&amp;planettype={$p['planet_type']}">
                                    {pretty_number($p['metal'])}
                                </a> / {pretty_number($p['metal_perhour'])}
                            </th>
                        {/foreach}
                    </tr>
                    <tr height="20">
                        <th width="75">{$lang['crystal']}</th>
                        {foreach $planet as $p}
                            <th width="75">
                                <a href="resources.php?cp={$p['id']}&amp;re=0&amp;planettype={$p['planet_type']}">
                                    {pretty_number($p['crystal'])}
                                </a> / {pretty_number($p['crystal_perhour'])}
                            </th>
                        {/foreach}
                    </tr>
                    <tr height="20">
                        <th width="75">{$lang['deuterium']}</th>
                        {foreach $planet as $p}
                            <th width="75">
                                <a href="resources.php?cp={$p['id']}&amp;re=0&amp;planettype={$p['planet_type']}">
                                    {pretty_number($p['deuterium'])}
                                </a> / {pretty_number($p['deuterium_perhour'])}
                            </th>
                        {/foreach}
                    </tr>
                    <tr height="20">
                        <th width="75">{$lang['energy']}</th>
                        {foreach $planet as $p}
                            <th width="75">
                                {pretty_number($p['energy_max'] - $p['energy_used'])} / {pretty_number($p['energy_max'])}
                            </th>
                        {/foreach}
                    </tr>
                    <tr height="20">
                        <td class="c" colspan="{count($planet) + 1}" align="left">{$lang['buildings']}</td>
                    </tr>
                    <!-- Lista de edificios -->
                    {foreach $reslist['build'] as $a => $i}
                        <tr>
                            <th width="75">
                                {$lang['tech'][$i]}
                            </th>
                            {foreach $planet as $p}
                            <th width="75">
                                    {if (in_array($i, $reslist['build']))}
                                        {if $p[$resource[$i]]    == 0}
                                            -
                                        {else}
                                            <a href="buildings.php?cp={$p['id']}&amp;re=0&amp;planettype={$p['planet_type']}">
                                                {$p[$resource[$i]]}
                                            </a>
                                        {/if}
                                    {/if}
                                </th>
                            {/foreach}
                        </tr>
                    {/foreach}
                    <tr height="20">
                        <td class="c" colspan="{count($planet) + 1}" align="left">{$lang['investigation']}</td>
                    </tr>
                        <!-- Lista de tecnologias -->
                    {foreach $reslist['tech'] as $a => $i}
                        <tr>
                            <th width="75">
                                {$lang['tech'][$i]}
                            </th>
                            {foreach $planet as $p}
                                <th width="75">
                                    {if (in_array($i, $reslist['tech']))}
                                        {if $user[$resource[$i]]    == 0}
                                            -
                                        {else}
                                            <a href="buildings.php?mode=research&cp={$p['id']}&amp;re=0&amp;planettype={$p['planet_type']}">
                                                {$user[$resource[$i]]}
                                            </a>
                                        {/if}
                                    {/if}
                                </th>
                            {/foreach}
                        </tr>
                    {/foreach}
                    <tr height="20">
                        <td class="c" colspan="{count($planet) + 1}" align="left">{$lang['ships']}</td>
                    </tr>
                        <!-- Lista de naves -->
                    {foreach $reslist['fleet'] as $a => $i}
                        <tr>
                            <th width="75">
                                {$lang['tech'][$i]}
                            </th>
                            {foreach $planet as $p}
                                <th width="75">
                                    {if (in_array($i, $reslist['fleet']))}
                                        {if $p[$resource[$i]] ==0}
                                            -
                                        {else}
                                            <a href="buildings.php?mode=fleet&cp={$p['id']}&amp;re=0&amp;planettype={$p['planet_type']}">
                                                {$p[$resource[$i]]}
                                            </a>
                                        {/if}
                                    {/if}
                                </th>
                            {/foreach}
                        </tr>
                    {/foreach}
                    <tr height="20">
                        <td class="c" colspan="{count($planet) + 1}" align="left">{$lang['defense']}</td>
                    </tr>
                        <!-- Lista de defensas -->
                    {foreach $reslist['defense'] as $a => $i}
                        <tr>
                            <th width="75">
                                {$lang['tech'][$i]}
                            </th>
                            {foreach $planet as $p}
                                <th width="75">
                                    {if (in_array($i, $reslist['defense']))}
                                        {if $p[$resource[$i]] ==0}
                                            -
                                        {else}
                                            <a href="buildings.php?mode=defense&cp={$p['id']}&amp;re=0&amp;planettype={$p['planet_type']}">
                                                {$p[$resource[$i]]}
                                            </a>
                                        {/if}
                                    {/if}
                                </th>
                            {/foreach}
                        </tr>
                    {/foreach}
                </tbody>
            </table>
            <script type="text/javascript" src="scripts/wz_tooltip.js"></script>
        </center>
{/block}