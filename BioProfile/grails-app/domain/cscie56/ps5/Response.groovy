package cscie56.ps5

class Response extends Comment {

    static constraints = {
    }

    static belongsTo = [ comment : BlogEntry ]
}
