<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户登录（普通）</title>
    <asset:stylesheet src="base.css"/>
    <asset:stylesheet src="login.css"/>
</head>
<body>
<div class="superloginA"></div>
<div class="loginBox">
    <div>
        <asset:image src="logo_login.png"/>
    </div>
    <g:form action="login1" method="post" >
        <div class="loginMain">
            <div class="tabwrap">
                <table border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr class="title">
                        <td valign="top" class="name">
                            <label for="name">用户名:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean:userInstance,field:'name','errors')}">
                        <input type="text" id="name" name="name" class ="from-control txt" value="${fieldValue(bean:userInstance,field:'name')}"/>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="password">密 码:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean:userInstance,field:'password','errors')}">
                            <input type="text" id="password" name="password" class ="from-control txt" value="${fieldValue(bean:userInstance,field:'password')}"/>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td><td>
                        <div class="buttons">
                            <span class="button"><input type="submit" class="save"  value="登录"  /></span>
                            <span class="button"><g:link type="submit" class="create1" action="create1">注册</g:link></span>
                    </div>
                    </td>
                    </tr>
                </table>
            </div>
        </div>
    </g:form>
</div>
</body>
</html>
