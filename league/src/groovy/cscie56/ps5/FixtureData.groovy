package cscie56.ps5


class FixtureData {
    Random random = new Random();
    String[] locations =  ["New York", "Los Angeles","Chicago","Houston", "Phoenix", "Philadelphia", "San Antonio",
    "San Diego", "Dallas", "San Jose", "Detroit", "Jacksonville", "Indianapolis", "San Francisco",
    "Columbus", "Austin", "Memphis", "Fort Worth", "Baltimore", "Charlotte"]

    String[] schools = [ "Correspondence School", "Academy", "High School", "College" , "University", "Trade Tech", "Community College", "A & M"]

    public String getRandomLocation() {

        return locations[random.nextInt(locations.size())]

    }

    public String getRandomUniversity() {
        return sprintf ("%s %s", getRandomLocation(), schools[random.nextInt(schools.size())])
    }

    public int getRandomHeight() {
        return random.nextInt(18 ) + 70
    }

    public int getRandomWeight() {
        return random.nextInt(90 ) + 185
    }

    public Date getRandomBirthdate() {
        int monthsago = random.nextInt(12 * 20 * 30 ) + (12 * 20 * 30 ) ;
        return new Date() - monthsago;
    }

    public Date getLeagueEndDate() {
        return new GregorianCalendar(2016, 11, 31,23, 59).getTime();
    }

    public Date getLeagueStartDate() {
        return new GregorianCalendar(2016, 0, 0,0, 0).getTime();
    }

    public Date getRandomGameDate() {
        return getLeagueEndDate() - random.nextInt(364)
    }

    public int getRandomScore() {
        return 75 + random.nextInt(77);
    }

    public int getRandomSkill() {
        return 5 + random.nextInt(90)
    }

    public Collection<GameStats> createGameStats(Game game) {
        HashMap<String, GameStats> gameStatsByPlayer = new HashMap<String, GameStats>()

        game.homeScore = getRandomScore();
        game.awayScore = getRandomScore();
        game.homeTeam.roster.each {
            GameStats gameStat = new GameStats();
            gameStat.player = it;
            gameStatsByPlayer.put(it.getFullName(), gameStat);
        }
        game.awayTeam.roster.each {
            GameStats gameStat = new GameStats();
            gameStat.player = it;
            gameStatsByPlayer.put(it.getFullName(), gameStat);
        }
        assignRandomInjuredPlayers(game, gameStatsByPlayer);
        assignPointsPerPlayers(game, gameStatsByPlayer);
        assignAssistsPerPlayers(game, gameStatsByPlayer);
        assignMinutesPerPlayers(game, gameStatsByPlayer);
        assignShotsAttemptedPerPlayers(game, gameStatsByPlayer);
        assignStealsPerPlayers(game, gameStatsByPlayer);
        assignReboundsPerPlayers(game, gameStatsByPlayer);
        assignFoulsPerPlayers(game, gameStatsByPlayer);
        gameStatsByPlayer.values()
    }

    private void assignRandomInjuredPlayers(Game game, Map<String, GameStats> gameStatsMap) {
        Person player1 = game.homeTeam.roster.getAt(random.nextInt(game.homeTeam.roster.size()));
        gameStatsMap.get(player1.getFullName()).didNotPlay = true;
        Person player2 = game.awayTeam.roster.getAt(random.nextInt(game.awayTeam.roster.size()));
        gameStatsMap.get(player2.getFullName()).didNotPlay = true;
    }

    private void assignPointsPerPlayers(Game game, Map<String, GameStats> gameStatsMap) {
        int tally = game.homeScore;
        while (tally > 0) {
            game.homeTeam.roster.each {
                GameStats gameStat = gameStatsMap.get(it.getFullName())

                if (tally > 0 && !gameStat.didNotPlay && it.skill > random.nextInt(100)) {
                    gameStat.points++;
                    tally--
                }
            }
        }

        tally = game.awayScore;
        while (tally > 0) {
            game.awayTeam.roster.each {
                GameStats gameStat = gameStatsMap.get(it.getFullName())

                if (tally > 0 && !gameStat.didNotPlay && it.skill > random.nextInt(100)) {
                    gameStat.points++;
                    tally--
                }
            }
        }
    }

    private void assignAssistsPerPlayers(Game game, Map<String, GameStats> gameStatsMap) {
        int tally = game.homeScore / 3;
        while (tally > 0) {
            game.homeTeam.roster.each {
                GameStats gameStat = gameStatsMap.get(it.getFullName())

                if (tally > 0 && !gameStat.didNotPlay && it.skill > random.nextInt(100)) {
                    gameStat.assists++;
                    tally--
                }
            }
        }

        tally = game.awayScore / 3;
        while (tally > 0) {
            game.awayTeam.roster.each {
                GameStats gameStat = gameStatsMap.get(it.getFullName())

                if (tally > 0 && !gameStat.didNotPlay && it.skill > random.nextInt(100)) {
                    gameStat.assists++;
                    tally--
                }
            }
        }
    }

    private void assignReboundsPerPlayers(Game game, Map<String, GameStats> gameStatsMap) {
        int tally = game.homeScore / 4;
        while (tally > 0) {
            game.homeTeam.roster.each {
                GameStats gameStat = gameStatsMap.get(it.getFullName())

                if (tally > 0 && !gameStat.didNotPlay && it.skill > random.nextInt(100)) {
                    gameStat.rebounds++;
                    tally--
                }
            }
        }

        tally = game.awayScore / 4;
        while (tally > 0) {
            game.awayTeam.roster.each {
                GameStats gameStat = gameStatsMap.get(it.getFullName())

                if (tally > 0 && !gameStat.didNotPlay && it.skill > random.nextInt(100)) {
                    gameStat.rebounds++;
                    tally--
                }
            }
        }
    }

    private void assignFoulsPerPlayers(Game game, Map<String, GameStats> gameStatsMap) {
        int tally = game.homeScore / 5;
        while (tally > 0) {
            game.homeTeam.roster.each {
                GameStats gameStat = gameStatsMap.get(it.getFullName())

                if (tally > 0 && gameStat.personalFouls <= 6 && !gameStat.didNotPlay && it.skill > random.nextInt(100)) {
                    gameStat.personalFouls++;
                    tally--
                }
            }
        }

        tally = game.awayScore / 5;
        while (tally > 0) {
            game.awayTeam.roster.each {
                GameStats gameStat = gameStatsMap.get(it.getFullName())

                if (tally > 0 && gameStat.personalFouls <= 6 && !gameStat.didNotPlay && it.skill > random.nextInt(100)) {
                    gameStat.personalFouls++;
                    tally--
                }
            }
        }
    }


    private void assignShotsAttemptedPerPlayers(Game game, Map<String, GameStats> gameStatsMap) {


        game.homeTeam.roster.each {
            GameStats gameStat = gameStatsMap.get(it.getFullName())
            int tally = gameStat.points * 4 / 5 //account 20% for free throws
            while (tally > 1) {
                if (tally > 2 && !gameStat.didNotPlay && 15 > random.nextInt(100)) {
                    gameStat.threePointersMade++;
                    tally-=3
                }
                if (tally > 1 && !gameStat.didNotPlay && 85 > random.nextInt(100)) {
                    gameStat.shotsMade++;
                    tally-=2
                }
            }
            if (gameStat.threePointersMade == 0) {
                gameStat.threePointersAttempted = random.nextInt(5 )
            } else {
                float threePointPct = 0.15 + random.nextFloat()  * 3 / 4  ; //(15-90%)
                gameStat.threePointersAttempted = ((int)(gameStat.threePointersMade / threePointPct) + 1)
            }

            if (gameStat.shotsMade == 0) {
                gameStat.shotsAttempted = random.nextInt(8)
            } else {
                float shotsPct = 0.25 + random.nextFloat()  * 3 / 4 ; //(25-90%)
                gameStat.shotsAttempted = ((int)(gameStat.shotsMade / shotsPct) + 1)
            }


        }

        game.awayTeam.roster.each {
            GameStats gameStat = gameStatsMap.get(it.getFullName())
            int tally = gameStat.points * 4 / 5 //account 20% for free throws
            while (tally > 1) {
                if (tally > 2 && !gameStat.didNotPlay && 15 > random.nextInt(100)) {
                    gameStat.threePointersMade++;
                    tally-=3
                }
                if (tally > 1 && !gameStat.didNotPlay && 85 > random.nextInt(100)) {
                    gameStat.shotsMade++;
                    tally-=2
                }
            }
            if (gameStat.threePointersMade == 0) {
                gameStat.threePointersAttempted = random.nextInt(5 )
            } else {
                float threePointPct = 0.20 + random.nextFloat()  * 3 / 4 ; //(20-90%)
                gameStat.threePointersAttempted = ((int)(gameStat.threePointersMade / threePointPct) + 1)
            }

            if (gameStat.shotsMade == 0) {
                gameStat.shotsAttempted = random.nextInt(8)
            } else {
                float shotsPct = 0.25 + random.nextFloat()  * 3 / 4 ; //(25-90%)
                gameStat.shotsAttempted = ((int)(gameStat.shotsMade / shotsPct) + 1)
            }
        }





    }

    private void assignStealsPerPlayers(Game game, Map<String, GameStats> gameStatsMap) {
        int tally = game.homeScore / 10;
        while (tally > 0) {
            game.homeTeam.roster.each {
                GameStats gameStat = gameStatsMap.get(it.getFullName())

                if (tally > 0 && !gameStat.didNotPlay && it.skill > random.nextInt(100)) {
                    gameStat.steals++;
                    tally--
                }
            }
        }

        tally = game.awayScore / 10;
        while (tally > 0) {
            game.awayTeam.roster.each {
                GameStats gameStat = gameStatsMap.get(it.getFullName())

                if (tally > 0 && !gameStat.didNotPlay && it.skill > random.nextInt(100)) {
                    gameStat.steals++;
                    tally--
                }
            }
        }
    }

    private void assignMinutesPerPlayers(Game game, Map<String, GameStats> gameStatsMap) {
        final int minutesPerGame = 48
        int tally = minutesPerGame * 5 ;
        while (tally > 0) {
            game.homeTeam.roster.each {
                GameStats gameStat = gameStatsMap.get(it.getFullName())

                if (tally > 0 && gameStat.minutesPlayed < minutesPerGame && !gameStat.didNotPlay && it.skill > random.nextInt(100)) {
                    gameStat.minutesPlayed++;
                    tally--
                }
            }
        }

        tally = minutesPerGame * 5;
        while (tally > 0) {
            game.awayTeam.roster.each {
                GameStats gameStat = gameStatsMap.get(it.getFullName())

                if (tally > 0 && gameStat.minutesPlayed < minutesPerGame && !gameStat.didNotPlay && it.skill > random.nextInt(100)) {
                    gameStat.minutesPlayed++;
                    tally--
                }
            }
        }
    }



    public String getRandomFirstName() {
        String[] firstNames = ["JAMES","JOHN","ROBERT","MICHAEL","WILLIAM","DAVID","RICHARD","CHARLES","JOSEPH","THOMAS",
                               "CHRISTOPHER","DANIEL","PAUL","MARK","DONALD","GEORGE","KENNETH","STEVEN","EDWARD","BRIAN",
                               "RONALD","ANTHONY","KEVIN","JASON","MATTHEW","GARY","TIMOTHY","JOSE","LARRY","JEFFREY",
                               "FRANK","SCOTT","ERIC","STEPHEN","ANDREW","RAYMOND","GREGORY","JOSHUA","JERRY","DENNIS",
                               "WALTER","PATRICK","PETER","HAROLD","DOUGLAS","HENRY","CARL","ARTHUR","RYAN","ROGER"]
        return firstNames[random.nextInt(firstNames.length)].toLowerCase().capitalize()
    }

    public String getRandomLastName() {
        String[] lastNames =["SMITH","JOHNSON","WILLIAMS","JONES","BROWN","DAVIS","MILLER","WILSON","MOORE","TAYLOR",
                             "ANDERSON","THOMAS","JACKSON","WHITE","HARRIS","MARTIN","THOMPSON","GARCIA","MARTINEZ",
                             "ROBINSON","CLARK","RODRIGUEZ","LEWIS","LEE","WALKER","HALL","ALLEN","YOUNG","HERNANDEZ",
                             "KING","WRIGHT","LOPEZ","HILL","SCOTT","GREEN","ADAMS","BAKER","GONZALEZ","NELSON","CARTER",
                             "MITCHELL","PEREZ","ROBERTS","TURNER","PHILLIPS","CAMPBELL","PARKER","EVANS","EDWARDS",
                             "COLLINS","STEWART","SANCHEZ","MORRIS","ROGERS","REED","COOK","MORGAN","BELL","MURPHY",
                             "BAILEY","RIVERA","COOPER","RICHARDSON","COX","HOWARD","WARD","TORRES","PETERSON","GRAY",
                             "RAMIREZ","JAMES","WATSON","BROOKS","KELLY","SANDERS","PRICE","BENNETT","WOOD","BARNES",
                             "ROSS","HENDERSON","COLEMAN","JENKINS","PERRY","POWELL","LONG","PATTERSON","HUGHES",
                             "FLORES","WASHINGTON","BUTLER","SIMMONS","FOSTER","GONZALES","BRYANT","ALEXANDER","RUSSELL",
                             "GRIFFIN","DIAZ","HAYES"]
        return lastNames[random.nextInt(lastNames.length)].toLowerCase().capitalize()
    }

    def lipsum = { what = "paras", amount = 1, start = false ->

        def text = new URL("http://www.lipsum.com/feed/xml?what=$what&amount=$amount&start=${start?'yes':'no'}").text
        def feed = new XmlSlurper().parseText(text)
        feed.lipsum.text()
    }

    public String getRandomBio() {

        //lipsum('words',15 + random.nextInt(110))
        "The quick brown fox jumped over the lazy dog."

    }

    public String getRandomUserName() {
        "un" + random.nextInt();
    }

    public String getRandomPassword() {
        "pw" + random.nextInt();
    }

}
