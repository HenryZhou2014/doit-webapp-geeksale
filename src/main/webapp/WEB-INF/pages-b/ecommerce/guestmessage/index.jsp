<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>预约订货管理</title>
    <meta name="heading" content="<fmt:message key='articleList.heading'/>"/>
    <meta name="module-group" content="ecommerce-management"/>
    <meta name="module" content="ecommerce-preorder"/>

    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">

    <script src="${ctx}/resource/common/scripts/plugins/dataTables/datatables.min.js"></script>
    <script src="${ctx}/resource/common/scripts/plugins/jeditable/jquery.jeditable.js"></script>

    <style type="text/css">
        table.dataTables-example {
            font-size: 13px;
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
                <a>商城管理</a>
            </li>
            <li class="active">
                <strong>预约订货管理</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>预约订货管理</h5>
                    <div class="ibox-tools">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${ctx}/backend/guestMessages.html">刷新</a>
                            </li>
                            <li>
                                <a id="toolbar_delete" href="javascript:void(0);"">删除</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-lg-12 queryform">
                            <form id="guestMessageSearch" class="form-horizontal" style="margin-bottom: 5px;">
                                <div class="row">
                                    <div class="col-lg-1 text-right">
                                        <label for="search_visitorName">称呼</label>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <input name="visitorName" id="search_visitorName" class="form-control" maxlength="30"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-1 text-right">
                                        <label for="search_email">电子邮件</label>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <input name="email" id="search_email" class="form-control" maxlength="60"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-1 text-right">
                                        <label for="search_phoneNum">联系电话</label>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <input name="phoneNum" id="search_phoneNum" class="form-control" maxlength="60"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-1 text-right">
                                        <label for="search_companyName">单位名称</label>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <input name="companyName" id="search_companyName" class="form-control" maxlength="60"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-1 text-right">
                                        <label>下约日期</label>
                                    </div>
                                    <div class="col-lg-5">
                                        <div class="form-group">
                                            <div class="pull-left" style="width: 160px;">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i
                                                            class="fa fa-calendar"></i></span><input type="text"
                                                                                                     name="startDate"
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
                                                                                                     name="endDate"
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
                                    <th width="100">预定日期</th>
                                    <th width="150">称呼</th>
                                    <th>电子邮件</th>
                                    <th>联系电话</th>
                                    <th>单位名称</th>
                                    <th>单位地址</th>
                                    <th>内容数量</th>
                                    <th width="100">编辑</th>
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
<!-- 模态框（Modal） -->
<div class="modal fade" id="guestMessageModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改预约订货信息
                </h4>
            </div>
            <div class="modal-body">
                <form id="form" class="form-horizontal" action="${ctx}/readership/order-book" method="post">
                    <c:if test="${error != null}">
                        <div class="alert alert-mini alert-danger margin-bottom-30"><!-- DANGER -->
                            <strong>错误!</strong> 必须填写完整的预约单信息.
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">称呼</label>
                        <div class="col-sm-10">
                            <input type="text" id="visitorName" name="visitorName" class="form-control required" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电子邮件</label>
                        <div class="col-sm-10">
                            <input type="text" id="email" name="email" class="form-control required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">联系电话</label>
                        <div class="col-sm-10">
                            <input type="text" id="phoneNum" name="phoneNum" class="form-control required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">单位名称</label>
                        <div class="col-sm-10">
                            <input type="text" id="companyName" name="companyName" class="form-control required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">单位地址</label>
                        <div class="col-sm-10">
                            <input type="text" id="address" name="address" class="form-control required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">内容数量</label>
                        <div class="col-sm-10">
                            <textarea id="content" name="content" class="form-control required" style="height: 80px;"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="editGuestMessage();">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script id="columnButtonsTemplate" type="text/html">
    <div style="width:140px;">
        <button class="btn btn-primary btn-sm" type="button" onclick="showEditGuestMessageModal({{id}})">
            <i class="fa fa-edit icon-center"></i>&nbsp;编辑
        </button>
        <button class="btn btn-primary btn-sm" type="button" onclick="deleteGuestMessage({{id}})">
            <i class="fa fa-trash-o icon-center"></i>&nbsp;删除
        </button>
    </div>
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
            "ordering": false,
            "rowId":"id",
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
                "data": "id",
                class: "text-center",
                "bSortable": false
            }, {
                "data": "id",
                "bSortable": false,
                "visible":false
            }, {
                "data": "createDate",
                "width":"100px"
            }, {
                "data": "visitorName"
            },{
                "data": "email"
            }, {
                "data": "phoneNum",
            }, {
                "data": "companyName"
            }, {
                "data": "address"
            }, {
                "data": "content"
            }, {
                "data": "id"
            }],
            "ajax": {
                url: "${ctx}/backend/ecommerce/guestMessage/items.json",
                type: "POST",
                dataType: "json",
                data: {
                    visitorName: function () {
                        return $("#search_visitorName").val();
                    },
                    email: function () {
                        return $("#search_email").val();
                    },
                    phoneNum: function () {
                        return $("#search_phoneNum").val();
                    },
                    companyName: function () {
                        return $("#search_companyName").val();
                    },
                    startDate: function () {
                        return $("input[name='startDate']").val();
                    },
                    endDate: function () {
                        return $("input[name='endDate']").val();
                    }
                }
            },
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        return "<input type='checkbox' name='checkId' value=\"" + row.id + "\"/>";

                    }, "targets": 0
                },{
                    "render": function (data, type, row) {
                        var html = template("columnButtonsTemplate", row);
                        return html;
                    }, "targets": 9
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

    }

    function deleteItems() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要删除的预约订货单");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认删除所选预约货单？",
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
                            url: "${ctx}/backend/json/ecommerce/guestMessages/trash",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选预约货单已删除！");
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

    var currentGuestMessageId;
    function showEditGuestMessageModal(id) {
        var row = mainDataTable.row('#'+id).data();


        $("#visitorName").val(row.visitorName);
        $("#phoneNum").val(row.phoneNum);
        $("#email").val(row.email);
        $("#companyName").val(row.companyName);
        $("#address").val(row.address);
        $("#content").val(row.content);

        currentGuestMessageId = row.id;

        $("#guestMessageModal").modal('show');
    }

    function editGuestMessage() {
        if(!currentGuestMessageId){
            toastError("操作提示", "修改信息失败！");
        }

        const visitorName = $("#visitorName").val();
        const phoneNum = $("#phoneNum").val();
        const email = $("#email").val();
        const companyName = $("#companyName").val();
        const address = $("#address").val();
        const content = $("#content").val();

        $.ajax({
            url: "${ctx}/backend/json/ecommerce/guestMessage/edit",
            data: {
                id:currentGuestMessageId,
                visitorName:visitorName,
                phoneNum:phoneNum,
                email:email,
                companyName:companyName,
                address:address,
                content:content
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#guestMessageModal").modal('hide');
                    mainDataTable.ajax.reload();
                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });

    }

    function deleteGuestMessage(id) {
        if(!id){
            toastError("操作提示", "删除失败，可能该信息已不存在！");
            return;
        }
        $.ajax({
            url: "${ctx}/backend/json/ecommerce/guestMessage/trash",
            data: {
                id:id
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    mainDataTable.ajax.reload();
                } else {
                    toastError("操作提示", "删除失败");
                }
            }
        });
    }
</script>
