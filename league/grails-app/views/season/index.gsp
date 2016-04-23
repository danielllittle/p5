
<%@ page import="cscie56.ps5.Season" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'season.label', default: 'Season')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-season" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-season" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'season.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="startDate" title="${message(code: 'season.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'season.endDate.label', default: 'End Date')}" />
					
						<th><g:message code="season.league.label" default="League" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${seasonInstanceList}" status="i" var="seasonInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${seasonInstance.id}">${fieldValue(bean: seasonInstance, field: "name")}</g:link></td>
					
						<td><g:formatDate date="${seasonInstance.startDate}" /></td>
					
						<td><g:formatDate date="${seasonInstance.endDate}" /></td>
					
						<td>${fieldValue(bean: seasonInstance, field: "league")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${seasonInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
