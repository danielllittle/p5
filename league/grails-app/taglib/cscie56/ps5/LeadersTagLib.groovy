package cscie56.ps5

import cscie56.ps5.GameStatsService

class LeadersTagLib {
    //static defaultEncodeAs = [taglib:'html']
    static defaultEncodeAs = [taglib:'none']
    static namespace = "stats"
    def GameStatsService gameStatsService

    def showAll = { attrs, body ->
        StringBuffer sb = new StringBuffer();

        if (attrs.limit >= gameStatsService.playerCount) {
            sb.append  ("<a href=\"leaderboard\">Show Less</a>")
        } else {
            sb.append  ("<a href=\"leaderboard?limit="+gameStatsService.playerCount+"\">Show All</a>")
        }
        out << sb.toString()
    }

    def createTopStats = { attrs, body ->
        String stat = attrs.stat;
        int limit = attrs.limit.toInteger();
        Map statLeaderMap;
        switch (stat) {
            case "points":
                statLeaderMap = gameStatsService.topPointScorers
                break
            case "assists":
                statLeaderMap = gameStatsService.topAssists
                break
            case "rebounds":
                statLeaderMap = gameStatsService.topRebounders
                break
            case "steals":
                statLeaderMap = gameStatsService.topSteals
                break
        }
        StringBuffer sb =  new StringBuffer();
        sb.append ""
        statLeaderMap.eachWithIndex{
            leaderentry, i
            ->

            if (i < limit) {
                sb.append "<tr><td>${leaderentry.key.firstName}&nbsp;${leaderentry.key.lastName}</td>"
                sb.append (String.format("<td>%.2f</td>", leaderentry.value) + "</tr>")
            }

        }
        sb.append ""
        out << sb.toString()
    }

}
