<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>查询分析信息</title>
</head>
<body>
<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:form action="doSearch" method="post">
        <div class="dialog">
            <p>请输入分析名称:</p>
            <table  class="userForm">
                <tr class='prop'>
                    <td valign='top' style='text-align:left;' width='20%'>
                        <label for='name'>Name:</label>
                    </td>
                    <td valign='top' style='text-align:left;' width='80%'>
                        <input id="name" type='text' name='name' value='${params.name}' />
                    </td>
                </tr>
            </table>
        </div>
            <fieldset class="buttons">
                <input type="submit" value="查询" />
            </fieldset>
    </g:form>
</div>
</body>
</html>

