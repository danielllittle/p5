package cscie56.ps5

import cscie56.ps5.Conference
import cscie56.ps5.Season
import cscie56.ps5.Team
import grails.transaction.Transactional

@Transactional
class StandingsService {

    def createTeamStandingsRowMap(Team team, Season season) {
       /* def standings = [:];
        //create ordered conference list
        def conferences = Conference.findAll().sort();
        standings["ordConfList"] =  conferences;

        //create list of ordered teams for each conf
        conferences.each { conference  ->
            def teams = getTeamsByConferenceStandings(conference, season)
            standings[conference] =  teams ;

            //for each team, build map of standings data by team
            teams.each {} {team ->
*/
                def teammap  = [
                //standings[team] = teammap

                name : team.toString(),
                wins : getTeamWinsBySeason(team, season),
                losses : getTeamLossesBySeason(team, season),
                ties : getTeamTiesBySeason(team, season),
                homewins : getTeamHomeWinsBySeason(team, season),
                homelosses : getTeamHomeLossesBySeason(team, season),
                hometies : getTeamHomeTiesBySeason(team, season),
                awaywins : getTeamAwayWinsBySeason(team, season),
                awaylosses : getTeamAwayLossesBySeason(team, season),
                awayties : getTeamAwayTiesBySeason(team, season),
                gamesback : getTeamGamesBackByConferenceSeason(team, season),
                confwins : getTeamConferenceWinsBySeason(team, season),
                conflosses : getTeamConferenceLossesBySeason(team, season),
                confties : getTeamConferenceTiesBySeason(team, season),
                deltapoints : getTeamDeltaPointsBySeason(team, season),
                last10wins : getTeamLast10WinsBySeason(team,season),
                last10losses : getTeamLast10LossesBySeason(team,season),
                last10ties : getTeamLast10tiesBySeason(team,season),
                winningPct : getTeamWinningPercentageBySeason(team, season),
                streak : getTeamStreakBySeason(team, season)
                        ]
            //}

            teammap
        //}
    }

    def getTeamsByConferenceStandings(Conference teamConference, Season season) {
        List<Team> confTeams = Team.findAllByConference(teamConference)
        Map<Team, Float> summary = new HashMap<Team, Float>()
        confTeams.each { team ->
            summary.put(team, getTeamGamesBackByConferenceSeason(team , season))
        }
        summary.sort{it -> it.value}.keySet()
    }

    def getTeamWinsBySeason(Team team, Season season) {
        season.games.findAll{ game -> game.hasPlayed()&& game.winningTeam == team}.size()

    }

    def getTeamLossesBySeason(Team team, Season season) {
        season.games.findAll{it.hasPlayed() && it.losingTeam.equals(team) && it.isParticipant(team)}.size()
    }

    def getTeamTiesBySeason(Team team, Season season) {
        season.games.findAll{it.hasPlayed() && it.winningTeam == null && it.isParticipant(team)}.size()
    }

    def getTeamGamesPlayedBySeason(Team team, Season season) {
        season.games.findAll{it.hasPlayed() && it.isParticipant(team)}.size()
    }

    def getTeamWinningPercentageBySeason(Team team, Season season) {
        def wins = getTeamWinsBySeason( team,  season)
        def gamesPlayed = getTeamGamesPlayedBySeason( team,  season)
        wins/gamesPlayed
    }

    def getTeamGamesBackByConferenceSeason(Team team, Season season) {
        float leaderWinsTies = 0;
        team.conference.teams.each { confTeam ->
            leaderWinsTies = Math.max( leaderWinsTies, getTeamWinsBySeason(confTeam, season) - getTeamLossesBySeason(confTeam, season) + (0.5 * getTeamTiesBySeason(confTeam, season)))
        }
        (leaderWinsTies - (getTeamWinsBySeason( team,  season) - getTeamLossesBySeason(team, season) + 0.5 * getTeamTiesBySeason( team,  season)))/2

    }

    def getTeamHomeWinsBySeason(Team team, Season season) {
        season.games.findAll{it.hasPlayed() && it.winningTeam == team && it.homeTeam == team}.size()

    }

    def getTeamAwayWinsBySeason(Team team, Season season) {
        season.games.findAll{it.hasPlayed() && it.winningTeam == team && it.awayTeam == team}.size()

    }

    def getTeamHomeTiesBySeason(Team team, Season season) {
        season.games.findAll{
            it.hasPlayed() && it.homeTeam == team &&
                    it.winningTeam == null
        }.size()

    }

    def getTeamAwayTiesBySeason(Team team, Season season) {
        season.games.findAll{
            it.hasPlayed() && it.awayTeam == team &&
                it.winningTeam == null}.size()
    }

    def getTeamHomeLossesBySeason(Team team, Season season) {
        season.games.findAll{
            it.hasPlayed() && it.homeTeam == team &&
                    it.losingTeam == team
        }.size()

    }

    def getTeamAwayLossesBySeason(Team team, Season season) {
        season.games.findAll{it.hasPlayed() && it.awayTeam == team &&
                it.losingTeam == team
        }.size()

    }

    def getTeamConferenceLossesBySeason(Team team, Season season) {
        season.games.findAll{it.hasPlayed() && it.losingTeam == team &&
                it.isConferenceGame();
        }.size()

    }

    def getTeamConferenceWinsBySeason(Team team, Season season) {
        season.games.findAll{it.hasPlayed() && it.winningTeam == team &&
                it.isConferenceGame();
        }.size()

    }

    def getTeamConferenceTiesBySeason(Team team, Season season) {
        season.games.findAll{
            it.hasPlayed() && it.winningTeam == null &&
                    it.isParticipant(team) &&
                    it.isConferenceGame();
        }.size()

    }

    def getTeamLast10GamesBySeason(Team team, Season season) {
        def last10List = season.games.findAll{it.hasPlayed() && it.isParticipant(team)}.sort(false) {-it.id}.asList()
        if (last10List.size() > 10) {//return less only when < 10 games played
            last10List = last10List.subList(0, 10)
        }
    }

    def getTeamLast10WinsBySeason(Team team, Season season) {
        getTeamLast10GamesBySeason( team,  season).findAll {it.winningTeam.equals(team)}.size();
    }

    def getTeamLast10LossesBySeason(Team team, Season season) {
        getTeamLast10GamesBySeason( team,  season).findAll {it.losingTeam.equals(team)}.size();
    }

    def getTeamLast10tiesBySeason(Team team, Season season) {
        getTeamLast10GamesBySeason( team,  season).findAll {it.losingTeam == null}.size();
    }

    def getTeamDeltaPointsBySeason(Team team, Season season) {
        def games = season.games.findAll{it.hasPlayed() && it.isParticipant(team) }
        games*.getTeamScore(team).sum() - games*.getOpponentScore(team).sum()
    }

    def getTeamStreakBySeason (Team team, Season season) {
        String type = null;
        boolean done = false;
        int count = 1;
        season.games.findAll{g -> g.hasPlayed() && g.isParticipant(team)}.sort(false){ -it.id }.each { game ->
            if (type == null) {
                if (game.winningTeam == team) {
                    type = "W"
                } else if (game.losingTeam == team) {
                    type = "L"
                } else {
                    type = "T"
                }
            } else {
                if (!done && ((type.equals("W") && game.winningTeam == team) ||
                        (type.equals("L") && game.losingTeam == team) ||
                        (type.equals("T") && game.winningTeam == null))) {
                    count ++;
                } else {
                    done = true
                }
            }
        }
        type + count
    }
}

