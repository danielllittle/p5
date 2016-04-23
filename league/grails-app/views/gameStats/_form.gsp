<%@ page import="cscie56.ps5.GameStats" %>



<div class="fieldcontain ${hasErrors(bean: gameStatsInstance, field: 'assists', 'error')} required">
	<label for="assists">
		<g:message code="gameStats.assists.label" default="Assists" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="assists" type="number" value="${gameStatsInstance.assists}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameStatsInstance, field: 'didNotPlay', 'error')} ">
	<label for="didNotPlay">
		<g:message code="gameStats.didNotPlay.label" default="Did Not Play" />
		
	</label>
	<g:checkBox name="didNotPlay" value="${gameStatsInstance?.didNotPlay}" />

</div>

<div class="fieldcontain ${hasErrors(bean: gameStatsInstance, field: 'game', 'error')} required">
	<label for="game">
		<g:message code="gameStats.game.label" default="Game" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="game" name="game.id" from="${cscie56.ps5.Game.list()}" optionKey="id" required="" value="${gameStatsInstance?.game?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameStatsInstance, field: 'minutesPlayed', 'error')} required">
	<label for="minutesPlayed">
		<g:message code="gameStats.minutesPlayed.label" default="Minutes Played" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="minutesPlayed" type="number" value="${gameStatsInstance.minutesPlayed}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameStatsInstance, field: 'personalFouls', 'error')} required">
	<label for="personalFouls">
		<g:message code="gameStats.personalFouls.label" default="Personal Fouls" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="personalFouls" type="number" value="${gameStatsInstance.personalFouls}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameStatsInstance, field: 'player', 'error')} required">
	<label for="player">
		<g:message code="gameStats.player.label" default="Player" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="player" name="player.id" from="${cscie56.ps5.Person.list()}" optionKey="id" required="" value="${gameStatsInstance?.player?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameStatsInstance, field: 'points', 'error')} required">
	<label for="points">
		<g:message code="gameStats.points.label" default="Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="points" type="number" value="${gameStatsInstance.points}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameStatsInstance, field: 'rebounds', 'error')} required">
	<label for="rebounds">
		<g:message code="gameStats.rebounds.label" default="Rebounds" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rebounds" type="number" value="${gameStatsInstance.rebounds}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameStatsInstance, field: 'shotsAttempted', 'error')} required">
	<label for="shotsAttempted">
		<g:message code="gameStats.shotsAttempted.label" default="Shots Attempted" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="shotsAttempted" type="number" value="${gameStatsInstance.shotsAttempted}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameStatsInstance, field: 'shotsMade', 'error')} required">
	<label for="shotsMade">
		<g:message code="gameStats.shotsMade.label" default="Shots Made" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="shotsMade" type="number" value="${gameStatsInstance.shotsMade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameStatsInstance, field: 'steals', 'error')} required">
	<label for="steals">
		<g:message code="gameStats.steals.label" default="Steals" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="steals" type="number" value="${gameStatsInstance.steals}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameStatsInstance, field: 'threePointersAttempted', 'error')} required">
	<label for="threePointersAttempted">
		<g:message code="gameStats.threePointersAttempted.label" default="Three Pointers Attempted" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="threePointersAttempted" type="number" value="${gameStatsInstance.threePointersAttempted}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameStatsInstance, field: 'threePointersMade', 'error')} required">
	<label for="threePointersMade">
		<g:message code="gameStats.threePointersMade.label" default="Three Pointers Made" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="threePointersMade" type="number" value="${gameStatsInstance.threePointersMade}" required=""/>

</div>

