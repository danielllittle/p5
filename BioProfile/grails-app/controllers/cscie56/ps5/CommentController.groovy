package cscie56.ps5

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CommentController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_USER', 'ROLE_ADMIN', 'ROLE_ANONYMOUS'])
    def index(Integer max) {
        def user = springSecurityService.currentUser
        params.max = Math.min(max ?: 10, 100)
        respond Comment.list(params), model:[commentCount: Comment.count()]
    }

    def show(Comment comment) {
        respond comment
    }


    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def create() {
        if (springSecurityService.isLoggedIn()) {
            respond new Comment(params)
        } else {
            notFound()
        }
    }

    @Transactional
    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def save(Comment comment) {
        if (springSecurityService.isLoggedIn()) {
            if (comment == null) {
                notFound()
                return
            }


            if (comment.hasErrors()) {
                respond comment.errors, view: 'create'
                return
            }

            comment.save flush: true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'comment.label', default: 'Comment'), comment.id])
                    redirect comment
                }
                '*' { respond comment, [status: CREATED] }
            }
        } else {
            notFound()
        }
    }

    def edit(Comment comment) {
        respond comment
    }

    @Transactional
    def update(Comment comment) {
        if (comment == null) {
            notFound()
            return
        }

        if (comment.hasErrors()) {
            respond comment.errors, view:'edit'
            return
        }

        comment.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Comment.label', default: 'Comment'), comment.id])
                redirect comment
            }
            '*'{ respond comment, [status: OK] }
        }
    }

    @Transactional
    def delete(Comment comment) {

        if (comment == null) {
            notFound()
            return
        }

        comment.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Comment.label', default: 'Comment'), comment.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', 'ROLE_ANONYMOUS'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
