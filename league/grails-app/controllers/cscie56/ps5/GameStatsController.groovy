package cscie56.ps5

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class GameStatsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def gameStatsService

    @Secured(['ROLE_ANONYMOUS','ROLE_USER'])
    def leaderboard(League leagueInstance) {
        final int limit = params.int('limit', 5)


        [limit: limit, tab: "leaders"]


    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond GameStats.list(params), model:[gameStatsInstanceCount: GameStats.count()]
    }

    def show(GameStats gameStatsInstance) {
        respond gameStatsInstance
    }

    def create() {
        respond new GameStats(params)
    }

    @Transactional
    def save(GameStats gameStatsInstance) {
        if (gameStatsInstance == null) {
            notFound()
            return
        }

        if (gameStatsInstance.hasErrors()) {
            respond gameStatsInstance.errors, view:'create'
            return
        }

        gameStatsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'gameStats.label', default: 'GameStats'), gameStatsInstance.id])
                redirect gameStatsInstance
            }
            '*' { respond gameStatsInstance, [status: CREATED] }
        }
    }

    def edit(GameStats gameStatsInstance) {
        respond gameStatsInstance
    }

    @Transactional
    def update(GameStats gameStatsInstance) {
        if (gameStatsInstance == null) {
            notFound()
            return
        }

        if (gameStatsInstance.hasErrors()) {
            respond gameStatsInstance.errors, view:'edit'
            return
        }

        gameStatsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'GameStats.label', default: 'GameStats'), gameStatsInstance.id])
                redirect gameStatsInstance
            }
            '*'{ respond gameStatsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(GameStats gameStatsInstance) {

        if (gameStatsInstance == null) {
            notFound()
            return
        }

        gameStatsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'GameStats.label', default: 'GameStats'), gameStatsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'gameStats.label', default: 'GameStats'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
