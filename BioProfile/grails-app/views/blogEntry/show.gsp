
<%@ page import="cscie56.ps5.BlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogEntry.label', default: 'BlogEntry')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-blogEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-blogEntry" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list blogEntry">
			
				<g:if test="${blogEntry?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="blogEntry.comments.label" default="Comments" /></span>
					
						<g:each in="${blogEntry.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${blogEntry?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="blogEntry.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${blogEntry?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogEntry?.datePublished}">
				<li class="fieldcontain">
					<span id="datePublished-label" class="property-label"><g:message code="blogEntry.datePublished.label" default="Date Published" /></span>
					
						<span class="property-value" aria-labelledby="datePublished-label"><g:formatDate date="${blogEntry?.datePublished}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogEntry?.player}">
				<li class="fieldcontain">
					<span id="player-label" class="property-label"><g:message code="blogEntry.player.label" default="Player" /></span>
					
						<span class="property-value" aria-labelledby="player-label"><g:link controller="user" action="show" id="${blogEntry?.player?.id}">${blogEntry?.player?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogEntry?.published}">
				<li class="fieldcontain">
					<span id="published-label" class="property-label"><g:message code="blogEntry.published.label" default="Published" /></span>
					
						<span class="property-value" aria-labelledby="published-label"><g:formatBoolean boolean="${blogEntry?.published}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogEntry?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="blogEntry.text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${blogEntry}" field="text"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:blogEntry, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${blogEntry}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
