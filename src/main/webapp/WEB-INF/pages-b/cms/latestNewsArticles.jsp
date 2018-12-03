<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="articleList.title"/></title>
    <meta name="heading" content="<fmt:message key='articleList.heading'/>"/>
    <meta name="menu" content="ArticleMenu"/>
</head>
<div class="page_container">
    <div class="page_toolbar">
        <div style="border:1px solid #ddd; background: #eee;">
            <div class="fl">
                <a id="toolbar_new" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">增加</a>
                <a id="toolbar_delete" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'">删除</a>
                |
                <a id="toolbar_publish" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-ok'">发布</a>
                <a id="toolbar_unpublish" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-undo'">取消发布</a>
                |
                <a id="toolbar_select_all" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true">全选</a>
                <a id="toolbar_select_reverse" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true">全不选</a>
            </div>
            <div class="fr">
                <a id="toolbar_reload" href="javascript:void(0);" class="easyui-linkbutton"   data-options="plain:true,iconCls:'icon-reload'">刷新</a>
                <a id="toolbar_close" href="javascript:void(0);" class="easyui-linkbutton"   data-options="plain:true,iconCls:'icon-close'">关闭</a>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <form:form commandName="articleQueryParameter" method="post" action="articles" id="form1">

        <div id="accordion">
            <table style="margin: 10px auto;">
                <tr>
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
                <%--<display:column property="articleCategory.title" sortable="true" sortProperty="articleCategory.title"
                                titleKey="article.categoryId"/>--%>
                <display:column sortable="true" sortProperty="title" titleKey="article.title">
                    <div>${rowItem.title}</div>
                </display:column>
                <c:if test="${isEnglishLanguageSupported}">
                    <display:column property="titleEn" sortable="true" titleKey="article.titleEn"/>
                </c:if>
                <%--<display:column property="aliasName" sortable="true" titleKey="article.aliasName"/>--%>
                <display:column property="author" sortable="true" titleKey="article.author"/>
                <%--<display:column property="refSource" sortable="true" titleKey="article.refSource"/>--%>
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
                    <a href="javascript:void(0);" onclick="openItem(${rowItem.id});" class="icon_table_button_edit"><img src="${ctx}/images/icon/edit-inactive.png"/></a>
                    <a href="javascript:void(0);" onclick="deleteItem(${rowItem.id});" class="icon_table_button_delete"><img src="${ctx}/images/icon/delete-inactive.png"/></a>
                </display:column>
                <display:setProperty name="paging.banner.item_name"><fmt:message
                        key="articleList.article"/></display:setProperty>
                <display:setProperty name="paging.banner.items_name"><fmt:message
                        key="articleList.articles"/></display:setProperty>

            </display:table>
        </div>

        <div class="hidden">
            <input type="submit" name="action" id="button_delete_items" value="deleteItems"/>
            <input type="submit" name="action" id="button_delete_item" value="deleteItem"/>
            <input type="submit" name="action" id="button_publish_items" value="publishItems"/>
            <input type="submit" name="action" id="button_publish_item" value="publishItem"/>
            <input type="submit" name="action" id="button_unpublish_items" value="unpublishItems"/>
            <input type="submit" name="action" id="button_unpublish_item" value="unpublishItem"/>
            <input type="hidden" name="targetItemId" id="targetItemId"/>
        </div>

    </form:form>
</div>
<script type="text/javascript">
//    highlightTableRows("articleList");
    $(document).ready(function () {
        // 工具栏按钮事件绑定
        initToolBarActions();

        // 表格按钮修饰
        decorateTableButtons();

        $(window).resize(function () {
//            $(".page_toolbar").pin();
            $(".page_toolbar").css("width", "100%");
        });

        $(".page_toolbar").pin({
            containerSelector: ".page_container"
        });
    });

    function initToolBarActions(){
        // 新增按钮
        $("#toolbar_new").bind("click", function(){
            openPage('文章','${ctx}/backend/cms/articleform?categoryId=${defaultArticleCategory.id}');
        });

        // 删除按钮
        $("#toolbar_delete").bind("click", function(){
            deleteItems();
        });

        // 发布
        $("#toolbar_publish").bind("click", function(){
            publishItems();
        });

        // 取消发布
        $("#toolbar_unpublish").bind("click", function () {
            unpublishItems();
        });

        // 全选
        $("#toolbar_select_all").bind("click", function(){
            selectAllItems();
        });

        // 反向选择
        $("#toolbar_select_reverse").bind("click", function(){
            reverseSelectItems();
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

    function decorateTableButtons(){

        $(".icon_table_button_edit").bind("mouseover", function(){
            $(".icon_table_button_edit img").prop("src", "${ctx}/images/icon/edit-inactive.png");
            $(this).find("img").prop("src", "${ctx}/images/icon/edit-active.png");
        });

        $(".icon_table_button_edit").bind("mouseout", function(){
            $(this).find("img").prop("src", "${ctx}/images/icon/edit-inactive.png");
        });

        $(".icon_table_button_delete").bind("mouseover", function(){
            $(this).find("img").prop("src", "${ctx}/images/icon/delete-active.png");
        });

        $(".icon_table_button_delete").bind("mouseout", function(){
            $(this).find("img").prop("src", "${ctx}/images/icon/delete-inactive.png");
        });
    }

    function deleteItems(){
        var selectedNum = $("input[name='chkSelect']:checked").length;
        if (selectedNum == 0) {
            $.messager.alert("信息", "请选择要删除的记录！", 'warning');
            return;
        }

        $.messager.confirm('确认', '确认删除所选择的记录！', function (r) {
            if (r) {
                $("#button_delete_items").click();
            }
        });
    }

    function deleteItem(itemId){
        $.messager.confirm('确认', '确认删除该记录！', function (r) {
            if (r) {
                $("#targetItemId").val(itemId);
                $("#button_delete_item").click();
            }
        });
    }

    function openItem(itemId){
        openPage('文章信息','${ctx}/backend/cms/articleform?id=' + itemId);
    }

    function viewItem(){
        openPage('文章信息','${ctx}/backend/cms/articleform?id=' + itemId);
    }

    function selectItems() {
        $("input[name='chkSelect']").each(function (index, item) {
            $(item).attr("checked", true);
        });
    }

    function action_reload(){
        location.href='${ctx}/backend/cms/latestNewsArticles';
    }

    function selectAllItems() {
        $("input[name='chkSelect']").each(function (index, item) {
            $(item).prop("checked", true);
        });
    }

    function reverseSelectItems() {
        $("input[name='chkSelect']").each(function (index, item) {
            var isChecked = ($(item).prop("checked") == true);

            $(item).attr("checked", !isChecked);
        });
    }

    function doDelete() {
        var selectedNum = $("input[name='chkSelect']:checked").length;
        if (selectedNum == 0) {
            $.messager.alert("信息", "请选择要删除的内容！", 'warning');
            return;
        }

        $.messager.confirm('确认', '确认删除所选的内容?', function (r) {
            if (r) {
                $("#deleteButton").click();
            }
        });
    }

    function unpublishItems() {
        var selectedNum = $("input[name='chkSelect']:checked").length;
        if (selectedNum == 0) {
            $.messager.alert("信息", "请选择要取消发布的记录！", 'warning');
            return;
        }

        $.messager.confirm('确认', '确认取消发布所选择的记录！', function (r) {
            if (r) {
                $("#button_unpublish_items").click();
            }
        });
    }

    function publishItems(){
        var selectedNum = $("input[name='chkSelect']:checked").length;
        if (selectedNum == 0) {
            $.messager.alert("信息", "请选择要发布的记录！", 'warning');
            return;
        }

        $.messager.confirm('确认', '确认发布所选择的记录！', function (r) {
            if (r) {
                $("#button_publish_items").click();
            }
        });
    }

    function publishItem(itemId){
        $.messager.confirm('确认', '确认发布该记录！', function (r) {
            if (r) {
                $("#targetItemId").val(itemId);
                $("#button_publish_item").click();
            }
        });
    }

</script> 
