package cscie56.ps5

import cscie56.ps5.StandingsService

class StandingsTagLib {
    static defaultEncodeAs = [taglib:'none']
    static namespace = "stats"

    StandingsService standingsService

    def createStandings = { attrs, body ->
        def season = attrs.season
        def conference = attrs.conference

        def teams = standingsService.getTeamsByConferenceStandings(conference, season)

        teams.each { team ->

            out << render(template: '/season/standingsTable', model: [standingsRow:standingsService.createTeamStandingsRowMap( team, season)])
        }
    }
}
