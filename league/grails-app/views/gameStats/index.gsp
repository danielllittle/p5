
<%@ page import="cscie56.ps5.GameStats" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gameStats.label', default: 'GameStats')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-gameStats" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-gameStats" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="assists" title="${message(code: 'gameStats.assists.label', default: 'Assists')}" />
					
						<g:sortableColumn property="didNotPlay" title="${message(code: 'gameStats.didNotPlay.label', default: 'Did Not Play')}" />
					
						<th><g:message code="gameStats.game.label" default="Game" /></th>
					
						<g:sortableColumn property="minutesPlayed" title="${message(code: 'gameStats.minutesPlayed.label', default: 'Minutes Played')}" />
					
						<g:sortableColumn property="personalFouls" title="${message(code: 'gameStats.personalFouls.label', default: 'Personal Fouls')}" />
					
						<th><g:message code="gameStats.player.label" default="Player" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gameStatsInstanceList}" status="i" var="gameStatsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${gameStatsInstance.id}">${fieldValue(bean: gameStatsInstance, field: "assists")}</g:link></td>
					
						<td><g:formatBoolean boolean="${gameStatsInstance.didNotPlay}" /></td>
					
						<td>${fieldValue(bean: gameStatsInstance, field: "game")}</td>
					
						<td>${fieldValue(bean: gameStatsInstance, field: "minutesPlayed")}</td>
					
						<td>${fieldValue(bean: gameStatsInstance, field: "personalFouls")}</td>
					
						<td>${fieldValue(bean: gameStatsInstance, field: "player")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gameStatsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
