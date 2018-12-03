<%@ page import="com.doit.ecommerce.enums.DisplayType" %>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>销售分类管理</title>
    <meta name="heading" content="<fmt:message key='productCategoryList.heading'/>"/>
    <meta name="module-group" content="ecommerce-management"/>
    <meta name="module-subgroup" content="ecommerce-sale"/>
    <meta name="module" content="ecommerce-sale-category"/>

    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/font-awesome-zTree.css" type="text/css">

    <script src="${ctx}/resource/common/scripts/plugins/dataTables/datatables.min.js"></script>
    <script src="${ctx}/resource/common/scripts/plugins/jeditable/jquery.jeditable.js"></script>
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

        .bootstrap-dialog.type-primary .modal-header {
            background-color: #18a689;
        }

        .sub_category_title {
            padding-left: 30px;
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

        .cat-padding-5 {
            padding-left: 80px;

        }

        .cat-padding-6 {
            padding-left: 100px;

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
                <a>书城管理</a>
            </li>
            <li>
                <a>销售管理</a>
            </li>
            <li class="active">
                <strong>销售分类管理</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">


            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>销售分类管理</h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="javascript:void(0);">
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
                                <a id="toolbar_delete" href="javascript:void(0);">删除</a>
                            </li>
                            <li>
                                <a id="toolbar_publish" href="javascript:void(0);">发布</a>
                            </li>
                            <li>
                                <a id="toolbar_unpublish" href="javascript:void(0);">下架</a>
                            </li>
                            <li>
                                <a id="toolbar_update_cache" href="javascript:void(0);">更新缓存</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="pull-left" style="width:220px;">
                        <ul id="treeDemo" class="ztree"></ul>
                    </div>

                    <div class="panel">
                        <div class="table-responsive">
                            <input type="hidden" name="root" value=""/>

                            <table class="table table-striped table-bordered table-hover dataTables-example"
                                   width="100%">
                                <thead>
                                <tr>
                                    <th width="20">
                                        <input type="checkbox" class="checkAll" checkTarget="checkId"/>
                                    </th>
                                    <th width="25">#</th>
                                    <th>名称</th>
                                    <th>编号</th>
                                    <th>属性定义</th>
                                    <th>发布状态</th>
                                    <th>创建信息</th>
                                    <th>备注</th>
                                    <th width="140">操作</th>
                                </tr>
                                </thead>

                            </table>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                </div>
            </div>
        </div>
    </div>

</div>

<div class="modal fade" id="newItemDialogue" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     data-backdrop="false" data-show="false">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 800px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加分类信息
                </h4>
            </div>
            <div class="modal-body" id="userForm" style="min-height:300px;max-height: 455px;overflow: auto;">
                <form class="form-horizontal" id="newItemForm">
                    <input type="hidden" name="parentId" value=""/>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <i class="fa fa-align-left"></i> <span id="rootName">商品分类</span>
                        </div>
                    </div>
                    <div class="form-group m-t-xs newItemBlock" style="clear:both;">
                        <div class="col-sm-4">
                            <input type="hidden" name="id"/>
                            <input type="text" name="aliasName" placeholder="编码" class="form-control"/>
                        </div>

                        <div class="col-sm-4">
                            <input type="text" name="title" placeholder="名称" class="form-control"/>
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
                <button type="button" class="btn btn-default" onclick="newItem();">新增</button>
                <button type="button" class="btn btn-primary" onclick="saveNewItems();">
                    确认
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<div class="modal fade" id="itemEditDialogue" tabindex="-1" role="dialog"
     data-backdrop="false" data-show="false">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 600px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    分类信息修改
                </h4>
            </div>
            <div class="modal-body" style="min-height:300px;max-height: 455px;overflow: auto;">
                <form class="form-horizontal" id="itemInfoEditForm">
                    <input type="hidden" name="id"/>
                    <div class="form-group m-t-xl">
                        <label class="col-sm-2 control-label">编码</label>

                        <div class="col-sm-8">
                            <input type="text" name="aliasName" placeholder="编码" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">名称</label>

                        <div class="col-sm-8">
                            <input type="text" name="title" placeholder="名称" class="form-control"/>
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
                <button type="button" class="btn btn-primary" onclick="updateItemInfo();">
                    确认
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<div class="modal fade" id="paramsEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     data-backdrop="false" data-show="false">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 800px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    属性定义
                </h4>
            </div>
            <div class="modal-body" style="min-height:300px;max-height: 455px;overflow: auto;">
                <div class="row">
                    <div class="col-sm-12">
                        <i class="fa fa-align-left"></i> <span>商品分类</span>
                    </div>
                </div>
                <div class="row">
                    <table class="table">
                        <th>
                            <td>编号</td>
                            <td>属性名</td>
                            <td>显示类型</td>
                            <td>说明</td>
                        </th>
                    </table>
                </div>
                <form class="form-horizontal" id="paramsEditForm">

                    <div class="form-group m-t-xs newItemBlock" style="clear:both;">
                        <div class="col-sm-2">
                            <input type="hidden" name="id"/>
                            <input type="text" name="propertyNo" placeholder="编码" class="form-control"/>
                        </div>

                        <div class="col-sm-3">
                            <input type="text" name="propertyName" placeholder="属性名" class="form-control"/>
                        </div>
                        <div class="col-sm-3">
                            <div class="row">
                                <div class="col-sm-4">
                                    <label class="control-label text-right">显示</label>
                                </div>
                                <div class="col-sm-8" style="padding-left:0">
                                    <select name="displayType" class="form-control">
                                        <option value="<%=DisplayType.INPUT.getCode()%>"><%=DisplayType.INPUT.getName()%></option>
                                        <option value="<%=DisplayType.SELECT.getCode()%>"><%=DisplayType.SELECT.getName()%></option>
                                    </select>
                                </div>
                            </div>
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
                <button type="button" class="btn btn-default" onclick="newParamItem();">新增</button>
                <button type="button" class="btn btn-primary" onclick="saveParamItems();">
                    确认
                </button>
            </div>
        </div><!-- /属性定义.modal-content -->
    </div><!-- /属性定义.modal-dialog -->
</div>


<script id="newItemTemplate" type="text/html">
    <div class="form-group m-t-xs newItemBlock" style="clear:both;">
        <div class="col-sm-4">
            <input type="hidden" name="id"/>
            <input type="text" name="aliasName" placeholder="编码" class="form-control"/>
        </div>

        <div class="col-sm-4">
            <input type="text" name="title" placeholder="名称" class="form-control"/>
        </div>
        <div class="col-sm-3">
            <input type="text" name="memo" placeholder="说明" class="form-control"/>
        </div>
        <div class="col-sm-1">
            <a onclick="removeItemTemplate(this);"><i class="fa fa-trash"></i> </a>
        </div>
    </div>
</script>

<%--属性定义模板--%>
<script id="newParamItemTemplate" type="text/html">
    <div class="form-group m-t-xs newItemBlock" style="clear:both;">
        <div class="col-sm-2">
            <input type="hidden" name="id"/>
            <input type="text" name="aliasName" placeholder="编码" class="form-control"/>
        </div>

        <div class="col-sm-3">
            <input type="text" name="title" placeholder="属性名" class="form-control"/>
        </div>
        <div class="col-sm-3">
            <div class="row">
                <div class="col-sm-4">
                    <label class="control-label text-right">显示</label>
                </div>
                <div class="col-sm-8" style="padding-left:0">
                    <select name="propertyName" class="form-control">
                        <option value="<%=DisplayType.INPUT.getCode()%>"><%=DisplayType.INPUT.getName()%></option>
                        <option value="<%=DisplayType.SELECT.getCode()%>"><%=DisplayType.SELECT.getName()%></option>
                    </select>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <input type="text" name="memo" placeholder="说明" class="form-control"/>
        </div>
        <div class="col-sm-1">
            <a onclick="removeItemTemplate(this);"><i class="fa fa-trash"></i> </a>
        </div>
    </div>
</script>

<script id="columnNameTemplate" type="text/html">
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

        <a class="catName" data-alias-name="{{aliasName}}"><span>{{title}}</span></a>
    </div>
</script>

<script id="columnStatusTemplate" type="text/html">
    <div>
        {{if publishFlag == '1'}}
        <div>
            <a title="已发布">
                <i class="fa fa-check text-success"></i> 已发布
            </a>
        </div>
        {{/if}}
    </div>
</script>

<script type="text/javascript">
    var mainDataTable;
    var zTreeObj;

    $(document).ready(function () {
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

        // 工具栏按钮事件绑定
        initToolBarActions();

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
                url: "${ctx}/backend/json/goodsSaleCategories/ztree",
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

            $(".dataTables-example").on("click", ".btn_new", function (element) {
                $("#newItemForm")[0].reset();
                $("#newItemForm .form-group").each(function (index, item) {
                    if (index > 1) {
                        $(item).remove();
                    }
                });

                var item = $(element)[0].target;
                console.log("a.id=" + $(item).attr("data-id"));
                console.log("a.name=" + $(item).attr("data-name"));

                $("#newItemForm input[name='parentId']").val($(item).attr("data-id"));
                $("#newItemForm #rootName").text($(item).attr("data-name"));

                $("#newItemDialogue").modal("show");

            });

            $(".dataTables-example").on("click", ".btn_edit", function (element) {
                var id = $(this).attr("data-id");
                var code = $(this).attr("data-code");
                var name = $(this).attr("data-name");
                var memo = $(this).attr("data-memo");

                console.log(code);

                $("#itemInfoEditForm input[name='id']").val(id);
                $("#itemInfoEditForm input[name='aliasName']").val(code);
                $("#itemInfoEditForm input[name='title']").val(name);
                $("#itemInfoEditForm input[name='memo']").val(memo);

                $("#itemEditDialogue").modal("show");
            });

            $(".dataTables-example").on("click", ".btn_params_edit", function (element) {
//                $("#paramsEditForm")[0].reset();
//                $("#paramsEditForm .form-group").each(function (index, item) {
//                    if (index > 1) {
//                        $(item).remove();
//                    }
//                });
//
//                var item = $(element)[0].target;
//                console.log("a.id=" + $(item).attr("data-id"));
//                console.log("a.name=" + $(item).attr("data-name"));
//
//                $("#paramsEditForm input[name='parentId']").val($(item).attr("data-id"));
//                $("#paramsEditForm #rootName").text($(item).attr("data-name"));
//
//                $("#paramsEditDialog").modal("show");

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
            "iDisplayLength": 50,
            "aLengthMenu": [50, 100, 150],
            "ordering": false,
//            "order": [[1, "asc"]],
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
            "columns": [
                {"data": "id", class: "text-center", "bSortable": false},
                {"data": "seqNo", class: "text-center", "bSortable": false},
                {"data": "title", "bSortable": false},
                {"data": "aliasName", "bSortable": false},
                {"data": "id"},
                {"data": "publishFlag"},
                {"data": "id"},
                {"data": "memo", "bSortable": false},
                {"data": "id", "bSortable": false}
            ],
            "ajax": {
                "url": "${ctx}/backend/json/ecommerce/product/goodsSaleCategories",
                "type": "GET",
                "dataType": "json",
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
                        var html = template("columnNameTemplate", row);

                        return html;

                    }, "targets": 2
                },
                {
                    "render": function (data, type, row) {
                        var html = "<a class='btn btn-default btn-xs btn_params_edit' href='${ctx}/backend/ecommerce/product/categoryProperties?cpid=" + row.id + "'>属性定义</a>";
                        return html;

                    }, "targets": 4
                },{
                    "render": function (data, type, row) {
                        console.log(row.publishFlag);
                        var html = template("columnStatusTemplate", row);
                        return html;

                    }, "targets": 5
                },{
                    "render": function (data, type, row) {

                        return row.createDate;

                    }, "targets": 6
                }, {
                    "render": function (data, type, row) {
                        var buttons = "<a class='btn btn-default btn-xs btn_sort_up' href=\"javascript:void(0);\" data-id='" + row.id + "' data-parent-id='" + row.parentId + "'><i class='fa fa-long-arrow-up'></i></a>";
                        buttons += " <a class='btn btn-default btn-xs btn_sort_down' href=\"javascript:void(0);\" data-id='" + row.id + "' data-parent-id='" + row.parentId + "'><i class='fa fa-long-arrow-down'></i></a>";
                        buttons += " <a class='btn btn-default btn-xs btn_new' href=\"javascript:void(0);\" data-id='" + row.id + "' data-name='" + row.title + "'>增加</a>";
                        buttons += " <a class='btn btn-primary btn-xs btn_edit' href=\"javascript:void(0);\" data-id='" + row.id + "' data-code='" + row.aliasName + "' data-name='" + row.title + "' data-memo='" + row.memo + "'>编辑</a>";
                        return buttons;

                    }, "targets": 8
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

        $("#toolbar_new").bind("click", function(){
            $("#newItemForm")[0].reset();
            $("#newItemForm .form-group").each(function (index, item) {
                if (index > 1) {
                    $(item).remove();
                }
            });

            $("#newItemForm input[name='parentId']").val("");
            $("#newItemForm #rootName").text("分类");

            $("#newItemDialogue").modal("show");
        });

        // Add event listener for opening and closing details
        $('#example tbody').on('click', 'td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = table.row( tr );

            if ( row.child.isShown() ) {
                // This row is already open - close it
                row.child.hide();
                tr.removeClass('shown');
            }
            else {
                // Open this row
                row.child( format(row.data()) ).show();
                tr.addClass('shown');
            }
        } );

        $(".dataTables-example").on("click", ".catName", function(){
            var root = $(this).attr("data-alias-name");
            console.log("alias name=" + root);
            $("input[name='root']").val(root);

            mainDataTable.ajax.reload();
        });
    });

    function initToolBarActions() {

        // 刷新按钮
        $("#toolbar_reload").bind("click", function () {
            action_reload();
        });
        // 发布按钮
        $("#toolbar_publish").bind("click", function () {
            publishItems();
        });
        // 取消发布按钮
        $("#toolbar_unpublish").bind("click", function () {
            unpublishItems();
        });
        // 删除按钮
        $("#toolbar_delete").bind("click", function () {
            deleteItems();
        });
        // 更新缓存按钮
        $("#toolbar_update_cache").bind("click", function () {
            updateCache();
        });
    }

    function unpublishItems() {
        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要取消发布的分类");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认取消发布所选分类？",
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
                            url: "${ctx}/backend/json/ecommerce/product/goodsSaleCategories/unpublish",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选分类已取消发布！");
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

    function publishItems() {
        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要发布的分类");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认发布所选分类？",
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
                            url: "${ctx}/backend/json/ecommerce/product/goodsSaleCategories/publish",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选分类已发布！");
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
            message: "确认删除所选项？",
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
                            url: "${ctx}/backend/json/ecommerce/product/goodsSaleCategories/deleteItems",
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
                                    toastError("操作提示", data.msg);
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

    function action_reload() {
        mainDataTable.ajax.reload();
    }

    function seqNoExchange(id1, id2) {
        $.ajax({
            url: "${ctx}/backend/json/ecommerce/product/goodsSaleCategories/seqNoExchange",
            data: {
                id1: id1,
                id2: id2
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

    //使用属性模板添加一个新属性
    function newParamItem() {
        var html = template("newParamItemTemplate", []);
        $("#paramsEditForm").append(html);
    }

    function newItem() {
        var html = template("newItemTemplate", []);
        $("#newItemForm").append(html);
    }

    function saveNewItems() {
        var formData = $("#newItemForm").serializeArray();
        var parentId = $("#newItemForm input[name='parentId']").val();
        console.log("parentId=" + parentId);
        console.log("formdata=" + JSON.stringify(formData));
        /* var data = {};
         for(var i=0; i<formData.length; i++){
         var item = formData[i];
         data[item.name] = item.value;
         }*/
        $.ajax({
            url: "${ctx}/backend/json/ecommerce/product/goodsSaleCategories/create",
            data: formData,
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#newItemDialogue").modal("hide");
                    toastSuccess("操作提示", "分类信息设置成功！");
                    mainDataTable.ajax.reload();
                    zTreeObj.reAsyncChildNodes(null, "refresh");

                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }

    //保存属性定义
    function saveParamItems() {
        var formData = $("#paramsEditForm").serializeArray();
        console.log("formdata=" + JSON.stringify(formData));
        $.ajax({
            url: "${ctx}/backend/json/ecommerce/product/productCategorieParams/create",
            data: formData,
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#paramsEditDialog").modal("hide");
                    toastSuccess("操作提示", "分类信息设置成功！");
                    mainDataTable.ajax.reload();
                    zTreeObj.reAsyncChildNodes(null, "refresh");

                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }


    function removeItemTemplate(element) {
        $(element).parents(".form-group").remove();
    }

    function updateItemInfo() {

        var id = $("#itemInfoEditForm input[name='id']").val();
        var aliasName = $("#itemInfoEditForm input[name='aliasName']").val();
        var title = $("#itemInfoEditForm input[name='title']").val();
        var memo = $("#itemInfoEditForm input[name='memo']").val();

        $.ajax({
            url: "${ctx}/backend/json/ecommerce/product/goodsSaleCategories/update",
            data: {
                id: id,
                aliasName: aliasName,
                title: title,
                memo: memo
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#itemEditDialogue").modal("hide");
                    toastSuccess("操作提示", "分类信息设置成功！");
                    mainDataTable.ajax.reload();
                    zTreeObj.reAsyncChildNodes(null, "refresh");

                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }
    function updateCache() {

        $.ajax({
            url: "${ctx}/backend/ecommerce/product/goodsSaleCategories/updateCache.json",
            data: {},
            success: function (data) {

                if (data && data.flag == "1") {
                    toastInfo("分类缓存已更新！")
                }
                else if (data && data.flag == "0") {
                    toastError("操作提示", data.msg);
                }
                else {
                    toastError("操作提示", "分类缓存更新失败！");
                }
            }
        });

    }
</script>

