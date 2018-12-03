<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="articleList.title"/></title>
    <meta name="heading" content="<fmt:message key='articleList.heading'/>"/>
    <meta name="menu" content="ArticleMenu"/>
</head>
<div class="container">
    <div class="toolbar">
        <a href="javascript:void(0);" class="easyui-linkbutton" onclick="javascript:location.href='${ctx}/cms/articles';"
           data-options="plain:true,iconCls:'icon-reload'">刷新</a>
        <a href="javascript:void(0);" class="easyui-linkbutton"
           onclick="javascript:openPage('文章详细','${ctx}/cms/articleform');"
           data-options="plain:true,iconCls:'icon-add'">增加</a>
        <a href="javascript:void(0);" class="easyui-linkbutton"
           onclick="javascript:doDelete();"
           data-options="plain:true,iconCls:'icon-remove'">删除</a>
        |
        <a href="javascript:void(0);" class="easyui-linkbutton"
           onclick="javascript:doPublish(true);"
           data-options="plain:true,iconCls:'icon-ok'">发布</a>
        <a href="javascript:void(0);" class="easyui-linkbutton"
           onclick="javascript:doPublish(false);"
           data-options="plain:true,iconCls:'icon-undo'">取消发布</a>
        |
        <a href="javascript:void(0);" class="easyui-linkbutton"
           onclick="javascript:selectAll(true);"
           data-options="plain:true,iconCls:'icon-checkAll'">全选</a>
        <a href="javascript:void(0);" class="easyui-linkbutton"
           onclick="javascript:selectAll(false);"
           data-options="plain:true,iconCls:'icon-checkNone'">全不选</a>
    </div>
    <form:form commandName="articleQueryParameter" method="post" action="articles" id="form1">

        <div id="accordion">
            <table style="margin: 10px auto;">
                <tr>
                    <td>
                        <label class="title">分类</label>
                    </td>
                    <td>
                        <form:select path="categoryId" cssClass="text medium">
                            <form:option value="">请选择</form:option>
                            <form:options items="${articleCategoryList}" itemLabel="label" itemValue="value"/>
                        </form:select>
                    </td>
                    <td><label class="title">标题</label></td>
                    <td>
                        <form:input path="title" id="title" maxlength="16" cssClass="text medium"/>
                    </td>
                    <td>
                        <label class="title">发布状态</label>
                    </td>
                    <td>
                        <form:radiobuttons path="publishFlag" items="${publishFlagList}" itemLabel="label"
                                           itemValue="value"/>
                    </td>
                    <td>
                        <input type="submit" value="查询"/>
                        <input type="button" value="清除" onclick="javascript:clearForm(this.form);"/>
                    </td>
                </tr>
            </table>
        </div>

        <div style="margin: 15px;">
            <display:table name="articleList" class="table" requestURI="" id="rowItem" export="false" pagesize="25">
                <display:column style="width:20px;">
                    <input type="checkbox" name="chkSelect" value="${rowItem.id}"/>
                </display:column>
                <display:column title="#"
                                style="width:20px;">${articleList.objectsPerPage * (articleList.pageNum-1) + rowItem_rowNum}</display:column>
                <display:column property="articleCategory.title" sortable="true" sortProperty="articleCategory.title"
                                titleKey="article.categoryId"/>
                <display:column sortable="true" sortProperty="title" titleKey="article.title">
                    <div>${rowItem.title}</div>
                </display:column>
                <c:if test="${isEnglishLanguageSupported}">
                    <display:column property="titleEn" sortable="true" titleKey="article.titleEn"/>
                </c:if>
                <display:column property="aliasName" sortable="true" titleKey="article.aliasName"/>
                <display:column property="author" sortable="true" titleKey="article.author"/>
                <display:column property="refSource" sortable="true" titleKey="article.refSource"/>
                <display:column property="tag" sortable="true" titleKey="article.tag"/>
                <display:column property="publishDate" sortable="true" titleKey="article.publishDate"/>
                <display:column sortable="true" sortProperty="publishFlag" titleKey="article.publishFlag">
                    <c:choose>
                        <c:when test="${rowItem.publishFlag == 'Y'}">
                            <a href="javascript:void(0);"><span class="publishStatus"></span></a>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:void(0);"><span class="unpublishStatus"></span></a>
                        </c:otherwise>
                    </c:choose>
                </display:column>
                <display:column property="hits" sortable="true" titleKey="article.hits"/>
                <%--<display:column property="status" sortable="true" titleKey="article.status"/>--%>
                <display:column>
                    <a href="javascript:void(0);"
                       onclick="javascript:openPage('文章详细','<c:url value="/cms/articleform"/>?id=${rowItem.id}');"
                            >修改</a>
                </display:column>
                <display:setProperty name="paging.banner.item_name"><fmt:message
                        key="articleList.article"/></display:setProperty>
                <display:setProperty name="paging.banner.items_name"><fmt:message
                        key="articleList.articles"/></display:setProperty>

                <display:setProperty name="export.excel.filename"><fmt:message
                        key="articleList.title"/>.xls</display:setProperty>
                <display:setProperty name="export.csv.filename"><fmt:message
                        key="articleList.title"/>.csv</display:setProperty>
                <display:setProperty name="export.pdf.filename"><fmt:message
                        key="articleList.title"/>.pdf</display:setProperty>
            </display:table>
        </div>

        <div class="hidden">
            <input type="submit" name="action" value="DELETE" id="deleteButton"/>
            <input type="submit" name="action" value="PUBLISH" id="publishButton"/>
            <input type="submit" name="action" value="UNPUBLISH" id="unpublishButton"/>
        </div>

    </form:form>
</div>
<script type="text/javascript">
//    highlightTableRows("articleList");
    $(document).ready(function () {
        $(".toolbar").pin({
            containerSelector: ".container"
        });
    });

    function doDelete() {
        var selectedNum = $("input[name='chkSelect']:checked").length;
        if (selectedNum == 0) {
            $.messager.alert("信息", "请选择要删除的文章！", 'warning');
            return;
        }

        $.messager.confirm('确认', '确认删除所选的文章?', function (r) {
            if (r) {
                $("#deleteButton").click();
            }
        });
    }

    function doPublish(publishAction) {
        var selectedNum = $("input[name='chkSelect']:checked").length;
        if (selectedNum == 0) {
            $.messager.alert("信息", "请选择文章！", 'warning');
            return;
        }

        if (publishAction == true) {
            $("#publishButton").click();
        }
        else {
            $("#unpublishButton").click();
        }
    }

    function selectAll(select) {
        $("input[name='chkSelect']").attr("checked", select);
    }

</script> 
