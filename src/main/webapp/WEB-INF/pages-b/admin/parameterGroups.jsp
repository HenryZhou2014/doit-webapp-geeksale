<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>参数组管理</title>
    <meta name="heading" content="<fmt:message key='roleList.heading'/>"/>
    <meta name="module-group" content="system-management"/>
    <meta name="module" content="system-parameters-setting"/>

    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/font-awesome-zTree.css" type="text/css">

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

        table.table tr td{
            padding: 8px 0 0 8px;
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
                <a href="${ctx}/backend/admin/parameterGroups.html">参数组管理</a>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>参数组管理</h5>
                    <div class="ibox-tools">
                        <a href="javascript:void(0);" id="toolbar_new">
                            <i class="fa fa-file-o"></i> 增加
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${ctx}/backend/admin/parameterGroups.html">刷新</a>
                            </li>
                            <li>
                                <a id="toolbar_delete" href="javascript:void(0);">删除</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="pull-left" style="width:220px;">
                        <ul id="treeDemo" class="ztree"></ul>
                    </div>

                    <div class="table-responsive">
                        <input type="hidden" name="root" value=""/>

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
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="newItemsDialogue" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         data-backdrop="false" data-show="false">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 800px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        添加
                    </h4>
                </div>
                <div class="modal-body" id="userForm" style="min-height:300px;max-height: 455px;overflow: auto;">
                    <form class="form-horizontal" id="newItemsForm">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <i class="fa fa-align-left"></i> <span id="rootName">参数组</span>
                                <input type="hidden" name="parentGroupId" value="-1">
                            </div>
                        </div>
                        <div class="form-group m-t-xs rightItem" style="clear:both;">
                            <div class="col-sm-4">
                                <input type="hidden" name="id"/>
                                <input type="text" name="groupCode" placeholder="编码" class="form-control"/>
                            </div>

                            <div class="col-sm-4">
                                <input type="text" name="groupName" placeholder="名称" class="form-control"/>
                            </div>
                            <div class="col-sm-3">
                                <input type="text" name="groupDesc" placeholder="说明" class="form-control"/>
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
                    <button type="button" class="btn btn-default" onclick="newItem();">新增</button>
                    <button type="button" class="btn btn-primary" onclick="saveItems();">
                        确认
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <div class="modal fade" id="itemEditDialogue" tabindex="-1" role="dialog"
         data-backdrop="false" data-show="false">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 600px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title">
                        信息修改
                    </h4>
                </div>
                <div class="modal-body" style="min-height:300px;max-height: 455px;overflow: auto;">
                    <form class="form-horizontal" id="itemEditForm">
                        <input type="hidden" name="id"/>
                        <div class="form-group m-t-xl">
                            <label class="col-sm-2 control-label">编码</label>
                            <div class="col-sm-8">
                                <input type="text" name="groupCode" placeholder="编码" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-8">
                                <input type="text" name="groupName" placeholder="名称" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">说明</label>
                            <div class="col-sm-8">
                                <input type="text" name="groupDesc" placeholder="说明" class="form-control"/>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="updateItem();">
                        确认
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
</div>

<script id="newItemTemplate" type="text/html">
    <div class="form-group m-t-xs rightItem" style="clear:both;">
        <div class="col-sm-4">
            <input type="hidden" name="id"/>
            <input type="text" name="groupCode" placeholder="编码" class="form-control"/>
        </div>

        <div class="col-sm-4">
            <input type="text" name="groupName" placeholder="名称" class="form-control"/>
        </div>
        <div class="col-sm-3">
            <input type="text" name="groupDesc" placeholder="说明" class="form-control"/>
        </div>
        <div class="col-sm-1">
            <a onclick="removeItem(this);"><i class="fa fa-trash"></i> </a>
        </div>
    </div>
</script>

<script id="columnCodeTemplate" type="text/html">
    <div class='cat-padding-{{treeLevel}}'>
        {{if hasChild == "1"}}
        {{if seqNo == "1"}}
        <a class='btn-expand'><i class='fa fa-folder-open'></i></a>
        {{else}}
        <a class='btn-expand'><i class='fa fa-folder'></i></a>
        {{/if}}
        {{else}}
        <a><i class='fa fa-file-o'></i></a>
        {{/if}}

        <a class="catName" data-alias-name="{{groupCode}}"><span>{{groupName}}</span></a>
    </div>
</script>

<script id="columnButtonsTemplate" type="text/html">
    <a class='btn btn-default btn-xs move_up' href="javascript:void(0);" data-id="{{id}}" data-parent-id="{{groupParentId}}"><i class='fa fa-long-arrow-up'></i></a>
    <a class='btn btn-default btn-xs move_down' href="javascript:void(0);" data-id="{{id}}" data-parent-id="{{groupParentId}}"><i class='fa fa-long-arrow-down'></i></a>
    <a class='btn btn-default btn-xs btn_new' href="javascript:void(0);" data-id="{{id}}" data-group-name="{{groupName}}">增加</a>
    <a class='btn btn-primary btn-xs btn_edit' href="javascript:void(0);" data-id="{{id}}" data-code="{{groupCode}}" data-name="{{groupName}}" data-memo="{{groupDesc}}">编辑</a>
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

        var setting = {
            check: {
                enable: false
            },
            data: {
                simpleData: {
                    enable: false
                }
            },
            callback: {
                onClick: function(event, treeId, treeNode){
                    $("input[name='root']").val(treeNode.aliasName);
                    mainDataTable.ajax.reload();
                }
            },
            async: {
                url: "${ctx}/backend/json/admin/parameterGroups/ztree",
                otherParam:{
                    include:true,
                    depth:0,
                    open:2
                },
                enable: true,
                type: "post"
            }
        };

        var zNodes = [
            {
                name: "父节点1", children: [
                {name: "子节点1"},
                {name: "子节点2"}
            ]
            }
        ];

        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, []);

        mainDataTable = $(".dataTables-example").on('init.dt', function () {
            $(".dataTables-example").on("click", ".move_up", function (element) {
                var id = $(this).attr("data-id");
                var parentId = $(this).attr("data-parent-id");

                var prevElement;
                var found = false;
                $(".move_up[data-parent-id='" + parentId + "']").each(function () {
                    if (found){
                        return;
                    }

                    var itemId = $(this).attr("data-id");
                    if (itemId == id){
                        found = true;
                    }
                    else{
                        prevElement = $(this);
                    }
                });

                if(!prevElement){
                    return;
                }

                exchangeSeqNo(id, $(prevElement).attr("data-id"));
            });
            $(".dataTables-example").on("click", ".move_down", function (element) {
                var id = $(this).attr("data-id");
                var parentId = $(this).attr("data-parent-id");

                var nextElement;
                var found = false;
                var nextIndex = -1;
                $(".move_down[data-parent-id='" + parentId + "']").each(function (index) {
                    if (found){
                        return;
                    }

                    var itemId = $(this).attr("data-id");
                    if (itemId == id){
                        nextIndex = index+1;
                    }
                    else if(nextIndex == index){
                        nextElement = $(this);
                        found = true;
                    }
                });

                if(!nextElement){
                    return;
                }

                exchangeSeqNo(id, $(nextElement).attr("data-id"));
            });

            $(".dataTables-example").on("click", ".btn_new", function (element) {
                $("#newItemsForm")[0].reset();
                $("#newItemsForm .form-group").each(function (index, element) {
                    if (index > 1) {
                        $(element).remove();
                    }
                });

                var parentId = $(this).attr("data-id");
                var parentName = $(this).attr("data-group-name");

                $("#newItemsForm input[name='parentGroupId']").val(parentId);
                $("#newItemsForm #rootName").text(parentName);

                $("#newItemsDialogue").modal("show");
            });

            $(".dataTables-example").on("click", ".btn_edit", function (element) {
                var id = $(this).attr("data-id");
                var code = $(this).attr("data-code");
                var name = $(this).attr("data-name");
                var memo = $(this).attr("data-memo");

                console.log(code);

                $("#itemEditForm input[name='id']").val(id);
                $("#itemEditForm input[name='groupCode']").val(code);
                $("#itemEditForm input[name='groupName']").val(name);
                $("#itemEditForm input[name='groupDesc']").val(memo);

                $("#itemEditDialogue").modal("show");
            });
        }).DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": false,
//            "scrollY": "600px",
            "scrollCollapse": true,
            "bFilter": false, //过滤功能 search 功能
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
                "data": "groupName"
            }, {
                "data": "groupCode"
            }, {
                "data": "memo",
                "bSortable": false
            }, {
                "data": "id",
                "bSortable": false
            }],
            "ajax": {
                "url": "${ctx}/backend/json/admin/parameterGroups",
                "type": "GET",
                dataType: "json",
                "data": {
                    include : true,
                    depth : 2,
                    root : function(){
                        var a = $("input[name='root']").val();
                        console.log("a=" + a);
                        return a;
                    }
                }
            },
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        return "<input type='checkbox' name='checkId' value=\"" + row.id + "\"/>";

                    }, "targets": 0
                }, {
                    "render": function (data, type, row) {
                        var html = template("columnCodeTemplate", row);
                        return html;

                    }, "targets": 2
                },
                {
                    "render": function (data, type, row) {
                        var html = template("columnButtonsTemplate", row);
                        return html;
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

        $(".dataTables-example").on("click", ".catName", function(){
            var root = $(this).attr("data-alias-name");
            console.log("alias name=" + root);
            $("input[name='root']").val(root);

            mainDataTable.ajax.reload();
        });
    });

    function initToolBarActions() {
        // 删除按钮
        $("#toolbar_delete").bind("click", function () {
            deleteItems();
        });

        // 新增
        $("#toolbar_new").bind("click", function () {
            $("#newItemsForm")[0].reset();
            $("#newItemsForm .form-group").each(function (index, element) {
                if (index > 1) {
                    $(element).remove();
                }
            });

            $("#newItemsForm input[name='parentGroupId']").val(${rootGroup.id});
            $("#newItemsForm #rootName").text("参数组");

            $("#newItemsDialogue").modal("show");
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
                            url: "${ctx}/backend/json/admin/parameterGroups/deleteItems",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    zTreeObj.reAsyncChildNodes(null, "refresh");

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

    function updateItem() {

        var id = $("#itemEditForm input[name='id']").val();
        var groupCode = $("#itemEditForm input[name='groupCode']").val();
        var groupName = $("#itemEditForm input[name='groupName']").val();
        var groupDesc = $("#itemEditForm input[name='groupDesc']").val();

        $.ajax({
            url: "${ctx}/backend/json/admin/parameterGroups/update",
            data: {
                id: id,
                groupCode: groupCode,
                groupName: groupName,
                groupDesc: groupDesc
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#itemEditDialogue").modal("hide");
                    toastSuccess("操作提示", "参数组修改成功！");
                    mainDataTable.ajax.reload();
                    zTreeObj.reAsyncChildNodes(null, "refresh");

                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }

    function saveItems() {

//        var formData = $("#rightInfoCreateForm").serializeArray();
//        var rootId = $("#rightInfoCreateForm input[name='rootId']").val();
//
//        console.log("rootId:" + rootId + ",formdata=" + JSON.stringify(formData));

        var params = [];
        var parentId = $("#newItemsForm").find("input[name='parentGroupId']").val();
        $("#newItemsForm .rightItem").each(function () {

            var groupCode = $(this).find("input[name='groupCode']").val();
            var groupName = $(this).find("input[name='groupName']").val();
            var groupDesc = $(this).find("input[name='groupDesc']").val();

            var param = {
                groupCode: groupCode,
                groupName: groupName,
                groupDesc: groupDesc
            };

            params.push(param);
        });
        var paramsStr = JSON.stringify(params);

        $.ajax({
            url: "${ctx}/backend/json/admin/parameterGroups/create",
            data: {
                parentId: parentId,
                parameterGroups: paramsStr
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#newItemsDialogue").modal("hide");
                    toastSuccess("操作提示", "设置成功！");
                    mainDataTable.ajax.reload();
                    zTreeObj.reAsyncChildNodes(null, "refresh");

                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }

    function newItem() {
        var html = template("newItemTemplate", []);
        $("#newItemsForm").append(html);
    }

    function removeItem(element) {
        $(element).parents(".form-group").remove();
    }

    function exchangeSeqNo(id1, id2){
        $.ajax({
            url: "${ctx}/backend/json/admin/parameterGroups/exchangeSeqNo",
            data: {
                id1 : id1,
                id2 : id2
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {

                    mainDataTable.ajax.reload();
                    zTreeObj.reAsyncChildNodes(null, "refresh");

                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }
</script>