<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="companyInfoExtDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='companyInfoExtDetail.heading'/>"/>
</head>

<form:form commandName="companyInfoExt" method="post" action="companyInfoExtform" id="companyInfoExtForm" onsubmit="return validateCompanyInfoExt(this)">
<form:errors path="*" cssClass="error" element="div"/>
<form:hidden path="id"/>
<ul>
    <li>
        <appfuse:label styleClass="desc" key="companyInfoExt.aliasName"/>
        <form:errors path="aliasName" cssClass="fieldError"/>
        <form:input path="aliasName" id="aliasName" cssClass="text medium" cssErrorClass="text medium error" maxlength="80"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="companyInfoExt.companyId"/>
        <form:errors path="companyId" cssClass="fieldError"/>
        <form:input path="companyId" id="companyId" cssClass="text medium" cssErrorClass="text medium error" maxlength="255"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="companyInfoExt.createBy"/>
        <form:errors path="createBy" cssClass="fieldError"/>
        <form:input path="createBy" id="createBy" cssClass="text medium" cssErrorClass="text medium error" maxlength="50"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="companyInfoExt.createDate"/>
        <form:errors path="createDate" cssClass="fieldError"/>
        <form:input path="createDate" id="createDate" cssClass="text medium" cssErrorClass="text medium error" maxlength="7"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="companyInfoExt.extContent"/>
        <form:errors path="extContent" cssClass="fieldError"/>
        <form:input path="extContent" id="extContent" cssClass="text medium" cssErrorClass="text medium error" maxlength="255"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="companyInfoExt.extType"/>
        <form:errors path="extType" cssClass="fieldError"/>
        <form:input path="extType" id="extType" cssClass="text medium" cssErrorClass="text medium error" maxlength="80"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="companyInfoExt.title"/>
        <form:errors path="title" cssClass="fieldError"/>
        <form:input path="title" id="title" cssClass="text medium" cssErrorClass="text medium error" maxlength="150"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="companyInfoExt.updateBy"/>
        <form:errors path="updateBy" cssClass="fieldError"/>
        <form:input path="updateBy" id="updateBy" cssClass="text medium" cssErrorClass="text medium error" maxlength="50"/>
    </li>
    <li>
        <appfuse:label styleClass="desc" key="companyInfoExt.updateDate"/>
        <form:errors path="updateDate" cssClass="fieldError"/>
        <form:input path="updateDate" id="updateDate" cssClass="text medium" cssErrorClass="text medium error" maxlength="7"/>
    </li>

    <li class="buttonBar bottom">
        <input type="submit" class="button" name="save" value="<fmt:message key="button.save"/>"/>
        <c:if test="${not empty companyInfoExt.id}">
        <input type="submit" class="button" name="delete" onclick="bCancel=true;return confirmDelete('companyInfoExt')"
            value="<fmt:message key="button.delete"/>" />
        </c:if>
        <input type="submit" class="button" name="cancel" value="<fmt:message key="button.cancel"/>" onclick="bCancel=true"/>
    </li>
</ul>
</form:form>

<v:javascript formName="companyInfoExt" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>

<script type="text/javascript">
    Form.focusFirstElement($('companyInfoExtForm'));
</script>
