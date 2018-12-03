<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>客户查询</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="menu-item-group" content="03"/>
    <meta name="menu-item-module" content="0320"/>

    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">

    <script src="${ctx}/resource/common/scripts/plugins/dataTables/datatables.min.js"></script>
    <style type="text/css">

    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <div class="pull-right">
                <a href="${ctx}/usercenter/newMemberApply" class="btn btn-success btn-sm"><i class="fa fa-user"></i> 客户开户申请</a>
            </div>

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#tab1" data-toggle="tab">我的客户</a></li>
                <li><a href="#tab2" data-toggle="tab">申请中</a></li>
            </ul>

            <div class="tab-content margin-top-20">
                <div class="tab-pane fade in active" id="tab1">
                    <div>
                        <div class="form-inline">
                            <input type="text" name="queryAccountName" class="form-control width-200" id="queryAccountName"/>
                            <button class="btn btn-default btn-query">查询</button>
                        </div>
                    </div>

                    <div class="table-responsive margin-top-10">
                        <table class="table table-striped table-bordered table-hover dataTables-example table-mymember" width="100%">
                        </table>
                    </div>
                </div>

                <div class="tab-pane fade in" id="tab2">
                    <div class="table-responsive margin-top-10">
                        <table class="table table-striped table-bordered table-hover dataTables-example table-mymember-apply" width="100%">
                        </table>
                    </div>
                </div>

            </div>
        </div>
        <!-- LEFT -->
        <div class="col-lg-2 col-md-2 col-sm-3 col-lg-pull-10 col-md-pull-10 col-sm-pull-7">
            <jsp:include page="/app/usercenter/userCenterMenu"/>
        </div>
    </div>
</section>

<script id="statusColumnTemplate" type="text/html">
    {{if accountEnabled == '1'}}
    <i class="fa fa-check text-success"></i>
    {{else if accountEnabled == '0'}}
    <i class="fa fa-ban text-danger"></i>
    {{/if}}
</script>

<script id="applyStatusColumnTemplate" type="text/html">
    {{if accountState == '20'}}
    申请中
    {{else if accountState == '2091'}}
    拒绝
    {{/if}}
</script>

<script type="text/javascript">

    var memberDataTable;
    var memberApplyDataTable;
    $(document).ready(function () {
        $(".btn-query").click(function(){
            memberDataTable.ajax.reload();
        });

        // 公司列表
        memberDataTable = $(".table-mymember").DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": true,
//            "scrollY": "600px",
            "scrollCollapse": true,
            "bFilter": false, //过滤功能 search 功能
            "paging": false,
            "iDisplayLength": 25,
            "aLengthMenu": [25, 50, 100],
            "ordering": false,
            "order": [[1, "desc"]],
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
                {"data": "seqNo", "bSortable": false, visible: true, title: "#"},
                {"data": "accountName", "bSortable": false, title: "手机号"},
                {"data": "userName", "bSortable": false, title: "姓名"},
                {"data": "companyName", "bSortable": false, title: "公司信息"},
//                {"data": "linkPerson",title:"联系人"},
//                {"data": "phoneNumber",title:"联系方式"},
                {"data": "createDate", title: "注册时间"},
                {"data": "expireDate", title: "到期时间"},
                {"data": "companyNumber", title: "公司数量"},
                {"data": "accountNumber", title: "账号数量"},
                {"data": "accountEnabled", title: "状态"}
            ],
            "ajax": {
                url: "${ctx}/usercenter/myMember/accountList",
                type: "POST",
                dataType: "json",
                data: {
                    userName: function () {
                        return $("#queryAccountName").val();
                    },
                    accountState: function () {
                        return ["2090"];
                    }
                }
            },
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        var html = template("statusColumnTemplate", row);
                        return html;
                    }, "targets": 8
                }
            ]
        });

        // 申请开户列表
        memberApplyDataTable = $(".table-mymember-apply").DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": true,
//            "scrollY": "600px",
            "scrollCollapse": true,
            "bFilter": false, //过滤功能 search 功能
            "paging": false,
            "iDisplayLength": 25,
            "aLengthMenu": [25, 50, 100],
            "ordering": false,
            "order": [[1, "desc"]],
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
                {"data": "seqNo", "bSortable": false, visible: true, title: "#"},
                {"data": "accountName", "bSortable": false, title: "手机号"},
                {"data": "userName", "bSortable": false, title: "姓名"},
                {"data": "companyName", "bSortable": false, title: "公司信息"},
//                {"data": "linkPerson",title:"联系人"},
//                {"data": "phoneNumber",title:"联系方式"},
                {"data": "createDate", title: "注册时间"},
                {"data": "expireDate", title: "到期时间"},
//                {"data": "companyNumber",title:"公司数量"},
//                {"data": "accountNumber",title:"账号数量"},
                {"data": "id", "bSortable": false, title: "状态"}
            ],
            "ajax": {
                url: "${ctx}/usercenter/myMember/accountList",
                type: "POST",
                dataType: "json",
                data: {
                    accountState: function () {
                        return ["20", "2091"];
                    }
                }
            },
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        var html = template("applyStatusColumnTemplate", row);
                        return html;
                    }, "targets": 6
                }
            ]
        });
    });

</script>
