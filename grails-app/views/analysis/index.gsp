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
    <div class="ctab-title clearfix"><h3>分析列表</h3></div>
    <div class="ctab-Main-title">
        <ul class="clearfix">
            <li class="cur">分析信息</li>
        </ul>
    </div>
    <div class="Mian-cont-wrap">
        <table border="0" cellspacing="0" cellpadding="0" class="defaultTable defaultTable2">
            <div class="ctab-Main">
                <div class="Mian-cont-btn clearfix">
                    <div class="operateBtn">
                        <a onclick="location.href='create.gap'" class="greenbtn publish">创建信息</a>
                    </div>
                </div>
            </div>
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
                                <g:sortableColumn property="project" title="项目名称" />
                                <g:sortableColumn property="id" title="信息编号" />
                                <g:sortableColumn property="startline" title="开始行数" />
                                <g:sortableColumn property="endline" title="结束行数" />
                                <g:sortableColumn property="column" title="报错列数" />
                                <g:sortableColumn property="group" title="错误代码或警告代码" />
                                <g:sortableColumn property="message" title="报错信息" />

                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${analysisList}" status="i" var="analysisInstance">
                                <in class="${(i % 2) == 0 ? 'odd' : 'even'}"></in>
                                <td><g:link action="show" id="${analysisInstance.id}">${fieldValue(bean:analysisInstance, field:'startline')}</g:link></td>
                                <td><g:link action="show" id="${analysisInstance.id}">${fieldValue(bean:analysisInstance, field:'id')}</g:link></td>
                                <td><g:link action="show" id="${analysisInstance.id}">${fieldValue(bean:analysisInstance, field:'endline')}</g:link></td>
                                <td><g:link action="show" id="${analysisInstance.id}">${fieldValue(bean:analysisInstance, field:'column')}</g:link></td>
                                <td><g:link action="show" id="${analysisInstance.id}">${fieldValue(bean:analysisInstance, field:'group')}</g:link></td>
                                <td><g:link action="show" id="${analysisInstance.id}">${fieldValue(bean:analysisInstance, field:'message')}</g:link></td>
                                <td><g:link action="show" id="${analysisInstance.id}">${fieldValue(bean:analysisInstance, field:'project')}</g:link></td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                    <div class="pagination">
                        <g:paginate total="${analysisCount ?: 0}" />
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