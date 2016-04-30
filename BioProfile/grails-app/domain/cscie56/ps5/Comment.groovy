package cscie56.ps5

class Comment extends BlogEntry {


    boolean approved
    boolean rejected
    String type = "Comment"


    static belongsTo = [ blogEntry : BlogEntry ]
    static hasMany = [responses : Response]

    static mapping = {
        sort datePublished: "desc"
    }

}
