package cscie56.ps5

class BlogEntry {

    String text
    Date dateCreated
    Date datePublished
    boolean published

    static belongsTo = [player: User, owner: User]

    static hasMany = [comments : Comment]

    static constraints = {
        datePublished nullable: true
    }
    /*static mapping = {
            comments sort: 'datePublished', order: 'desc'
    }*/

    static transients = ['type']
    String type = "Blog"


}
