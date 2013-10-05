{block name="title" prepend}{/block}
{block name="content"}
        <center>
            <br/>
            {if $Queue_lenght > 0}
                {$BuildListScript}
            {else}
            {/if}
            <table width=530>
            {if $Queue_lenght > 0}
                {$BuildList}
            {else}
            {/if}
                <tr>
                    <th >{$bld_usedcells}</th>
                    <th colspan="2">
                        <font color="#00FF00">{$planet_field_current}</font> / 
                        <font color="#FF0000">{$planet_field_max}</font> 
                        {$bld_theyare} {$field_libre} {$bld_cellfree}
                    </th >
                </tr><!--
                {foreach $tech as $Element => $ElementName}
                    {if (in_array($Element, $Allowed_planet_type))}
                        {if (IsTechnologieAccessible($user, $planetrow, $Element))}
                    
                    
                    <tr>
                        <td class="l">
                            <a href="infos.php?gid={$Element}">
                                <img border="0" src="{$dpath}gebaeude/{$Element}.gif" align="top" width="120" height="120">
                            </a>
                        </td>
                        <td class="l">
                            <a href="infos.php?gid={$Element}">{$ElementName}</a>
                            {if !$BuildingLevel == 0}
                            {else}
                                ({$level} {$BuildingLevel})
                            {/if}
                            <br>
                            {$descriptions[$Element]}<br>
                            {$price}3
                            {$time}4
                            {$rest_price}5
                        </td>
                        <td class="k">{ $click }</td>
                    </tr>
                    
                        {/if}
                    {/if}
                {/foreach}-->{$BuildingsList}
            </table>
            <br/>
        </center>
{/block}