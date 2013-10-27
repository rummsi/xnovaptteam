{block name="title" prepend}{/block}
{block name="content"}
        <center>
            <br/>
            {if $Queue_lenght > 0}
                {$BuildListScript}
            {/if}
            <table width=530>
            {if $Queue_lenght > 0}
                {$BuildList}
            {/if}
                <tr>
                    <th >{$bld_usedcells}</th>
                    <th colspan="2">
                        <font color="#00FF00">{$planet_field_current}</font> / 
                        <font color="#FF0000">{$planet_field_max}</font> 
                        {$bld_theyare} {$field_libre} {$bld_cellfree}
                    </th >
                </tr>
                {foreach $lang['tech'] as $Element => $ElementName}
                    {if in_array($Element, $Allowed[$planetrow['planet_type']])}
                        {if IsTechnologieAccessible($user, $planetrow, $Element)}
                    <tr>
                        <td class="l">
                            <a href="infos.php?gid={$Element}">
                            <img border="0" src="{$dpath}gebaeude/{$Element}.gif" align="top" width="120" height="120">
                            </a>
                        </td>
                        <td class="l">
                            <a href="infos.php?gid={$Element}">{$ElementName}</a>{if $planetrow[$resource[$Element]] > 0}({$lang['level']}{$planetrow[$resource[$Element]]}){/if}<br>
                            {$lang['res']['descriptions'][$Element]}<br>
                            {GetElementPrice($user, $planetrow, $Element)}
                            {ShowBuildTime(GetBuildingTime($user, $planetrow, $Element))}
                            {GetRestPrice($user, $planetrow, $Element)}
                        </td>
                        <td class="k">
                            {if $Element == 31}
                                {if $user["b_tech_planet"] != 0 && $game_config['BuildLabWhileRun'] != 1}
                                    <font color=#FF0000>{$lang['in_working']}</font>
                                {/if}
                            {/if}
                            {if $RoomIsOk && $CanBuildElement}
                                {if $Queue['lenght'] == 0}
                                    {if $NextBuildLevel == 1}
                                        {if $HaveRessources == true}
                                            <a href="game.php?page=buildings&cmd=insert&building={$Element}">
                                                <font color=#00FF00>{$lang['BuildFirstLevel']}</font>
                                            </a>
                                        {else}
                                            <font color=#FF0000>{$lang['BuildFirstLevel']}</font>
                                        {/if}
                                    {else}
                                        {if $HaveRessources == true}
                                            <a href="game.php?page=buildings&cmd=insert&building={$Element}"><font color=#00FF00>{$lang['BuildNextLevel']} {$NextBuildLevel}</font></a>
                                        {else}
                                            <font color=#FF0000>{$lang['BuildNextLevel']} {$NextBuildLevel}</font>
                                        {/if}
                                    {/if}
                                {else}
                                    <a href="game.php?page=buildings&cmd=insert&building={$Element}"><font color=#00FF00>{$lang['InBuildQueue']}</font></a>
                                {/if}
                            {elseif $RoomIsOk && !$CanBuildElement}
                                {if $NextBuildLevel == 1}
                                    <font color=#FF0000>{$lang['BuildFirstLevel']}</font>
                                {else}
                                    <font color=#FF0000>{$lang['BuildNextLevel']} {$NextBuildLevel}</font>
                                {/if}
                            {else}
                                <font color=#FF0000>{$lang['NoMoreSpace']}</font>
                            {/if}
                        </td>
                    </tr>
                    {/if}
                    {/if}
                {/foreach}
            </table>
            <br/>
        </center>
{/block}