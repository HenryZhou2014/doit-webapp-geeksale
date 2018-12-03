<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>开户审核</title>
    <meta name="heading" content="<fmt:message key='accountList.heading'/>"/>
    <meta name="module-group" content="account-management"/>
    <meta name="module" content="accounts-queue-audit"/>

    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">

    <script src="${ctx}/resource/common/scripts/plugins/dataTables/datatables.min.js"></script>
    <script src="${ctx}/resource/common/scripts/plugins/jeditable/jquery.jeditable.js"></script>

    <style type="text/css">
        table.dataTables-example {
            font-size: 13px;
        }

        select.input-sm {
            /*height:30px;*/
            /*line-height:30px;*/
            padding: 2px 5px;
        }

        .table-striped > tbody > tr.selected {
            background: whitesmoke;
        }

        .bootstrap-dialog.type-primary .modal-header {
            background-color: #1ab394;
        }

        .queryform label {
            margin-top: 5px;
            font-weight: normal;
        }

        select.input-sm {
            padding: 2px 10px;
        }

        .imageWrapper {
            height: 110px;
            width: 150px;
            overflow: hidden;
        }

        .imageWrapper img {

        }

        .type-name {
            width: 20px;
            height: 20px;
            border-radius: 10px;
            overflow: hidden;
            margin: 0 auto;
        }
        .name{
            font-size:14px;
            line-height:20px;
            max-width:100px;
            max-height:60px;
            text-align:center;
            overflow: hidden;
        }
        .head-photo {
            width: 50px;
            height: 50px;
            border-radius: 25px;
            overflow: hidden;
        }
        .ibox-content{
            padding: 0;
        }

        table.dataTable{
            margin-top: 0 !important;
        }
    </style>
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
                <strong>开户审核</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>开户审核</h5>
                </div>
                <div class="ibox-content">
                    <div class="panel">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover dataTables-example dataTables-accounts"
                                   width="100%">
                                <thead>
                                <tr>
                                    <th width="20">
                                        <input type="checkbox" class="checkAll" checkTarget="checkId"/>
                                    </th>
                                    <th width="25">#</th>
                                    <th width="40">头像</th>
                                    <th width="100">账号</th>
                                    <th width="80">平台账号</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th width="100">电子邮件</th>
                                    <th>联系电话</th>
                                    <th>注册时间</th>
                                    <th>最近登录</th>
                                    <th>账号状态</th>
                                    <th width="40">操作</th>
                                </tr>
                                </thead>

                            </table>
                        </div>
                    </div>

                    <div class="hidden">
                        <div id="panel-reset-password">
                            <div>密码重置</div>
                            <div>
                                <input type="text" name="newPassword" class="form-control"/>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>子公司审核</h5>
                </div>
                <div class="ibox-content">
                    <div class="panel">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover dataTables-example dataTables-company"
                                   width="100%">
                                <thead>
                                <tr>
                                    <th width="20">
                                        <input type="checkbox" class="checkAll" checkTarget="checkId"/>
                                    </th>
                                    <th width="25">#</th>
                                    <th width="40">头像</th>
                                    <th width="100">账号</th>
                                    <th width="80">平台账号</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th width="100">电子邮件</th>
                                    <th>联系电话</th>
                                    <th>注册时间</th>
                                    <th>最近登录</th>
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
    var mainDataTable;
    var companyDataTable;

    $(document).ready(function () {
        // 工具栏按钮事件绑定
        initToolBarActions();

        $(".checkAll").click(function () {
            var checked = $(this).prop("checked");
            var target = $(this).attr("checkTarget");
            $("input[name='" + target + "']").each(function () {
                $(this).prop("checked", checked);

                $(this).parents("tr:first").toggleClass("selected", checked);
            });
        });

        $.fn.checkvalues = function () {
            var val = [];
            $(this).each(function (index, element) {
                val.push($(element).val());
            });

            return val.join(",");
        };

        mainDataTable = $(".dataTables-accounts").DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": false,
            "scrollY": "300px",
            "scrollCollapse": true,
            "bFilter": false, //过滤功能 search 功能
//            "paging": true,
//            "iDisplayLength": 25,
//            "aLengthMenu": [25, 50, 100],
            "ordering": false,
//            "order": [[12, "desc"]],
            "pagingType": "full_numbers",
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "抱歉， 没有找到",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "sSearch": "搜索",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                },
                "sZeroRecords": "没有检索到数据"
            },
            "columns": [{
                data: "id",
                class: "text-center",
                "bSortable": false
            }, {
                "data": "seqNo",
                class: "text-center",
                "bSortable": false
            }, {
                "data": "headPhoto",
                "bSortable": false
            }, {
                "data": "accountName"
            }, {
                "data": "typeName"
            }, {
                "data": "userName",
                "bSortable": false
            }, {
                "data": "gender"
            }, {
                "data": "email"
            }, {
                "data": "mobileNumber"
            }, {
                "data": "registerDate"
            }, {
                "data": "lastVistDate"
            }, {
                "data": "accountEnabled"
            }, {
                "data": "id",
                "bSortable": false
            }],
            "ajax": {
                "url": "${ctx}/backend/account/accounts-queue-audit/list",
                "type": "POST",
                "dataType": "json",
                "data": {
                    accountType : "U"
                }
            },
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        return "<input type='checkbox' name='checkId' value=\"" + row.id + "\"/>";

                    }, "targets": 0
                },
                {
                    "render": function (data, type, row) {
                        if (data != "") {
                            return "<div class='head-photo'>" +
                                    "<img class='img-responsive' src='" + data + "'/>" +
                                    "</div>";
                        } else {
                            return "";
                        }
                    }, "targets": 2
                },
                {
                    "render": function (data, type, row) {
                        if (data != "") {
                            return "<div class='type-name'>" +
                                    "<img class='img-responsive' src='${ctx}/b/resource/images/" + data + ".png'/>" +
                                    "</div>" +
                                    "<div class='name'>" + row.name + "</span>";
                        } else {
                            return "";
                        }

                    }, "targets": 4
                },
                {
                    "render": function (data, type, row) {

                        if (data == "M") {
                            return "男";
                        } else if (data == "F") {
                            return "女";
                        } else {
                            return "";
                        }

                    }, "targets": 6
                },

                {
                    "render": function (data, type, row) {
                        if (data == "1") {
                            return "<i class='fa fa-check'></i>";
                        }
                        return "<i class='fa fa-ban text-danger'></i>";

                    }, "targets": 11
                },
                {
                    "render": function (data, type, row) {
//                        return "<a class='btn btn-primary btn-xs' href='javascript:void(0);' onclick=\"openItem(" + row.id + ");\">编辑</a>";
                        return "<a class='btn btn-primary btn-xs' href='${ctx}/backend/account/accountform?id=" + row.id + "'>编辑</a>";

                    }, "targets": 12
                }
            ]
        });

        companyDataTable = $(".dataTables-company").DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": false,
            "scrollY": "300px",
            "scrollCollapse": true,
            "bFilter": false, //过滤功能 search 功能
//            "paging": true,
//            "iDisplayLength": 25,
//            "aLengthMenu": [25, 50, 100],
            "ordering": false,
//            "order": [[12, "desc"]],
            "pagingType": "full_numbers",
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "抱歉， 没有找到",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "sSearch": "搜索",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                },
                "sZeroRecords": "没有检索到数据"
            },
            "columns": [{
                data: "id",
                class: "text-center",
                "bSortable": false
            }, {
                "data": "seqNo",
                class: "text-center",
                "bSortable": false
            }, {
                "data": "headPhoto",
                "bSortable": false
            }, {
                "data": "accountName"
            }, {
                "data": "typeName"
            }, {
                "data": "userName",
                "bSortable": false
            }, {
                "data": "gender"
            }, {
                "data": "email"
            }, {
                "data": "mobileNumber"
            }, {
                "data": "registerDate"
            }, {
                "data": "lastVistDate"
            }, {
                "data": "accountEnabled"
            }, {
                "data": "id",
                "bSortable": false
            }],
            "ajax": {
                "url": "${ctx}/backend/account/accounts-queue-audit/list",
                "type": "POST",
                "dataType": "json",
                "data": {
                    accountType : "U"
                }
            },
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        return "<input type='checkbox' name='checkId' value=\"" + row.id + "\"/>";

                    }, "targets": 0
                },
                {
                    "render": function (data, type, row) {
                        if (data != "") {
                            return "<div class='head-photo'>" +
                                "<img class='img-responsive' src='" + data + "'/>" +
                                "</div>";
                        } else {
                            return "";
                        }
                    }, "targets": 2
                },
                {
                    "render": function (data, type, row) {
                        if (data != "") {
                            return "<div class='type-name'>" +
                                "<img class='img-responsive' src='${ctx}/b/resource/images/" + data + ".png'/>" +
                                "</div>" +
                                "<div class='name'>" + row.name + "</span>";
                        } else {
                            return "";
                        }

                    }, "targets": 4
                },
                {
                    "render": function (data, type, row) {

                        if (data == "M") {
                            return "男";
                        } else if (data == "F") {
                            return "女";
                        } else {
                            return "";
                        }

                    }, "targets": 6
                },

                {
                    "render": function (data, type, row) {
                        if (data == "1") {
                            return "<i class='fa fa-check'></i>";
                        }
                        return "<i class='fa fa-ban text-danger'></i>";

                    }, "targets": 11
                },
                {
                    "render": function (data, type, row) {
//                        return "<a class='btn btn-primary btn-xs' href='javascript:void(0);' onclick=\"openItem(" + row.id + ");\">编辑</a>";
                        return "<a class='btn btn-primary btn-xs' href='${ctx}/backend/account/accountform?id=" + row.id + "'>编辑</a>";

                    }, "targets": 12
                }
            ]
        });


        $('.dataTables-example tbody').on('click', 'tr', function (e) {

            $(this).toggleClass('selected');
            var checkbox = $(this).find("input[name='checkId']").first();

            $(checkbox).prop("checked", $(this).hasClass('selected'));
        });

    });

    function query() {
        mainDataTable.ajax.reload();
    }

    function initToolBarActions() {
        // 刷新按钮
        $("#toolbar_reload").bind("click", function () {
            query();
        });

        // 启用按钮
        $("#toolbar_enable").bind("click", function () {
            enableItems();
        });

        // 停用按钮
        $("#toolbar_disable").bind("click", function () {
            disableItems();
        });

        // 重新设置密码
        $("#toolbar_reset_password").bind("click", function () {
            resetPasswordOfUsers();
        });

        // 删除按钮
        $("#toolbar_delete").bind("click", function () {
            deleteItems();
        });

        // 按钮
        $("#toolbar_add_to_admin").bind("click", function () {
            addToManageTeam();
        });
    }

    function enableItems() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要启用的用户");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认启用所选用户？",
            buttons: [{
                label: '取消',
                action: function (dialogItself) {
                    dialogItself.close();
                }
            },
                {
                    label: '确认',
                    cssClass: "btn-primary",
                    action: function (dialogItself) {
                        $.ajax({
                            url: "${ctx}/backend/account/enable.json",
                            type: "POST",
                            dataType: "json",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选用户已启用！");
                                }
                                else if (data && data.flag == "0") {
                                    toastError("操作提示", "系统繁忙，请稍后再试！");
                                }
                                else {
                                    toastError("操作提示", "系统繁忙，请稍后再试！");
                                }
                            }
                        });
                    }
                }]
        });
    }

    function disableItems() {
        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要停用的用户");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认停用所选用户？",
            buttons: [{
                label: '取消',
                action: function (dialogItself) {
                    dialogItself.close();
                }
            },
                {
                    label: '确认',
                    cssClass: "btn-primary",
                    action: function (dialogItself) {
                        $.ajax({
                            url: "${ctx}/backend/account/disable.json",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选用户已停用！");
                                }
                                else if (data && data.flag == "0") {
                                    toastError("操作提示", "系统繁忙，请稍后再试！");
                                }
                                else {
                                    toastError("操作提示", "系统繁忙，请稍后再试！");
                                }
                            }
                        });
                    }
                }]
        });
    }

    function deleteItems() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要删除的账号");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认删除所选账号？",
            buttons: [{
                label: '取消',
                action: function (dialogItself) {
                    dialogItself.close();
                }
            },
                {
                    label: '确认',
                    cssClass: "btn-primary",
                    action: function (dialogItself) {
                        $.ajax({
                            url: "${ctx}/backend/account/delete.json",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选账号已删除！");
                                }
                                else if (data && data.flag == "0") {
                                    toastError("操作提示", "操作失败！");
                                }
                                else {
                                    toastError("操作提示", "操作失败！");
                                }
                            }
                        });
                    }
                }]
        });
    }
    function resetPasswordOfUsers() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要操作的账号");
            return;
        }

        BootstrapDialog.show({
            title: "密码重置",
            draggable: true,
            size: BootstrapDialog.SIZE_SMALL,
            message: $("#panel-reset-password").clone(),
            buttons: [{
                label: '取消',
                action: function (dialogItself) {
                    dialogItself.close();
                }
            },
                {
                    label: '确认',
                    cssClass: "btn-primary",
                    action: function (dialogItself) {
                        var newPassword = $($("input[name=newPassword]")[1]).val();
                        if (newPassword == "") {
                            toastError("新密码不能为空！");
                            return;
                        }
                        $.ajax({
                            url: "${ctx}/backend/account/resetpassword.json",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                },
                                newPassword: newPassword
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "密码重置完成！");
                                }
                                else if (data && data.flag == "0") {
                                    toastError("操作提示", "操作失败！");
                                }
                                else {
                                    toastError("操作提示", "操作失败！");
                                }
                            }
                        });
                    }
                }]
        });

    }

    function addToManageTeam() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要操作的账号");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "<div class='text-danger'>确认设置所选账号为管理账号?</div><p class='m-t'>管理账号能登陆后台运营管理系统</p>",
            buttons: [{
                label: '取消',
                action: function (dialogItself) {
                    dialogItself.close();
                }
            },
                {
                    label: '确认',
                    cssClass: "btn-primary",
                    action: function (dialogItself) {
                        $.ajax({
                            url: "${ctx}/backend/account/addToManageTeam.json",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "操作成功！");
                                }
                                else if (data && data.flag == "0") {
                                    toastError("操作提示", "操作失败！");
                                }
                                else {
                                    toastError("操作提示", "操作失败！");
                                }
                            }
                        });
                    }
                }]
        });
    }
</script>
