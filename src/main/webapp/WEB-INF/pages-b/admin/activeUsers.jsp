<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>在线用户管理</title>
    <meta name="heading" content="<fmt:message key='userList.heading'/>"/>
    <meta name="module-group" content="system-management"/>
    <meta name="module" content="system-activeUsers"/>

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
                <strong>在线用户管理</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>在线用户管理</h5>
                    <div class="ibox-tools">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a id="toolbar_reload" href="javascript:void(0);">刷新</a>
                            </li>
                            <li>
                                <a id="toolbar_kickoff" href="javascript:void(0);">强制下线</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">
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
                                    <th width="40">头像</th>
                                    <th width="100">系统账号</th>
                                    <th width="80">其他平台账号</th>
                                    <th>姓名</th>
                                    <th>注册日期</th>
                                    <th>最近登录</th>
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

        mainDataTable = $(".dataTables-example").DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": false,
            "bPaginate": true,
//            "scrollY": "600px",
            "scrollCollapse": true,
            "bFilter": true, //过滤功能 search 功能
            "paging": true,
            "iDisplayLength": 25,
            "aLengthMenu": [25, 50, 100],
            "ordering": true,
            "order": [[3, "desc"]],
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
                "data": "accountName"
            }, {
                "data": "typeName",
                "bSortable": false
            }, {
                "data": "userName",
                "bSortable": false
            }, {
                "data": "registerDate"
            }, {
                "data": "lastVistDate"
            }, {
                "data": "id",
                "bSortable": false
            }],
            "ajax": {
                "url": "${ctx}/backend/json/admin/activeUsers",
                "type": "POST",
                "dataType": "json",
                "data": {
                    accountName: function () {
                        return $("input[name='accountName']").val();
                    },
                    userName: function () {
                        return $("input[name='userName']").val();
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
                        if (data) {
                            return "<div class='head-photo'>" +
                                    "<img class='img-responsive' src='" + data + "'/>" +
                                    "</div>";
                        }
                        else if(row.headPhotoQQ){
                            return "<div class='head-photo'>" +
                                    "<img class='img-responsive' src='" + row.headPhotoQQ + "'/>" +
                                    "</div>";
                        }
                        else if(row.headPhotoWeixin){
                            return "<div class='head-photo'>" +
                                    "<img class='img-responsive' src='" + row.headPhotoWeixin + "'/>" +
                                    "</div>";
                        }
                        else if(row.headPhotoWeibo){
                            return "<div class='head-photo'>" +
                                    "<img class='img-responsive' src='" + row.headPhotoWeibo + "'/>" +
                                    "</div>";
                        }
                        else {
                            return "";
                        }

                    }, "targets": 2
                },
                {
                    "render": function (data, type, row) {
                        if (row.nameQQ) {
                            return "<div class='type-name'>" +
                                    "<img class='img-responsive' src='${ctx}/b/resource/images/qq.png'/>" +
                                    "</div>" +
                                    "<div class='name'>" + row.nameQQ + "</span>";
                        }
                        else if (row.nameWeixin) {
                            return "<div class='type-name'>" +
                                    "<img class='img-responsive' src='${ctx}/b/resource/images/weixin.png'/>" +
                                    "</div>" +
                                    "<div class='name'>" + row.nameWeixin + "</span>";
                        }
                        else if (row.nameWeibo) {
                            return "<div class='type-name'>" +
                                    "<img class='img-responsive' src='${ctx}/b/resource/images/weibo.png'/>" +
                                    "</div>" +
                                    "<div class='name'>" + row.nameWeibo + "</span>";
                        } else {
                            return "";
                        }

                    }, "targets": 4
                },
                {
                    "render": function (data, type, row) {
//                        return "<a class='btn btn-primary btn-xs' href='javascript:void(0);' onclick=\"openItem(" + row.id + ");\">编辑</a>";
                        return "<a class='btn btn-primary btn-xs' href='${ctx}/backend/user/accountform?id=" + row.id + "'>编辑</a>";

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
    });

    function query() {
        mainDataTable.ajax.reload();
    }

    function initToolBarActions() {
        // 刷新按钮
        $("#toolbar_reload").bind("click", function () {
            query();
        });

        // 踢出用户按钮
        $("#toolbar_kickoff").bind("click", function () {
            kickoffUsers();
        });
    }

    function kickoffUsers() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要启用的账号");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认强制下线所选账号？",
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
                            url: "${ctx}/backend/json/admin/activeUsers/kickoff",
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
                                    toastSuccess("操作提示", "所选账号已强制下线！");
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

</script>
