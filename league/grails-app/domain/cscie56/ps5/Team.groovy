package cscie56.ps5

class Team {

    String name;
    String location;
    String abbrev;


    static belongsTo = [conference:Conference];

    static constraints = {
        name(nullable: false, unique: true)
        location(nullable: false)
        roster(size: 12..15)
        coaches(minSize: 2)
    }



    static hasMany = [roster:Person, coaches:Person]

    /*public float gamesBack () {

        Team leader = conference.teams.sort().get(0);
        ((leader.wins - wins ) + (losses - leader.losses)) / 2
    }*/

    //test equality of teams via their unique 'name' property
    // @Override
    boolean equals(Object t2) {
        Team other = (Team) t2;
        return name.equals(other.getName())
    }
    /** play game updates each team with the summary totals like wins, losses, ties, point scored/allowed */
    void play(Game game) {

        /*if (game.isWinningTeam(this)) { //if game is win
            wins = wins.next(); //then increment wins
            streak = streak >=0 ? streak.next() : 1 //either add to current win streak or start a new streak at '1'
            if (game.isConferenceGame()) {

                confWins = confWins.next();
            }
            if(game.getHomeTeam().equals( this)) {
                homeWins = homeWins.next()
            } else {
                //roadWins = roadWins.next()
            }

        } else {
            losses = losses.next()// game is a loss
            streak = streak  >0 ?  -1 : streak.previous()//either add to current losing streak or start a new streak at '1'
            if (game.isConferenceGame()) {
                confLosses = confLosses.next();
            }
            if(game.getHomeTeam().equals( this)) {
                homeLosses = homeLosses.next()
            } else {
                //roadLosses = roadLosses.next()
            }
        }*/
    }

   /* public Integer getWins() {

    }

    public Integer getLosses() {

    }

    public Integer gamesback() {

    }

    public Integer confWins() {

    }

    public Integer roadWins() {

    }

    public Integer roadLosses() {

    }

    public String last10() {

    }

    public String getStreakPrettyPrint() {

    }*


    @Override
    public String toString() {

        return  name.padRight(8) +
                wins.toString().padLeft(5) + "".center(2) +
                losses.toString().padLeft(5) + "".center(2) +
                winningPercentagePrettyPrint.toString().padLeft(6)  + "".center(2) +
                gamesback.toString().padLeft(5) + "".center(2) +
                confWins.toString().padLeft(5) + "".center(2) +
                "-" +
                confLosses.toString().padLeft(5) + "".center(2) +
                roadWins.toString().padLeft(5) + "".center(2) +
                "-" +
                roadLosses.toString().padLeft(5) + "".center(2) +
                last10.toString().padLeft(5) + "".center(2) +
                streakPrettyPrint.center(7)

    }*/

    @Override
    String toString() {
        return sprintf("%s %s", location, name)
    }
}
