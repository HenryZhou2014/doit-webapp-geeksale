<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="articleList.title"/></title>
    <meta name="heading" content="<fmt:message key='articleList.heading'/>"/>
    <meta name="module-group" content="content-management"/>
    <meta name="module" content="articles"/>

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
            max-height: 100px;
            width: 160px;
            overflow: hidden;
            margin-left: 10px;
        }

        .imageWrapper img {

        }

        .ibox-tools .dropdown-menu > li > a{
            line-height: 20px;
        }

        .form-group{
            margin-bottom: 5px;
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
                <a>网站管理</a>
            </li>
            <li class="active">
                <strong>文章管理</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>文章管理</h5>
                    <div class="ibox-tools">
                        <a href="${ctx}/backend/cms/articleform.html">
                            <i class="fa fa-file-o"></i> 增加
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${ctx}/backend/cms/articles.html">刷新</a>
                            </li>
                            <li>
                                <a id="toolbar_publish" href="javascript:void(0);">发布</a>
                            </li>
                            <li>
                                <a id="toolbar_unpublish" href="javascript:void(0);">下架</a>
                            </li>
                            <li>
                                <%--<!-- 按钮触发模态框 -->--%>
                                <%--<button class="btn btn-primary btn-lg" data-toggle="modal"--%>
                                <%--data-target="#myModal">--%>
                                <%--批量分类--%>
                                <%--</button>--%>
                                <a id="toolbar_updatecategory" href="javascript:void(0);">批量分类</a>
                            </li>
                            <li>
                                <a id="toolbar_delete" href="javascript:void(0);">删除</a>
                            </li>
                        </ul>
                        <a href="${ctx}/backend/cms/articleform.html">
                            <i class="fa fa-columns"></i> 布局
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-lg-2">
                            <div style="min-height: 300px;">
                                <ul id="treeDemo" class="ztree"></ul>
                            </div>
                        </div>
                        <div class="col-lg-10">

                            <div class="queryform">

                                <form id="productInfoform" class="form-horizontal" style="margin-bottom: 5px;">
                                    <input type="hidden" name="categoryId" id="categoryId"/>
                                    <div class="row">
                                        <div class="col-lg-1">
                                            <label for="title">标题</label>
                                        </div>
                                        <div class="col-lg-2">
                                            <div class="form-group">
                                                <input name="title" id="title" class="form-control" maxlength="30"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-1">
                                            <label for="editor">作者</label>
                                        </div>
                                        <div class="col-lg-2">
                                            <div class="form-group">
                                                <input name="editor" id="editor" class="form-control" maxlength="60"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-1">
                                            <label>状态</label>
                                        </div>
                                        <div class="col-lg-2">
                                            <div class="form-group">
                                                <select class="form-control">
                                                    <option value=""></option>
                                                    <option value="1">已发布</option>
                                                    <option value="2">未发布</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-1">
                                            <label>编辑日期</label>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <div class="pull-left" style="width: 160px;">
                                                    <div class="input-group">
                                                    <span class="input-group-addon"><i
                                                            class="fa fa-calendar"></i></span><input type="text"
                                                                                                     name="editDateStart"
                                                                                                     class="form-control datebox"
                                                                                                     value=""
                                                                                                     style="width:110px;">
                                                    </div>
                                                </div>
                                                <div class="pull-left">
                                                    ~
                                                </div>
                                                <div class="pull-left" style="width: 160px;">
                                                    <div class="input-group">
                                                    <span class="input-group-addon"><i
                                                            class="fa fa-calendar"></i></span><input type="text"
                                                                                                     name="editDateEnd"
                                                                                                     class="form-control datebox"
                                                                                                     value=""
                                                                                                     style="width:110px;">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-1">
                                            <label>发布日期</label>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <div class="pull-left" style="width: 160px;">
                                                    <div class="input-group">
                                                    <span class="input-group-addon"><i
                                                            class="fa fa-calendar"></i></span><input type="text"
                                                                                                     name="publishDateStart"
                                                                                                     class="form-control datebox"
                                                                                                     value=""
                                                                                                     style="width:110px;">
                                                    </div>
                                                </div>
                                                <div class="pull-left">
                                                    ~
                                                </div>
                                                <div class="pull-left" style="width: 160px;">
                                                    <div class="input-group">
                                                    <span class="input-group-addon"><i
                                                            class="fa fa-calendar"></i></span><input type="text"
                                                                                                     name="publishDateEnd"
                                                                                                     class="form-control datebox"
                                                                                                     value=""
                                                                                                     style="width:110px;">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-1">
                                            <button class="btn btn-primary btn-sm" type="button" onclick="query();">查询
                                            </button>
                                        </div>
                                    </div>

                                </form>

                                <hr style="margin-bottom: 10px; margin-top: 5px;"/>

                                <div class="panel">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover dataTables-example"
                                               width="100%">
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    批量更改文章分类
                </h4>
            </div>
            <div class="modal-body">
                <select name="categoryId" class="form-control" id="modalCategoryId">
                    <option value="">全部</option>
                    <c:forEach items="${articleCategoryList}" var="item">
                        <option value="${item.id}">${item.title}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="updateCategory();">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script id="articleInfoTemplate" type="text/html">
    {{if thumbImageUrl}}
    <div class='pull-right imageWrapper'>
        <img class='img-responsive block-center' src="{{thumbImageUrl}}"/>
    </div>
    {{/if}}

    <div>
        <h4>{{title}}</h4>
        <div>
            <ul class="nomargin nopadding list-unstyled">
                <li>
                    {{lastEditDate}}
                </li>
                <li>
                    由{{updateBy}}于{{updateDate}}最后编辑
                </li>
            </ul>
        </div>

    </div>
</script>

<script type="text/javascript">
    var mainDataTable;
    var zTreeObj;

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

        $('.datebox').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true,
            format: "yyyy/mm/dd"
        });

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
                    $("input[name='categoryId']").val(treeNode.id);
                    mainDataTable.ajax.reload();
                }
            },
            async: {
                url: "${ctx}/backend/json/articleCategories/ztree",
                otherParam:{
                    root: 'news',
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
            "order": [[8, "desc"]],
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
                {"data": "id",class: "text-center","bSortable": false,title:"<input type='checkbox' class='checkAll'' checkTarget='checkId'/>"},
                {"data": "seqNo",class: "text-center","bSortable": false, title: "#"},
                {"data": "id","bSortable": false, title:"标题"},
//                {"data": "title"},
                {"data": "categoryName","bSortable": false, title:"分类"},
                {"data": "author",title:"作者"},
                {"data": "lastEditDate",title:"编辑时间",style:"width:80px;", visible:false},
                {"data": "createDate",title:"创建信息",style:"width:80px;", visible:false},
                {"data": "updateDate",title:"修改信息",style:"width:80px;", visible:false},
                {"data": "publishFlag","bSortable": false,title:"状态",style:"width:80px;"},
                {"data": "publishDate",title:"发布信息"},
                {"data": "hits","bSortable": false,title:"访问次数", visible:false},
                {"data": "id","bSortable": false,titao:"操作"}
            ],
            "ajax": {
                url: "${ctx}/backend/json/cms/articles",
                type: "POST",
                dataType: "json",
                data: {
                    categoryId: function () {
                        return $("#categoryId").val();
                    },
                    title: function () {
                        return $("input[name='title']").val();
                    },
                    editor: function () {
                        return $("input[name='editor']").val();
                    },
                    publishDateStart: function () {
                        return $("input[name='publishDateStart']").val();
                    },
                    publishDateEnd: function () {
                        return $("input[name='publishDateEnd']").val();
                    },
                    editDateStart: function () {
                        return $("input[name='editDateStart']").val();
                    },
                    editDateEnd: function () {
                        return $("input[name='editDateEnd']").val();
                    },
                    publishStatus: function () {
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
                        var html = template("articleInfoTemplate", row);
                        return html;
//                        return "<div class='imageWrapper'><img class='img-responsive block-center' src=\"" + row.thumbImageUrl + "\"/></div>";

                    }, "targets": 2
                },
                {
                    "render": function (data, type, row) {

                        return data + "<br/>/<br/>" + row.createBy;

                    }, "targets": 6
                },
                {
                    "render": function (data, type, row) {

                        return data + "<br/>/<br/>" + row.updateBy;

                    }, "targets": 7
                },
                {
                    "render": function (data, type, row) {
                        if (data == "1") {
                            return "<i class='fa fa-check'></i>";
                        }
                        return "";

                    }, "targets": 8
                },
                {
                    "render": function (data, type, row) {
                        if (row.publishFlag == "1") {
                            return data + "<br/>/<br/>" + row.publishBy;
                        } else {
                            return "";
                        }

                    }, "targets": 9
                },
                {
                    "render": function (data, type, row) {
                        return "<a class='btn btn-primary btn-xs' href=\"articleform?id=" + row.id + "\">编辑</a>";

                    }, "targets": 11
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

        // 删除按钮
        $("#toolbar_delete").bind("click", function () {
            deleteItems();
        });

        // 发布
        $("#toolbar_publish").bind("click", function () {
            publishItems();
        });

        // 取消发布
        $("#toolbar_unpublish").bind("click", function () {
            unpublishItems();
        });

        // 分类更新
        $("#toolbar_updatecategory").bind("click", function () {
            updatecategoryItems();
        });

    }

    function deleteItems() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要删除的文章");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认删除所选文章？",
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
                            url: "${ctx}/backend/json/cms/articles/trash",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选文章已删除！");
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

    function unpublishItems() {
        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要取消发布的文章");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认取消发布所选文章？",
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
                            url: "${ctx}/backend/json/cms/articles/unpublish",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选文章已取消发布！");
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
            toastWarning("提示", "请选择要发布的文章");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认发布所选文章？",
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
                            url: "${ctx}/backend/json/cms/articles/publish",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选文章已发布！");
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

    function updatecategoryItems() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要更改分类的文章");
            return;
        }

        $('#myModal').modal('show');
    }
    function updateCategory() {
        var categoryId = $("#modalCategoryId[name='categoryId']").val();

        $.ajax({
            url: "${ctx}/backend/json/cms/articles/updateCategory",
            data: {
                checkId: function () {
                    return $("input[name='checkId']:checked").checkvalues();
                },
                categoryId:categoryId
            },
            success: function (data) {
                $('#myModal').modal('hide');
                if (data && data.flag == "1") {
                    mainDataTable.ajax.reload();
                    toastSuccess("操作提示", "所选文章已更改成功！");
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

</script>
