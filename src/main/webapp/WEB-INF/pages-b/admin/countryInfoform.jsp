<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="departmentDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='departmentDetail.heading'/>"/>
    <meta name="menu" content="SystemAdminMenu"/>
</head>
<div class="navigateDiv">
    <a href="<c:url value='/mainMenu'/>">首页</a>
    &gt;
    <a href="<c:url value='/admin/departments'/>">部门管理</a>
    &gt;
    部门编辑
</div>

<form:form commandName="department" method="post" action="departmentform" id="departmentForm" onsubmit="return validateDepartment(this)">
<form:errors path="*" cssClass="error" element="div"/>
<ul>

    <li>
        <appfuse:label styleClass="desc" key="department.departmentName"/>
        <form:errors path="departmentName" cssClass="fieldError"/>
        <form:input path="departmentName" id="departmentName" cssClass="text medium" cssErrorClass="text medium error" maxlength="128"/>
    </li>

    <li>
        <appfuse:label styleClass="desc" key="department.sortNo"/>
        <form:errors path="sortNo" cssClass="fieldError"/>
        <form:input path="sortNo" id="sortNo" cssClass="text medium" cssErrorClass="text medium error" maxlength="255"/>
    </li>

    <security:authorize ifAnyGranted="ROLE_9102">
    <li>
        <input type="submit" class="button" name="save" value="<fmt:message key="button.save"/>"/>
        <c:if test="${not empty department.id}">
        <input type="submit" class="button" name="delete" onclick="bCancel=true;return confirmDelete('部门')"
            value="<fmt:message key="button.delete"/>" />
        </c:if>
        <input type="submit" class="button" name="cancel" value="<fmt:message key="button.cancel"/>" onclick="bCancel=true"/>
    </li>
    </security:authorize>

</ul>
    <div class="hidden">
        <form:input path="id" id="id" cssClass="text medium"/>
        <form:input path="parentCode" id="parentCode" cssClass="text medium" cssErrorClass="text medium error" maxlength="64"/>
        <form:input path="departmentCode" id="departmentCode" cssClass="text medium" cssErrorClass="text medium error" maxlength="64"/>
        <form:input path="memo" id="memo" cssClass="text medium" cssErrorClass="text medium error" maxlength="250"/>
    </div>
</form:form>

<v:javascript formName="department" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>

<script type="text/javascript">
    Form.focusFirstElement($('departmentForm'));
</script>
