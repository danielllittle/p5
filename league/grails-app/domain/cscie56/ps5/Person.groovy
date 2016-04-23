package cscie56.ps5


class Person extends User{


    String firstName
    String lastName
    String role

    int skill

    static hasMany = [gameStats: GameStats]

    static mapping = {
        gameStats sort:'game'
    }

    static belongsTo = [team: Team]

    static constraints = {
        role(inList: ["Player","Coach"]);
        firstName(nullable: false, blank: null)
        lastName(nullable: false, blank: null)
        skill(range: 5..95)

    }

    static transients = ['fullName']

    @Override
    public String toString() {
        return sprintf("%s %s", firstName, lastName);
    }

    public String getFullName() {
        return sprintf("%s %s", firstName, lastName);
    }
}
