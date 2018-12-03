<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="accountList.title"/></title>
    <meta name="heading" content="<fmt:message key='accountList.heading'/>"/>
    <meta name="menu" content="AccountMenu"/>
</head>

<div class="page_container">

<form:form commandName="accountQueryParameter" method="post" action="joinAccounts" id="form1">

    <div class="page_toolbar">
        <div style="border:1px solid #ddd; background: #eee;">
            <div class="fl">
                <a id="toolbar_new" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">增加</a>
                <a id="toolbar_delete" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'">删除</a>
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

    <spring:bind path="accountQueryParameter">
    <div id="accordion">
        <table style="margin: 10px auto;">
            <tr>
                <td><label class="title">代理</label></td>
                <td>
                    <form:select path="agentId" cssClass="text select medium">
                        <form:option value=""></form:option>
                        <form:options items="${agentAccounts}" itemValue="id" itemLabel="accountName"/>
                    </form:select>
                </td>
                <td><label class="title">账户</label></td>
                <td>
                    <form:input path="accountName" id="accountName" maxlength="16" cssClass="text medium"/>
                </td>
                <td><label class="title">姓名</label></td>
                <td>
                    <form:input path="username" id="username" cssClass="text medium" maxlength="16"/>
                </td>
                <td>
                    <input type="submit" value="查询"/>
                    <input type="button" value="清除" onclick="javascript:clearForm(this.form);"/>
                </td>
            </tr>
        </table>
    </div>
    </spring:bind>

    <div style="margin: 15px;">
    <display:table name="accountList" class="table" requestURI="" id="rowItem" export="false" pagesize="25">
        <display:column style="width:20px;">
            <input type="checkbox" name="chkSelect" value="${rowItem.id}"/>
        </display:column>
        <display:column title="序号" style="width:30px;">${accountList.objectsPerPage * (accountList.pageNum-1) + rowItem_rowNum}</display:column>
        <display:column property="newIndex" sortable="true" titleKey="account.newIndex"></display:column>
        <display:column property="accountName" sortable="true" titleKey="account.accountName"/>
        <display:column property="userName" sortable="true" titleKey="account.userName"/>
        <display:column property="parentAccount.accountName" sortable="true" title="代理商"/>
        <display:column sortable="false" titleKey="account.gender" style="width:40px;">
            <c:if test="${rowItem.gender == 'M'}">男</c:if>
            <c:if test="${rowItem.gender == 'F'}">女</c:if>
        </display:column>
        <display:column property="mobileNumber" sortable="false" titleKey="account.mobileNumber"/>

        <%--<display:column property="faxNumber" sortable="true" titleKey="account.faxNumber"/>--%>
        <display:column property="province" sortable="false" titleKey="account.province"/>
        <display:column property="cityName" sortable="false" titleKey="account.cityName"/>
        <display:column titleKey="account.registerDate" style="width:80px;">
            <fmt:formatDate  value="${rowItem.registerDate}" type="date" pattern="yyyy/MM/dd"/>
        </display:column>

        <display:column sortable="true" titleKey="account.accountState" sortProperty="t.accountState" style="width:50px;">
            <c:if test="${rowItem.accountEnabled == true}">
                <c:if test="${rowItem.accountState == '1'}"><span style="color:red">待激活</span></c:if>
                <c:if test="${rowItem.accountState == '2'}"><span style="color:darkgoldenrod">审核中</span></c:if>
                <c:if test="${rowItem.accountState == '3'}"><span style="color:lightseagreen">已激活</span></c:if>
            </c:if>
            <c:if test="${rowItem.accountEnabled == false}">
                <span style="color:red">已冻结</span>
            </c:if>
        </display:column>

        <display:column property="memo" sortable="false" titleKey="account.memo"/>
        <%--<display:column property="accountExpired" sortable="true" titleKey="account.accountExpired"/>--%>
        <%--<display:column property="credentialExpired" sortable="true" titleKey="account.credentialExpired"/>--%>
        <%--<display:column property="deleteFlag" sortable="true" titleKey="account.deleteFlag"/>--%>
        <%--<display:column property="createBy" sortable="true" titleKey="account.createBy"/>--%>
        <%--<display:column property="createDate" sortable="true" titleKey="account.createDate"/>--%>
        <%--<display:column property="updateBy" sortable="true" titleKey="account.updateBy"/>--%>
        <%--<display:column property="updateDate" sortable="true" titleKey="account.updateDate"/>--%>
        <display:column style="width:75px;">
            <a href="javascript:void(0);" onclick="viewItem(${rowItem.id});" class="icon_table_button_view"><img src="${ctx}/images/icon/detail-inactive.png"/></a>
            <a href="javascript:void(0);" onclick="openItem(${rowItem.id});" class="icon_table_button_edit"><img src="${ctx}/images/icon/edit-inactive.png"/></a>
            <a href="javascript:void(0);" onclick="deleteItem(${rowItem.id});" class="icon_table_button_delete"><img src="${ctx}/images/icon/delete-inactive.png"/></a>
        </display:column>

        <display:setProperty name="paging.banner.item_name"><fmt:message key="accountList.account"/></display:setProperty>
        <display:setProperty name="paging.banner.items_name"><fmt:message key="accountList.accounts"/></display:setProperty>

    </display:table>
    </div>
    <div class="hidden">
        <input type="hidden" name="newPassword" id="hidden_password"/>
        <input type="submit" name="action" id="button_delete" value="delete"/>
        <input type="submit" name="action" id="button_enable" value="enable"/>
        <input type="submit" name="action" id="button_disable" value="disable"/>
        <input type="submit" name="action" id="button_reset" value="password"/>

        <input type="submit" name="action" id="button_delete_items" value="deleteItems"/>
        <input type="submit" name="action" id="button_delete_item" value="deleteItem"/>
        <input type="hidden" name="targetItemId" id="targetItemId"/>
    </div>
</form:form>

</div>
<script type="text/javascript">
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
            openPage('新增会员','${ctx}/backend/account/joinAccountform?action=create');
        });

        // 删除按钮
        $("#toolbar_delete").bind("click", function(){
            deleteItems();
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
        $(".icon_table_button_view").bind("mouseover", function(){
            $(".icon_table_button_view img").prop("src", "${ctx}/images/icon/detail-inactive.png");
            $(this).find("img").prop("src", "${ctx}/images/icon/detail-active.png");
        });

        $(".icon_table_button_view").bind("mouseout", function(){
            $(this).find("img").prop("src", "${ctx}/images/icon/detail-inactive.png");
        });

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

    function action_reload(){
        location.href='${ctx}/backend/account/joinAccounts';
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

    function openItem(itemId){
        openPage('编辑加盟会员信息','${ctx}/backend/account/joinAccountform?action=update&id=' + itemId);
    }

    function viewItem(itemId){
        openPage('加盟会员信息','${ctx}/backend/account/joinAccountDetail?id=' + itemId);
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

</script>
