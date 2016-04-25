
<%@ page import="cscie56.ps5.Comment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-comment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-comment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list comment">
			
				<g:if test="${comment?.approved}">
				<li class="fieldcontain">
					<span id="approved-label" class="property-label"><g:message code="comment.approved.label" default="Approved" /></span>
					
						<span class="property-value" aria-labelledby="approved-label"><g:formatBoolean boolean="${comment?.approved}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${comment?.blogEntry}">
				<li class="fieldcontain">
					<span id="blogEntry-label" class="property-label"><g:message code="comment.blogEntry.label" default="Blog Entry" /></span>
					
						<span class="property-value" aria-labelledby="blogEntry-label"><g:link controller="blogEntry" action="show" id="${comment?.blogEntry?.id}">${comment?.blogEntry?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${comment?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="comment.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${comment?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${comment?.datePublished}">
				<li class="fieldcontain">
					<span id="datePublished-label" class="property-label"><g:message code="comment.datePublished.label" default="Date Published" /></span>
					
						<span class="property-value" aria-labelledby="datePublished-label"><g:formatDate date="${comment?.datePublished}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${comment?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="comment.text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${comment}" field="text"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:comment, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${comment}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
