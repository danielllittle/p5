package cscie56.ps5

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CommentController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Comment.list(params), model:[commentCount: Comment.count()]
    }

    def show(Comment comment) {
        respond comment
    }

    def create() {
        respond new Comment(params)
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    @Transactional
    def ajaxapprove() {
        println "ajaxpublishcomments begin"
        BlogEntry blogEntry = BlogEntry.findById(params.getLong("blog.id"))
        if (blogEntry.owner.id != springSecurityService.principal.id) {
            render "unauthorized"
        } else {
            Comment comment = Comment.findById(params.getLong("comment.id"))
            comment.approved = true
            if (!comment.save(flush: true)) comment.errors.allErrors.each {
                println it
            } else println "saved " + comment
            //blogEntry.save flush:true
            println "ajaxpublishcomments end"
            render "approved"
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
            Comment comment = Comment.findById(params.getLong("comment.id"))
            comment.rejected = true
            if (!comment.save(flush: true)) comment.errors.allErrors.each {
                println it
            } else println "saved " + comment
            //blogEntry.save flush:true
            println "ajaxreject end"
            render "rejected"
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    @Transactional
    def ajaxsave() {
        println "ajaxsave begin"
        Comment comment = new Comment()
        comment.dateCreated = new Date();
        comment.text = (String) params.get("text")
        comment.published = true
        comment.datePublished = new Date()
        comment.errors.allErrors.each{println it}
        User person = User.findById(params.getLong("player.id"))
        println "ajaxsave after findplay"
        comment.player = person
        comment.owner = springSecurityService.currentUser
        if (!comment.save(flush: true)) comment.errors.allErrors.each{println it} else println "saved " + comment
        println "loading blog with id: " + params.getLong("blog.id")

        BlogEntry blog = BlogEntry.findById(params.getLong("blog.id"))

        blog.addToComments(comment)
        println "ajaxsave saving"
        blog.save flush:true

        println "ajaxsave end"

        render status: NO_CONTENT
    }

    @Transactional
    def save(Comment comment) {
        if (comment == null) {
            notFound()
            return
        }

        if (comment.hasErrors()) {
            respond comment.errors, view:'create'
            return
        }

        comment.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'comment.label', default: 'Comment'), comment.id])
                redirect comment
            }
            '*' { respond comment, [status: CREATED] }
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
