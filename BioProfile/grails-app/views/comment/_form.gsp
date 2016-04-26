<%@ page import="cscie56.ps5.Comment" %>



<div class="fieldcontain ${hasErrors(bean: comment, field: 'approved', 'error')} ">
	<label for="approved">
		<g:message code="comment.approved.label" default="Approved" />
		
	</label>
	<g:checkBox name="approved" value="${comment?.approved}" />

</div>

<div class="fieldcontain ${hasErrors(bean: comment, field: 'blogEntry', 'error')} ">
	<label for="blogEntry">
		<g:message code="comment.blogEntry.label" default="Blog Entry" />
		
	</label>
	<g:select id="blogEntry" name="blogEntry.id" from="${cscie56.ps5.BlogEntry.list()}" optionKey="id" required="" value="${comment?.blogEntry?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: comment, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="comment.comments.label" default="Comments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${comment?.comments?}" var="c">
    <li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comment" action="create" params="['comment.id': comment?.id]">${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: comment, field: 'datePublished', 'error')} ">
	<label for="datePublished">
		<g:message code="comment.datePublished.label" default="Date Published" />
		
	</label>
	<g:datePicker name="datePublished" precision="day" value="${comment?.datePublished}" />

</div>

<div class="fieldcontain ${hasErrors(bean: comment, field: 'owner', 'error')} ">
	<label for="owner">
		<g:message code="comment.owner.label" default="Owner" />
		
	</label>
	<g:select id="owner" name="owner.id" from="${cscie56.ps5.User.list()}" optionKey="id" required="" value="${comment?.owner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: comment, field: 'player', 'error')} ">
	<label for="player">
		<g:message code="comment.player.label" default="Player" />
		
	</label>
	<g:select id="player" name="player.id" from="${cscie56.ps5.User.list()}" optionKey="id" required="" value="${comment?.player?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: comment, field: 'published', 'error')} ">
	<label for="published">
		<g:message code="comment.published.label" default="Published" />
		
	</label>
	<g:checkBox name="published" value="${comment?.published}" />

</div>

<div class="fieldcontain ${hasErrors(bean: comment, field: 'rejected', 'error')} ">
	<label for="rejected">
		<g:message code="comment.rejected.label" default="Rejected" />
		
	</label>
	<g:checkBox name="rejected" value="${comment?.rejected}" />

</div>

<div class="fieldcontain ${hasErrors(bean: comment, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="comment.text.label" default="Text" />
		
	</label>
	<g:textField name="text" value="${comment?.text}" />

</div>

