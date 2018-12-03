<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>新闻管理</title>
    <meta name="heading" content="<fmt:message key='articleList.heading'/>"/>
    <meta name="module-group" content="column-management"/>
    <meta name="module-subgroup" content="column-${columnName}"/>
    <meta name="module" content="${categoryName}"/>

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
                <a>栏目管理</a>
            </li>
            <li>
                <a><fmt:message key="${columnMenu}"></fmt:message></a>
            </li>
            <li>
                <a><fmt:message key="${moduleMenu}"></fmt:message></a>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5><fmt:message key="${moduleMenu}"></fmt:message></h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="javascript:void(0);">
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
                                    <a id="toolbar_publish" href="javascript:void(0);">发布</a>
                                </li>
                                <li>
                                    <a id="toolbar_unpublish" href="javascript:void(0);">下架</a>
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
                                        <label for="categoryId">分类</label>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <select name="categoryId" class="form-control" id="categoryId">
                                                <%--<option value="">全部</option>--%>
                                                <c:forEach items="${articleCategoryList}" var="item">
                                                    <option value="${item.id}">${item.title}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-1 text-right">
                                        <label for="title">标题</label>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <input name="title" id="title" class="form-control" maxlength="30"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-1 text-right">
                                        <label for="editor">编辑人</label>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <input name="editor" id="editor" class="form-control" maxlength="60"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-1 text-right">
                                        <label>发布状态</label>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="checkbox-inline">
                                            <input type="checkbox" name="publishFlag" value="1" id="c1"/>
                                            <label for="c1" style="margin-top: 0;"> 已发布 </label>
                                        </div>
                                        <div class="checkbox-inline">
                                            <input type="checkbox" name="publishFlag" value="0" id="c2"/>
                                            <label for="c2" style="margin-top: 0;"> 未发布 </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-1 text-right">
                                        <label>发布日期</label>
                                    </div>
                                    <div class="col-lg-5">
                                        <div class="form-group">
                                            <div class="pull-left" style="width: 160px;">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </span>
                                                    <input type="text" name="publishDateStart" class="form-control datebox"
                                                           value="" style="width:110px;">
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
                                    <th width="150">首图</th>
                                    <th>标题</th>
                                    <th>分类</th>
                                    <th>作者</th>
                                    <th width="80">编辑信息</th>
                                    <th width="80">创建信息</th>
                                    <th width="80">修改信息</th>
                                    <th width="60">发布状态</th>
                                    <th>发布时间</th>
                                    <th width="60">访问次数</th>
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
            "columns": [{
                data: "id",
                class: "text-center",
                "bSortable": false
            }, {
                "data": "seqNo",
                class: "text-center",
                "bSortable": false
            }, {
                "data": "id",
                "bSortable": false
            }, {
                "data": "title"
            }, {
                "data": "categoryName",
                "bSortable": false
            }, {
                "data": "author"
            }, {
                "data": "lastEditDate"
            }, {
                "data": "createDate"
            }, {
                "data": "updateDate"
            }, {
                "data": "publishFlag"
            }, {
                "data": "publishDate"
            }, {
                "data": "hits",
                "bSortable": false
            }, {
                "data": "id",
                "bSortable": false
            }],
            "ajax": {
                <%--"url": "${ctx}/backend/json/cms/articles",--%>
                "url": "${ctx}/backend/json/column-${columnName}/articles",
                "type": "POST",
                "dataType": "json",
                "data": {
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
                    publishFlag: function () {
                        return $("input[name='publishFlag']:checked").checkvalues();
                    },
                    categoryName: "${categoryName}"
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
                        return "<div class='imageWrapper'><img class='img-responsive block-center' src=\"${ctx}/" + row.imageUrl + "\"/></div>";

                    }, "targets": 2
                },
                {
                    "render": function (data, type, row) {

                        return data + "<br/>" + "/" + "<br/>" + row.createBy;

                    }, "targets": 7
                },
                {
                    "render": function (data, type, row) {

                        return data + "<br/>" + "/" + "<br/>" + row.updateBy;

                    }, "targets": 8
                },
                {
                    "render": function (data, type, row) {
                        if (data == "1") {
                            return "<i class='fa fa-check'></i>";
                        }
                        return "";

                    }, "targets": 9
                },
                {
                    "render": function (data, type, row) {
                        if (row.publishFlag == "1") {
                            return data + "<br/>" + "/" + "<br/>" + row.publishBy;
                        } else {
                            return "";
                        }

                    }, "targets": 10
                },
                {
                    "render": function (data, type, row) {
                        return "<a class='btn btn-primary btn-xs' href='javascript:void(0);' onclick=\"openItem(" + row.id + ");\">编辑</a>";

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
        // 新增按钮
        $("#toolbar_new").bind("click", function () {
            location.href = "${ctx}/backend/column-${columnName}/${categoryName}/articleform";
        });

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

    }

    function openItem(itemId) {
        location.href = "${ctx}/backend/column-${columnName}/${categoryName}/articleform?id=" + itemId;
    }

    function action_reload() {
//        alert("action_reload()...");
        location.href = '${ctx}/backend/column-${columnName}/articles';
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

</script>
