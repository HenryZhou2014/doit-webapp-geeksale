<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>代理账号管理</title>
    <meta name="heading" content="<fmt:message key='accountList.heading'/>"/>
    <meta name="module-group" content="account-management"/>
    <meta name="module" content="user-agent-accounts"/>

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
                <strong>代理账号管理</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>代理账号管理</h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="${ctx}/backend/agentaccount/accountform">
                            <i class="fa fa-file-o"></i> 增加
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a id="toolbar_reload" href="javascript:void(0);">刷新</a>
                            </li>
                            <li>
                                <a id="toolbar_enable" href="javascript:void(0);">启用</a>
                            </li>
                            <li>
                                <a id="toolbar_disable" href="javascript:void(0);">停用</a>
                            </li>
                            <li>
                                <a id="toolbar_reset_password" href="javascript:void(0);">重设密码</a>
                            </li>
                            <li>
                                <a id="toolbar_user_group" href="javascript:void(0);">用户组管理</a>
                            </li>
                            <li>
                                <a id="toolbar_delete" href="javascript:void(0);">删除</a>
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
                                            <input name="accountName" id="accountName" class="form-control"
                                                   maxlength="30"/>
                                        </div>
                                    </div>

                                    <div class="col-lg-1 text-right">
                                        <label for="userName">姓名</label>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <input name="userName" id="userName" class="form-control" maxlength="60"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-1 text-right">
                                        <label>账号状态</label>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="checkbox-inline">
                                            <input type="checkbox" name="publishFlag" value="1" id="c1"/>
                                            <label for="c1" style="margin-top: 0;"> 已启用 </label>
                                        </div>
                                        <div class="checkbox-inline">
                                            <input type="checkbox" name="publishFlag" value="0" id="c2"/>
                                            <label for="c2" style="margin-top: 0;"> 未停用 </label>
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

</div>

<script id="columnProfileImageTemplate" type="text/html">
    {{if headPhoto}}
    <img src="{{headPhoto}}" style="max-height: 40px"/>
    {{else}}
    <img src="${ctx}/images/no_portrait.png" style="max-height: 40px"/>
    {{/if}}
</script>

<script type="text/javascript">
    var mainDataTable;

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

        mainDataTable = $(".dataTables-example").DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": true,
//            "scrollY": "600px",
            "scrollCollapse": true,
            "bFilter": true, //过滤功能 search 功能
            "paging": true,
            "iDisplayLength": 25,
            "aLengthMenu": [25, 50, 100],
            "ordering": true,
            "order": [[9, "desc"]],
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
                title: "#",
                "bSortable": false
            }, {
                "data": "headPhoto",
                "bSortable": false,
                title: "头像"
            }, {
                "data": "accountName",
                title: "账号"
            }, {
                "data": "userName",
                "bSortable": false,
                title: "姓名"
            },{
                "data": "companyName",
                title: "公司"
            },  {
                "data": "gender",
                title: "性别"
            }, {
                "data": "email",
                title: "电子邮件",
                visible: false
            }, {
                "data": "mobileNumber",
                title: "联系电话"
            }, {
                "data": "registerDate",
                title: "注册时间"
            }, {
                "data": "lastVistDate",
                title: "最近登录"
            }, {
                "data": "accountEnabled",
                title: "状态"
            }, {
                "data": "id",
                "bSortable": false,
                title: "操作"
            }],
            "ajax": {
                "url": "${ctx}/backend/account/accountList",
                "type": "POST",
                "dataType": "json",
                "data": {
                    accountName: function () {
                        return $("input[name='accountName']").val();
                    },
                    userName: function () {
                        return $("input[name='userName']").val();
                    },
                    publishFlag: function () {
                        return $("input[name='publishFlag']:checked").checkvalues();
                    },
                    accountType : "A"
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
                        var html = template("columnProfileImageTemplate", row);
                        return html;
                    }, "targets": 2
                },
                {
                    "render": function (data, type, row) {
                        return data;
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
                        return "<a class='btn btn-primary btn-xs' href='${ctx}/backend/agentaccount/accountform?id=" + row.id + "'>编辑</a>";

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
