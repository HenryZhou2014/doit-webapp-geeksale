<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="accessLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='accessLogDetail.heading'/>"/>
</head>

<form:form commandName="accessLog" method="post" action="accessLogform" id="accessLogForm" onsubmit="return validateAccessLog(this)">
<form:errors path="*" cssClass="error" element="div"/>
<ul>
    <li>
        <appfuse:label styleClass="desc" key="accessLog.pid"/>
        <form:errors path="pid" cssClass="fieldError"/>
        <form:input path="pid" id="pid" cssClass="text medium"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="accessLog.accessDate"/>
        <form:errors path="accessDate" cssClass="fieldError"/>
        <form:input path="accessDate" id="accessDate" cssClass="text medium" cssErrorClass="text medium error" maxlength="7"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="accessLog.accessUrl"/>
        <form:errors path="accessUrl" cssClass="fieldError"/>
        <form:input path="accessUrl" id="accessUrl" cssClass="text medium" cssErrorClass="text medium error" maxlength="1024"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="accessLog.clientInfo"/>
        <form:errors path="clientInfo" cssClass="fieldError"/>
        <form:input path="clientInfo" id="clientInfo" cssClass="text medium" cssErrorClass="text medium error" maxlength="512"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="accessLog.fromIp"/>
        <form:errors path="fromIp" cssClass="fieldError"/>
        <form:input path="fromIp" id="fromIp" cssClass="text medium" cssErrorClass="text medium error" maxlength="64"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="accessLog.sessionId"/>
        <form:errors path="sessionId" cssClass="fieldError"/>
        <form:input path="sessionId" id="sessionId" cssClass="text medium" cssErrorClass="text medium error" maxlength="128"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="accessLog.userInfo"/>
        <form:errors path="userInfo" cssClass="fieldError"/>
        <form:input path="userInfo" id="userInfo" cssClass="text medium" cssErrorClass="text medium error" maxlength="256"/>
    </li>

    <li class="buttonBar bottom">
        <input type="submit" class="button" name="save" value="<fmt:message key="button.save"/>"/>
        <c:if test="${not empty accessLog.pid}">
        <input type="submit" class="button" name="delete" onclick="bCancel=true;return confirmDelete('accessLog')"
            value="<fmt:message key="button.delete"/>" />
        </c:if>
        <input type="submit" class="button" name="cancel" value="<fmt:message key="button.cancel"/>" onclick="bCancel=true"/>
    </li>
</ul>
</form:form>

<v:javascript formName="accessLog" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>

<script type="text/javascript">
    Form.focusFirstElement($('accessLogForm'));
</script>
