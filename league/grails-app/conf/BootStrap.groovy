import cscie56.ps5.Game
import cscie56.ps5.League
import cscie56.ps5.Conference
import cscie56.ps5.Role
import cscie56.ps5.Season
import cscie56.ps5.Team
import cscie56.ps5.Person
import cscie56.ps5.FixtureData
import cscie56.ps5.User
import cscie56.ps5.UserRole


class BootStrap {


    def init = { servletContext ->

        def adminRole = new Role(authority: 'ROLE_ADMIN')//Role.findOrSaveWhere(authority:  'ROLE_ADMIN')
        def userRole = new Role(authority: 'ROLE_USER')// Role.findOrSaveWhere(authority: 'ROLE_USER')
        def testUser = new User(username: 'test', password: 'test', birthDate: new Date(), birthPlace: "bp", bio: "bio", weight: 100, universityAttended: "UA", inches : 11) // User.findOrSaveWhere(username:  'test'
        def adminUser = new User(username: 'admin', password: 'admin', birthDate: new Date(), birthPlace: "bp", bio: "bio", weight: 100, universityAttended: "UA", inches : 11) // User.findOrSaveWhere(username: 'adm

        if (!adminRole.save(flush: true)) adminRole.errors.allErrors.each{println it} else println "loaded " + adminRole
        if (!userRole.save(flush: true)) userRole.errors.allErrors.each{println it} else println "loaded " + userRole
        if (!testUser.save(flush: true)) testUser.errors.allErrors.each{println it} else println "loaded " + testUser
        if (!adminUser.save(flush: true)) adminUser.errors.allErrors.each{println it} else println "loaded " + adminUser

        UserRole.create adminUser, adminRole, true
        UserRole.create testUser, userRole, true

        Random random = new Random();
        FixtureData fixtureData = new FixtureData();

        League league = new League(name: "NBA-E56")
        if (!league.save(flush: true)) league.errors.allErrors.each{println it} else println "loaded " + league

        Conference econf = new Conference(name: "Eastern Conference", league: league)
        Conference wconf = new Conference(name: "Western Conference", league: league)

        if (!econf.save(flush: true)) econf.errors.allErrors.each{println it} else println "loaded " + econf
        if (!wconf.save(flush: true)) wconf.errors.allErrors.each{println it} else println "loaded " + wconf



        Team atlanta = new Team(abbrev: "ATL", name:"Hawks", location:"Atlanta", conference:econf).save(flush: true, failOnError: true)
        Team boston = new Team(abbrev: "BOS", name:"Celtics", location:"Boston", conference:econf).save(flush: true, failOnError: true)
        Team cleveland = new Team(abbrev: "CLE", name:"Cavaliers", location:"Cleveland", conference:econf).save(flush: true, failOnError: true)
        Team toronto = new Team(abbrev: "TOR", name:"Raptors", location:"Toronto", conference:econf).save(flush: true, failOnError: true)

        Team goldenstate = new Team(abbrev: "GSW", name:"Warriors", location:"Golden State", conference:wconf).save(flush: true, failOnError: true)
        Team sanantonio = new Team(abbrev: "SAN", name:"Spurs", location:"San Antonio", conference:wconf).save(flush: true, failOnError: true)
        Team losangeles = new Team(abbrev: "LAC", name:"Clippers", location:"Los Angeles", conference:wconf).save(flush: true, failOnError: true)
        Team oklahomacity = new Team(abbrev: "OKC", name:"Thunder", location:"Oklahoma", conference:wconf).save(flush: true, failOnError: true)

        league.addToConferences(wconf)
        league.addToConferences(econf)

        wconf.addToTeams(goldenstate)
        wconf.addToTeams(sanantonio)
        wconf.addToTeams(losangeles)
        wconf.addToTeams(oklahomacity)

        econf.addToTeams(atlanta)
        econf.addToTeams(boston)
        econf.addToTeams(cleveland)
        econf.addToTeams(toronto)

        league.conferences.each { conf ->
            conf.teams.each { team ->

                println "building " + team

                15.times { idx ->

                    Person player = new Person(bio: fixtureData.getRandomBio(), birthPlace: fixtureData.getRandomLocation(),
                            birthDate: fixtureData.getRandomBirthdate(), universityAttended: fixtureData.getRandomUniversity(),
                            weight: fixtureData.getRandomWeight(), inches: fixtureData.getRandomHeight(),
                            password:  fixtureData.getRandomPassword(), username: fixtureData.getRandomUserName(),
                            firstName: fixtureData.getRandomFirstName(), lastName: fixtureData.getRandomLastName(), role: "Player",
                            skill: fixtureData.getRandomSkill());
                    player.team = team
                    if (!player.validate()) player.errors.allErrors.each{println it} else println "validated " + player
                    //player.save(flush: true, failOnError: true)
                    team.addToRoster(player);

                }

                2.times { idx ->
                    Person coach = new Person(bio: fixtureData.getRandomBio(), birthPlace: fixtureData.getRandomLocation(),
                            birthDate: fixtureData.getRandomBirthdate(), universityAttended: fixtureData.getRandomUniversity(),
                            weight: fixtureData.getRandomWeight(), inches: fixtureData.getRandomHeight(),
                            password:  fixtureData.getRandomPassword(), username: fixtureData.getRandomUserName(),
                            firstName: fixtureData.getRandomFirstName(), lastName: fixtureData.getRandomLastName(), role: "Coach",
                            skill: fixtureData.getRandomSkill());
                    coach.team = team
                    //coach.save(flush: true, failOnError: true)
                    if (!coach.validate()) coach.errors.allErrors.each{println it} else println "validated " + coach
                    team.addToCoaches(coach);

                }
                println "completed " + team
            }
        }

        Season season = new Season(name: "2016", startDate: fixtureData.getLeagueStartDate(),
                endDate: fixtureData.getLeagueEndDate(), league: league)

        if (!season.validate()) season.errors.allErrors.each{println it} else println "validated " + season
        if (!season.save(flush: true)) season.errors.allErrors.each{println it} else println "saved " + season

        def teams = wconf.teams + econf.teams
        teams.eachWithIndex {team1,idx1->
            teams.eachWithIndex { team2,idx2->
                if (idx2 > idx1) {//avoid duplicate games
                    5.times {
                        Game game1 = new Game(homeTeam: team1, location: team2.location, datetime: fixtureData.getRandomGameDate(), awayTeam: team2,
                                season: season)

                        Game game2 = new Game(homeTeam: team2, location: team1.location, datetime: fixtureData.getRandomGameDate(), awayTeam: team1,
                                season: season)
                        game1.save(flush: true, failOnError: true);
                        game2.save(flush: true, failOnError: true);
                        if (game1.getDatetime() < new Date()) {  //play game w
                            fixtureData.createGameStats(game1).each {
                                it.game = game1
                                it.save()
                                game1.addToGameStats(it)
                            }
                        }
                        if (game2.getDatetime() < new Date()) {
                            fixtureData.createGameStats(game2).each {
                                it.game = game2
                                it.save(flush: true, failOnError: true)
                                game2.addToGameStats(it)
                            }
                        }
                        season.addToGames(game1);
                        season.addToGames(game2);
                    }

                }
            }
        }
        println "loaded games"



    }


    def destroy = {
    }
}
