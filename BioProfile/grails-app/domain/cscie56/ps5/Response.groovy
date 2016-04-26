package cscie56.ps5

class Response extends Comment {

    String type = "Response"

    static constraints = {
    }

    static belongsTo = [ comment : BlogEntry ]
}
