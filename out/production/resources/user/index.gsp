<!DOCTYPE html>
<html class=" js csstransforms3d">
    <head>
        <meta charset="utf-8">
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>项目列表</title>
        <asset:stylesheet src="base.css"/>
        <asset:stylesheet src="page.css"/>
        <asset:javascript src="jquery.min.js"/>
        <asset:javascript src="main.js"/>
        <asset:javascript src="modernizr.js"/>
        <meta name="layout" content="main" />
</head>
<body>
<div class="nav">
    <li class="menuButton"><g:link class="create" action="create">创建信息</g:link></li>
    <li class="menuButton"><g:link class="create" action="search">搜索信息</g:link></li>
</div>
<div class="superCtab">
    <div class="ctab-title clearfix"><h3>用户列表</h3> </div>
    <div class="ctab-Main">
        <div class="Mian-cont-wrap">
            <table border="0" cellspacing="0" cellpadding="0" class="defaultTable defaultTable2">
                <tbody>
                <tr>
                    <div id="list-user" class="content scaffold-list" role="main">
                      <td class="t_1"> <g:if test="${flash.message}"></td>
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <f:table collection="${userList}" />
                        <div class="pagination">
                            <g:paginate total="${userCount ?: 0}" />
                        </div>
                    </div>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>