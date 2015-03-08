<tr class="eventFleet" id="eventRow-9480785" data-mission-type="{$MissionType}" data-return-flight="{if $Status != 2}false{else}true{/if}" data-arrival-time="1400778799">
    {$fleet_javai}
    <td class="countDown friendly textBeefy" id="bxx{$fleet_order}">A carregar...</td>
    <td class="arrivalTime">{$fleet_time}</td>
    <td class="missionFleet">
        <img src="images/missions/{$fleet_style}.gif" class="tooltipHTML" title="Fleet próprio|{$lang['type_mission'][$MissionType]}"/>
    </td>
    <td class="originFleet">
        <figure class="planetIcon {if $StartType == 1}planet{elseif $StartType == 3}moon{/if}"></figure>
        {$StartPlanet['name']}
    </td>
    <td class="coordsOrigin">
        <a href="game.php?page=galaxy&galaxy={$FleetRow['fleet_start_galaxy']}&system={$FleetRow['fleet_start_system']}" target="_top">
            [{$FleetRow['fleet_start_galaxy']}:{$FleetRow['fleet_start_system']}:{$FleetRow['fleet_start_planet']}]
        </a>
    </td>
    <td class="detailsFleet">
        <span>{$FleetRow['fleet_amount']}</span>
    </td>
    <td class="{if $Status != 2}icon_movement{else}icon_movement_reserve{/if}">
        <span class="tooltip tooltipRight tooltipClose" title="
                        <div class='htmlTooltip'>
                        <h1>Detalhes da Frota:</h1>
                        <div class='splitLine'></div>
                        <table cellpadding='0' cellspacing='0' class='fleetinfo'>
                        {$FleetContent}
                        <tr>
                        <td colspan='2'>&amp;nbsp;</td>
                        </tr>
                        {$FleetCapacity}
                        </table>
                        </div>
              " data-federation-user-id="">
            &nbsp;
        </span>
    </td>
    <td class="destFleet">
        <figure class="planetIcon {if $TargetType == 1}planet{elseif $TargetType == 3}moon{/if}"></figure>
        {$TargetPlanet['name']}
    </td>
    <td class="destCoords">
        <a href="game.php?page=galaxy&galaxy={$FleetRow['fleet_end_galaxy']}&system={$FleetRow['fleet_end_system']}" target="_top">
            [{$FleetRow['fleet_end_galaxy']}:{$FleetRow['fleet_end_system']}:{$FleetRow['fleet_end_planet']}]
        </a>
    </td>
    <td class="sendProbe"></td>
    <td class="sendMail"></td>
    {$fleet_javas}
</tr>