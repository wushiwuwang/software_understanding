<%@ page import="software_understanding.Project" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'analysis.label', default: 'Analysis')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-analysis" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">首页</a></li>
                <li><g:link class="list" action="index">分析列表</g:link></li>
            </ul>
        </div>
        <div id="create-analysis" class="content scaffold-create" role="main">
            <h1>创建分析信息</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.analysis}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.analysis}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.analysis}" method="POST">
                <div class="dialog">
                    <table>
                        <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="startline">开始行数:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean:this.analysis,field:'startline','errors')}">
                                <input type="text" id="startline" name="startline" value="${fieldValue(bean:this.analysis,field:'startline')}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="endline">结束行数:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean:this.analysis,field:'endline','errors')}">
                                <input type="text" id="endline" name="endline" value="${fieldValue(bean:this.analysis,field:'endline')}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="column">列数:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean:this.analysis,field:'column','errors')}">
                                <input type="text" id="column" name="column" value="${fieldValue(bean:this.analysis,field:'column')}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="group">错误信息或警告信息:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean:this.analysis,field:'group','errors')}">
                                <input type="text" id="group" name="group" value="${fieldValue(bean:this.analysis,field:'group')}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="code">错误代码:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean:this.analysis,field:'code','errors')}">
                                <input type="text" id="code" name="code" value="${fieldValue(bean:this.analysis,field:'code')}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="message">报错信息:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean:this.analysis,field:'message','errors')}">
                                <input type="text" id="message" name="message" value="${fieldValue(bean:this.analysis,field:'message')}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="project">项目名称:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean:this.analysis,field:'project','errors')}">
                                <g:select optionKey="id" from="${ software_understanding.Project.list()}" name="project.project_id" value="${this.analysis?.project?.id}" ></g:select>
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
