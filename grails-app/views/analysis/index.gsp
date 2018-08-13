<!DOCTYPE html>
<html class=" js csstransforms3d"><head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>分析列表</title>
    <asset:stylesheet src="base.css"/>
    <asset:stylesheet src="page.css"/>
    <!--[if lte IE 8]>
	<link href="css/ie8.css" rel="stylesheet" type="text/css"/>
	<![endif]-->
    <asset:javascript src="jquery.min.js"/>
    <asset:javascript src="main.js"/>
    <asset:javascript src="modernizr.js"/>
    <!--[if IE]>
	<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
    <meta name="layout" content="main" />
</head>
<body style="background: #f6f5fa;">
<!--content S-->
<div class="nav">
    <li class="menuButton"><g:link class="create" action="create">创建信息</g:link></li>
</div>
<div class="superCtab">
    <div class="ctab-title clearfix"><h3>分析列表</h3> </div>
    <div class="ctab-Main">
        <div class="Mian-cont-wrap">
            <table border="0" cellspacing="0" cellpadding="0" class="defaultTable defaultTable2">
                <tbody>
                <tr>
                    <div id="list-project" class="content scaffold-list" role="main">
                    <td class="t_1"> <g:if test="${flash.message}"></td>
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                        <f:table collection="${analysisList}" />
                        <div class="pagination">
                            <g:paginate total="${analysisCount ?: 0}" />
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