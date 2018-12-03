<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>权限单元管理</title>
    <meta name="heading" content="<fmt:message key='roleList.heading'/>"/>
    <meta name="module-group" content="system-management"/>
    <meta name="module" content="system-rightUnits"/>

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

        .cat-padding-1 {
            padding-left: 0;
        }

        .cat-padding-2 {
            padding-left: 20px;

        }

        .cat-padding-3 {
            padding-left: 40px;

        }

        .cat-padding-4 {
            padding-left: 60px;

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
                <a href="${ctx}/backend/admin/roles.html">权限单元管理</a>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>权限单元管理</h5>
                    <div class="ibox-tools">
                        <a href="javascript:void(0);" id="toolbar_new">
                            <i class="fa fa-plus-circle"></i> 增加
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${ctx}/backend/admin/rightUnits.html">刷新</a>
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
                                <th width="280">名称</th>
                                <th>编码</th>
                                <th>说明</th>
                                <th width="150">操作</th>
                            </tr>
                            </thead>
                        </table>

                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="rightInfoDialogue" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         data-backdrop="false" data-show="false">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 800px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        添加权限单元设置
                    </h4>
                </div>
                <div class="modal-body" id="userForm" style="min-height:300px;max-height: 455px;overflow: auto;">
                    <form class="form-horizontal" id="rightInfoCreateForm">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <i class="fa fa-align-left"></i> <span id="rootName">系统权限</span>
                                <input type="hidden" name="parentId" value="-1">
                            </div>
                        </div>
                        <div class="form-group m-t-xs rightItem" style="clear:both;">
                            <div class="col-sm-4">
                                <input type="hidden" name="id"/>
                                <input type="text" name="rightCode" placeholder="编码" class="form-control"/>
                            </div>

                            <div class="col-sm-4">
                                <input type="text" name="rightName" placeholder="名称" class="form-control"/>
                            </div>
                            <div class="col-sm-3">
                                <input type="text" name="memo" placeholder="说明" class="form-control"/>
                            </div>
                            <div class="col-sm-1">

                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-default" onclick="newRightItem();">新增</button>
                    <button type="button" class="btn btn-primary" onclick="saveUnitRights();">
                        确认
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <div class="modal fade" id="rightInfoEditDialogue" tabindex="-1" role="dialog"
         data-backdrop="false" data-show="false">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 600px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title">
                        权限单元信息修改
                    </h4>
                </div>
                <div class="modal-body" style="min-height:300px;max-height: 455px;overflow: auto;">
                    <form class="form-horizontal" id="rightInfoEditForm">
                        <input type="hidden" name="id"/>
                        <div class="form-group m-t-xl">
                            <label class="col-sm-2 control-label">编码</label>
                            <div class="col-sm-8">
                                <input type="text" name="rightCode" placeholder="编码" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-8">
                                <input type="text" name="rightName" placeholder="名称" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">说明</label>
                            <div class="col-sm-8">
                                <input type="text" name="memo" placeholder="说明" class="form-control"/>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="updateRightInfo();">
                        确认
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
</div>

<script id="rightItemTemplate" type="text/html">
    <div class="form-group m-t-xs rightItem" style="clear:both;">
        <div class="col-sm-4">
            <input type="hidden" name="id"/>
            <input type="text" name="rightCode" placeholder="编码" class="form-control"/>
        </div>

        <div class="col-sm-4">
            <input type="text" name="rightName" placeholder="名称" class="form-control"/>
        </div>
        <div class="col-sm-3">
            <input type="text" name="memo" placeholder="说明" class="form-control"/>
        </div>
        <div class="col-sm-1">
            <a onclick="removeRightItem(this);"><i class="fa fa-trash"></i> </a>
        </div>
    </div>
</script>

<script id="rightCodeTemplate" type="text/html">
    <div class='cat cat-padding-{{treeLevel}}' data-thread="{{parentThread}}" data-open="" data-has-child="{{hasChild}}" data-parent="{{parentId}}" data-id="{{id}}">
        {{if hasChild == '1'}}
            <a class='btn-expand'><i class='cat-icon fa fa-folder-open'></i> <span>{{rightName}}</span></a>
        {{else}}
            <a><i class='fa fa-file-o'></i> <span>{{rightName}}</span></a>
        {{/if}}
    </div>
</script>

<script type="text/javascript">
    var mainDataTable;

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

        mainDataTable = $(".dataTables-example").on('init.dt', function () {
            $(".dataTables-example").on("click", ".move_up", function (element) {
                console.log("move up ... ");
                var thisId = $(this).attr("data-id");

                $.ajax({
                    url: "${ctx}/backend/json/admin/right/trasposition",
                    type: "POST",
                    dataType: "JSON",
                    data: {
                        thisId: thisId,
                        direction: "up"
                    },
                    success: function (data) {
                        if (data.flag == '1') {
                            mainDataTable.ajax.reload();
                            return;
                        }
                        toastError("提示", data.msg);
                    }
                });
            });
            $(".dataTables-example").on("click", ".move_down", function (element) {
                console.log("move down ... ");
                var thisId = $(this).attr("data-id");

                $.ajax({
                    url: "${ctx}/backend/json/admin/right/trasposition",
                    type: "POST",
                    dataType: "JSON",
                    data: {
                        thisId: thisId,
                        direction: "down"
                    },
                    success: function (data) {
                        if (data.flag == '1') {
                            mainDataTable.ajax.reload();
                            return;
                        }
                        toastError("提示", data.msg);
                    }
                });
            });

            $(".dataTables-example").on("click", ".btn_new", function (element) {
                var parentId = $(this).attr("data-id");
                $("#rightInfoCreateForm").find("input[name='parentId']").val(parentId);
                $("#rightInfoDialogue").modal("show");
            });

            $(".dataTables-example").on("click", ".btn_edit", function (element) {
                var id = $(this).attr("data-id");
                var code = $(this).attr("data-code");
                var name = $(this).attr("data-name");
                var memo = $(this).attr("data-memo");

                console.log(code);

                $("#rightInfoEditForm input[name='id']").val(id);
                $("#rightInfoEditForm input[name='rightCode']").val(code);
                $("#rightInfoEditForm input[name='rightName']").val(name);
                $("#rightInfoEditForm input[name='memo']").val(memo);

                $("#rightInfoEditDialogue").modal("show");
            });
        }).DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": false,
//            "scrollY": "600px",
            "scrollCollapse": true,
            "bFilter": true, //过滤功能 search 功能
            "paging": false,
            "iDisplayLength": 35,
            "aLengthMenu": [35, 100, 150],
            "ordering": false,
//            "order": [[2, "asc"]],
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
                "data": "rightName"
            }, {
                "data": "rightCode"
            }, {
                "data": "memo",
                "bSortable": false
            }, {
                "data": "id",
                "bSortable": false
            }],
            "ajax": {
                "url": "${ctx}/backend/json/admin/rightUnits",
                "type": "GET",
                dataType: "json",
                "data": {}
            },
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        return "<input type='checkbox' name='checkId' value=\"" + row.id + "\"/>";

                    }, "targets": 0
                }, {
                    "render": function (data, type, row) {
                        var html = template("rightCodeTemplate", row);
                        return html;

                    }, "targets": 2
                },
                {
                    "render": function (data, type, row) {
                        var buttons = "<a class='btn btn-default btn-xs move_up' href=\"javascript:void(0);\" data-id='" + row.id + "'><i class='fa fa-long-arrow-up'></i></a>";
                        buttons += "<a class='btn btn-default btn-xs move_down' href=\"javascript:void(0);\" data-id='" + row.id + "'><i class='fa fa-long-arrow-down'></i></a>";
                        buttons += "<a class='btn btn-default btn-xs btn_new' href=\"javascript:void(0);\" data-id='" + row.id + "'>增加</a>";
                        buttons += "<a class='btn btn-primary btn-xs btn_edit' href=\"javascript:void(0);\" data-id='" + row.id + "' data-code='" + row.rightCode + "' data-name='" + row.rightName + "' data-memo='" + row.memo + "'>编辑</a>";
                        return buttons;
                    }, "targets": 5
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

        var openNode;

        $(document).on("click", ".btn-expand", function(e){
            var thread = $(this).parent().attr("data-thread");
            var id = $(this).parent().attr("data-id");
            var folderElement = $(this).find(".cat-icon");
            var open = $(folderElement).hasClass("fa-folder-open");

            $(".dataTables-example tbody tr").each(function(i, element){
                var catElement = $(this).find(".cat");
                var trThread = $(catElement).attr("data-thread");
                var parentId = $(catElement).attr("data-parent");
                if(open){

                    if(trThread != thread && trThread.indexOf(thread) != -1){
                        $(this).addClass("hidden");
                    }
                }
                else{
                    if (parentId == id){
                        $(this).removeClass("hidden");
                        if(catElement.attr("data-has-child") == "1"){
                            $(this).find(".cat-icon").removeClass("fa-folder-open");
                            $(this).find(".cat-icon").addClass("fa-folder");
                        }
                    }
                }
            });

            $(folderElement).toggleClass("fa-folder-open");
            $(folderElement).toggleClass("fa-folder");
        });
    });

    function initToolBarActions() {
        // 删除按钮
        $("#toolbar_delete").bind("click", function () {
            deleteItems();
        });

        // 新增
        $("#toolbar_new").bind("click", function () {
            $("#rightInfoCreateForm").find("input[name='parentId']").val("1");
            $("#rightInfoDialogue").modal("show");
        });


        //异步请求( 设置权限 )
        $(".jsonOnSubmit").bind("click", function () {
            jsonOnSubmit();
        });

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
            message: "<p>确认删除所选项？</p><br/><div class='alert alert-warning'>如果该选项有子选项，所有子选项也将被一并删除！</div>",
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
                            url: "${ctx}/backend/json/admin/rightUnits/deleteItems",
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
                    $("#rightInfoDialogue").modal("hide");
                    toastSuccess("操作提示", "权限设置成功！");
//                    mainDataTable.ajax.reload();
                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }

    function updateItem() {

        var id = $("#rightInfoEditForm input[name='id']").val();
        var rightCode = $("#rightInfoEditForm input[name='rightCode']").val();
        var rightName = $("#rightInfoEditForm input[name='rightName']").val();
        var memo = $("#rightInfoEditForm input[name='memo']").val();

        $.ajax({
            url: "${ctx}/backend/json/admin/rightUnits/update",
            data: {
                id: id,
                rightCode: rightCode,
                rightName: rightName,
                memo: memo
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#rightInfoEditDialogue").modal("hide");
                    toastSuccess("操作提示", "权限设置成功！");
                    mainDataTable.ajax.reload();
                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }

    function saveUnitRights() {

//        var formData = $("#rightInfoCreateForm").serializeArray();
//        var rootId = $("#rightInfoCreateForm input[name='rootId']").val();
//
//        console.log("rootId:" + rootId + ",formdata=" + JSON.stringify(formData));

        var params = [];
        var parentId = $("#rightInfoCreateForm").find("input[name='parentId']").val();
        $("#rightInfoCreateForm .rightItem").each(function () {

            var rightCode = $(this).find("input[name='rightCode']").val();
            var rightName = $(this).find("input[name='rightName']").val();
            var memo = $(this).find("input[name='memo']").val();

            var param = {
                rightCode: rightCode,
                rightName: rightName,
                memo: memo
            };

            params.push(param);
        });
        var paramsStr = JSON.stringify(params);

        $.ajax({
            url: "${ctx}/backend/json/admin/rightUnits/create",
            data: {
                parentId: parentId,
                rights: paramsStr
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#rightInfoDialogue").modal("hide");
                    toastSuccess("操作提示", "权限设置成功！");
                    mainDataTable.ajax.reload();
                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }

    function newRightItem() {
        var html = template("rightItemTemplate", []);
        $("#rightInfoCreateForm").append(html);
    }

    function removeRightItem(element) {
        $(element).parents(".form-group").remove();
    }
</script>