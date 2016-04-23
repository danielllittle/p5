
<%@ page import="cscie56.ps5.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class = "container">
			<div id="show-person" class="content scaffold-show" role="main">
				<h1><g:fieldValue bean="${personInstance}" field="firstName"/>&nbsp;<g:fieldValue bean="${personInstance}" field="lastName"/></h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<div role="tabpanel">

					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#personal" aria-controls="1" role="tab" data-toggle="tab">Personal</a></li>
						<g:if test="${personInstance.role.equals('Player')}">
							<li role="presentation"><a href="#seasonstats" aria-controls="2" role="tab" data-toggle="tab">Season Stats</a></li>
							<li role="presentation"><a href="#games" aria-controls="2" role="tab" data-toggle="tab">Games</a></li>
						</g:if>

					</ul>

					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="personal">
							<ol class="property-list person">

								<g:if test="${personInstance?.bio}">
									<li class="fieldcontain">
										<span id="bio-label" class="property-label"><g:message code="person.bio.label" default="Bio" /></span>

										<span class="property-value" aria-labelledby="bio-label"><g:fieldValue bean="${personInstance}" field="bio"/></span>

									</li>
								</g:if>

								<g:if test="${personInstance?.team}">
									<li class="fieldcontain">
										<span id="team-label" class="property-label"><g:message code="person.team.label" default="Team" /></span>

										<span class="property-value" aria-labelledby="team-label"><g:link controller="team" action="show" id="${personInstance?.team?.id}">${personInstance?.team?.encodeAsHTML()}</g:link></span>

									</li>
								</g:if>

								<g:if test="${personInstance?.inches}">
									<li class="fieldcontain">
										<span id="inches-label" class="property-label"><g:message code="person.inches.label" default="Inches" /></span>

										<span class="property-value" aria-labelledby="inches-label"><%= String.format("%d' %d\"", personInstance.inches.toInteger().intdiv(12), personInstance.inches%12) %></span>

									</li>
								</g:if>

								<g:if test="${personInstance?.weight}">
									<li class="fieldcontain">
										<span id="weight-label" class="property-label"><g:message code="person.weight.label" default="Weight" /></span>

										<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${personInstance}" field="weight"/></span>

									</li>
								</g:if>

								<g:if test="${personInstance?.birthDate}">
									<li class="fieldcontain">
										<span id="birthDate-label" class="property-label"><g:message code="person.birthDate.label" default="Birth Date" /></span>

										<span class="property-value" aria-labelledby="birthDate-label"><g:formatDate type="date" style="LONG" date="${personInstance?.birthDate}" /></span>

									</li>
								</g:if>

								<g:if test="${personInstance?.role}">
								<li class="fieldcontain">
									<span id="role-label" class="property-label"><g:message code="person.role.label" default="Role" /></span>

										<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${personInstance}" field="role"/></span>

								</li>
								</g:if>

								<g:if test="${personInstance?.birthPlace}">
									<li class="fieldcontain">
										<span id="birthplace-label" class="property-label"><g:message code="person.birthPlace.label" default="Birth Place" /></span>

										<span class="property-value" aria-labelledby="birthPlace-label"><g:fieldValue bean="${personInstance}" field="birthPlace" /></span>

									</li>
								</g:if>

								<g:if test="${personInstance?.universityAttended}">
									<li class="fieldcontain">
										<span id="universityAttended-label" class="property-label"><g:message code="person.universityAttended.label" default="University Attended" /></span>

										<span class="property-value" aria-labelledby="universityAttended-label"><g:fieldValue bean="${personInstance}" field="universityAttended"/></span>

									</li>
								</g:if>



							</ol>
							<g:form url="[resource:personInstance, action:'delete']" method="DELETE">
								<fieldset class="buttons">
									<g:link class="edit" action="edit" resource="${personInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
									<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
								</fieldset>
							</g:form>
						</div>
						<div role="tabpanel" class="tab-pane" id="seasonstats">

							<table class="table table-striped table-bordered table-hover"><tr><th/><th>GP</th><th>MP</th><th>P</th><th>A</th><th>R</th><th>ST</th><th class="hidden-xs">SM</th><th class="hidden-xs">SA</th>
								<th class="hidden-xs">S%</th><th class="hidden-xs">3PM</th><th class="hidden-xs">3PA</th><th class="hidden-xs">3P%</th><th class="hidden-xs">PF</th></tr>
								<stats:summaryStatsAbs playerGameStats="${personInstance.gameStats}"/>
								<stats:summaryStatsAvg playerGameStats="${personInstance.gameStats}"/>
							</table>
						</div>
						<div role="tabpanel" class="tab-pane" id="games">
							<table class="table table-striped table-bordered table-hover"><tr><th>Game</th><th>MP</th><th>P</th><th>A</th><th>R</th><th>S</th><th class="hidden-xs">ST</th>
								<th class="hidden-xs">SM</th><th class="hidden-xs">S%</th><th class="hidden-xs">3PA</th><th class="hidden-xs">3PM</th>
								<th class="hidden-xs">3P%<th>PF</th></tr>
								<g:render template="/person/gamesStatsRow" collection="${personInstance?.gameStats.asList().sort()}" />
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>