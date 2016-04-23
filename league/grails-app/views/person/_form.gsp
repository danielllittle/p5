<%@ page import="cscie56.ps5.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="person.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="role" from="${personInstance.constraints.role.inList}" required="" value="${personInstance?.role}" valueMessagePrefix="person.role"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="person.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${personInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="person.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${personInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'skill', 'error')} required">
	<label for="skill">
		<g:message code="person.skill.label" default="Skill" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="skill" from="${5..95}" class="range" required="" value="${fieldValue(bean: personInstance, field: 'skill')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'bio', 'error')} required">
	<label for="bio">
		<g:message code="person.bio.label" default="Bio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="bio" required="" value="${personInstance?.bio}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthDate', 'error')} required">
	<label for="birthDate">
		<g:message code="person.birthDate.label" default="Birth Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthDate" precision="day"  value="${personInstance?.birthDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthPlace', 'error')} required">
	<label for="birthPlace">
		<g:message code="person.birthPlace.label" default="Birth Place" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="birthPlace" required="" value="${personInstance?.birthPlace}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'inches', 'error')} required">
	<label for="inches">
		<g:message code="person.inches.label" default="Inches" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="inches" type="number" value="${personInstance.inches}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'team', 'error')} required">
	<label for="team">
		<g:message code="person.team.label" default="Team" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="team" name="team.id" from="${cscie56.ps5.Team.list()}" optionKey="id" required="" value="${personInstance?.team?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'universityAttended', 'error')} required">
	<label for="universityAttended">
		<g:message code="person.universityAttended.label" default="University Attended" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="universityAttended" required="" value="${personInstance?.universityAttended}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="person.weight.label" default="Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" type="number" value="${personInstance.weight}" required=""/>

</div>

