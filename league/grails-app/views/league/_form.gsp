<%@ page import="cscie56.ps5.League" %>



<div class="fieldcontain ${hasErrors(bean: leagueInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="league.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${leagueInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: leagueInstance, field: 'conferences', 'error')} ">
	<label for="conferences">
		<g:message code="league.conferences.label" default="Conferences" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${leagueInstance?.conferences?}" var="c">
    <li><g:link controller="conference" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="conference" action="create" params="['league.id': leagueInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'conference.label', default: 'Conference')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: leagueInstance, field: 'seasons', 'error')} ">
	<label for="seasons">
		<g:message code="league.seasons.label" default="Seasons" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${leagueInstance?.seasons?}" var="s">
    <li><g:link controller="season" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="season" action="create" params="['league.id': leagueInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'season.label', default: 'Season')])}</g:link>
</li>
</ul>


</div>

