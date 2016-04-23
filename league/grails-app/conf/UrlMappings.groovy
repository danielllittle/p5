class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/league/leaderboard"(controller: "GameStats", action: "leaderboard")

        "/"(view:"/index")
        "500"(view:'/error')
    }
}
