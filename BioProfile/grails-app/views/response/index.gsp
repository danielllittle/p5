
<%@ page import="cscie56.ps5.Response" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'response.label', default: 'Response')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-response" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-response" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="approved" title="${message(code: 'response.approved.label', default: 'Approved')}" />
					
						<th><g:message code="response.blogEntry.label" default="Blog Entry" /></th>
					
						<th><g:message code="response.comment.label" default="Comment" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'response.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="datePublished" title="${message(code: 'response.datePublished.label', default: 'Date Published')}" />
					
						<th><g:message code="response.owner.label" default="Owner" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${responseList}" status="i" var="response">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${response.id}">${fieldValue(bean: response, field: "approved")}</g:link></td>
					
						<td>${fieldValue(bean: response, field: "blogEntry")}</td>
					
						<td>${fieldValue(bean: response, field: "comment")}</td>
					
						<td><g:formatDate date="${response.dateCreated}" /></td>
					
						<td><g:formatDate date="${response.datePublished}" /></td>
					
						<td>${fieldValue(bean: response, field: "owner")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${responseCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
