package cscie56.ps5



import grails.plugin.springsecurity.annotation.Secured
import cscie56.ps5.User

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class BlogEntryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    @Secured(['ROLE_ANONYMOUS', 'ROLE_USER', 'ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond BlogEntry.list(params), model:[blogEntryCount: BlogEntry.count()]
    }

    def show(BlogEntry blogEntry) {
        respond blogEntry
    }

    def create() {
        respond new BlogEntry(params)
    }

    @Transactional
    def save(BlogEntry blogEntry) {
        println "save begin"
        if (blogEntry == null) {
            notFound()
            return
        }

        if (blogEntry.hasErrors()) {
            respond blogEntry.errors, view:'create'
            return
        }

        blogEntry.errors.allErrors.each{println it}
        if (!blogEntry.save(flush: true)) blogEntry.errors.allErrors.each{println it} else println "saved " + blogEntry
        //blogEntry.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'blogEntry.label', default: 'BlogEntry'), blogEntry.id])
                redirect blogEntry
            }
            '*' { respond blogEntry, [status: CREATED] }
        }
    }

    @Transactional
    def ajaxsave() {
        println "ajaxsave begin"
        BlogEntry blogEntry = new BlogEntry()
        blogEntry.dateCreated = new Date();
        blogEntry.text = (String) params.get("blogtext")
        if ("publish".equals(params.get("method"))) {
            println "ajaxsave - now publishing"
            blogEntry.datePublished = new Date();
            blogEntry.published = true;
        } else {
            println "ajaxsave - not publishing"
        }
        println "ajaxsave before user"
        User person = User.findById(params.getLong("player.id"))
        println "ajaxsave after findplay"
        blogEntry.player = person
        person.addToBlogEntries(blogEntry);
        println "ajaxsave after player added"
        User owner = User.findById(params.getLong("owner.id"))
        println "ajaxsave adding owner"
        owner.addToPublishedBlogEntries(blogEntry)
        println "ajaxsave saving"
        blogEntry.save flush:true
        println "ajaxsave end"

        render(plugin: "bio-profile", template:"/blogEntry/blogentries", model: ['blogentriescoll' : person?.blogEntries,'userid': springSecurityService.principal.id])
    }

    @Transactional
    def ajaxpublish() {
        println "ajaxpublsh begin"
        BlogEntry blogEntry = BlogEntry.findById(params.getLong("blog.id"))
        if (blogEntry.owner.id != springSecurityService.principal.id) {
            render "unauthorized"
        } else {
            blogEntry.published = true
            blogEntry.datePublished = new Date()
            if (!blogEntry.save(flush: true)) blogEntry.errors.allErrors.each {
                println it
            } else println "saved " + blogEntry
            //blogEntry.save flush:true
            println "ajaxpublsh end"

            render(plugin: "bio-profile", template:"/blogEntry/blog_row", model: ['blogEntry': blogEntry])
        }
    }




    def edit(BlogEntry blogEntry) {
        respond blogEntry
    }

    @Transactional
    def update(BlogEntry blogEntry) {
        if (blogEntry == null) {
            notFound()
            return
        }

        if (blogEntry.hasErrors()) {
            respond blogEntry.errors, view:'edit'
            return
        }

        blogEntry.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BlogEntry.label', default: 'BlogEntry'), blogEntry.id])
                redirect blogEntry
            }
            '*'{ respond blogEntry, [status: OK] }
        }
    }

    @Transactional
    def delete(BlogEntry blogEntry) {

        if (blogEntry == null) {
            notFound()
            return
        }

        blogEntry.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BlogEntry.label', default: 'BlogEntry'), blogEntry.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'blogEntry.label', default: 'BlogEntry'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
