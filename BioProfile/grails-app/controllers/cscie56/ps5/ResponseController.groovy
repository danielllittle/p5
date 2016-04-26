package cscie56.ps5



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResponseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Response.list(params), model:[responseCount: Response.count()]
    }

    def show(Response response) {
        respond response
    }

    def create() {
        respond new Response(params)
    }

    @Transactional
    def save(Response response) {
        if (response == null) {
            notFound()
            return
        }

        if (response.hasErrors()) {
            respond response.errors, view:'create'
            return
        }

        response.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'response.label', default: 'Response'), response.id])
                redirect response
            }
            '*' { respond response, [status: CREATED] }
        }
    }

    def edit(Response response) {
        respond response
    }

    @Transactional
    def update(Response response) {
        if (response == null) {
            notFound()
            return
        }

        if (response.hasErrors()) {
            respond response.errors, view:'edit'
            return
        }

        response.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Response.label', default: 'Response'), response.id])
                redirect response
            }
            '*'{ respond response, [status: OK] }
        }
    }

    @Transactional
    def delete(Response response) {

        if (response == null) {
            notFound()
            return
        }

        response.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Response.label', default: 'Response'), response.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'response.label', default: 'Response'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
