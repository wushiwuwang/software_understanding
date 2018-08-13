

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>用户认证</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'/car/list')}">首页</a></span>
            <span class="menuButton"><g:link class="create" action="create">公司列表</g:link></span> 
        </div>
    <div class="body">
    		<h1>搜索信息</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="name" title="公司名称" />
                        
                   	        <g:sortableColumn property="country" title="所属国家" />
                        
                   	        <g:sortableColumn property="phone" title="联系电话" />
                        
                   	        <g:sortableColumn property="address" title="公司地址" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${companyInstanceList}" status="i" var="companyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${companyInstance.id}">${fieldValue(bean:companyInstance, field:'name')}</g:link></td>
                            <td><g:link action="show" id="${companyInstance.id}">${fieldValue(bean:companyInstance, field:'country')}</g:link></td>
                            <td><g:link action="show" id="${companyInstance.id}">${fieldValue(bean:companyInstance, field:'phone')}</g:link></td>
                            <td><g:link action="show" id="${companyInstance.id}">${fieldValue(bean:companyInstance, field:'address')}</g:link></td> 
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate action='searchresultspagenavigate' total="${companyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
