
<td>&nbsp;&nbsp;&nbsp;${comment.type}</td>
<td>${comment.owner.username }</td>
<td><g:if test="${comment.rejected}"><s style="opacity: 0.7"></g:if>${fieldValue(bean: comment, field: "text")}<g:if test="$comment.rejected"></s></g:if></td>
<td><g:formatDate format="MMM-dd-yyyy hh:mm:ss a" date="${comment.dateCreated}"/></td>
<sec:ifLoggedIn>
    <td>
        <div id="approvecomment${comment.id}">
            <g:if test="${!comment.approved && !comment.rejected && blog.owner.id == userid}">
                <g:form controller="comment" action="ajaxapprove">
                    <input type="hidden" name="blog.id" value="${blog.id}"/>
                    <input type="hidden" name="comment.id" value="${comment.id}"/>
                    <g:submitToRemote class="btn-xs btn btn-success" url="[controller:'comment', action:'ajaxapprove']" update="commentrow${comment.id}" value="Approve"/>
                </g:form>
                <g:form controller="comment" action="ajaxreject">
                    <input type="hidden" name="blog.id" value="${blog.id}"/>
                    <input type="hidden" name="comment.id" value="${comment.id}"/>
                    <g:submitToRemote class="btn-xs btn btn-danger" url="[controller:'comment', action:'ajaxreject']" update="commentrow${comment.id}" value="Reject"/>
                </g:form>
            </g:if>
            <g:else>
                <g:if test="${!comment.approved && !comment.rejected && comment.owner.id == userid}">
                    awaiting approval
                </g:if>
                <g:if test="${comment.rejected && (blog.id == userid ||
                                                   comment.owner.id == userid)}">
                    rejected
                </g:if>
            </g:else>
        </div>
    </td>
    <td>
        <g:if test="${comment.approved}">
            <sec:ifLoggedIn>
                <button type="button" onclick='document.getElementById("commentid").value="${comment.id}"' class="btn-xs btn btn-warning" data-toggle="modal" data-target="#myModalResponse">Response</button>
            </sec:ifLoggedIn>
        </g:if>
    </td>
</sec:ifLoggedIn>

