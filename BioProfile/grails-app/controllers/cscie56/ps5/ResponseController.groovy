package cscie56.ps5

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResponseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Response.list(params), model:[responseCount: Response.count()]
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    @Transactional
    def ajaxapprove() {
        println "ajaxpublishcomments begin"
        BlogEntry blogEntry = BlogEntry.findById(params.getLong("blog.id"))
        if (blogEntry.owner.id != springSecurityService.principal.id) {
            render "unauthorized"
        } else {
            Response response = Response.findById(params.getLong("response.id"))
            response.approved = true
            if (!response.save(flush: true)) response.errors.allErrors.each {
                println it
            } else println "saved " + response
            //blogEntry.save flush:true
            println "ajaxpublishcomments end"
            render (plugin: "bio-profile", template: "/response/response_row", model: ['resp': response, 'blog' : blogEntry] )

        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    @Transactional
    def ajaxreject() {
        println "ajaxreject begin"
        BlogEntry blogEntry = BlogEntry.findById(params.getLong("blog.id"))
        if (blogEntry.owner.id != springSecurityService.principal.id) {
            render "unauthorized"
        } else {
            Response response = Response.findById(params.getLong("response.id"))
            response.rejected = true
            if (!response.save(flush: true)) response.errors.allErrors.each {
                println it
            } else println "saved " + response
            //blogEntry.save flush:true
            println "ajaxreject end"
            render (plugin: "bio-profile", template: "/response/response_row", model: ['resp': response, 'blog' : blogEntry])

        }

    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    @Transactional
    def ajaxsave() {
        println "ajaxsave begin - response"
        Response response = new Response()
        response.dateCreated = new Date();
        println "ajaxsave begin - response test "
        response.text = (String) params.get("responsetext")
        response.published = true
        response.datePublished = new Date()
        response.errors.allErrors.each{println it}
        User person = User.findById(params.getLong("player.id"))
        println "ajaxsave after findplay"
        response.player = person
        response.owner = springSecurityService.currentUser
        if (!response.save(flush: true)) response.errors.allErrors.each{println it} else println "saved " + response
        println "loading comment with id: " + params.getLong("comment.id")

        Comment comment = Comment.findById(params.getLong("comment.id"))

        comment.addToResponses(response)
        println "ajaxsave saving"
        comment.save flush:true

        println "ajaxsave end"

        render(plugin: "bio-profile", template:"/blogEntry/blogentries", model: ['blogentriescoll' : person?.blogEntries, 'userid' : springSecurityService.principal.id])
        //render status: NO_CONTENT
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
