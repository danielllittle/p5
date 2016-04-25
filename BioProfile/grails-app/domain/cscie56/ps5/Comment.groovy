package cscie56.ps5

class Comment {

    String text
    Date dateCreated
    Date datePublished
    boolean approved


    static belongsTo = [ blogEntry : BlogEntry ]



}
