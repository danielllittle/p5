
<%@ page import="cscie56.ps5.Game" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-game" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-game" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list game">
			
				<g:if test="${gameInstance?.homeTeam}">
				<li class="fieldcontain">
					<span id="homeTeam-label" class="property-label"><g:message code="game.homeTeam.label" default="Home Team" /></span>
					
						<span class="property-value" aria-labelledby="homeTeam-label"><g:link controller="team" action="show" id="${gameInstance?.homeTeam?.id}">${gameInstance?.homeTeam?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.awayTeam}">
				<li class="fieldcontain">
					<span id="awayTeam-label" class="property-label"><g:message code="game.awayTeam.label" default="Away Team" /></span>
					
						<span class="property-value" aria-labelledby="awayTeam-label"><g:link controller="team" action="show" id="${gameInstance?.awayTeam?.id}">${gameInstance?.awayTeam?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="game.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${gameInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.datetime}">
				<li class="fieldcontain">
					<span id="datetime-label" class="property-label"><g:message code="game.datetime.label" default="Datetime" /></span>
					
						<span class="property-value" aria-labelledby="datetime-label"><g:formatDate date="${gameInstance?.datetime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.awayScore}">
				<li class="fieldcontain">
					<span id="awayScore-label" class="property-label"><g:message code="game.awayScore.label" default="Away Score" /></span>
					
						<span class="property-value" aria-labelledby="awayScore-label"><g:fieldValue bean="${gameInstance}" field="awayScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.gameStats}">
				<li class="fieldcontain">
					<span id="gameStats-label" class="property-label"><g:message code="game.gameStats.label" default="Game Stats" /></span>
					
						<g:each in="${gameInstance.gameStats}" var="g">
						<span class="property-value" aria-labelledby="gameStats-label"><g:link controller="gameStats" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.homeScore}">
				<li class="fieldcontain">
					<span id="homeScore-label" class="property-label"><g:message code="game.homeScore.label" default="Home Score" /></span>
					
						<span class="property-value" aria-labelledby="homeScore-label"><g:fieldValue bean="${gameInstance}" field="homeScore"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:gameInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${gameInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
