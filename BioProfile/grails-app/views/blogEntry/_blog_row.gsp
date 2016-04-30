

    <td>${blogEntry.type}</td>
    <td>${blogEntry.owner.username }</td>
    <td>${fieldValue(bean: blogEntry, field: "text")}</td>
    <td><g:formatDate format="MMM-dd-yyyy hh:mm:ss a" date="${blogEntry.dateCreated}"/></td>
    <sec:ifLoggedIn>
        <td>
            <g:if test="${!blogEntry.published}">
                <g:form controller="blogEntry" action="ajaxpublish">
                    <input type="hidden" name="blog.id" value="${blogEntry.id}"/>
                    <g:submitToRemote class="btn-xs btn btn-success" url="[controller:'blogEntry', action:'ajaxpublish']" update="blogrow${blogEntry.id}" value="Publish"/>
                </g:form>
            </g:if>
        </td>
        <td>
            <g:if test="${blogEntry.published}">
                <sec:ifLoggedIn>
                    <button type="button" onclick='document.getElementById("blogid").value="${blogEntry.id}"' class="btn-xs btn btn-info" data-toggle="modal" data-target="#myModalComment">Comment</button>
                </sec:ifLoggedIn>
            </g:if>
        </td>
    </sec:ifLoggedIn>
