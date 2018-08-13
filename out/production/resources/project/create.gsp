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
                <fieldset class="form">
                    <f:all bean="project"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="创建" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
