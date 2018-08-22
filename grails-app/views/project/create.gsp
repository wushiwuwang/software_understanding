<%@ page import="software_understanding.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">首页</a></li>
                <li><g:link class="list" action="index">项目列表</g:link></li>
            </ul>
        </div>
        <div id="create-project" class="content scaffold-create" role="main">
            <h1>创建项目信息</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.project}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.project}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
                <g:form resource="${this.project}" method="POST">
                    <div class="dialog">
                        <table>
                            <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="project_name">项目名:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:this.project,field:'project_name','errors')}">
                                    <input type="text" id="project_name" name="project_name" value="${fieldValue(bean:this.project,field:'project_name')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="time">创建时间:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:this.project,field:'time','errors')}">
                                    <g:datePicker name="time" value="${this.project?.time}" precision="day" ></g:datePicker>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="language">项目语言:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:this.project,field:'language','errors')}">
                                    <input type="text" id="language" name="language" value="${fieldValue(bean:this.project,field:'language')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="project_id">项目编号:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:this.project,field:'project_id','errors')}">
                                    <input type="text" id="project_id" name="project_id" value="${fieldValue(bean:this.project,field:'project_id')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">创建人:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:this.project,field:'user','errors')}">
                                    <g:select optionKey="id" from="${software_understanding.User.list()}" name="user.id" value="${this.project?.user?.id}" ></g:select>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="创建" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
