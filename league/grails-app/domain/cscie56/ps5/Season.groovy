package cscie56.ps5

class Season {

    String name
    League league
    Date startDate
    Date endDate

    static hasMany = [games:Game];
    static belongsTo = [league:League];

    static constraints = {
        name(unique: true)
        startDate(nullable: false, min: new FixtureData().getLeagueStartDate())
        endDate (nullable: false, max: new FixtureData().getLeagueEndDate())
        league (nullable: false)
    }

    @Override
    String toString() {
        return name
    }

    void generateStandings() {

        25.times {  //print '*' banner
            print '*'
        }
        println ''
        println  "2016 Basketball Standings"
        println ''

        /**print formatted header */
        println  "Team".padRight(8) + "Wins".center(7)  + "Losses".center(7) + "Ties".center(7) + "%".center(8)  +
                "Scored ".center(8) + "Allowed".center(8) + "Delta".center(8)  + "Streak".center(7);

        //print '-' banner
        68.times  {
            print '-'
        }
        println ''

        //sort teams using comparable in team and delagate to team for printing formatted string representation */
        teams.sort().each { team ->
            println(team)
        }
    }
}
