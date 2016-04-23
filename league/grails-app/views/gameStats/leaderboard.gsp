
<%@ page import="cscie56.ps5.GameStats" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
	<head>

		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gameStats.label', default: 'GameStats')}" />
		<title>Leaderboard</title>
	</head>
	<body>
		<div class="container">
			<h1>Leaderboard</h1>
			<div class="row">
				<div class="col-xs-12 col-md-6 col-lg-3" id = "points">
					<table class="table table-striped table-hover table-bordered1">
						<thead><tr><th style="text-align: center" colspan="2">Points</th></tr></thead><stats:createTopStats stat="points" limit="${limit}"/>
					</table>
				</div>
				<div class="col-xs-12 col-md-6 col-lg-3" id = "rebounds">
					<table class="table table-striped table-hover table-bordered1">
						<thead><tr><th style="text-align: center" colspan="2">Rebounds</th></tr></thead><stats:createTopStats stat="rebounds" limit="${limit}"/>
					</table>
				</div>
				<div class="col-xs-12 col-md-6 col-lg-3" id = "assists">
					<table class="table table-striped table-hover table-bordered1">
						<thead><tr><th style="text-align: center" colspan="2">Assists</th></tr></thead><stats:createTopStats stat="assists" limit="${limit}"/>
					</table>
				</div>
				<div class="col-xs-12 col-md-6 col-lg-3" id = "stats">
					<table class="table table-striped table-hover table-bordered1">
						<thead></tr><th style="text-align: center" colspan="2">Steals</th></tr></thead><stats:createTopStats stat="steals" limit="${limit}"/>
					</table>
				</div>
			</div>
			<stats:showAll limit="${limit}"/>

		</div>
	</body>
</html>
