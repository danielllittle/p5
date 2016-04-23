
<%@ page import="cscie56.ps5.Season" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'season.label', default: 'Season')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-season" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-season" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list season">
			
				<g:if test="${seasonInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="season.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${seasonInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seasonInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="season.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${seasonInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${seasonInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="season.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${seasonInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${seasonInstance?.league}">
				<li class="fieldcontain">
					<span id="league-label" class="property-label"><g:message code="season.league.label" default="League" /></span>
					
						<span class="property-value" aria-labelledby="league-label"><g:link controller="league" action="show" id="${seasonInstance?.league?.id}">${seasonInstance?.league?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${seasonInstance?.games}">
				<li class="fieldcontain">
					<span id="games-label" class="property-label"><g:message code="season.games.label" default="Games" /></span>
					
						<g:each in="${seasonInstance.games}" var="g">
						<span class="property-value" aria-labelledby="games-label"><g:link controller="game" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:seasonInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${seasonInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
