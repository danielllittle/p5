<%@ page import="cscie56.ps5.Game" %>



<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'homeTeam', 'error')} required">
	<label for="homeTeam">
		<g:message code="game.homeTeam.label" default="Home Team" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="homeTeam" name="homeTeam.id" from="${cscie56.ps5.Team.list()}" optionKey="id" required="" value="${gameInstance?.homeTeam?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'awayTeam', 'error')} required">
	<label for="awayTeam">
		<g:message code="game.awayTeam.label" default="Away Team" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="awayTeam" name="awayTeam.id" from="${cscie56.ps5.Team.list()}" optionKey="id" required="" value="${gameInstance?.awayTeam?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="game.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="location" required="" value="${gameInstance?.location}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'datetime', 'error')} required">
	<label for="datetime">
		<g:message code="game.datetime.label" default="Datetime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="datetime" precision="day"  value="${gameInstance?.datetime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'awayScore', 'error')} required">
	<label for="awayScore">
		<g:message code="game.awayScore.label" default="Away Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="awayScore" type="number" value="${gameInstance.awayScore}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'gameStats', 'error')} ">
	<label for="gameStats">
		<g:message code="game.gameStats.label" default="Game Stats" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${gameInstance?.gameStats?}" var="g">
    <li><g:link controller="gameStats" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="gameStats" action="create" params="['game.id': gameInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'gameStats.label', default: 'GameStats')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'homeScore', 'error')} required">
	<label for="homeScore">
		<g:message code="game.homeScore.label" default="Home Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="homeScore" type="number" value="${gameInstance.homeScore}" required=""/>

</div>

