
<tr><td><nobr><g:formatDate format="MMM-dd" date="${it.game.datetime}" />&nbsp;

    ${it.game.awayTeam.toString()}&nbsp;v.&nbsp;${it.game.homeTeam.toString()}
</td>
<g:if test="${it.didNotPlay}"><td align="center" colspan="12">Did Not Play</td>
</g:if>
<g:else>


    <td>${it.minutesPlayed}</td><td>${it.points}</td><td>${it.assists}</td><td>${it.rebounds}</td><td>${it.steals}</td><td class="hidden-xs">${it.shotsAttempted}</td>
<td class="hidden-xs">${it.shotsMade}</td><td class="hidden-xs"><g:formatNumber format="##.#" number="${it.shotsPercentage}" type="percent"   /></td>
    <td class="hidden-xs">${it.threePointersAttempted}</td><td class="hidden-xs">${it.threePointersMade}</td>
<td class="hidden-xs" align="right"><g:formatNumber format="##.#" number="${it.threePointerPercentage}" type="percent"   /></td>
    <td>${it.personalFouls}</td></tr>
</g:else>
