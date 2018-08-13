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
                <fieldset class="form">
                    <f:all bean="analysis"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="创建" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
