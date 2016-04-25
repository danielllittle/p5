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

<div class="fieldcontain ${hasErrors(bean: comment, field: 'datePublished', 'error')} ">
	<label for="datePublished">
		<g:message code="comment.datePublished.label" default="Date Published" />
		
	</label>
	<g:datePicker name="datePublished" precision="day" value="${comment?.datePublished}" />

</div>

<div class="fieldcontain ${hasErrors(bean: comment, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="comment.text.label" default="Text" />
		
	</label>
	<g:textField name="text" value="${comment?.text}" />

</div>

