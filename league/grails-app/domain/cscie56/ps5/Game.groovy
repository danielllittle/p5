package cscie56.ps5

class Game implements Comparable<Game>{

    Team homeTeam;
    Team awayTeam;

    int homeScore;
    int awayScore;

    Date datetime;


    Team getWinningTeam() {
        if (homeScore == awayScore) {
            return null
        }
        return (homeScore > awayScore) ? homeTeam : awayTeam
    }

    Team getLosingTeam() {
        if (homeScore == awayScore) {
            return null
        }
        return (homeScore < awayScore) ? homeTeam : awayTeam
    }


    boolean isConferenceGame() {
        return homeTeam.conference.equals(awayTeam.conference)
    }


    public int compareTo(Game g2) {
        datetime <=> g2.datetime
    }

    public boolean isParticipant(Team team) {
        team.equals(homeTeam) || team.equals(awayTeam)
    }

    public int getTeamScore(Team team) {
        if (!isParticipant(team)) {
            0
        }
        if (team.equals(homeTeam) ) {
            homeScore
        } else {
            awayScore
        }
    }

    public int getOpponentScore(Team team) {
        if (!isParticipant(team)) {
            0
        }
        if (team.equals(homeTeam) ) {
            awayScore
        } else {
            homeScore
        }
    }

    String location

    static belongsTo = [Season];

    static hasMany = [gameStats:GameStats]


    static constraints = {
        homeTeam( nullable: false, blank: false)
        awayTeam( nullable: false, blank: false)
        location(nullable: false)
        datetime(nullable: false)
    }

    @Override
    String toString() {
        return sprintf("%s v. %s", awayTeam.abbrev, homeTeam.abbrev)
    }
    static transients = ['teamScore']

    boolean hasPlayed() {
        return homeScore > 0 || awayScore > 0 ;
    }
}
