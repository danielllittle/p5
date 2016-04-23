
<%@ page import="cscie56.ps5.Conference" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conference.label', default: 'Conference')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-conference" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-conference" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'conference.name.label', default: 'Name')}" />
					
						<th><g:message code="conference.league.label" default="League" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conferenceInstanceList}" status="i" var="conferenceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conferenceInstance.id}">${fieldValue(bean: conferenceInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: conferenceInstance, field: "league")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conferenceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
