<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>组织部门管理</title>
    <meta name="heading" content="<fmt:message key='roleList.heading'/>"/>
    <meta name="module-group" content="system-management"/>
    <meta name="module" content="system-departments"/>

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

        .padding-1 {
            padding-left: 0;
        }

        .padding-2 {
            padding-left: 20px;

        }

        .padding-3 {
            padding-left: 40px;

        }

        .padding-4 {
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
                <a href="${ctx}/backend/admin/roles.html">组织部门管理</a>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>组织部门管理</h5>
                    <div class="ibox-tools">
                        <a href="javascript:void(0);" id="toolbar_new">
                            <i class="fa fa-plus-circle"></i> 增加
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${ctx}/backend/admin/departments.html">刷新</a>
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
                                <th width="280">编码</th>
                                <th>名称</th>
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
    <div class="modal fade" id="departmentInfoDialogue" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         data-backdrop="false" data-show="false">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 800px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        添加部门信息
                    </h4>
                </div>
                <div class="modal-body" id="userForm" style="min-height:300px;max-height: 455px;overflow: auto;">
                    <form class="form-horizontal" id="departmentInfoCreateForm">
                        <input type="hidden" name="rootId" value="-1"/>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <i class="fa fa-align-left"></i> <span id="rootName">组织部门</span>
                            </div>
                        </div>
                        <div class="form-group m-t-xs rightItem" style="clear:both;">
                            <div class="col-sm-4">
                                <input type="hidden" name="id"/>
                                <input type="text" name="departmentCode" placeholder="编码" class="form-control"/>
                            </div>

                            <div class="col-sm-4">
                                <input type="text" name="departmentName" placeholder="名称" class="form-control"/>
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
                    <button type="button" class="btn btn-default" onclick="newDepartmentItem();">新增</button>
                    <button type="button" class="btn btn-primary" onclick="saveNewDepartments();">
                        确认
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <div class="modal fade" id="departmentInfoEditDialogue" tabindex="-1" role="dialog"
         data-backdrop="false" data-show="false">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 600px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title">
                        部门信息修改
                    </h4>
                </div>
                <div class="modal-body" style="min-height:300px;max-height: 455px;overflow: auto;">
                    <form class="form-horizontal" id="departmentInfoEditForm">
                        <input type="hidden" name="id"/>
                        <div class="form-group m-t-xl">
                            <label class="col-sm-2 control-label">编码</label>

                            <div class="col-sm-8">
                                <input type="text" name="departmentCode" placeholder="编码" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">名称</label>

                            <div class="col-sm-8">
                                <input type="text" name="departmentName" placeholder="名称" class="form-control"/>
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
                    <button type="button" class="btn btn-primary disabled" onclick="updateItemInfo();">
                        确认
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
</div>

<script id="departmentItemTemplate" type="text/html">
    <div class="form-group m-t-xs rightItem" style="clear:both;">
        <div class="col-sm-4">
            <input type="hidden" name="id"/>
            <input type="text" name="departmentCode" placeholder="编码" class="form-control"/>
        </div>

        <div class="col-sm-4">
            <input type="text" name="departmentName" placeholder="名称" class="form-control"/>
        </div>
        <div class="col-sm-3">
            <input type="text" name="memo" placeholder="说明" class="form-control"/>
        </div>
        <div class="col-sm-1">
            <a onclick="removeDepartmentItem(this);"><i class="fa fa-trash"></i> </a>
        </div>
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
            $(".dataTables-example").on("click", ".btn_new", function (element) {
                $("#departmentInfoCreateForm")[0].reset();
                $("#departmentInfoCreateForm .form-group").each(function (index, item) {
                    if (index > 1) {
                        $(item).remove();
                    }
                });

                var item = $(element)[0].target;
                console.log("a.id=" + $(item).attr("data-id"));
                console.log("a.name=" + $(item).attr("data-name"));

                $("#departmentInfoCreateForm input[name='rootId']").val($(item).attr("data-id"));
                $("#departmentInfoCreateForm #rootName").text($(item).attr("data-name"));

                $("#departmentInfoDialogue").modal("show");
            });

            $(".dataTables-example").on("click", ".btn_edit", function (element) {
                var id = $(this).attr("data-id");
                var code = $(this).attr("data-code");
                var name = $(this).attr("data-name");
                var memo = $(this).attr("data-memo");

                console.log(code);

                $("#departmentInfoEditForm input[name='id']").val(id);
                $("#departmentInfoEditForm input[name='departmentCode']").val(code);
                $("#departmentInfoEditForm input[name='departmentName']").val(name);
                $("#departmentInfoEditForm input[name='memo']").val(memo);

                $("#departmentInfoEditDialogue").modal("show");
            });

            $(".dataTables-example").on("click", ".btn_sort_up", function (element) {
                var id = $(this).attr("data-id");
                var parentId = $(this).attr("data-parent-id");

                var prevElement;
                var found = false;
                $(".btn_sort_up[data-parent-id='" + parentId + "']").each(function () {
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

                seqNoExchange(id, $(prevElement).attr("data-id"));

            });

            $(".dataTables-example").on("click", ".btn_sort_down", function (element) {
                var id = $(this).attr("data-id");
                var parentId = $(this).attr("data-parent-id");

                var nextElement;
                var found = false;
                var nextIndex = -1;
                $(".btn_sort_down[data-parent-id='" + parentId + "']").each(function (index) {
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

                seqNoExchange(id, $(nextElement).attr("data-id"));
            });
        }).DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": false,
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
                "data": "code"
            }, {
                "data": "name"
            }, {
                "data": "memo",
                "bSortable": false
            }, {
                "data": "id",
                "bSortable": false
            }],
            "ajax": {
                "url": "${ctx}/backend/json/admin/departments",
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
                        var html = "<div class='padding-" + row.treeLevel + "'>";
                        if (row.hasChild == "1") {
                            html += "<a class='btn-expand'><i class='fa fa-folder-open'></i></a> ";
                        }
                        else {
                            html += "<a><i class='fa fa-file-o'></i></a> ";
                        }

                        html += " <span>" + data + "</span>";
                        html += "</div>";
                        return html;

                    }, "targets": 2
                },
                {
                    "render": function (data, type, row) {
                        var buttons = "<a class='btn btn-default btn-xs btn_sort_up' href=\"javascript:void(0);\" data-id='" + row.id + "' data-parent-id='" + row.parentId + "'><i class='fa fa-long-arrow-up'></i></a>";
                        buttons += " <a class='btn btn-default btn-xs btn_sort_down' href=\"javascript:void(0);\" data-id='" + row.id + "' data-parent-id='" + row.parentId + "'><i class='fa fa-long-arrow-down'></i></a>";
                        buttons += " <a class='btn btn-default btn-xs btn_new' href=\"javascript:void(0);\" data-id='" + row.id + "' data-name='" + row.name + "'>增加</a>";
                        buttons += " <a class='btn btn-primary btn-xs btn_edit' href=\"javascript:void(0);\" data-id='" + row.id + "' data-code='" + row.code + "' data-name='" + row.name + "' data-memo='" + row.memo + "'>编辑</a>";
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

        $('#departmentInfoEditForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                departmentCode: {
                    message: '编码不能为空',
                    validators: {
                        notEmpty: {
                            message: '账号不能为空'
                        },
                        regexp: {
                            regexp: /^[a-z|A-Z|0-9|_|\-]*$/,
                            message: '仅限字母数字下划线以及中横线,不能含有空格'
                        }
                    }
                },
                departmentName: {
                    validators: {
                        notEmpty: {
                            message: '名称不能为空'
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {
//            e.preventDefault();
//            preSaveProcess();

            $('#departmentInfoEditForm .btn-primary').attr("disabled", false);
        });

        $('#departmentInfoEditForm .btn-primary').attr("disabled", false);
    });

    function initToolBarActions() {
        // 删除按钮
        $("#toolbar_delete").bind("click", function () {
            deleteItems();
        });

        // 新增
        $("#toolbar_new").bind("click", function () {
            $("#departmentInfoCreateForm")[0].reset();
            $("#departmentInfoCreateForm .form-group").each(function (index, element) {
                if (index > 1) {
                    $(element).remove();
                }
            });

            $("#departmentInfoCreateForm input[name='rootId']").val(${rootDepartment.id});
            $("#departmentInfoCreateForm #rootName").text("组织部门");

            $("#departmentInfoDialogue").modal("show");
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
                            url: "${ctx}/backend/json/admin/departments/deleteItems",
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

    function updateItemInfo() {

        var id = $("#departmentInfoEditForm input[name='id']").val();
        var departmentCode = $("#departmentInfoEditForm input[name='departmentCode']").val();
        var departmentName = $("#departmentInfoEditForm input[name='departmentName']").val();
        var memo = $("#departmentInfoEditForm input[name='memo']").val();

        $.ajax({
            url: "${ctx}/backend/json/admin/departments/update",
            data: {
                id: id,
                departmentCode: departmentCode,
                departmentName: departmentName,
                memo: memo
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#departmentInfoEditDialogue").modal("hide");
                    toastSuccess("操作提示", "部门设置成功！");
                    mainDataTable.ajax.reload();
                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }

    function saveNewDepartments() {
        var formData = $("#departmentInfoCreateForm").serializeArray();
        var rootId = $("#departmentInfoCreateForm input[name='rootId']").val();
        console.log("rootId=" + rootId);
        console.log("formdata=" + JSON.stringify(formData));
        /* var data = {};
         for(var i=0; i<formData.length; i++){
         var item = formData[i];
         data[item.name] = item.value;
         }*/
        $.ajax({
            url: "${ctx}/backend/json/admin/departments/create",
            data: formData,
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#departmentInfoDialogue").modal("hide");
                    toastSuccess("操作提示", "部门设置成功！");
                    mainDataTable.ajax.reload();
                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }

    function newDepartmentItem() {
        var html = template("departmentItemTemplate", []);
        $("#departmentInfoCreateForm").append(html);
    }

    function removeDepartmentItem(element) {
        $(element).parents(".form-group").remove();
    }

    function seqNoExchange(id1, id2){
        $.ajax({
            url: "${ctx}/backend/json/admin/departments/seqNoExchange",
            data: {
                id1 : id1,
                id2 : id2
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {

                    mainDataTable.ajax.reload();
                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }

</script>