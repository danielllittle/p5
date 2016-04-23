package cscie56.ps5


class GameStats implements Comparable<GameStats>{

    int minutesPlayed
    int points
    int assists
    int rebounds
    int steals
    int shotsAttempted
    int shotsMade
    float shotsPercentage
    int threePointersAttempted
    int threePointersMade
    float threePointerPercentage
    int personalFouls
    boolean didNotPlay

    static belongsTo = [game:Game, player:Person]

    static constraints = {
    }

    static transients = ['threePointerPercentage','shotsPercentage']

    public float getThreePointerPercentage() {
        if (threePointersAttempted == 0 ) {
            return 0
        } else {
            return threePointersMade/threePointersAttempted
        }
    }

    public float getShotsPercentage() {
        if (shotsAttempted == 0 ) {
            return 0
        } else {
            return shotsMade/shotsAttempted
        }
    }

    @Override
    String toString() {
        if (didNotPlay) {
            return sprintf("%s %s DNP",game.toString(), player.lastName)
        } else {
            return sprintf("%s %s %d points", game.toString(), player.lastName, points)
        }

    }


    public int compareTo(GameStats gs2) {
        game <=> gs2.game
            //game.datetime <=> gs2.game.datetime
            /*int c = game.datetime <=> gs2.game.datetime
            if (c != 0)
                return c
            c =  player.lastName <=> gs2.player.lastName
            if (c != 0)
                return c
            return player.team.abbrev <=> gs2.player.team.abbrev*/
    }
}
