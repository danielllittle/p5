<%@ page import="cscie56.ps5.Team" %>



<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="team.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${teamInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="team.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="location" required="" value="${teamInstance?.location}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'roster', 'error')} ">
	<label for="roster">
		<g:message code="team.roster.label" default="Roster" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${teamInstance?.roster?}" var="r">
    <li><g:link controller="person" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="person" action="create" params="['team.id': teamInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'person.label', default: 'Person')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'coaches', 'error')} ">
	<label for="coaches">
		<g:message code="team.coaches.label" default="Coaches" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${teamInstance?.coaches?}" var="c">
    <li><g:link controller="person" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="person" action="create" params="['team.id': teamInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'person.label', default: 'Person')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'abbrev', 'error')} required">
	<label for="abbrev">
		<g:message code="team.abbrev.label" default="Abbrev" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="abbrev" required="" value="${teamInstance?.abbrev}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'conference', 'error')} required">
	<label for="conference">
		<g:message code="team.conference.label" default="Conference" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="conference" name="conference.id" from="${cscie56.ps5.Conference.list()}" optionKey="id" required="" value="${teamInstance?.conference?.id}" class="many-to-one"/>

</div>

