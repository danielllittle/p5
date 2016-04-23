<tr>
<td><nobr>${standingsRow['name']}</nobr></td>
    <td>${standingsRow['wins']}</td>
    <td>${standingsRow['losses']}</td>
    <td>${standingsRow['ties']}</td>
    <td>${String.format("%.1f%%",100*standingsRow['winningPct'])}</td>
    <td class="hidden-xs">${standingsRow['gamesback']}</td>
    <td class="hidden-xs"><nobr>${standingsRow['confwins']}-${standingsRow['conflosses']}-${standingsRow['confties']}</nobr></td>
    <td class="hidden-xs"><nobr>${standingsRow['homewins']}-${standingsRow['homelosses']}-${standingsRow['hometies']}</nobr></td>
    <td class="hidden-xs"><nobr>${standingsRow['awaywins']}-${standingsRow['awaylosses']}-${standingsRow['awayties']}</nobr></td>
    <td><nobr>${standingsRow['last10wins']}-${standingsRow['last10losses']}-${standingsRow['last10ties']}</nobr></td>
    <td class="hidden-xs">${standingsRow['streak']}</td>
    <td class="hidden-xs">${String.format("%+d",standingsRow['deltapoints'])}</td>
</tr>