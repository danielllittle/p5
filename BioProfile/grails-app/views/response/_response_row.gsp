
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${resp.type}</td>
<td>${resp.owner.username }</td>
<td><g:if test="${resp.rejected}"><s style="opacity: 0.7"></g:if>${fieldValue(bean: resp, field: "text")}<g:if test="$resp.rejected"></s></g:if></td>
<td><g:formatDate format="MMM-dd-yyyy hh:mm:ss a" date="${resp.dateCreated}"/></td>
<sec:ifLoggedIn>
    <td>
        <div id="approveresponse${resp.id}">
            <g:if test="${!resp.approved && !resp.rejected && blog.owner.id == userid}">
                <g:form controller="response" action="ajaxapprove">
                    <input type="hidden" name="blog.id" value="${blog.id}"/>
                    <input type="hidden" name="response.id" value="${resp.id}"/>
                    <g:submitToRemote class="btn-xs btn btn-success" url="[controller:'response', action:'ajaxapprove']" update="responserow${resp.id}" value="Approve"/>
                </g:form>
                <g:form controller="response" action="ajaxreject">
                    <input type="hidden" name="blog.id" value="${blog.id}"/>
                    <input type="hidden" name="response.id" value="${resp.id}"/>
                    <g:submitToRemote class="btn-xs btn btn-danger" url="[controller:'response', action:'ajaxreject']" update="responserow${resp.id}" value="Reject"/>
                </g:form>
            </g:if>
            <g:else>
                <g:if test="${!resp.approved && !resp.rejected && resp.owner.id == userid}">
                    awaiting approval
                </g:if>
                <g:if test="${resp.rejected && (blog.id == userid ||
                        resp.owner.id == userid)}">
                    rejected
                </g:if>
            </g:else>
        </div>
    </td>
    <td></td>
</sec:ifLoggedIn>