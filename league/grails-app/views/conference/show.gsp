
<%@ page import="cscie56.ps5.Conference" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conference.label', default: 'Conference')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-conference" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-conference" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list conference">
			
				<g:if test="${conferenceInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="conference.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${conferenceInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.league}">
				<li class="fieldcontain">
					<span id="league-label" class="property-label"><g:message code="conference.league.label" default="League" /></span>
					
						<span class="property-value" aria-labelledby="league-label"><g:link controller="league" action="show" id="${conferenceInstance?.league?.id}">${conferenceInstance?.league?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.teams}">
				<li class="fieldcontain">
					<span id="teams-label" class="property-label"><g:message code="conference.teams.label" default="Teams" /></span>
					
						<g:each in="${conferenceInstance.teams}" var="t">
						<span class="property-value" aria-labelledby="teams-label"><g:link controller="team" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:conferenceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${conferenceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
