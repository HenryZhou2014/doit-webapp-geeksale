<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>订单管理</title>
    <meta name="heading" content="<fmt:message key='goodsOrderList.heading'/>"/>
    <meta name="module-group" content="ecommerce-order-management"/>
    <meta name="module-subgroup" content="ecommerce-orders"/>
    <meta name="module" content="ecommerce-orders-list"/>

    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">

    <script src="${ctx}/resource/common/scripts/plugins/dataTables/datatables.min.js"></script>
    <script src="${ctx}/resource/common/scripts/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="${ctx}/resource/common/scripts/plugins/numeral/2.0.4/numeral.min.js"></script>

    <style type="text/css">
        .float-e-margins .btn {
            margin-bottom: 0;
        }

        #orderQueryForm table td {
            padding: 3px 5px;
            text-align: center;
        }

        .dataTables-example th{
            font-size:14px;
        }

        .dataTables-example td{
            font-size:13px;
        }

        .viewTable th, .viewTable td {
            text-align: center;
        }

        .order-status-list li a {
            font-weight: normal;
            color: #444;
        }

        .order-status-list li.active a {
            font-weight: bold;
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
                <strong>订单管理</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">


            <div class="ibox float-e-margins">

                <div class="ibox-title">
                    <div class="pull-left">
                        <ul class="list-unstyled list-inline order-status-list">
                            <li class="active">
                                <a>订单管理</a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>

                    <div class="ibox-tools pull-right">
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
                                <a id="toolbar_print" href="javascript:void(0);">打印</a>
                            </li>
                            <li>
                                <a id="toolbar_close" href="javascript:void(0);">关闭</a>
                            </li>
                            <li>
                                <a id="toolbar_delete" href="javascript:void(0);">删除</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">


                    <form class="form-inline" role="form">
                        <div class="form-group">
                            <label for="orderSearchText" class="sr-only">订单号</label>
                            <input type="email" id="orderSearchText" class="form-control" style="width:300px;" placeholder="输入商品标题或订单号进行搜索">

                        </div>
                        <button type="button" class="btn btn-default" onclick="query()">订单查询</button>
                        <button type="button" class="btn btn-default" id="senior_search_btn">更多条件 <span class="caret"></span></button>
                    </form>

                    <form id="senior_search_items" class="form-inline" style="display:none" role="form">
                        <div class="row" style="width:1080px">
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <label for="orderType">订单类型</label>
                                    <select class="form-control" id="orderType">
                                        <option value="-1">请选择</option>
                                        <option value="1">实体商品订单</option>
                                        <option value="0">虚拟商品订单</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div>
                                    <div class="form-group">
                                        <label for="startDate">下单日期</label>
                                        <input type="text" class="form-control datebox" style="width:120px" id="startDate" placeholder="开始日期">
                                    </div>
                                    -
                                    <div class="form-group">
                                        <label class="sr-only" for="endDate">成交时间</label>
                                        <input type="text" class="form-control datebox" style="width:120px" id="endDate" placeholder="结束日期">
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div>
                                    <div>
                                        <div class="form-group">
                                            <label for="account">客户账号</label>
                                            <input type="input" class="form-control" style="width:120px" id="account" placeholder="输入客户的账号信息">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="width:1080px;margin-top:10px;">
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <label for="paymentStatus">交易状态</label>
                                    <select class="form-control" id="paymentStatus">
                                        <option value="-1">请选择</option>
                                        <option value="0">待付款</option>
                                        <option value="">待发货</option>
                                        <option value="">待确认</option>
                                        <option value="">已完成</option>
                                        <option value="">已关闭</option>
                                        <option value="">退货</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-4">

                            </div>
                        </div>
                        <button type="button" class="btn btn-primary" onclick="advancedQuery()" style="margin-top:10px;">查询订单</button>
                    </form>

                    <div class="hr"></div>

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

<script id="orderNoInfoTemplate" type="text/html">
    <div class="size-14">{{orderCreateDate}}</div>
    <div class="size-14">{{orderCreateTime}}</div>
    <div class="margin-top-10">
        <a href="${ctx}/backend/ecommerce/order/goodsOrderform?id={{orderId}}" class="size-14">{{orderNo}}</a>
    </div>
    <div class="margin-top-10">
        {{orderType}}
    </div>

</script>

<script id="orderItemsTemplate" type="text/html">
    <div>
        <ul class="list-unstyled list-inline">
            {{each offerItems as value i}}
            <li class="col-sm-12 col-md-6 col-lg-4">
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-4">
                        <div>
                            <img class="img-responsive" src="{{value.img}}"/>
                        </div>
                    </div>

                    <div class="col-sm-12 col-md-12 col-lg-8">
                        <div>
                            <div class="size-14">
                                <a>{{value.offerName}}</a>
                            </div>
                            <div class="margin-top-10">
                                {{value.sku}}
                            </div>
                            <div>
                                数量 {{value.offerNum}} x 单价 {{value.offerPrice}} 元
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            {{/each}}
        </ul>
    </div>
</script>

<script id="orderMoneyTemplate" type="text/html">
    <div class="text-right size-20">{{totalMoney}}</div>
</script>

<script id="orderUserInfoTemplate" type="text/html">
    <div class="text-center">
        {{clientName}}
    </div>
    <div class="text-center margin-top-10">{{clientPhone}}</div>
    <div class="text-center margin-top-10">{{clientEmail}}</div>
    <div class="text-center margin-top-10"><a class="btn btn-default btn-xs">地址信息</a></div>
    <div class="text-center margin-top-10"><a class="btn btn-default btn-xs">发送通知</a></div>
</script>

<script id="orderPaymentStatusTemplate" type="text/html">
    <div class="text-center">{{paymentType}}</div>
    <div class="text-center margin-top-10"><span class="label label-success btn-xs">{{paymentStatus}}</span></div>
    <div class="text-center margin-top-10"><a class="btn btn-default btn-xs">查看支付记录</a></div>
</script>

<script id="orderStatusTemplate" type="text/html">
    <div class="text-center">{{orderStatus}}</div>
    <div class="text-center margin-top-10"><a class="btn btn-default btn-xs">审核</a></div>
    <div class="text-center margin-top-10"><a class="btn btn-default btn-xs">查看物流信息</a></div>
    <div class="text-center margin-top-10"><a class="btn btn-default btn-xs">查看处理记录</a></div>
    <div class="text-center margin-top-10"><a class="btn btn-default btn-xs">查看备注</a></div>
</script>

<script id="orderOperateTemplate" type="text/html">
    <div class="text-center margin-top-10"><a class="btn btn-default btn-xs">关闭</a></div>
    <div class="text-center margin-top-10"><a class="btn btn-default btn-xs">打印</a></div>
    <div class="text-center margin-top-10"><a class="btn btn-default btn-xs">备注</a></div>
    <div class="text-center margin-top-10"><a class="btn btn-default btn-xs">删除</a></div>
</script>

<script type="text/javascript">

    var mainDataTable;

    $(document).ready(function () {

        //输入框日期组件初始化
        $('.datebox').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true,
            format: "yyyy/mm/dd"
        });

        $('#senior_search_btn').click(function () {
            //$(this).children("span").attr("class","");
            $("#senior_search_items").toggle();
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
            "paging": true,
            "iDisplayLength": 25,
            "aLengthMenu": [25, 50, 100],
            "ordering": false,
//            "order": [[1, "desc"]],
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
                {"data": "seqNo", class: "text-center", "bSortable": false, title: "#"},
                {"data": "id", class: "width-180 text-center", "bSortable": false, title: "订单编号"},
                {"data": "id", "bSortable": false, title: "商品清单"},
                {"data": "id", "bSortable": false, title: "订单金额", class:"width-100"},
                {"data": "id", title: "客户信息", "bSortable": false, class:"width-150"},
                {"data": "id", title: "支付状态", "bSortable": false, class:"width-150"},
                {"data": "id", title: "订单状态", "bSortable": false, class:"width-100"},
                {"data": "id", "bSortable": false, title: "操作", class:"width-100"}
            ],
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        var html = template("orderNoInfoTemplate", row);
                        return html;
                    }, "targets": 1
                }, {
                    "render": function (data, type, row) {
                        var html = template("orderItemsTemplate", row);
                        return html;
                    }, "targets": 2
                }, {
                    "render": function (data, type, row) {
//                        var html = '<div class="text-right size-20">' + row.totalMoney + '</div>';
                        var money = numeral(row.totalMoney).format("0.00");
                        var html = template("orderMoneyTemplate", {totalMoney : money});
                        return html;
                    }, "targets": 3
                }, {
                    "render": function (data, type, row) {
                        var html = template("orderUserInfoTemplate", row);
                        return html;
                    }, "targets": 4
                }, {
                    "render": function (data, type, row) {
                        var html = template("orderPaymentStatusTemplate", row);
                        return html;
                    }, "targets": 5
                }, {
                    "render": function (data, type, row) {
                        var html = template("orderStatusTemplate", row);
                        return html;

                    }, "targets": 6
                }, {
                    "render": function (data, type, row) {
                        var html = template("orderOperateTemplate", row);
                        return html;

                    }, "targets": 7
                }
            ],
            "ajax": {
                url: "${ctx}/backend/json/ecommerce/order/goodsOrders",
                type: "POST",
                dataType: "json",
                dataSrc: "goodsOrderList",
                data: function(d){
                    d.categoryId = $("#categoryId").val();
                    d.title = $("input[name='title']").val();
                    d.orderSearchText = $("#orderSearchText").val();
                    d.startDate = $("#startDate").val();
                    d.endDate = $("#endDate").val();
                    d.account = $("#account").val();
                    const orderType = $('#orderType').val();
                    if(orderType != '-1'){
                        d.orderType = orderType;
                    }
                    const paymentStatus = $('#paymentStatus').val();
                    if(paymentStatus != '-1'){
                        d.paymentStatus = paymentStatus;
                    }
                }
            }
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

    function advancedQuery() {
        mainDataTable.ajax.reload();
    }

</script> 
