package cscie56.ps5


class Person {

    String firstName
    String lastName
    String role
    String bio // ight want to make this *long* -> up to 1023 characters
    Date birthDate
    String birthPlace
    int inches // must be displayed in feet and inches (e.g., 6’1”)
    int weight //lbs
    String universityAttended
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
        bio(maxSize: 1023)
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
