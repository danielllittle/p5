package cscie56.ps5

class Conference {

    String name;
    League league;

    static hasMany = [teams: Team]

    static belongsTo = [league: League]

    static constraints = {
        name(nullable: false, unique: true, blank: false)
    }

    @Override
    String toString() {
        return name;
    }
}
