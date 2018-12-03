<%--
  Created by IntelliJ IDEA.
  User: AUSER
  Date: 2016/11/21
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>
<html>
<head>
    <meta name="heading" content="<fmt:message key='goodsOrderList.heading'/>"/>
    <meta name="module-group" content="ecommerce-order-management"/>
    <meta name="module-subgroup" content="ecommerce-orders"/>
    <meta name="module" content="ecommerce-orders-valet"/>

    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <script src="${ctx}/resource/common/scripts/plugins/stickUp/stickUp.js"></script>
    <script src="//cdn.bootcss.com/iScroll/5.2.0/iscroll.min.js"></script>
    <title>代客下单</title>

    <style type="text/css">
        #choice_selloffer_modal .modal-body { max-height: 600px; max-width: 900px; }
        .scrollspy{
            height: 500px;
            overflow: auto;
            position: relative;
        }
        .flexbox{
            display: -webkit-box; /* 老版本语法: Safari, iOS, Android browser, older WebKit browsers. */
            display: -moz-box; /* 老版本语法: Firefox (buggy) */
            display: -ms-flexbox; /* 混合版本语法: IE 10 */
            display: -webkit-flex; /* 新版本语法: Chrome 21+ */
            display: flex; /* 新版本语法: Opera 12.1, Firefox 22+ */
        }
        .flex_row{
            -webkit-box-direction: normal;
            -webkit-box-orient: horizontal;
            -moz-flex-direction: row;
            -webkit-flex-direction: row;
            flex-direction: row;
        }
        .flex_column{
            -webkit-box-direction: normal;
            -webkit-box-orient: vertical;
            -moz-flex-direction: column;
            -webkit-flex-direction: column;
            flex-direction: column;
        }
        .flex1 {
            -webkit-flex: 1;   /* Chrome */
            -ms-flex: 1;       /* IE 10 */
            flex: 1;         /* NEW, Spec - Opera 12.1, Firefox 20+ */
            -webkit-box-flex: 1;   /* OLD - iOS 6-, Safari 3.1-6 */
            -moz-box-flex: 1;    /* OLD - Firefox 19- */
        }
        .justify_center{
            -webkit-box-pack: center;
            -moz-justify-content: center;
            -webkit-justify-content: center;
            justify-content: center;
        }
        .align_center{
            -webkit-box-align: center;
            -moz-align-items: center;
            -webkit-align-items: center;
            align-items: center;
        }
        .flex_border{
            border: #F1F1F1 1px solid;
        }
        .list-group-item.active,.list-group-item.active:focus, .list-group-item.active:hover{
            z-index: 2;
            color:#000;
            background-color: #F2F2F2;
            border-color: #F2F2F2;
        }
        #sell_offer_list_wrapper_ul li,sell_offer_real_list_wrapper_ul li{
            cursor:pointer;
        }
    </style>
</head>
<body>
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
            <li>
                <a>订单管理</a>
            </li>
            <li class="active">
                <strong>代客下单</strong>
            </li>
        </ol>
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox">
        <div class="ibox-title">
            <h5>用户信息</h5>
        </div>
        <div class="ibox-content">
            <form role="form" class="form-inline">
                <div class="form-group">
                    <label for="user_input">用户名/用户编号</label>
                    <input type="input" placeholder="请输入用户名或用户编号" id="user_input" class="form-control" style="width:300px;">
                </div>
                <button class="btn btn-default" type="button" data-toggle="modal" data-target="#choice_user_modal">选择用户</button>
            </form>
            <div class="row">
                <div style="width:400px;" id="user_info_view_content"></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-9">
            <div class="ibox">
                <div class="ibox-title">
                    <span class="pull-right">(<strong>5</strong>) 件商品</span>
                    <h5>您已选择的商品</h5>
                </div>
                <div id="mainContext"></div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel" style="padding-top:20px;padding-left:10px;">
                <button class="btn btn-primary  dim btn-large-dim" data-toggle="modal" data-target="#choice_selloffer_modal" type="button"><div><i class="fa fa-plus-square-o"></i></div><div><span style="font-size:14px;">选择新商品</span></div></button>
            </div>
            <div class="ibox" id="shop_cart_panel">
                <div class="ibox-title">
                    <h5>购物车汇总</h5>
                </div>
                <div class="ibox-content">
                            <span>
                                总价
                            </span>
                    <h2 class="font-bold">
                        ￥<span id="total_pay">0.00</span>
                    </h2>
                    <hr>
                    <div class="m-t-sm">
                        <div class="btn-group">
                            <button onclick="goOrder()" class="btn btn-primary btn-sm"><i class="fa fa-shopping-cart"></i> 确定下单</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- 选择下单客户Modal -->
<div class="modal fade bs-example-modal-lg" id="choice_user_modal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width:800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="userModalLabel">选择下单客户</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="panel">
                        <table id="users_table" class="table table-striped table-bordered table-hover  dataTable"  width="100%" style="font-size:14px">
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="choice_selloffer_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">选择购买的商品</h4>
            </div>
            <div class="modal-body">
                <div style="width:100%" class="flexbox flex1 flex_row ">
                    <div class="flex1 flex_border">
                        <div id="sell_offer_list_wrapper">
                            <ul id="sell_offer_list_wrapper_ul" class="list-group scrollspy" style="padding:0;margin:0" >
                            </ul>
                        </div>
                        <%--<div class="table-responsive">--%>
                        <%--<table id="sell_offers_table" class="table table-striped table-bordered table-hover dataTables-example" style="font-size:14px;"--%>
                        <%--width="100%">--%>
                        <%--</table>--%>
                        <%--</div>--%>
                    </div>
                    <div style="width:80px;" class="flexbox justify_center  align_center">
                        <div class="flexbox flex_column justify_center">
                            <button class="btn btn-default " type="button" onclick="addToRight()">添加&nbsp;<i class="fa fa-angle-right"></i></button>
                            <button class="btn btn-default " type="button" style="margin-top:5px"  onclick="removeToLeft()"><i class="fa fa-angle-left"></i>&nbsp;移除</button>
                        </div>

                    </div>
                    <div class="flex1 flex_border">
                        <ul id="sell_offer_real_list_wrapper_ul" class="list-group elements-list scrollspy" style="padding:0;margin:0" >
                        </ul>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="select_order_sell_success_btn">确定</button>
            </div>
        </div>
    </div>
</div>

<%--下单客户信息展示模板--%>
<script id="user_info_view" type="text/html">
    <div class="contact-box">
        <a href="profile.html">
            <div class="col-sm-4">
                <div class="text-center">
                    <img alt="image" class="img-circle m-t-xs img-responsive" src="http://creator.mushan-studio.com/creator/bootstrap/inspinia/img/a6.jpg">
                    <div class="m-t-xs font-bold">普通会员</div>
                </div>
            </div>
            <div class="col-sm-8">
                <h3><strong>{{accountName}}</strong></h3>
                <p>用户编号：{{id}}</p>
                <div>状态：<span class="bg-success" style="padding:2px 5px;">正常</span></div>
                <div>邮箱：{{email}}</div>
                <div>手机号码: {{mobileNumber}}</div>
            </div>
            <div class="clearfix"></div>
        </a>
    </div>
</script>

<%--商品选择列表的商品模板--%>
<script id="selloffer_list" type="text/html">
    <li class="list-group-item" id="{{skuId}}" style="height:80px;" >
        <div href="#">
            <div style="float:left;width:70px"><img class='img-responsive block-center' src="{{thumbImageUrl}}" /></div>
            <div style="margin-left:80px;">
                <small class="pull-right text-muted" style="color:#6CCE3B;display:none"> 已选中</small>
                <strong>{{productName}}</strong>
                <div class="small m-t-xs">
                    <p>
                        零售价：{{price}} 库存:100  单位：件
                    </p>
                </div>
            </div>
        </div>
    </li>
</script>

<%--已选商品列表模板--%>
<script id="selloffer_real_list" type="text/html">
    <li class="list-group-item" id="selected_{{skuId}}" style="height:80px;">
        <div href="#">
            <div style="float:left;width:70px;"><img class='img-responsive block-center' src="{{thumbImageUrl}}" /></div>
            <div style="margin-left:80px;">
                <small class="pull-right text-muted hide" style="color:#6CCE3B"> 已选中</small>
                <strong>{{productName}}</strong>
                <div class="small m-t-xs">
                    <p>
                        零售价：{{price}} 库存:100  单位：件
                    </p>
                </div>
            </div>
        </div>
    </li>
</script>

<%--在订单中添加一条商品的模板--%>
<script id="sellOfferItem" type="text/html">
    <div class="ibox-content">
        <div class="table-responsive">
            <table class="table shoping-cart-table">
                <tbody>
                <tr style="height:120px;">
                    <td width="90">
                        <div class="cart-product-imitation">
                            <img src="{{img}}" alt="..." class="img-rounded" style="width:60px;height:60px">
                        </div>
                    </td>
                    <td class="desc">
                        <p class="small">
                            {{nm}}
                        </p>
                        <dl class="small m-b-none">
                            <dd><span>颜色：白色</span><span style="margin-left:5px;">尺寸：22码</span></dd>
                        </dl>
                        <div class="m-t-sm">
                            <a href="#" class="text-muted"><i class="fa fa-trash" ></i> 从购物车移除</a>
                        </div>
                    </td>
                    <td width="100">
                        <div style="margin-top:5px;">￥{{prc}}</div>
                    </td>
                    <td width="100">
                        <input type="text" id="real_{{id}}" oninput="changeShopsNum(this)" class="form-control" placeholder="1" value="{{num}}">
                    </td>
                    <td width="100">
                        <div style="margin-top:5px;">￥{{prc}}</div>
                    </td>
                    <td widht="100">
                        <div style="margin-top:5px;">￥{{total_prc}}</div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</script>

    <script type="text/javascript">
        var total_pay = 0.00;//订单总金额
        var order_user_id;//购买用户id
        var order_user_adress;//购买用户收货地址信息
        var order_shop_skus = [];//购买的商品

        var shipping_method;//配送方式-快递、平邮、EMS、物流、EMS、上门自取
        var pay_method;//支付方式-在线支付、货到付款。。


        var selloffer_list_data = [];
        var selloffer_list_selected_id_data = [];
        var selloffer_list_will_select_id_data = [];
        var selloffer_list_will_remove_id_data = [];
        var selloffer_list_real_selected_id_data = [];
        var selloffer_list_real_selected_data= [];

        $(document).ready(function () {

            //获取商品列表
            getSellOfferList();

            $("#select_order_sell_success_btn").click(function () {
                choiceSelloffersAndCloseModal();
                selectOrderSellOffer();
            });

            $("#sell_offer_list_wrapper_ul").on("click","li",function () {
                choice_selloffer(this);
            });
            $("#sell_offer_real_list_wrapper_ul").on("click","li",function () {
                choice_remove_selloffer(this);
            });

            //弹出选择商品框时的事件处理
            $('#choice_selloffer_modal').on('show.bs.modal', function (e) {
                initChoiceSellerInfo();
            })


            usersDataTable = $("#users_table").on('init.dt', function () {
            }).DataTable({
                "bProcessing": true,
                "bServerSide": true,
                "bPaginate": true,
                scrollY:500,
                "bFilter": true, //过滤功能 search 功能
                "paging": true,
                pageLength: 20,
                lengthChange:false,
                "ordering": true,
                "order": [[1, "asc"]],
                "pagingType": "full_numbers",
                "oLanguage": {
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
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
                    title:"会员编号",
                    orderable: false,
                },{
                    data: "accountName",
                    title:"用户名",
                    orderable: false,
                },{
                    data: "mobileNumber",
                    title:"手机号码",
                    width:"200px",
                    orderable: false,
                },{
                    data: "email",
                    title:"邮箱",
                    orderable: false,
                },{
                    data: "gender",
                    title:"状态",
                    orderable: false,
                },{
                    data: "accountClass",
                    title:"会员等级",
                    orderable: false,
                }],
                "ajax": {
                    "url": "${ctx}/backend/json/account/accounts",
                    "type": "GET",
                    "dataType": "json",
                    "data": {}
                },
                rowId:'id'
            });

            $('#users_table tbody').on('click', 'tr', function (e) {
                $(this).toggleClass('selected');
                var rowData = usersDataTable.rows('.selected').data()[0];
                viewUser(rowData);
                $(this).toggleClass('selected');
                $("#choice_user_modal").modal('hide');
            });

            mainDataTable = $("#sell_offers_table").on('init.dt', function () {
            }).DataTable({
                "bProcessing": true,
                "bServerSide": true,
                "bPaginate": true,
//            "scrollY": "600px",
                "scrollCollapse": true,
                "bFilter": true, //过滤功能 search 功能
                "paging": true,
                "iDisplayLength": 50,
                "aLengthMenu": [50, 100, 150],
                "ordering": true,
                "order": [[1, "asc"]],
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
                    "bSortable": false,
                    "render": function (data, type, row) {
                        var html = "<input type='checkbox' name='checkId' onclick='changeSelectedorderSell(this,"+row.id+")' value=\"" + row.id + "\" />";
                        return html;
                    }
                }, {
                    data:'item.id',
                    title:'首图',
                    "render": function (data, type, row) {
                        return "<div class='imageWrapper' style='width:90px;'><img class='img-responsive block-center' src=\"" + row.thumbImageUrl + "\"/></div>";
                    }
                },{
                    "data": "productName",
                    "bSortable": false,
                    title:'商品名称'
                }, {
                    "data": "skuId",
                    "bSortable": false,
                    title:'skuId'
                }, {
                    "data": "pri",
                    "bSortable": false,
                    title:'单价'
                }],
                "ajax": {
                    "url": "${ctx}/backend/json/ecommerce/product/sellOffers",
                    "type": "GET",
                    "dataType": "json",
                    "data": {}
                },
                rowId:'id'
            });



            $('#sell_offers_table tbody').on('click', 'tr', function (e) {
                $(this).toggleClass('selected');
                var checkbox = $(this).find("input[name='checkId']").first();
                $(checkbox).prop("checked", $(this).hasClass('selected'));
                var rowData = mainDataTable.row( this ).data().id;
                changeSelectedorderSell(checkbox,rowData);
            });


        });
        template.helper('getSellOfferData', function(data) {
            return JSON.stringify(data);
        });

        //选定客户后显示客户信息
        function viewUser(data) {
            var html = template('user_info_view', data);
            $("#user_info_view_content").html(html);
            order_user_id = data.id;
        }

        function getSellOfferList(){
            $.ajax({
                url: "${ctx}/backend/json/ecommerce/product/sellOffers",
                type: "GET",
                dataType: "json",
                data: {},
                success:function(data){
                    $.each(data.data,function(i,v){
                        selloffer_list_data.splice(selloffer_list_data.length,0,v);
                        renderSellofferListLi(v);
                    })
                }
            });
        }

        function renderSellofferListLi(data){
            //组装数据结构
            var html = template('selloffer_list', data);
            $("#sell_offer_list_wrapper_ul").append(html);
        }
        function renderRealSellofferListLi(data){
            var html = template('selloffer_real_list', data);
            $("#sell_offer_real_list_wrapper_ul").append(html);
        }

        //确认下单的商品
        function selectOrderSellOffer() {
            //删除已被移除的商品
            var data_temp = [];

            $.each(selloffer_list_real_selected_data,function (i,v) {
                var isExist = false;
                $.each(selloffer_list_real_selected_id_data,function (index,v_id) {
                    if(v_id == v.id){
                        isExist = true;
                        return false;
                    }
                });
                if(!isExist){
                    data_temp.push(i);
                }
            });

            $.each(data_temp,function (i,v) {
                selloffer_list_real_selected_data.splice(v,1);
            });


            $.each(selloffer_list_real_selected_id_data,function(index,value) {
                var isNew = true;
                $.each(selloffer_list_real_selected_data, function (i, v) {
                    if (v.id == value) {
                        isNew = false;
                        return false;
                    }
                });
                if(isNew){
                    var rowData = getRowDataById(value);
                    var order_sell_data = {
                        id: rowData.skuId,
                        img:rowData.thumbImageUrl,
                        nm:rowData.productName,
                        num:'1',
                        prc:rowData.price,
                        total_prc:rowData.price
                    };
                    selloffer_list_real_selected_data.push(order_sell_data);
                }
            });


            $("#mainContext").html("");
            //所购商品总额清零
            total_pay = 0.0;
            $.each(selloffer_list_real_selected_data,function(index,rowData){
                newShopItem(rowData);
            });
            $("#total_pay").html(total_pay);
        }

        //选中新的商品
        function newShopItem(data) {
            var html = template('sellOfferItem', data);
            $("#mainContext").append(html);

            //改变订单总价
            total_pay += data.prc;

            var v_tmp = {id:data.id,num:data.num};
            order_shop_skus.splice(order_shop_skus.length,0,v_tmp);
        }

        //商品将要被选中但还未移入确认选中框中时的处理逻辑
        function changeSelectedorderSell(willSelectId,selectedFlag) {
            const isExistInSelected = selloffer_list_selected_id_data.indexOf(willSelectId)>=0;
            if(isExistInSelected){
                return false;
            }

            const existInWillSelectIndex = selloffer_list_will_select_id_data.indexOf(willSelectId);
            if(selectedFlag){
                if(existInWillSelectIndex>=0){
                    selloffer_list_will_select_id_data.splice(existInWillSelectIndex,1);
                }
            }else{
                if(existInWillSelectIndex<0){
                    selloffer_list_will_select_id_data.splice(selloffer_list_will_select_id_data.length,0,willSelectId);
                }
            }
            return true;
        }

        //商品将要被选中但还未移入确认选中框中时的处理逻辑
        function changeRemoveorderSell(willRemoveId,selectedFlag) {
            const existInWillRemoveIndex = selloffer_list_will_remove_id_data.indexOf(willRemoveId);
            if(selectedFlag){
                if(existInWillRemoveIndex>=0){
                    selloffer_list_will_remove_id_data.splice(existInWillRemoveIndex,1);
                }
            }else{
                if(existInWillRemoveIndex<0){
                    selloffer_list_will_remove_id_data.splice(selloffer_list_will_remove_id_data.length,0,willRemoveId);
                }
            }
        }

        //添加购物商品按钮
        function addToRight(){

            $.each(selloffer_list_will_select_id_data,function(i,v){
                selloffer_list_selected_id_data.push(v);
                var rowData = getRowDataById(v);
                renderRealSellofferListLi(rowData);

                const currentLi = $("#"+v);
                currentLi.removeClass("active");
                currentLi.find("small").first().show();
            });

            selloffer_list_will_select_id_data.splice(0,selloffer_list_will_select_id_data.length);
        }
        
        //从已选中的商品中移除商品
        function removeToLeft() {
            $.each(selloffer_list_will_remove_id_data,function(i,v){
                var removeIndex = selloffer_list_selected_id_data.indexOf(v);
                if(removeIndex>=0){
                    selloffer_list_selected_id_data.splice(removeIndex,1);
                }
                $("#" + v).find("small").first().hide();
                $("#selected_" + v).remove();
            });

            selloffer_list_will_remove_id_data.splice(0,selloffer_list_will_remove_id_data.length);
        }


        //修改订单商品数量
        function changeShopsNum(currentInput) {
            const _this = $(currentInput);
            const _this_id = _this.attr("id").split("_")[1];
            const _this_val = _this.val();

            total_pay = 0.0;
            $.each(selloffer_list_real_selected_data,function (i,v) {
                if(v.id == _this_id){
                    v.num =_this_val;
                    v.total_prc = _this_val*v.prc;

                }
                total_pay += v.num*v.prc;
            });
            $("#total_pay").html(total_pay);
        }


        //下单
        function goOrder() {
            const saveData = {uid:order_user_id,u_addr:order_user_adress,u_sku_list:order_shop_skus};
            $.ajax({
                type:"POST",
                url:"${ctx}/backend/ecommerce/order/goodsOrdersCreate",
                dataType:"json",
                contentType:"application/json",
                data:JSON.stringify(saveData),
                success:function(data){
                    if(data.flag=="1"){
                        toastSuccess("下单成功", "您的订单已生成，请及时付款！");
                        //window.location.href="${ctx}/backend/ecommerce/order/goodsOrdersPay";
                    }else{
                        toastError("下单失败", "您的订单下单失败，请重新下单！");
                    }
                }
            });
        }

        function choice_selloffer(currentLi,skuId){
            var _this = $(currentLi);
            var flag = _this.hasClass("active");
            const isActiveAble = changeSelectedorderSell(_this.attr("id"),flag);
            if(!isActiveAble){
                return;
            }
            _this.toggleClass('active');
            //_this.find("small").first().toggleClass("hide");
        }

        function choice_remove_selloffer(currentLi){
            var _this = $(currentLi);
            var flag = _this.hasClass("active");
            var remove_id = _this.attr("id").split("_")[1];
            changeRemoveorderSell(remove_id,flag);
            _this.toggleClass('active');
            //_this.find("small").first().toggleClass("hide");
        }

        //选中购买商品并关闭选择商品弹出框
        function choiceSelloffersAndCloseModal(){
            //清空已真实选定的商品列表
            selloffer_list_real_selected_id_data.splice(0,selloffer_list_real_selected_id_data.length);
            $.each(selloffer_list_selected_id_data,function (i,v) {
                selloffer_list_real_selected_id_data.push(v);
            });
            $('#choice_selloffer_modal').modal('hide');

            //情况选择或移除的商品选择零时列表信息
            clearSellofferChoiceInfo();
        }

        function initChoiceSellerInfo(){
            $.each(selloffer_list_real_selected_id_data,function (i,v) {
                selloffer_list_selected_id_data.push(v);
            });
        }

        function clearSellofferChoiceInfo(){
            selloffer_list_selected_id_data.splice(0,selloffer_list_selected_id_data.length);
            selloffer_list_will_select_id_data.splice(0,selloffer_list_will_select_id_data.length);
            selloffer_list_will_remove_id_data.splice(0,selloffer_list_will_remove_id_data.length);
        }


        function getRowDataById(id) {
            var returnVal;
            $.each(selloffer_list_data,function (i,v) {
                if(v.skuId == id){
                    returnVal = v;
                    return false;
                }
            });
            return returnVal;
        }
    </script>
</body>
</html>
