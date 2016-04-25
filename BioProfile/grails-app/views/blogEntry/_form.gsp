<%@ page import="cscie56.ps5.BlogEntry" %>



<div class="fieldcontain ${hasErrors(bean: blogEntry, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="blogEntry.comments.label" default="Comments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${blogEntry?.comments?}" var="c">
    <li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comment" action="create" params="['blogEntry.id': blogEntry?.id]">${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: blogEntry, field: 'datePublished', 'error')} ">
	<label for="datePublished">
		<g:message code="blogEntry.datePublished.label" default="Date Published" />
		
	</label>
	<g:datePicker name="datePublished" precision="day" value="${blogEntry?.datePublished}" />

</div>

<div class="fieldcontain ${hasErrors(bean: blogEntry, field: 'player', 'error')} ">
	<label for="player">
		<g:message code="blogEntry.player.label" default="Player" />
		
	</label>
	<g:select id="player" name="player.id" from="${cscie56.ps5.User.list()}" optionKey="id" required="" value="${blogEntry?.player?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: blogEntry, field: 'published', 'error')} ">
	<label for="published">
		<g:message code="blogEntry.published.label" default="Published" />
		
	</label>
	<g:checkBox name="published" value="${blogEntry?.published}" />

</div>

<div class="fieldcontain ${hasErrors(bean: blogEntry, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="blogEntry.text.label" default="Text" />
		
	</label>
	<g:textField name="text" value="${blogEntry?.text}" />

</div>

