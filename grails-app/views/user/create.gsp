<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title>用户注册</title>
    </head>
    <body>
        <a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="list" action="index1">首页</g:link></li>
                <li><g:link class="list" action="index">用户列表</g:link></li>
            </ul>
        </div>
        <div id="create-user" class="content scaffold-create" role="main">
            <h1>用户注册</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
                <g:form resource="${this.user}" method="POST">
                    <div class="dialog">
                        <table>
                            <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">用户名:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:this.user,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:this.user,field:'name')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">密码:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:this.user,field:'password','errors')}">
                                    <input type="text" id="password" name="password" value="${fieldValue(bean:this.user,field:'password')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone">联系电话:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:this.user,field:'phone','errors')}">
                                    <input type="text" id="phone" name="phone" value="${fieldValue(bean:this.user,field:'phone')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="emailAdd">邮箱:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:this.user,field:'emailAdd','errors')}">
                                    <input type="text" id="emailAdd" name="emailAdd" value="${fieldValue(bean:this.user,field:'emailAdd')}"/>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="注册" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
