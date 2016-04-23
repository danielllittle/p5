
<%@ page import="cscie56.ps5.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list person">

				<table><tr><th>Date</th><th>Opp</th><th>Minutes</th><th>Pts</th><th>Ast</th><th>Reb</th><th>Stl</th><th>2 pt Att</th>
					<th>2 pt Made</th><th>2 pt %</th><th>3 pt att</th><th>3 pt made</th>
					<th>3 pt %<th>Fouls</th></tr>
					<g:render template="/person/gamesStatsRow" collection="${personInstance?.gameStats.sort()}" />
					<stats:summaryStatsAbs playerGameStats="${personInstance.gameStats}"/>
					<stats:summaryStatsAvg playerGameStats="${personInstance.gameStats}"/>
				</table>

		</div>
	</body>
</html>
