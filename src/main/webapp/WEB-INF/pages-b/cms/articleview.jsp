<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="articleDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='articleDetail.heading'/>"/>
    <script src="${ctx}/scripts/ueditor1.4/ueditor.config.js"></script>
    <script src="${ctx}/scripts/ueditor1.4/ueditor.all.min.js"></script>
</head>

<form:form commandName="article" method="post" action="articleform" id="articleForm" onsubmit="return validateArticle(this)">
<form:errors path="*" cssClass="error" element="div"/>
<form:hidden path="id"/>
<form:hidden path="createBy"/>
<form:hidden path="createDate"/>
<form:hidden path="updateBy"/>
<form:hidden path="updateDate"/>
<form:hidden path="hits"/>
    <div style="margin: 15px auto;">
        <table style="margin: 0px auto;border: 1px solid #d4d4d4; box-shadow: 0 3px 3px #E6E6E6;">
            <tr>
                <td valign="top">
                    <ul>
                        <li>
                            <appfuse:label styleClass="desc" key="article.title"/>
                            <form:errors path="title" cssClass="fieldError"/>
                            <form:input path="title" id="title" cssClass="text large" cssErrorClass="text medium error" maxlength="200"/>
                        </li>
                        <li class="fl">
                            <appfuse:label styleClass="desc" key="article.sectionId"/>
                            <form:errors path="sectionId" cssClass="fieldError"/>
                            <form:input path="sectionId" id="sectionId" cssClass="text medium" cssErrorClass="text medium error" maxlength="255"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="article.categoryId"/>
                            <form:errors path="categoryId" cssClass="fieldError"/>
                            <form:input path="categoryId" id="categoryId" cssClass="text medium" cssErrorClass="text medium error" maxlength="255"/>
                        </li>
                        <li class="fl">
                            <appfuse:label styleClass="desc" key="article.tag"/>
                            <form:errors path="tag" cssClass="fieldError"/>
                            <form:input path="tag" id="tag" cssClass="text medium" cssErrorClass="text medium error" maxlength="64"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="article.refSource"/>
                            <form:errors path="refSource" cssClass="fieldError"/>
                            <form:input path="refSource" id="refSource" cssClass="text medium" cssErrorClass="text medium error" maxlength="64"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="article.author"/>
                            <form:errors path="author" cssClass="fieldError"/>
                            <form:input path="author" id="author" cssClass="text medium" cssErrorClass="text medium error" maxlength="32"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="article.introText"/>
                            <form:errors path="introText" cssClass="fieldError"/>
                            <form:input path="introText" id="introText" cssClass="text large" cssErrorClass="text medium error" maxlength="40000"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="article.images"/>
                            <form:errors path="images" cssClass="fieldError"/>
                            <form:input path="images" id="images" cssClass="text large" cssErrorClass="text medium error" maxlength="2024"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="article.fullText"/>
                            <form:errors path="fullText" cssClass="fieldError"/>
                            <SCRIPT id="fullText" type="text/plain" name="fullText"><%if (request.getAttribute("fullText") != null){out.print(request.getAttribute("fullText"));}%></SCRIPT>
                        </li>
                    </ul>
                </td>
                <td valign="top">
                    <ul>
                        <li>
                            <appfuse:label styleClass="desc" key="article.attributes"/>
                            <form:errors path="attributes" cssClass="fieldError"/>
                            <form:input path="attributes" id="attributes" cssClass="text medium" cssErrorClass="text medium error" maxlength="1024"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="article.metaData"/>
                            <form:errors path="metaData" cssClass="fieldError"/>
                            <form:input path="metaData" id="metaData" cssClass="text medium" cssErrorClass="text medium error" maxlength="1024"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="article.metaDesc"/>
                            <form:errors path="metaDesc" cssClass="fieldError"/>
                            <form:input path="metaDesc" id="metaDesc" cssClass="text medium" cssErrorClass="text medium error" maxlength="1024"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="article.metaKey"/>
                            <form:errors path="metaKey" cssClass="fieldError"/>
                            <form:input path="metaKey" id="metaKey" cssClass="text medium" cssErrorClass="text medium error" maxlength="1024"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="article.publishDate"/>
                            <form:errors path="publishDate" cssClass="fieldError"/>
                            <form:input path="publishDate" id="publishDate" cssClass="text medium" cssErrorClass="text medium error" maxlength="20"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="article.unpublishDate"/>
                            <form:errors path="unpublishDate" cssClass="fieldError"/>
                            <form:input path="unpublishDate" id="unpublishDate" cssClass="text medium" cssErrorClass="text medium error" maxlength="20"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="article.publishBy"/>
                            <form:errors path="publishBy" cssClass="fieldError"/>
                            <form:input path="publishBy" id="publishBy" cssClass="text medium" cssErrorClass="text medium error" maxlength="32"/>
                        </li>
                        <li>
                            <appfuse:label styleClass="desc" key="article.status"/>
                            <form:errors path="status" cssClass="fieldError"/>
                            <form:input path="status" id="status" cssClass="text medium" cssErrorClass="text medium error" maxlength="8"/>
                        </li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>

    <div style="margin: 10px auto;text-align: center;">
        <input type="submit" class="button" name="save" value="<fmt:message key="button.save"/>"/>
        <input type="button" class="button" name="save" value="<fmt:message key="button.saveAndNew"/>"
               onclick="$('#newButton').click();"/>
        <c:if test="${not empty article.id}">
        <input type="button" class="button" name="copy" value="<fmt:message key="button.copy"/>"
               onclick="$('#copyButton').click();"/>
        </c:if>
        <input type="button" class="button" name="cancel" value="<fmt:message key="button.close"/>"
               onclick="closeCurrentTab();"/>
    </div>
    <div class="hidden">
        <input type="submit" class="button" name="action" value="NEW" id="newButton"/>
        <input type="submit" class="button" name="action" value="COPY" id="copyButton"/>
    </div>
</form:form>

<v:javascript formName="article" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>

<script type="text/javascript">
//    Form.focusFirstElement($('articleForm'));
    $(document).ready(function () {
        var options = {
            minFrameHeight:300,
            autoClearinitialContent:false,
            initialContent:''
        };

        var editor = new UE.ui.Editor(options);
        editor.render("fullText");
//        editor.setContent("搜索树");
    });
</script>
