
<%@ page import="cscie56.ps5.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-person" class="container" >
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="row">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<g:sortableColumn class ="hidden-xs" property="role" title="${message(code: 'person.role.label', default: 'Role')}" />
							<th>Name</th>
							<g:sortableColumn property="team" title="${message(code: 'person.team.label', default: 'Team')}" />
							<g:sortableColumn property="inches" title="${message(code: 'person.inches.label', default: 'Height')}" />
							<g:sortableColumn property="weight" title="${message(code: 'person.weight.label', default: 'Weight')}" />
							<g:sortableColumn class="hidden-xs" property="birthDate" title="${message(code: 'person.birthDate.label', default: 'Birth Date')}" />
							<g:sortableColumn class ="visible-lg" property="bio" title="${message(code: 'person.bio.label', default: 'Bio')}" />
						</tr>
					</thead>
					<tbody>
					<g:each in="${personInstanceList}" status="i" var="personInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td class ="hidden-xs">${fieldValue(bean: personInstance, field: "role")}</td>

							<td><g:link action="show" id="${personInstance.id}"><nobr>${fieldValue(bean: personInstance, field: "firstName")}&nbsp;${fieldValue(bean: personInstance, field: "lastName")}</nobr></g:link></td>
							<td><nobr>${fieldValue(bean: personInstance, field: "team")}</nobr></td>
							<td><%=fieldValue(bean: personInstance, field: "inches").toInteger().intdiv(12)%>'&nbsp;<%=fieldValue(bean: personInstance, field: "inches").toInteger() % 12%>&quot;</td>
							<td>${fieldValue(bean: personInstance, field: "weight")}</td>
							<td class ="hidden-xs"><g:formatDate type="date" style="LONG" date="${personInstance.birthDate}" /></td>

							<% def bioArray = fieldValue(bean: personInstance, field: "bio").split(' ')%>
							<td class ="visible-lg" title="${fieldValue(bean: personInstance, field: "bio")}"><%=bioArray[0..4].join(' ')%>
								<a data-toggle="collapse" href="#longContent" aria-expanded="false" aria-controls="longContent">more/less</a>
								<span class="collapse" id="longContent"><%=bioArray[5..bioArray.size()-1].join(' ')%></span>
							</td>



						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
			<div class="row pagination">
				<g:paginate total="${personInstanceCount ?: 0}" />
			</div>
		</div>
	<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
	</body>
</html>
