<%@ page import="cscie56.ps5.Season" %>



<div class="fieldcontain ${hasErrors(bean: seasonInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="season.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${seasonInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: seasonInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="season.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${seasonInstance?.startDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: seasonInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="season.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${seasonInstance?.endDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: seasonInstance, field: 'league', 'error')} required">
	<label for="league">
		<g:message code="season.league.label" default="League" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="league" name="league.id" from="${cscie56.ps5.League.list()}" optionKey="id" required="" value="${seasonInstance?.league?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: seasonInstance, field: 'games', 'error')} ">
	<label for="games">
		<g:message code="season.games.label" default="Games" />
		
	</label>
	<g:select name="games" from="${cscie56.ps5.Game.list()}" multiple="multiple" optionKey="id" size="5" value="${seasonInstance?.games*.id}" class="many-to-many"/>

</div>

