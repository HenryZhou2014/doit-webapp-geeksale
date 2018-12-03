<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="accountList.title"/></title>
    <meta name="heading" content="<fmt:message key='accountList.heading'/>"/>
    <meta name="module-group" content="account-management"/>
    <%--<meta name="module-subgroup" content="column-perspective"/>--%>
    <meta name="module" content="user-accounts"/>
</head>

<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <%--<h2>Basic Form</h2>--%>
        <ol class="breadcrumb">
            <li>
                <a href="${ctx}/backend/index.html">首页</a>
            </li>
            <li>
                <a>会员管理</a>
            </li>
            <li class="active">
                <strong>会员账号管理</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>用户管理</h5>
                    <div class="ibox-tools">
                        <a href="${ctx}/backend/account/accountform.html">
                            <i class="fa fa-plus-circle"></i> 增加
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${ctx}/backend/account/accounts.html">刷新</a>
                            </li>
                            <li>
                                <a id="toolbar_enable_user" href="javascript:void(0);">启用</a>
                            </li>
                            <li>
                                <a id="toolbar_disable_user" href="javascript:void(0);">停用</a>
                            </li>
                            <li>
                                <a id="toolbar_reset_password" href="javascript:void(0);">重置密码</a>
                            </li>
                            <li>
                                <a id="toolbar_delete_user" href="javascript:void(0);">删除</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-lg-12 queryform">
                            <form id="productInfoform">
                                <div class="row">
                                    <div class="col-lg-1 text-right">
                                        <label for="accountName">账号</label>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <input name="accountName" id="accountName" class="form-control" maxlength="30"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-1 text-right">
                                        <label for="title">姓名</label>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <input name="title" id="title" class="form-control" maxlength="30"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-1 text-right">
                                        <label>账号状态</label>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="checkbox-inline">
                                            <input type="checkbox" name="publishFlag" value="1" id="c1"/>
                                            <label for="c1" style="margin-top: 0;"> 停用 </label>
                                        </div>
                                        <div class="checkbox-inline">
                                            <input type="checkbox" name="publishFlag" value="0" id="c2"/>
                                            <label for="c2" style="margin-top: 0;"> 启用 </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-1">
                                        <button class="btn btn-primary btn-sm" type="button" onclick="query();">查询
                                        </button>
                                    </div>
                                </div>

                            </form>
                            <hr style="margin-bottom: 10px; margin-top: 5px;"/>
                        </div>
                    </div>

                    <div class="panel">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover dataTables-example"
                                   width="100%">
                                <thead>
                                <tr>
                                    <th width="20">
                                        <input type="checkbox" class="checkAll" checkTarget="checkId"/>
                                    </th>
                                    <th width="25">#</th>
                                    <th>账号</th>
                                    <th>电子邮件</th>
                                    <th>姓名</th>
                                    <th>学院</th>
                                    <th>专业</th>
                                    <th>班级</th>
                                    <th>性别</th>
                                    <th>联系电话</th>
                                    <th>注册时间</th>
                                    <th>最近登录时间</th>
                                    <th>账号状态</th>
                                    <th width="40">操作</th>
                                </tr>
                                </thead>

                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        // 工具栏按钮事件绑定
        initToolBarActions();

        // 表格按钮修饰
        decorateTableButtons();

    });

    function initToolBarActions(){
        // 新增按钮
        $("#toolbar_new").bind("click", function(){
            openPage('新增会员','${ctx}/backend/account/accountform');
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
        location.href='${ctx}/backend/account/accounts';
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
        openPage('编辑会员信息','${ctx}/backend/account/accountform?id=' + itemId);
    }

    function viewItem(itemId){
        openPage('会员信息','${ctx}/backend/account/accountDetail?id=' + itemId);
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
