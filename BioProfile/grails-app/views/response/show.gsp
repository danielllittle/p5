
<%@ page import="cscie56.ps5.Response" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'response.label', default: 'Response')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-response" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-response" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list response">
			
				<g:if test="${response?.approved}">
				<li class="fieldcontain">
					<span id="approved-label" class="property-label"><g:message code="response.approved.label" default="Approved" /></span>
					
						<span class="property-value" aria-labelledby="approved-label"><g:formatBoolean boolean="${response?.approved}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${response?.blogEntry}">
				<li class="fieldcontain">
					<span id="blogEntry-label" class="property-label"><g:message code="response.blogEntry.label" default="Blog Entry" /></span>
					
						<span class="property-value" aria-labelledby="blogEntry-label"><g:link controller="blogEntry" action="show" id="${response?.blogEntry?.id}">${response?.blogEntry?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${response?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="response.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:link controller="blogEntry" action="show" id="${response?.comment?.id}">${response?.comment?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${response?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="response.comments.label" default="Comments" /></span>
					
						<g:each in="${response.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${response?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="response.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${response?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${response?.datePublished}">
				<li class="fieldcontain">
					<span id="datePublished-label" class="property-label"><g:message code="response.datePublished.label" default="Date Published" /></span>
					
						<span class="property-value" aria-labelledby="datePublished-label"><g:formatDate date="${response?.datePublished}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${response?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="response.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${response?.owner?.id}">${response?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${response?.player}">
				<li class="fieldcontain">
					<span id="player-label" class="property-label"><g:message code="response.player.label" default="Player" /></span>
					
						<span class="property-value" aria-labelledby="player-label"><g:link controller="user" action="show" id="${response?.player?.id}">${response?.player?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${response?.published}">
				<li class="fieldcontain">
					<span id="published-label" class="property-label"><g:message code="response.published.label" default="Published" /></span>
					
						<span class="property-value" aria-labelledby="published-label"><g:formatBoolean boolean="${response?.published}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${response?.rejected}">
				<li class="fieldcontain">
					<span id="rejected-label" class="property-label"><g:message code="response.rejected.label" default="Rejected" /></span>
					
						<span class="property-value" aria-labelledby="rejected-label"><g:formatBoolean boolean="${response?.rejected}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${response?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="response.text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${response}" field="text"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:response, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${response}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
