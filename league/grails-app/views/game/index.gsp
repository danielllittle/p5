
<%@ page import="cscie56.ps5.Game" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-game" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-game" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="game.homeTeam.label" default="Home Team" /></th>
					
						<th><g:message code="game.awayTeam.label" default="Away Team" /></th>
					
						<g:sortableColumn property="location" title="${message(code: 'game.location.label', default: 'Location')}" />
					
						<g:sortableColumn property="datetime" title="${message(code: 'game.datetime.label', default: 'Datetime')}" />
					
						<g:sortableColumn property="awayScore" title="${message(code: 'game.awayScore.label', default: 'Away Score')}" />
					
						<g:sortableColumn property="homeScore" title="${message(code: 'game.homeScore.label', default: 'Home Score')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gameInstanceList}" status="i" var="gameInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${gameInstance.id}">${fieldValue(bean: gameInstance, field: "homeTeam")}</g:link></td>
					
						<td>${fieldValue(bean: gameInstance, field: "awayTeam")}</td>
					
						<td>${fieldValue(bean: gameInstance, field: "location")}</td>
					
						<td><g:formatDate date="${gameInstance.datetime}" /></td>
					
						<td>${fieldValue(bean: gameInstance, field: "awayScore")}</td>
					
						<td>${fieldValue(bean: gameInstance, field: "homeScore")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gameInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
