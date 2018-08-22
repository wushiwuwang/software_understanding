<!DOCTYPE html>
<html class=" js csstransforms3d"><head>
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
<body style="background: #f6f5fa;">
<!--content S-->
<div class="superCtab">
    <div class="ctab-title clearfix"><h3>项目列表</h3></div>
    <div class="ctab-Main">
        <div class="ctab-Main-title">
            <ul class="clearfix">
                <li class="cur">项目信息</li>
            </ul>
        </div>
        <div class="ctab-Main">
            <div class="Mian-cont-btn clearfix">
                <div class="operateBtn">
                    <a onclick="location.href='create.gap'" class="greenbtn publish">创建信息</a>
                </div>
            </div>
        </div>

        <g:uploadForm action="upload" controller="project" >
            文件:<input type="file" name="myFile" id="myFile" />
            <span>  <g:submitButton name="submit" value="开始上传"/>  </span>
        </g:uploadForm>
    <div class="ctab-Main">
        <div class="Mian-cont-wrap">
            <table border="0" cellspacing="0" cellpadding="0" class="defaultTable defaultTable2">
                <tbody>
                <tr>
                    <div id="list-project" class="content scaffold-list" role="main">
                    <td class="t_1"><g:if test="${flash.message}"></td>
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                        <div class="list">
                            <table>
                                <thead>
                                <tr>
                                    <g:sortableColumn property="project_name" title="项目名称" />
                                    <g:sortableColumn property="time" title="创建时间" />
                                    <g:sortableColumn property="language" title="项目语言" />
                                    <g:sortableColumn property="project_id" title="项目编号" />
                                    <g:sortableColumn property="user" title="用户" />
                                    <g:sortableColumn property="user" title="操作" />
                                    <g:sortableColumn property="user" title="操作" />
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${projectList}" status="i" var="projectInstance">
                                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                        <td><g:link action="show" id="${projectInstance.id}">${fieldValue(bean:projectInstance, field:'project_name')}</g:link></td>
                                        <td><g:link action="show" id="${projectInstance.id}">${fieldValue(bean:projectInstance, field:'time')}</g:link></td>
                                        <td><g:link action="show" id="${projectInstance.id}">${fieldValue(bean:projectInstance, field:'language')}</g:link></td>
                                        <td><g:link action="show" id="${projectInstance.id}">${fieldValue(bean:projectInstance, field:'project_id')}</g:link></td>
                                        <td><g:link action="show" id="${projectInstance.id}">${fieldValue(bean:projectInstance, field:'user')}</g:link></td>
                                        <td><g:link class="create" action="submit">开始分析</g:link></td>
                                        <td ><g:link class="list" controller="analysis" action="index" target="Mainindex">获取结果</g:link></td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                        <div class="pagination">
                            <g:paginate total="${projectCount ?: 0}" />
                        </div>
                    </div>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!--main-->
</body>
</html>
