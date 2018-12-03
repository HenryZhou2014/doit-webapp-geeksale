<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="parameterDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='parameterDetail.heading'/>"/>
    <meta name="menu" content="SystemAdminMenu"/>
</head>
<form:form commandName="parameter" method="post" action="parameterform" id="parameterForm"
           onsubmit="return validateParameter(this)">
    <form:errors path="*" cssClass="error" element="div"/>
    <div class="container">
        <div class="margin-10">

            <div class="formWrapper">
                <div class="titleWrapper margin-bottom-10">
                <span class="titleTab">
                    参数基本信息
                </span>
                </div>
                <div>
                    <ul>
                        <li>
                            <appfuse:label styleClass="desc" key="parameter.parameterCode"/>
                            <form:errors path="parameterCode" cssClass="fieldError"/>
                            <form:input path="parameterCode" id="parameterCode" cssClass="text medium"
                                        cssErrorClass="text medium error" maxlength="64"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="parameter.parameterName"/>
                            <form:errors path="parameterName" cssClass="fieldError"/>
                            <form:input path="parameterName" id="parameterName" cssClass="text medium"
                                        cssErrorClass="text medium error" maxlength="64"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="parameter.dataType"/>
                            <form:errors path="dataType" cssClass="fieldError"/>
                            <form:radiobuttons path="dataType" items="${dataTypeList}" itemLabel="label"
                                               itemValue="value"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="parameter.dataOption"/>
                            <form:errors path="dataOption" cssClass="fieldError"/>
                            <form:input path="dataOption" id="dataOption" cssClass="text large"
                                        cssErrorClass="text medium error" maxlength="128"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="parameter.defaultValue"/>
                            <form:errors path="defaultValue" cssClass="fieldError"/>
                            <form:input path="defaultValue" id="defaultValue" cssClass="text large"
                                        cssErrorClass="text medium error" maxlength="128"/>
                        </li>
                        <li>
                            <form:checkbox path="isRequired" value="1" label="必填"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="parameter.parameterDesc"/>
                            <form:errors path="parameterDesc" cssClass="fieldError"/>
                            <form:input path="parameterDesc" id="parameterDesc" cssClass="text large"
                                        cssErrorClass="text medium error" maxlength="256"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="parameter.sortNo"/>
                            <form:errors path="sortNo" cssClass="fieldError"/>
                            <form:input path="sortNo" id="sortNo" cssClass="text small" cssErrorClass="text small error"
                                        maxlength="255"/>
                        </li>

                    </ul>
                    <div>
                        <form:hidden path="id"/>
                        <form:hidden path="parameterValue"/>
                        <form:hidden path="groupId"/>
                        <form:hidden path="memo"/>

                    </div>

                </div>
            </div>

            <div class="text-center margin-top-10">
                <input type="submit" class="button" name="save" value="<fmt:message key="button.save"/>"/>
                <input type="button" class="button" name="cancel" value="<fmt:message key="button.close"/>"
                       onclick="closeCurrentTab();"/>
            </div>
        </div>

    </div>
</form:form>

<v:javascript formName="parameter" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>

<script type="text/javascript">
    Form.focusFirstElement($('parameterForm'));
</script>
