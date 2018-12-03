<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="companyInfo.photoShops"/></title>
    <meta name="heading" content="<fmt:message key='namedTextModuleList.heading'/>"/>
    <meta name="menu" content="companyInfo"/>
</head>

<form:form commandName="companyInfo" method="post" action="companyInfo" id="companyInfoForm">

<div class="container">
    <div class="toolbar">
        <a href="javascript:void(0);" class="easyui-linkbutton" id="toolbar_new" data-options="plain:true,iconCls:'icon-add'">增加</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" id="toolbar_delete" data-options="plain:true,iconCls:'icon-remove'">删除</a>
        |
        <a href="javascript:void(0);" class="easyui-linkbutton" id="toolbar_select_all">全选</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" id="toolbar_select_reverse">反选</a>

        <div class="fr">
            <a href="javascript:void(0);" class="easyui-linkbutton" id="toolbar_reload"  data-options="plain:true,iconCls:'icon-reload'">刷新</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" id="toolbar_close"  data-options="plain:true,iconCls:'icon-close'">关闭</a>
        </div>
    </div>

    <div style="margin: 15px;">

        <display:table name="photoShopList" class="table" requestURI="" id="rowItem" export="false" pagesize="25">
            <display:column style="width:20px;">
                <input type="checkbox" name="chkSelect" value="${rowItem.id}"/>
            </display:column>
            <display:column title="#" class="rowNum">
                ${rowItem_rowNum}
            </display:column>
            <display:column property="name" style="width:180px;" sortable="true" title="快照点名称"/>

            <display:column property="account.accountName" style="width:180px;" sortable="true"
                             title="会员账号"/>
            <display:column property="account.newIndex" style="width:100px;" sortable="true"
                            title="会员编号"/>
            <display:column style="width:60px;">
                <a href="javascript:void(0);"
                   onclick="javascript:openNewPage('${rowItem.name}内容管理','${ctx}/backend/website/companyInfoform?id=${rowItem.id}');">修改</a>
            </display:column>

            <display:setProperty name="paging.banner.item_name"><fmt:message key="namedTextModuleList.namedTextModule"/></display:setProperty>
            <display:setProperty name="paging.banner.items_name"><fmt:message
                    key="namedTextModuleList.namedTextModules"/></display:setProperty>

            <display:setProperty name="export.excel.filename"><fmt:message
                    key="namedTextModuleList.title"/>.xls</display:setProperty>
            <display:setProperty name="export.csv.filename"><fmt:message
                    key="namedTextModuleList.title"/>.csv</display:setProperty>
            <display:setProperty name="export.pdf.filename"><fmt:message
                    key="namedTextModuleList.title"/>.pdf</display:setProperty>
        </display:table>
        <div class="hidden">
            <input type="submit" name="action" id="button_delete_items" value="deleteItems"/>
            <input type="submit" name="action" id="button_delete_item" value="deleteItem"/>
            <input type="hidden" name="targetItemId" id="targetItemId"/>
        </div>
    </div>
</div>
</form:form>
<script type="text/javascript">
    $(document).ready(function () {
        // 工具栏按钮事件绑定
        initToolBarActions();

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
            openPage('命名内容块','${ctx}/backend/cms/namedTextModuleform');
        });

        // 删除按钮
        $("#toolbar_delete").bind("click", function(){
            deleteItems();
        });

        // 全选
        $("#toolbar_select_all").bind("click", function(){
            selectItems();
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
        openPage('相册信息','${ctx}/gallerywall/albumInfoform?id=' + itemId);
    }

    function viewItem(){
        openPage('相册信息','${ctx}/gallerywall/albumInfoform?id=' + itemId);
    }

    function selectItems() {
        $("input[name='chkSelect']").each(function (index, item) {
            $(item).attr("checked", true);
        });
    }

    function action_reload(){
        location.href='${ctx}/backend/cms/namedTextModules';
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
</script>
