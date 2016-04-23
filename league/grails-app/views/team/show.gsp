
<%@ page import="cscie56.ps5.Team" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-team" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-team" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list team">
			
				<g:if test="${teamInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="team.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${teamInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="team.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${teamInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.roster}">
				<li class="fieldcontain">
					<span id="roster-label" class="property-label"><g:message code="team.roster.label" default="Roster" /></span>
					
						<g:each in="${teamInstance.roster}" var="r">
						<span class="property-value" aria-labelledby="roster-label"><g:link controller="person" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.coaches}">
				<li class="fieldcontain">
					<span id="coaches-label" class="property-label"><g:message code="team.coaches.label" default="Coaches" /></span>
					
						<g:each in="${teamInstance.coaches}" var="c">
						<span class="property-value" aria-labelledby="coaches-label"><g:link controller="person" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.abbrev}">
				<li class="fieldcontain">
					<span id="abbrev-label" class="property-label"><g:message code="team.abbrev.label" default="Abbrev" /></span>
					
						<span class="property-value" aria-labelledby="abbrev-label"><g:fieldValue bean="${teamInstance}" field="abbrev"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.conference}">
				<li class="fieldcontain">
					<span id="conference-label" class="property-label"><g:message code="team.conference.label" default="Conference" /></span>
					
						<span class="property-value" aria-labelledby="conference-label"><g:link controller="conference" action="show" id="${teamInstance?.conference?.id}">${teamInstance?.conference?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:teamInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${teamInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
