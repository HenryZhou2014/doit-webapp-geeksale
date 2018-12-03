<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>运营账号管理</title>
    <meta name="heading" content="<fmt:message key='userList.heading'/>"/>
    <meta name="module-group" content="system-management"/>
    <meta name="module" content="system-users"/>

    <meta name="nav" content="<a href='javascript:void(0);'>用户管理</a>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">

    <script src="${ctx}/resource/common/scripts/plugins/dataTables/datatables.min.js"></script>
    <script src="${ctx}/resource/common/scripts/plugins/jeditable/jquery.jeditable.js"></script>

    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script src="${ctx}/resource/common/scripts/zTree-v3.5.02/js/jquery.ztree.all-3.5.js"></script>

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
            float: left;
            display: inline-block;
        }
        .name{
            font-size:14px;
            line-height:20px;
            /*max-width:100px;*/
            max-height:60px;
            text-align:center;
            overflow: hidden;
            display: inline-block;
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
                <a>系统管理</a>
            </li>
            <li class="active">
                <strong>运营账号管理</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>运营账号管理</h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="${ctx}/backend/user/accountform">
                        <i class="fa fa-plus-circle"></i> 增加
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
                                <a id="toolbar_reset_role" href="javascript:void(0);">设置权限</a>
                            </li>
                            <li>
                                <a id="toolbar_import_user" href="javascript:void(0);">从导入运营账号</a>
                            </li>
                            <li>
                                <a id="toolbar_remove_from_admin" href="javascript:void(0);">收回运营管理权限</a>
                            </li>
                            <li>
                                <a id="toolbar_delete" href="javascript:void(0);">删除</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">

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
                                    <th width="300">账号</th>
                                    <%--<th width="100">系统账号</th>--%>
                                    <%--<th width="80">其他平台账号</th>--%>
                                    <%--<th>姓名</th>--%>
                                    <th>部门</th>
                                    <th>性别</th>
                                    <th width="100">电子邮件</th>
                                    <th>联系电话</th>
                                    <th>管理角色</th>
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

</div>

<div class="modal fade" id="roleModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     data-backdrop="false" data-show="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    用户权限设置
                </h4>
            </div>
            <div class="modal-body" id="userForm" style="max-height: 455px;overflow: auto;">
                <input type="hidden" name="checkedRoles"/>
                <div class="form-group" >
                    <div class="col-sm-2 text-right">
                        <label class="control-label">角色设置</label>
                        <div class="m-t">
                            <a class="btn btn-default btn-xs" style="width: 60px;"
                               onclick="checkAllRoles(true);">全选</a>
                        </div>
                        <div>
                            <a class="btn btn-default btn-xs" style="width: 60px;"
                               onclick="checkAllRoles(false);">全不选</a>
                        </div>
                    </div>

                    <div class="col-sm-10">
                        <ul id="treeDemo" class="ztree"></ul>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary jsonOnSubmit">
                    确认
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<script id="accountInfoTemplate" type="text/html">
    <div class="col-lg-3 nopadding" style="min-width: 25px;max-width: 40px;">
        <div>
            {{if headPhoto}}
                <img src="{{headPhoto}}" class="img-responsive"/>
            {{else}}
                <img src="${ctx}/images/icon/icons_user-128.png" class="img-responsive"/>
            {{/if}}
            <%--<img src="{{headPhoto}}" class="img-responsive"/>
            <img src="{{headPhotoQQ}}" class="img-responsive"/>
            <img src="{{headPhotoWeixin}}" class="img-responsive"/>
            <img src="{{headPhotoWeibo}}" class="img-responsive"/>--%>
        </div>
    </div>
    <div class="col-lg-9">
        <div>
            <ul class="list-unstyled">
                <li>{{accountName}}</li>
                <li>{{userName}}</li>
                {{if nameQQ}}
                <li><img src="${ctx}/b/resource/images/qq.png" style="max-width: 16px;"/> {{nameQQ}}</li>
                {{/if}}
                {{if nameWeixin}}
                <li><img src="${ctx}/b/resource/images/weixin.png" style="max-width: 16px;"/> {{nameWeixin}}</li>
                {{/if}}
                {{if nameWeibo}}
                <li><img src="${ctx}/b/resource/images/weibo.png" style="max-width: 16px;"/> {{nameWeibo}}</li>
                {{/if}}
            </ul>
        </div>
    </div>
</script>

<script type="text/javascript">
    var mainDataTable;

    var setting = {
        check:{
            enable:true
        },
        data:{
            simpleData:{
                enable:true
            }
        },
        callback:{
            onClick:zTreeOnClick
        },
        async:{
            type : "get",
            enable: true,
            dataType :"text",
            url:"${ctx}/backend/json/admin/roles/userRoleTreeItems"
        }
    };

    function zTreeOnClick(event, treeId, treeNode) {

    }

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
            "order": [[11, "desc"]],
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
                "data": "departmentName",
                "bSortable": false
            }, {
                "data": "gender",
                "bSortable": false
            }, {
                "data": "email",
                "bSortable": false
            }, {
                "data": "mobileNumber",
                "bSortable": false
            }, {
                "data": "roles",
                "bSortable": false
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
                "url": "${ctx}/backend/json/admin/users",
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
                    }
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
                        var html = template("accountInfoTemplate", row);
                        return html;
                    }, "targets": 2
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

                    }, "targets": 4
                },
                {
                    "render": function (data, type, row) {
                        if (data) {
                            var html = "";
                            console.log("data=" + data);
                            for(var i = 0; i < data.length; i++){
                                var item = data[i];
                                html += "<a class='label label-default'>" + item.name + "</a> ";
                            }
                            return html;
                        }
                        return "";

                    }, "targets": 7
                },
                {
                    "render": function (data, type, row) {
                        if (data == "1") {
                            return "<i class='fa fa-check'></i>";
                        }
                        return "<i class='fa fa-ban text-danger'></i>";

                    }, "targets": 10
                },
                {
                    "render": function (data, type, row) {
//                        return "<a class='btn btn-primary btn-xs' href='javascript:void(0);' onclick=\"openItem(" + row.id + ");\">编辑</a>";
                        return "<a class='btn btn-primary btn-xs' href='${ctx}/backend/user/accountform?id=" + row.id + "'>编辑</a>";

                    }, "targets": 11
                }
            ]
        });

        $('.dataTables-example tbody').on('click', 'tr', function (e) {
            // 排除按钮等
            if ($(e.target).is("button") || $(e.target).parent().is("button") || $(e.target).is("a") || $(e.target).parent().is("a")) {
                return;
            }

            $(this).toggleClass('selected');
            var checkbox = $(this).find("input[name='checkId']").first();

            $(checkbox).prop("checked", $(this).hasClass('selected'));
        });

        $.fn.zTree.init($("#treeDemo"), setting, []);

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

        // 设置权限
        $("#toolbar_reset_role").bind("click", function () {
            resetRoleOfUsers();
        });

        // 删除按钮
        $("#toolbar_delete").bind("click", function () {
            deleteItems();
        });

        // 移出运营管理
        $("#toolbar_remove_from_admin").bind("click", function () {
            removeFromManageTeam();
        });
    }

    function enableItems() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要启用的账号");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认启用所选账号？",
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
                            url: "${ctx}/backend/json/user/enable",
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
                                    toastSuccess("操作提示", "所选账号已启用！");
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
            toastWarning("提示", "请选择要停用的账号");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认停用所选账号？",
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
                            url: "${ctx}/backend/json/user/disable",
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

    function resetPasswordOfUsers() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要操作的会员号");
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
                            url: "${ctx}/backend/json/user/resetpassword",
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

    function resetRoleOfUsers() {
        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要操作的账号");
            return;
        }
        $("#roleModal").modal("show");

    }

    function deleteItems() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要操作的账号");
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
                            url: "${ctx}/backend/json/user/delete",
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

    function removeFromManageTeam() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要操作的账号");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "<div class='text-danger'>确认设置所选账号为非管理账号?</div><p class='m-t'>非管理账号不能登陆后台运营管理系统</p>",
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
                            url: "${ctx}/backend/json/user/removeFromManageTeam",
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

    function checkAllRoles(checkStatus) {
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        treeObj.checkAllNodes(checkStatus);
    }
</script>
