package cscie56.ps5

class Comment {

    String text
    Date dateCreated
    Date datePublished


    static belongsTo = [ blogEntry : BlogEntry ]



}
