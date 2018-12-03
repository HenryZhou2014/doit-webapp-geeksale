<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="systemLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='systemLogDetail.heading'/>"/>
</head>

<form:form commandName="systemLog" method="post" action="systemLogform" id="systemLogForm" onsubmit="return validateSystemLog(this)">
<form:errors path="*" cssClass="error" element="div"/>
<ul>
    <li>
        <appfuse:label styleClass="desc" key="systemLog.pid"/>
        <form:errors path="pid" cssClass="fieldError"/>
        <form:input path="pid" id="pid" cssClass="text medium"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="systemLog.log"/>
        <form:errors path="log" cssClass="fieldError"/>
        <form:input path="log" id="log" cssClass="text medium" cssErrorClass="text medium error" maxlength="1024"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="systemLog.logDate"/>
        <form:errors path="logDate" cssClass="fieldError"/>
        <form:input path="logDate" id="logDate" cssClass="text medium" cssErrorClass="text medium error" maxlength="7"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="systemLog.logType"/>
        <form:errors path="logType" cssClass="fieldError"/>
        <form:input path="logType" id="logType" cssClass="text medium" cssErrorClass="text medium error" maxlength="16"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="systemLog.module"/>
        <form:errors path="module" cssClass="fieldError"/>
        <form:input path="module" id="module" cssClass="text medium" cssErrorClass="text medium error" maxlength="128"/>
    </li>

    <li class="buttonBar bottom">
        <input type="submit" class="button" name="save" value="<fmt:message key="button.save"/>"/>
        <c:if test="${not empty systemLog.pid}">
        <input type="submit" class="button" name="delete" onclick="bCancel=true;return confirmDelete('systemLog')"
            value="<fmt:message key="button.delete"/>" />
        </c:if>
        <input type="submit" class="button" name="cancel" value="<fmt:message key="button.cancel"/>" onclick="bCancel=true"/>
    </li>
</ul>
</form:form>

<v:javascript formName="systemLog" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>

<script type="text/javascript">
    Form.focusFirstElement($('systemLogForm'));
</script>
