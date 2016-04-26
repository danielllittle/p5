package cscie56.ps5

class Comment extends BlogEntry {


    boolean approved
    boolean rejected



    static belongsTo = [ blogEntry : BlogEntry ]


}
