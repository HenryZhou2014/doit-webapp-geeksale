<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>提交订单</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="cache-control" content="no-store">
    <meta http-equiv="expires" content="0">

    <link href="${ctx}/a/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/resource/common/styles/flexstyle.css" rel="stylesheet" type="text/css"/>

    <script src="${resource}/common/scripts/jquery-ui-1.9.2.custom/development-bundle/ui/minified/jquery.ui.core.min.js"></script>
    <script src="${resource}/common/scripts/jquery-ui-1.9.2.custom/development-bundle/ui/minified/jquery.ui.widget.min.js"></script>
    <script src="${resource}/common/scripts/jquery-ui-1.9.2.custom/development-bundle/ui/minified/jquery.ui.mouse.min.js"></script>
    <script src="${resource}/common/scripts/jquery-ui-1.9.2.custom/development-bundle/ui/minified/jquery.ui.selectable.min.js"></script>

    <style type="text/css">

        .cart_item_check {
            float: left;
            width: 30px;
            margin: 10px 5px;
        }

        .callout.alert {
            padding: 5px 0;
        }

        .address-block {
            /*background: lightgrey;*/
        }

        #selectable > li {
            cursor: hand;
            padding: 10px;
            /*background: lightgrey;*/
            margin: 10px;
            border: 1px solid lightgrey;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }

        #selectable .ui-selecting {
            background: darkgrey;
        }

        #selectable .ui-selected {
            background: lightgrey;
        }

        #address_view li{
            margin-top:10px;
        }
        #address_view li:hover{
            background-color: #FFF3F3;
        }

        .address_scroll{
            max-height: 160px;
            overflow: auto;
        }
        .default_address{
            margin-left: 10px;
            padding:5px 2px;
            background-color: #999999;
            color:white;
            font-size:10px;
        }

        .pay_type_item{
            width: 120px;
            border:solid 1px gray;
        }
        .pay_type_ok,.pay_type_item:hover{
            border:solid 2px #e4393c;
        }

        .pay_type_item b {
            display: block;
            position: absolute;
            right: 0;
            bottom: 0;
            width: 12px;
            height: 12px;
            overflow: hidden;
            background: url(${ctx}/images/ecommerce/selected-icon.png) no-repeat;
        }

    </style>
</head>
<section class="noborder margin-bottom-0 padding-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-lg-push-3">
                <div>
                    <ul class="process-steps nav nav-justified">
                        <li class="active">
                            <a href="javascript:void(0);">1</a>
                            <h5>购物车</h5>
                        </li>
                        <li class="active">
                            <a href="javascript:void(0);">2</a>
                            <h5>提交订单</h5>
                        </li>
                        <li>
                            <a href="javascript:void(0);">4</a>
                            <h5>支付</h5>
                        </li>
                        <li>
                            <a href="javascript:void(0);">5</a>
                            <h5>完成</h5>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-lg-12">

                <div class="pull-right"><a href="${ctx}/mycart" rel="nofollow" target="_blank"
                                           class="btn btn-default btn-sm">返回购物车</a>
                </div>

                <ul class="nav nav-tabs nav-top-border">
                    <li class="active"><a href="#home" data-toggle="tab">确认订单</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade in active" id="home">
                        请继续补充下列信息然后提交订单！
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<section class="noborder margin-0 padding-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="callout alert alert-default margin-top-10 margin-bottom-10">
                    <div class="row">
                        <div class="col-md-12 col-sm-12"><!-- left text -->
                            <div class="pull-right">
                                <a href="javascript:void(0)" class="btn btn-default btn-xs" onclick="addAddress()">新增收货地址</a>
                            </div>
                            <span>收货地址</span>
                        </div><!-- /left text -->
                    </div>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">

                <ul class="list-unstyled" id="address_view">
                    <c:forEach items="${myAddress}" var="address" varStatus="status">
                        <c:choose>
                            <c:when test="${status.index == 0}">
                                <li id="address_${address.id}" class="flexbox flex_row flex1">
                            </c:when>
                            <c:otherwise>
                                <li id="address_${address.id}" style="display: none" class="flexbox flex_row flex1">
                            </c:otherwise>
                        </c:choose>
                            <label class="radio flex1">
                                <input type="radio" name="selected_address" value="${address.id}"
                                       <c:if test="${not empty address.defaultFlag && address.defaultFlag eq '1'}">checked="checked"</c:if> />
                                <i></i> <span>${address.name}(${address.phoneNum}) ${address.provinceName}(${address.cityName}) ${address.address}</span>
                                <c:if test="${not empty address.defaultFlag && address.defaultFlag eq '1'}">
                                    <span class="default_address">默认地址</span>
                                </c:if>
                            </label>
                            <div class="pull-right" style="display: none">
                                <a href="javascript:void(0)" onclick="setDefaultAddress(${address.id})" class="btn btn-default btn-xs">设为默认地址</a>
                                <a href="javascript:void(0)" onclick="updateAddress(${address.id})" class="btn btn-default btn-xs">编辑</a>
                                <a href="javascript:void(0)" onclick="removeAddress(${address.id})" class="btn btn-default btn-xs">删除</a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <span id="address_toggle_btn" style="cursor: pointer;">更多地址 <i class="fa fa-angle-double-down"></i></span>
            </div>

        </div>

    </div>
</section>

<section class="noborder margin-0 padding-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="callout alert alert-success margin-top-10 margin-bottom-10">
                    <div class="row">
                        <div class="col-md-12 col-sm-12"><!-- left text -->
                            <span>支付方式</span>
                        </div><!-- /left text -->
                    </div>

                </div>
            </div>
        </div>

        <!-- CART -->
        <div class="row">

            <!-- LEFT -->
            <div id="pay_type_view" class="col-lg-12 col-sm-12">
                <%--<button class="btn pay_type_item" data-paytype="5" >货到付款</button>--%>
                <button class="btn pay_type_item" data-paytype="0">微信支付</button>
                <button class="btn pay_type_item" data-paytype="1">支付宝支付</button>
            </div>

        </div>
        <!-- /CART -->

    </div>
</section>

<section class="noborder margin-0 padding-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="callout alert alert-default margin-top-10 margin-bottom-10">
                    <div class="row">
                        <div class="col-md-12 col-sm-12"><!-- left text -->
                            <span>商品清单</span>
                        </div><!-- /left text -->
                    </div>

                </div>
            </div>
        </div>

        <!-- CART -->
        <div class="row">

            <!-- LEFT -->
            <div class="col-lg-12 col-sm-12">

                <div style="border-bottom: 1px solid #eaeaea;">
                    <table class="table table-striped table-hover margin-0" style="margin-bottom: 0;">
                        <colgroup>
                            <col/>
                            <col width="200"/>
                            <col width="100"/>
                        </colgroup>
                        <tr>

                            <th>
                                商品
                            </th>
                            <th>
                                数量
                            </th>
                            <th>
                                小计
                            </th>

                        </tr>
                        <c:forEach items="${cartData.items}" var="cartItem">
                        <tr>
                            <td>
                                <div class="pull-left margin-right-20" style="width: 120px;">
                                    <img src="${cartItem.img}"
                                         alt="" class="img-responsive"/>
                                </div>
                                <div>
                                    <h4><a href="${ctx}/mall/item-2387.html">${cartItem.name}</a></h4>
                                    <div>作者:${cartItem.author}</div>
                                    <div>ISBN:${cartItem.ISBN}</div>
                                </div>
                            </td>
                            <td>
                                ${cartItem.num} &times;
                                ${cartItem.price}
                            </td>
                            <td>
                                ${cartItem.price*cartItem.num}
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

        </div>
        <!-- /CART -->
        <div class="margin-top-10">
            添加订单备注 <input type="text" class="width-500" placeholder="订单备注"/>
        </div>
    </div>
</section>

<%--<section class="noborder margin-0 padding-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="callout alert alert-default margin-top-10 margin-bottom-10">
                    <div class="row">
                        <div class="col-md-12 col-sm-12"><!-- left text -->
                            <span>优惠券使用</span>
                        </div><!-- /left text -->
                    </div>

                </div>
            </div>
        </div>


    </div>
</section>--%>

<section class="noborder margin-0 padding-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="callout alert alert-default margin-top-10 margin-bottom-10">
                    <div class="row">
                        <div class="col-md-12 col-sm-12"><!-- left text -->
                            <span>发票</span>
                        </div><!-- /left text -->
                    </div>

                </div>

                <div>
                    <div class="toggle-transparent toggle-bordered-full margin-top-0 clearfix">
                        <div class="toggle active">
                            <div class="toggle-content">

                                <div class="clearfix">
                                    <label class="checkbox pull-left">
                                        <input id="accountswitch" name="create-account[yes]" type="checkbox" value="1"/>
                                        <i></i> <span class="weight-300">需要随附发票</span>
                                    </label>
                                </div>

                                <!-- CREATE ACCOUNT FORM -->
                                <div id="newaccount" class="margin-top-10 margin-bottom-30">

                                    <div class="row nomargin-bottom">
                                        <div class="col-md-6 col-sm-6">
                                            <label for="account:password">发票抬头</label>
                                            <input id="account:password" name="account[password]" type="password"
                                                   class="form-control"/>
                                        </div>
                                    </div>
                                    <small class="text-warning">发票内容为物品清单</small>

                                </div>
                                <!-- /CREATE ACCOUNT FORM -->


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="toggle-transparent toggle-bordered-full clearfix pull-right"
                     style="min-width: 400px;">
                    <div class="toggle active">
                        <div class="toggle-content">

										<span class="clearfix">
											<span class="pull-right">${cartData.totalPrc}元</span>
											<strong class="pull-left">总计:</strong>
										</span>
										<span class="clearfix">
											<span class="pull-right">0.00元</span>
											<span class="pull-left">折扣:</span>
										</span>
										<span class="clearfix">
											<span class="pull-right">0.00元</span>
											<span class="pull-left">物流:</span>
										</span>

                            <hr/>

										<span class="clearfix">
											<span class="pull-right size-20">${cartData.totalPrc}元</span>
											<strong class="pull-left">合计:</strong>
										</span>

                            <hr/>
                            <form action="${ctx}/checkout/confirm-order" method="post" onsubmit="return confirmOrder()">
                                <input type="hidden" id="addr_id" name="addr_id" />
                                <input type="hidden" id="pay_type" name="pay_type" />
                                <button type="submit" class="btn btn-danger btn-lg btn-block size-15 weight-800"><i
                                        class="fa fa-mail-forward"></i> 提交订单</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>

<div class="modal fade" id="address_form_modal" tabindex="-1" role="dialog"
     data-backdrop="false" data-show="false">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 600px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    新增收货地址信息
                </h4>
            </div>
            <div class="modal-body" style="min-height:300px;max-height: 455px;overflow: auto;">
                <form class="form-horizontal" id="addressEditForm">
                    <input type="hidden" name="id"/>
                    <div class="form-group m-t-xl">
                        <label class="col-sm-2 control-label">收货人</label>
                        <div class="col-sm-8">
                            <input type="text" name="name" placeholder="收货人姓名" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">所在地区</label>
                        <div class="col-sm-8">
                            <input type="text" name="provinceId" placeholder="所在地区" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">详细地址</label>
                        <div class="col-sm-8">
                            <input type="text" name="address" placeholder="详细地址" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">手机号码</label>
                        <div class="col-sm-8">
                            <input type="text" name="phoneNum" placeholder="手机号码" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">固定电话</label>
                        <div class="col-sm-8">
                            <input type="text" name="phone" placeholder="固定电话" class="form-control"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="createOrUpdateAddressInfo();">
                    确认
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<%--收货地址模板--%>
<script id="addressItemTemplate" type="text/html">
    <li id="address_{{id}}">
        <label class="radio">
            <input type="radio" name="selected_address" value="{{id}}" checked="checked">
            <i></i> <span>{{name}}({{phoneNum}}) {{provinceName}}({{cityName}}) {{address}}</span>
        </label>
        <div class="pull-right" style="display: none">
            <a href="javascript:void(0)" onclick="setDefaultAddress({{id}})" class="btn btn-default btn-xs">设为默认地址</a>
            <a href="javascript:void(0)" onclick='updateAddress({{id}})' class="btn btn-default btn-xs">编辑</a>
            <a href="javascript:void(0)" onclick="removeAddress({{id}})" class="btn btn-default btn-xs">删除</a>
        </div>
    </li>
</script>


<script type="text/javascript">
    var is_view_show_more_address = false;
    var current_address_id;//选中的地址
    var current_address_element;
    var payType;//选中的支付方式
    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class

        <c:if test="${not empty errorMsg}">
             toastError("操作提示", "${errorMsg}");
        </c:if>

        $("#address_toggle_btn").click(function () {
            is_view_show_more_address = !is_view_show_more_address;
            if(is_view_show_more_address){
                $.each($("#address_view li"),function (i,v) {
                    $(v).show();
                });
                $(this).find("i").attr("class","fa fa-angle-double-up");
                $("#address_view").addClass("address_scroll");
            }else{
                $(current_address_element).insertBefore($("#address_view li").first());
                $.each($("#address_view li"),function (i,v) {
                    if(i == 0){
                        $(v).show();
                    }else{
                        $(v).hide();
                    }
                });
                $(this).find("i").attr("class","fa fa-angle-double-down");
                $("#address_view").removeClass("address_scroll");
            }
        });

        $("#address_view").on("mouseover","li",function () {
            $(this).find("div").last().show();
        });

        $("#address_view").on("mouseout","li",function () {
            $(this).find("div").last().hide();

        });

        //地址选择事件处理
        $("#address_view li").click(function () {
            var address_id = $(this).attr("id");
            if(current_address_id != address_id){
                current_address_id = address_id;
                current_address_element = $(this);
            }
        });
        
        //支付方式选中事件
        $("#pay_type_view button").on("click",function () {
            $("#pay_type_view button").removeClass("pay_type_ok").find("b").remove();
            $(this).addClass("pay_type_ok");
            $(this).append("<b></b>");
            payType = $(this).data("paytype");
        })
        
        $("#selectable").selectable();

    });
    
    function addAddress() {
        $("#addressEditForm")[0].reset();
        $("#address_form_modal h4:first").html("新增收货地址信息");
        $("#address_form_modal").modal("show");
    }

    function updateAddress(addr_id){
        $("#addressEditForm")[0].reset();
        $("#address_form_modal h4:first").html("修改收货地址信息");
        $("#address_form_modal").modal("show");
        initAddressModel(addr_id);
    }

    function initAddressModel(addr_id) {
        $.ajax({
            url: "${ctx}/checkout/address?addr_id="+addr_id,
            dataType: "json",
            success: function (data) {
                const address = data.address;
                if (data.flag == "1" && address) {
                    $("#addressEditForm input[name='id']").val(address.id);
                    $("#addressEditForm input[name='name']").val(address.name);
                    $("#addressEditForm input[name='address']").val(address.address);
                    $("#addressEditForm input[name='phoneNum']").val(address.phoneNum);
                } else {
                    toastError("操作提示", data.msg);
                }
            }
        });
    }

    function createOrUpdateAddressInfo() {
        var id = $("#addressEditForm input[name='id']").val();

        var formData = $("#addressEditForm").serialize();
        var postUrl = id?"updateAddress":"createAddress";

        $.ajax({
            url: "${ctx}/checkout/address/"+postUrl,
            data: formData,
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#address_form_modal").modal("hide");
                    if(id){
                        const address = data.address;
                        if(data.address){
                            const updateAddressText = (address.name||"") + "(" + (address.phoneNum||"") + ") " + (address.provinceName||"") + "(" + (address.cityName||"") + ")  " +  (address.address||"");
                            $("#address_"+id).find("span").first().html(updateAddressText);
                        }
                    }else{
                        //toastSuccess("操作提示", "新增收货地址成功！");
                        var html = template("addressItemTemplate", data.address);
                        $("#address_view").prepend(html);
                        //$(html).insertBefore($("#address_view li").first());
                        if(!is_view_show_more_address){
                            $.each($("#address_view li"),function (i,v) {
                                if(i!= 0){
                                    $(v).hide();
                                }
                            });
                        }
                    }
                    $("#addressEditForm")[0].reset();
                } else {
                    toastError("操作提示", data.msg);
                }
            }
        });
    }

    function removeAddress(addr_id){
        $.ajax({
            url: "${ctx}/checkout/address/removeAddress?addr_id=" + addr_id,
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    toastSuccess("操作提示", "收货地址删除成功！");
                    $("#address_"+addr_id).remove();
                } else {
                    toastError("操作提示", data.msg);
                }
            }
        });
    }

    function setDefaultAddress(addr_id){
        $.ajax({
            url: "${ctx}/checkout/address/defaultAddress?addr_id=" + addr_id,
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#address_view .default_address").remove();
                    const defaultAddressText = "<span class='default_address'>默认地址</span>";
                    $("#address_"+addr_id).find("span").first().after(defaultAddressText);

                } else {
                    toastError("操作提示", data.msg);
                }
            }
        });
    }

    function confirmOrder(){
        const addr_id = $("input:radio[name='selected_address']:checked").val();
        if(addr_id == null){
            toastError("操作提示", "请选择收货地址");
            return false;
        }
        if(!payType){
            toastError("操作提示", "请选择支付方式");
            return false;
        }
        $("#addr_id").val(addr_id);
        $("#pay_type").val(payType);
        return true;
    }
</script>
