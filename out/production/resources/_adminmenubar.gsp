<g:if test="${!session.name}">
</g:if>
<g:else>
    <span class="menuButton">
        <g:link class="list" controller="analysis" action="index">分析列表</g:link>
    </span>
    <span class="menuButton">
        <g:link class="list" controller="project" action="index">项目列表</g:link>
    </span>
    <span class="menuButton">
        <g:link class="list" controller="user" action="index">用户列表</g:link>
    </span>
</g:else>
		