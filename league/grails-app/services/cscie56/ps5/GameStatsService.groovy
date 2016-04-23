package cscie56.ps5

import cscie56.ps5.GameStats
import cscie56.ps5.Person
import grails.transaction.Transactional

@Transactional
class GameStatsService {

    def getTopPointScorers() {
        Map<Person, Float> summary = new LinkedHashMap<Person, Float>()
        def players = Person.findAll { "Player".equals(role) }
        players.each { player ->
            def filtGameStats = GameStats.findAllByPlayer(player).each {it.didNotPlay == false}.collect()
            if (filtGameStats.size() > 0 ) {
                float avg = filtGameStats.points.sum()/filtGameStats.size()
                summary.put(player, avg)
            }

        }
        summary.sort{it -> -it.value}


    }


    def getTopRebounders() {
        Map<Person, Float> summary = new LinkedHashMap<Person, Float>()
        def players = Person.findAll { "Player".equals(role) }
        players.each { player ->
            def filtGameStats = GameStats.findAllByPlayer(player).each {it.didNotPlay == false}.collect()
            if (filtGameStats.size() > 0 ) {
                float avg = filtGameStats.rebounds.sum()/filtGameStats.size()
                summary.put(player, avg)
            }

        }
        summary.sort{it -> -it.value}


    }

    def getTopSteals() {
        Map<Person, Float> summary = new LinkedHashMap<Person, Float>()
        def players = Person.findAll { "Player".equals(role) }
        players.each { player ->
            def filtGameStats = GameStats.findAllByPlayer(player).each {it.didNotPlay == false}.collect()
            if (filtGameStats.size() > 0 ) {
                float avg = filtGameStats.steals.sum()/filtGameStats.size()
                summary.put(player, avg)
            }

        }
        summary.sort{it -> -it.value}

    }

    def getTopAssists() {
        Map<Person, Float> summary = new LinkedHashMap<Person, Float>()
        def players = Person.findAll { "Player".equals(role) }
        players.each { player ->
            def filtGameStats = GameStats.findAllByPlayer(player).each { it.didNotPlay == false }.collect()
            if (filtGameStats.size() > 0) {
                float avg = filtGameStats.assists.sum() / filtGameStats.size()
                summary.put(player, avg)
            }

        }
        summary.sort { it -> -it.value }
    }

   def getPlayerCount() {
       Person.countByRole("Player")
   }

}
