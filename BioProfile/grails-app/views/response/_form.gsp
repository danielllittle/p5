<%@ page import="cscie56.ps5.Response" %>



<div class="fieldcontain ${hasErrors(bean: response, field: 'approved', 'error')} ">
	<label for="approved">
		<g:message code="response.approved.label" default="Approved" />
		
	</label>
	<g:checkBox name="approved" value="${response?.approved}" />

</div>

<div class="fieldcontain ${hasErrors(bean: response, field: 'blogEntry', 'error')} ">
	<label for="blogEntry">
		<g:message code="response.blogEntry.label" default="Blog Entry" />
		
	</label>
	<g:select id="blogEntry" name="blogEntry.id" from="${cscie56.ps5.BlogEntry.list()}" optionKey="id" required="" value="${response?.blogEntry?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: response, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="response.comment.label" default="Comment" />
		
	</label>
	<g:select id="comment" name="comment.id" from="${cscie56.ps5.BlogEntry.list()}" optionKey="id" required="" value="${response?.comment?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: response, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="response.comments.label" default="Comments" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: response, field: 'datePublished', 'error')} ">
	<label for="datePublished">
		<g:message code="response.datePublished.label" default="Date Published" />
		
	</label>
	<g:datePicker name="datePublished" precision="day" value="${response?.datePublished}" />

</div>

<div class="fieldcontain ${hasErrors(bean: response, field: 'owner', 'error')} ">
	<label for="owner">
		<g:message code="response.owner.label" default="Owner" />
		
	</label>
	<g:select id="owner" name="owner.id" from="${cscie56.ps5.User.list()}" optionKey="id" required="" value="${response?.owner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: response, field: 'player', 'error')} ">
	<label for="player">
		<g:message code="response.player.label" default="Player" />
		
	</label>
	<g:select id="player" name="player.id" from="${cscie56.ps5.User.list()}" optionKey="id" required="" value="${response?.player?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: response, field: 'published', 'error')} ">
	<label for="published">
		<g:message code="response.published.label" default="Published" />
		
	</label>
	<g:checkBox name="published" value="${response?.published}" />

</div>

<div class="fieldcontain ${hasErrors(bean: response, field: 'rejected', 'error')} ">
	<label for="rejected">
		<g:message code="response.rejected.label" default="Rejected" />
		
	</label>
	<g:checkBox name="rejected" value="${response?.rejected}" />

</div>

<div class="fieldcontain ${hasErrors(bean: response, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="response.text.label" default="Text" />
		
	</label>
	<g:textField name="text" value="${response?.text}" />

</div>

