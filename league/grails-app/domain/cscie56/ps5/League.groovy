package cscie56.ps5

class League {

    String name;

    static hasMany = [conferences:Conference, seasons:Season];

    static constraints = {
        name(unique: true,nullable: false, blank: false);  conferences(size: 2..2)
    }

    @Override
    String toString() {
        return name;
    }
}
