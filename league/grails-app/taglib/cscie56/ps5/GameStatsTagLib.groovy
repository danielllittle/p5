package cscie56.ps5

import java.math.RoundingMode;

class GameStatsTagLib {
    static defaultEncodeAs = [taglib:'none']
    static namespace = "stats"
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]


    def summaryStatsAbs = { attrs, body ->
        def shoot2pct = calculateShootingPercent(attrs.playerGameStats.shotsAttempted.sum(), attrs.playerGameStats.shotsMade.sum())
        def shoot3pct = calculateShootingPercent(attrs.playerGameStats.threePointersAttempted.sum(), attrs.playerGameStats.threePointersMade.sum())

        out << "<tr><td><nobr>Totals</nobr></td>" +
                "<td>${attrs.playerGameStats.count{it->!it.didNotPlay}}</td>" +
                "<td>${attrs.playerGameStats.minutesPlayed.sum()}</td>" +
                "<td>${attrs.playerGameStats.points.sum()}</td>"+
                "<td>${attrs.playerGameStats.assists.sum()}</td>" +
                "<td>${attrs.playerGameStats.rebounds.sum()}</td>" +
                "<td>${attrs.playerGameStats.steals.sum()}</td>" +
                "<td class=\"hidden-xs\">${attrs.playerGameStats.shotsMade.sum()}</td>" +
                "<td class=\"hidden-xs\">${attrs.playerGameStats.shotsAttempted.sum()}</td>" +
                "<td class=\"hidden-xs\"><g:formatNumber format=\"##.#\" number=\"${shoot2pct}\" type=\"percent\"/></td>" +
                "<td class=\"hidden-xs\">${attrs.playerGameStats.threePointersMade.sum()}</td>" +
                "<td class=\"hidden-xs\">${attrs.playerGameStats.threePointersAttempted.sum()}</td>" +
                "<td class=\"hidden-xs\" align=\"right\"><g:formatNumber format=\"##.#\" number=\"${shoot2pct}\" type=\"percent\"/></td>" +
                "<td class=\"hidden-xs\">${attrs.playerGameStats.personalFouls.sum()}</td></tr>"
    }

    def calculateShootingPercent(int shotsAttempted, int shotsMade) {
        if (shotsAttempted == 0) {
            0.0
        } else {
            return 100 * shotsMade / shotsAttempted
        }
    }

    def summaryStatsAvg = { attrs, body ->

        def filteredSize = attrs.playerGameStats.findAll{ gs -> !gs.didNotPlay }.size()

        boolean zeroResult = (filteredSize == 0)

        def mp  = zeroResult ? 0.0 : attrs.playerGameStats.minutesPlayed.sum()/filteredSize
        def pts = zeroResult ? 0.0 : attrs.playerGameStats.points.sum()/filteredSize
        def ast = zeroResult ? 0.0 : attrs.playerGameStats.assists.sum()/filteredSize
        def rbs = zeroResult ? 0.0 : attrs.playerGameStats.rebounds.sum()/filteredSize
        def stl = zeroResult ? 0.0 : attrs.playerGameStats.steals.sum()/filteredSize
        def sha = zeroResult ? 0.0 : attrs.playerGameStats.shotsAttempted.sum()/filteredSize
        def shm = zeroResult ? 0.0 : attrs.playerGameStats.shotsMade.sum()/filteredSize
        def tpa = zeroResult ? 0.0 : attrs.playerGameStats.threePointersAttempted.sum()/filteredSize
        def tpm = zeroResult ? 0.0 : attrs.playerGameStats.threePointersMade.sum()/filteredSize
        def pfs = zeroResult ? 0.0 : attrs.playerGameStats.personalFouls.sum()/filteredSize

        def pct2 = (zeroResult || sha == 0.0 ) ? 0.0 : 100* (shm.divide(sha, 4, RoundingMode.HALF_UP))
        def pct3 = (zeroResult || tpa == 0.0 ) ? 0.0 : 100* (tpm.divide(tpa, 4, RoundingMode.HALF_UP))

        StringBuffer sb = new StringBuffer("<tr><td>Averages</td> <td/>"

                + String.format("<td>%.2f</td>", mp)
                + String.format("<td>%.2f</td>",pts )
                + String.format("<td>%.2f</td>", ast )
                + String.format("<td>%.2f</td>", rbs )
                + String.format("<td>%.2f</td>", stl )
                + String.format("<td class=\"hidden-xs\">%.2f</td>", shm )
                + String.format("<td class=\"hidden-xs\">%.2f</td>", sha )
                + String.format("<td class=\"hidden-xs\">%2.0f%%</td>", pct2 )
                + String.format("<td class=\"hidden-xs\">%.2f</td>", tpm )
                + String.format("<td class=\"hidden-xs\">%.2f</td>", tpa )
                + String.format("<td class=\"hidden-xs\">%2.0f%%</td>", pct3 )
                + String.format("<td class=\"hidden-xs\">%.2f</td>", pfs ))
        out << sb.toString()
     }
}
