
<%@ page import="cscie56.ps5.Comment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-comment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-comment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="approved" title="${message(code: 'comment.approved.label', default: 'Approved')}" />
					
						<th><g:message code="comment.blogEntry.label" default="Blog Entry" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'comment.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="datePublished" title="${message(code: 'comment.datePublished.label', default: 'Date Published')}" />
					
						<g:sortableColumn property="text" title="${message(code: 'comment.text.label', default: 'Text')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${commentList}" status="i" var="comment">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${comment.id}">${fieldValue(bean: comment, field: "approved")}</g:link></td>
					
						<td>${fieldValue(bean: comment, field: "blogEntry")}</td>
					
						<td><g:formatDate date="${comment.dateCreated}" /></td>
					
						<td><g:formatDate date="${comment.datePublished}" /></td>
					
						<td>${fieldValue(bean: comment, field: "text")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${commentCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
