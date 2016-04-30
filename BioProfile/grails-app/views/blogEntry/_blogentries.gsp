<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<br>
<g:if test="${!blogentriescoll}"><tr><td><div id="noentries">No blog entries</div></td></tr></g:if>
<g:else>
    <table id="blogentriestable" class="table  table-bordere table-hover">
        <thead><tr><th>Discussion</th><th>Owner</th><th>Text</th><th>Date</th><sec:ifLoggedIn><th>Publish</th><th>Reply</th></sec:ifLoggedIn></tr></thead>
        <tbody>
        <g:each in="${blogentriescoll?.sort{b1,b2 -> b2.id<=>b1.id}}" status="i" var="blogEntry">
                <g:if test="${"Blog".equals(blogEntry.type) && (blogEntry.published ||
                        (blogEntry.owner.id == userid))}">
                    <tr id="blogrow${blogEntry.id}" class="table-success">
                        <g:render plugin="bio-profile" template="/blogEntry/blog_row" model="['blogEntry': blogEntry]" />
                    </tr>

                    <g:each in="${blogEntry.comments?.sort{c1,c2 -> c2.datePublished<=>c1.datePublished}}" status="j" var="comment">
                        <g:if test="${comment.approved ||
                                comment.owner.id == userid ||
                                blogEntry.owner.id == userid}">
                            <tr id="commentrow${comment.id}" class="table-info">
                                <g:render plugin="bio-profile" template="/comment/comment_row" model="['comment': comment, 'blog' : blogEntry]" />
                            </tr>
                            <g:each in="${comment.responses?.sort{r1,r2 -> r2.datePublished<=>r1.datePublished}}" status="k" var="resp">
                                <g:if test="${resp.approved ||
                                        resp.owner.id == userid ||
                                        (blogEntry.owner.id == userid)}">
                                    <tr id="responserow${resp.id}" class="table-info">
                                        <g:render plugin="bio-profile" template="/response/response_row" model="['resp': resp, 'blog' : blogEntry]" />
                                    </tr>
                                </g:if>
                            </g:each>
                        </g:if>
                    </g:each>
                </g:if>
            </g:each>
        </tbody>

    </table>
</g:else>
</br></br>
<sec:ifLoggedIn>
    <button type="button" class="btn btn-info" id="startblogentry" data-toggle="modal" data-target="#myModal">Create blog entry></button>
</sec:ifLoggedIn>
</div>