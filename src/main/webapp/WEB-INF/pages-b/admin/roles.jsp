<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="roleList.title"/></title>
    <meta name="heading" content="<fmt:message key='roleList.heading'/>"/>
    <meta name="module-group" content="system-management"/>
    <meta name="module" content="system-roles"/>

    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/zTreeStyle.css"
          type="text/css">
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
                <a href="${ctx}/backend/admin/roles.html">角色管理</a>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>角色管理</h5>
                    <div class="ibox-tools">
                        <a href="${ctx}/backend/admin/roleform.html">
                            <i class="fa fa-plus-circle"></i> 增加
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${ctx}/backend/admin/roles.html">刷新</a>
                            </li>
                            <li>
                                <a id="toolbar_delete" href="javascript:void(0);">删除</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                            <tr>
                                <th width="20">
                                    <input type="checkbox" class="checkAll" checkTarget="checkId"/>
                                </th>
                                <th width="25">#</th>
                                <th>角色编号</th>
                                <th>角色名称</th>
                                <th>说明</th>
                                <th>权限设置</th>
                                <th>角色用户</th>
                                <th width="40">操作</th>
                            </tr>
                            </thead>
                        </table>

                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="privilegeModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         data-backdrop="false" data-show="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        角色权限设置
                    </h4>
                </div>
                <div class="modal-body" id="userForm" style="min-height:300px;max-height: 455px;overflow: auto;">
                    <input type="hidden" name="checkedRoles"/>
                    <div class="form-group">
                        <div class="col-sm-2 text-right">
                            <label class="control-label">权限设置</label>
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
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>

<script type="text/javascript">
    var mainDataTable;

    function zTreeOnClick(event, treeId, treeNode) {

    }
    $(document).ready(function () {

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
            "paging": false,
            "iDisplayLength": 35,
            "aLengthMenu": [35, 100, 150],
            "ordering": true,
            "order": [[2, "asc"]],
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
                "data": "code"
            }, {
                "data": "name"
            }, {
                "data": "description",
                "bSortable": false
            }, {
                "data": "id",
                "bSortable": false
            }, {
                "data": "role-users",
                "bSortable": false
            }, {
                "data": "id",
                "bSortable": false
            }],
            "ajax": {
                "url": "${ctx}/backend/json/admin/roles",
                "type": "GET",
                dataType: "json",
                "data": {}
            },
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        return "<input type='checkbox' name='checkId' value=\"" + row.id + "\"/>";

                    }, "targets": 0
                },
                {
                    "render": function (data, type, row) {
                        return "<button class='btn btn-success btn-xs' onclick='resetPrivilegeOfRole(\"" + data + "\");'>权限设置</button>";

                    }, "targets": 5
                },
                {
                    "render": function (data, type, row) {
                        if (data && data.length > 0) {
                            var roles = "";
                            for (var i = 0; i < data.length; i++) {
                                var item = data[i];
                                var name = item.name;
                                var itemdesc = "<label class='label label-default m-t'>" + name + "</label> ";

                                roles += itemdesc;

                            }
                            return roles;
                        }

                        return "";

                    }, "targets": 6
                },
                {
                    "render": function (data, type, row) {
                        return "<a class='btn btn-primary btn-xs' href=\"roleform?id=" + row.id + "\">编辑</a>";

                    }, "targets": 7
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

    });

    function initToolBarActions() {
        // 删除按钮
        $("#toolbar_delete").bind("click", function () {
            deleteItems();
        });

        // 设置权限
        $("#toolbar_reset_privilege").bind("click", function () {
            resetPrivilegeOfRole();
        });

        //异步请求( 设置权限 )
        $(".jsonOnSubmit").bind("click", function () {
            jsonOnSubmit();
        });

    }

    var currentRoleId;
    function resetPrivilegeOfRole(roleId) {
        currentRoleId = roleId;
        var setting = {
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                onClick: zTreeOnClick
            },
            async: {
                type: "get",
                enable: true,
                otherParam: {
                    "id": currentRoleId
                },
                dataType: "text",
                url: "${ctx}/backend/json/admin/checkPrivilegeOfRole"
            }
        };

        $.fn.zTree.init($("#treeDemo"), setting, []);

        $("#privilegeModal").modal("show");

    }

    function deleteItems() {
        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要删除的记录项");
            return;
        }

        BootstrapDialog.show({
            title: "删除确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "<p>确认删除所选项？</p><br/><div class='alert alert-warning'>系统将删除该角色的所有配置！</div>",
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
                            url: "${ctx}/backend/json/admin/roles/deleteItems",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选项目已经删除！");
                                }
                                else if (data && data.flag == "0") {
                                    toastError("操作提示", "删除失败！");
                                }
                                else {
                                    toastError("操作提示", "删除失败！");
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

    function jsonOnSubmit() {

        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getCheckedNodes(true);
        var json = $.toJSON(nodes);

        $.ajax({
            url: "${ctx}/backend/json/admin/resetPrivilegeOfRole",
            data: {
                checkedPrivilege: json,
                roleId: currentRoleId
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#privilegeModal").modal("hide");
                    toastSuccess("操作提示", "权限设置成功！");
//                    mainDataTable.ajax.reload();
                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }

</script>