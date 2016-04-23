<%@ page import="cscie56.ps5.Conference" %>



<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="conference.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${conferenceInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'league', 'error')} required">
	<label for="league">
		<g:message code="conference.league.label" default="League" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="league" name="league.id" from="${cscie56.ps5.League.list()}" optionKey="id" required="" value="${conferenceInstance?.league?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'teams', 'error')} ">
	<label for="teams">
		<g:message code="conference.teams.label" default="Teams" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${conferenceInstance?.teams?}" var="t">
    <li><g:link controller="team" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="team" action="create" params="['conference.id': conferenceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'team.label', default: 'Team')])}</g:link>
</li>
</ul>


</div>

