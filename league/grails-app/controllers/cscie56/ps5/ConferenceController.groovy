package cscie56.ps5

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class ConferenceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Conference.list(params), model:[conferenceInstanceCount: Conference.count()]
    }

    def show(Conference conferenceInstance) {
        respond conferenceInstance
    }

    def create() {
        respond new Conference(params)
    }

    @Transactional
    def save(Conference conferenceInstance) {
        if (conferenceInstance == null) {
            notFound()
            return
        }

        if (conferenceInstance.hasErrors()) {
            respond conferenceInstance.errors, view:'create'
            return
        }

        conferenceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'conference.label', default: 'Conference'), conferenceInstance.id])
                redirect conferenceInstance
            }
            '*' { respond conferenceInstance, [status: CREATED] }
        }
    }

    def edit(Conference conferenceInstance) {
        respond conferenceInstance
    }

    @Transactional
    def update(Conference conferenceInstance) {
        if (conferenceInstance == null) {
            notFound()
            return
        }

        if (conferenceInstance.hasErrors()) {
            respond conferenceInstance.errors, view:'edit'
            return
        }

        conferenceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Conference.label', default: 'Conference'), conferenceInstance.id])
                redirect conferenceInstance
            }
            '*'{ respond conferenceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Conference conferenceInstance) {

        if (conferenceInstance == null) {
            notFound()
            return
        }

        conferenceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Conference.label', default: 'Conference'), conferenceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'conference.label', default: 'Conference'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
