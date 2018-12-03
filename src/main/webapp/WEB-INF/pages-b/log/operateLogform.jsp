<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="operateLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='operateLogDetail.heading'/>"/>
</head>

<form:form commandName="operateLog" method="post" action="operateLogform" id="operateLogForm" onsubmit="return validateOperateLog(this)">
<form:errors path="*" cssClass="error" element="div"/>
<ul>
    <li>
        <appfuse:label styleClass="desc" key="operateLog.pid"/>
        <form:errors path="pid" cssClass="fieldError"/>
        <form:input path="pid" id="pid" cssClass="text medium"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="operateLog.dataAfter"/>
        <form:errors path="dataAfter" cssClass="fieldError"/>
        <form:input path="dataAfter" id="dataAfter" cssClass="text medium" cssErrorClass="text medium error" maxlength="1024"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="operateLog.dataBefore"/>
        <form:errors path="dataBefore" cssClass="fieldError"/>
        <form:input path="dataBefore" id="dataBefore" cssClass="text medium" cssErrorClass="text medium error" maxlength="1024"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="operateLog.dataType"/>
        <form:errors path="dataType" cssClass="fieldError"/>
        <form:input path="dataType" id="dataType" cssClass="text medium" cssErrorClass="text medium error" maxlength="32"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="operateLog.fromIp"/>
        <form:errors path="fromIp" cssClass="fieldError"/>
        <form:input path="fromIp" id="fromIp" cssClass="text medium" cssErrorClass="text medium error" maxlength="64"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="operateLog.operateDate"/>
        <form:errors path="operateDate" cssClass="fieldError"/>
        <form:input path="operateDate" id="operateDate" cssClass="text medium" cssErrorClass="text medium error" maxlength="7"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="operateLog.userInfo"/>
        <form:errors path="userInfo" cssClass="fieldError"/>
        <form:input path="userInfo" id="userInfo" cssClass="text medium" cssErrorClass="text medium error" maxlength="256"/>
    </li>

    <li class="buttonBar bottom">
        <input type="submit" class="button" name="save" value="<fmt:message key="button.save"/>"/>
        <c:if test="${not empty operateLog.pid}">
        <input type="submit" class="button" name="delete" onclick="bCancel=true;return confirmDelete('operateLog')"
            value="<fmt:message key="button.delete"/>" />
        </c:if>
        <input type="submit" class="button" name="cancel" value="<fmt:message key="button.cancel"/>" onclick="bCancel=true"/>
    </li>
</ul>
</form:form>

<v:javascript formName="operateLog" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>

<script type="text/javascript">
    Form.focusFirstElement($('operateLogForm'));
</script>
