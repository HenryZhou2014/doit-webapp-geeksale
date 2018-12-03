<%@ page import="com.doit.cms.model.NamedTextModule" %>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="namedTextModuleDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='namedTextModuleDetail.heading'/>"/>

    <script src="${ctx}/scripts/ueditor1.4/ueditor.config.js"></script>
    <script src="${ctx}/scripts/ueditor1.4/ueditor.all.min.js"></script>
</head>
<form:form commandName="photoShop" method="post" action="companyInfoform" id="companyInfoform" onsubmit="return validateNamedTextModule(this)">
<div class="container">
    <div class="toolbar">
        <a href="javascript:void(0);" class="easyui-linkbutton" onclick="javascript:$('#saveButton').click();"
           data-options="plain:true,iconCls:'icon-save'">保存</a>

        <div class="fr">
            <a href="javascript:void(0);" class="easyui-linkbutton"
               onclick="location.href='companyInfoform?id=${namedTextModule.id}'"
               data-options="plain:true,iconCls:'icon-refresh'">刷新</a>

            <a href="javascript:void(0);" class="easyui-linkbutton"
               onclick="closeFrameworkCurrentTab();"
               data-options="plain:true,iconCls:'icon-close'">关闭</a>
        </div>
        <div class="clear"></div>
        </div>
<div style="margin: 15px 35px;">
    <form:errors path="*" cssClass="error" element="div"/>
        <form:hidden path="id"/>
    <ul>
        <li>
            <appfuse:label styleClass="desc" key="namedTextModule.title"/>
            <form:errors path="name" cssClass="fieldError"/>
            <form:input disabled="true" path="name" id="name" cssClass="text large" cssErrorClass="text medium error" maxlength="80"/>
        </li>
    </ul>
        <div id="tt" class="easyui-tabs">
            <div title="内容"  style="padding:5px;">
                <div>
                    <SCRIPT id="moduleContent" type="text/plain" name="companyInfo"><% out.print(request.getAttribute("moduleContent"));%></SCRIPT>
                </div>
            </div>
        </div>

        <div class="hidden">
            <input type="submit" name="NEW" id="newButton"/>
            <input type="submit" name="SAVE" id="saveButton"/>
        </div>
</div>
</div>
</form:form>

<v:javascript formName="photoShop" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>

<script type="text/javascript">
    //    Form.focusFirstElement($('sellOfferForm'));

    $(document).ready(function () {

        var options = {
            minFrameHeight:300,
            autoClearinitialContent:false,
            initialContent:''
        };

        var editor = new UE.ui.Editor(options);
        editor.render("moduleContent");
        <c:if test="${isEnglishLanguageSupported}">
        var editor2 = new UE.ui.Editor(options);
        editor2.render("moduleContentEn");
        </c:if>

        $(".toolbar").pin({
            containerSelector: ".container"
        });
    });
</script>
