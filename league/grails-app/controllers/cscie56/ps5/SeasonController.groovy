package cscie56.ps5

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class SeasonController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def StandingsService standingsService

    def showStandings(Season seasonInstance) {
        /*def confTeamMap
        Conference.findAll().each { conf ->
            confTeamMap << [conf : standingsService.getTeamsByConferenceStandings(conf, seasonInstance)]
        }*/

        render (view: "showSeason", model: [season: seasonInstance, tab: "standings"])//, confTeamMap: confTeamMap])

    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Season.list(params), model:[seasonInstanceCount: Season.count()]
    }

    def show(Season seasonInstance) {
        respond seasonInstance
    }

    def create() {
        respond new Season(params)
    }

    @Transactional
    def save(Season seasonInstance) {
        if (seasonInstance == null) {
            notFound()
            return
        }

        if (seasonInstance.hasErrors()) {
            respond seasonInstance.errors, view:'create'
            return
        }

        seasonInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'season.label', default: 'Season'), seasonInstance.id])
                redirect seasonInstance
            }
            '*' { respond seasonInstance, [status: CREATED] }
        }
    }

    def edit(Season seasonInstance) {
        respond seasonInstance
    }

    @Transactional
    def update(Season seasonInstance) {
        if (seasonInstance == null) {
            notFound()
            return
        }

        if (seasonInstance.hasErrors()) {
            respond seasonInstance.errors, view:'edit'
            return
        }

        seasonInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Season.label', default: 'Season'), seasonInstance.id])
                redirect seasonInstance
            }
            '*'{ respond seasonInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Season seasonInstance) {

        if (seasonInstance == null) {
            notFound()
            return
        }

        seasonInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Season.label', default: 'Season'), seasonInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'season.label', default: 'Season'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
