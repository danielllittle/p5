
<%@ page import="cscie56.ps5.Season" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'season.label', default: 'Season')}" />
		<title>${season.name} Season Standings </title>
	</head>
	<body>

	<div class="container">
		<h1>Season Standings for &nbsp;${season.name}</h1><br>
		<div role="tabpanel">

			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#1" aria-controls="1" role="tab" data-toggle="tab">Eastern Conference</a></li>
				<li role="presentation"><a href="#2" aria-controls="2" role="tab" data-toggle="tab">Western Conference</a></li>

			</ul>


			<div class="tab-content">
				<g:each status="i" var="conf" in="${season.league.conferences.sort(false)}">

				    <div role="tabpanel" class="tab-pane <%= conf.id == 1 ? "active" : "" %>" id="${conf.id}">

						<table class="table table-striped table-bordered table-hover"><tr><th>Team</th><th>W</th><th>L</th><th>T</th><th>%</th><th class="hidden-xs">GB</th><th class="hidden-xs">CONF</th><th class="hidden-xs">HOME</th><TH class="hidden-xs">ROAD</TH><TH>L10</TH><TH class="hidden-xs">STREAK</TH><TH class="hidden-xs">&Delta;</TH></tr>
							<stats:createStandings season="${season}" conference="${conf}"/>
						</table>
					</div>
				</g:each>
			</div>
		</div>
	</div>



	</body>
</html>
