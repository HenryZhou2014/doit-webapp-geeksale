<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="userLoginLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='userLoginLogDetail.heading'/>"/>
</head>

<div class="page_container">
    <div class="page_toolbar">
        <a id="toolbar_save" href="javascript:void(0);" class="easyui-linkbutton"  data-options="plain:true,iconCls:'icon-save'">保存</a>
        <a id="toolbar_new" href="javascript:void(0);" class="easyui-linkbutton"  data-options="plain:true,iconCls:'icon-add'">增加</a>

        <div class="fr" style="margin-right: 30px;">
            <a id="toolbar_reload" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-refresh'">刷新</a>
            <a id="toolbar_close" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-close'">关闭</a>
        </div>
        <div class="clear"></div>
    </div>

    <div class="formWrapper" style="width: 800px; margin: 15px auto 5px auto;">
        <div class="titleWrapper">
                <span class="titleTab">
                    UserLoginLog
                </span>
        </div>
        <div>
            <form:form commandName="userLoginLog" method="post" action="userLoginLogform" id="userLoginLogForm"
                       onsubmit="return validateUserLoginLog(this)">
                <form:errors path="*" cssClass="error" element="div"/>
                <form:hidden path="id"/>

                <div style="padding: 20px; background: #efefef; margin: 15px auto; border: 1px solid #d4d4d4; box-shadow: 0 3px 3px #E6E6E6;">
                    <ul>
                        <li>
                            <appfuse:label styleClass="desc" key="userLoginLog.id"/>
                            <form:errors path="id" cssClass="fieldError"/>
                            <form:input path="id" id="id" cssClass="text large" cssErrorClass="text medium error"
                                        maxlength="20"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="userLoginLog.accountId"/>
                            <form:errors path="accountId" cssClass="fieldError"/>
                            <form:input path="accountId" id="accountId" cssClass="text large" cssErrorClass="text medium error"
                                        maxlength="20"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="userLoginLog.accountInfo"/>
                            <form:errors path="accountInfo" cssClass="fieldError"/>
                            <form:input path="accountInfo" id="accountInfo" cssClass="text large" cssErrorClass="text medium error"
                                        maxlength="256"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="userLoginLog.userType"/>
                            <form:errors path="userType" cssClass="fieldError"/>
                            <form:input path="userType" id="userType" cssClass="text large" cssErrorClass="text medium error"
                                        maxlength="32"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="userLoginLog.fromIp"/>
                            <form:errors path="fromIp" cssClass="fieldError"/>
                            <form:input path="fromIp" id="fromIp" cssClass="text large" cssErrorClass="text medium error"
                                        maxlength="64"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="userLoginLog.clientInfo"/>
                            <form:errors path="clientInfo" cssClass="fieldError"/>
                            <form:input path="clientInfo" id="clientInfo" cssClass="text large" cssErrorClass="text medium error"
                                        maxlength="512"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="userLoginLog.sessionId"/>
                            <form:errors path="sessionId" cssClass="fieldError"/>
                            <form:input path="sessionId" id="sessionId" cssClass="text large" cssErrorClass="text medium error"
                                        maxlength="128"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="userLoginLog.loginChannel"/>
                            <form:errors path="loginChannel" cssClass="fieldError"/>
                            <form:input path="loginChannel" id="loginChannel" cssClass="text large" cssErrorClass="text medium error"
                                        maxlength="32"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="userLoginLog.loginType"/>
                            <form:errors path="loginType" cssClass="fieldError"/>
                            <form:input path="loginType" id="loginType" cssClass="text large" cssErrorClass="text medium error"
                                        maxlength="8"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="userLoginLog.loginDate"/>
                            <form:errors path="loginDate" cssClass="fieldError"/>
                            <form:input path="loginDate" id="loginDate" cssClass="text large" cssErrorClass="text medium error"
                                        maxlength="19"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="userLoginLog.logoutDate"/>
                            <form:errors path="logoutDate" cssClass="fieldError"/>
                            <form:input path="logoutDate" id="logoutDate" cssClass="text large" cssErrorClass="text medium error"
                                        maxlength="19"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="userLoginLog.activeTime"/>
                            <form:errors path="activeTime" cssClass="fieldError"/>
                            <form:input path="activeTime" id="activeTime" cssClass="text large" cssErrorClass="text medium error"
                                        maxlength="12"/>
                        </li>
                    </ul>
                </div>
                <div style="margin: 10px auto;text-align: center;">
                    <input type="submit" class="button" name="action_save" id="action_save" value="<fmt:message key="button.save"/>"/>
                    <input type="submit" class="button" name="action_save_and_new" id="action_save_and_new" value="<fmt:message key="button.saveAndNew"/>"/>
                    <input type="button" class="button" name="cancel" value="<fmt:message key="button.close"/>"
                    onclick="closeFrameworkCurrentTab();"/>
                </div>
            </form:form>
        </div>
    </div>

</div>



<v:javascript formName="userLoginLog" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>

<script type="text/javascript">
    //    Form.focusFirstElement($('accountForm'));
//    $("#academyName").focus();

    $(document).ready(function () {

        // 工具栏按钮事件绑定
        initToolBarActions();

        $(window).resize(function(){
//            $(".page_toolbar").pin();
            $(".page_toolbar").css("width", "100%");
        });

        $(".page_toolbar").pin({
            containerSelector: ".page_container"
        });
    });

    function initToolBarActions(){
        // 保存按钮
        $("#toolbar_save").bind("click", function(){
            $('#action_save').click();
        });

        // 新增按钮
        $("#toolbar_new").bind("click", function(){
            $('#action_save_and_new').click();
        });

        // 刷新按钮
        $("#toolbar_reload").bind("click", function(){
            action_reload();
        });

        // 关闭按钮
        $("#toolbar_close").bind("click", function(){
            closeFrameworkCurrentTab();
        });
    }

    function action_reload(){
        location.href='<c:url value="/app/gallerywall/userLoginLogform?id=${userLoginLog.id}"/>';
    }
</script>
