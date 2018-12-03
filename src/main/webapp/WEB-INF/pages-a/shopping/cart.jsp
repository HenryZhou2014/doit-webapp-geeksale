<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>我的购物车</title>

    <link href="${ctx}/a/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>

    <style type="text/css">

        ul.process-steps li:after, ul.process-steps li:before {
            /*border-top: 1px dashed #444;*/
        }

        .itemNumber{
            padding-left: 10px;
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
                        <li>
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

                <div class="pull-right"><a href="${ctx}/mall" rel="nofollow" target="_blank"
                                           class="btn btn-default btn-sm">继续浏览其他商品</a>
                </div>

                <ul class="nav nav-tabs nav-top-border">
                    <li class="active"><a href="#home" data-toggle="tab"><i class="fa fa-shopping-cart"></i> 我的购物车</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade in active" id="home">
                        请选择商品进行结算！
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>


<section>
    <div class="container">
        <!-- CART -->
        <div class="row">

            <!-- LEFT -->
            <div class="col-lg-12 col-sm-12">

                <!-- CART -->
                <form class="cartContent clearfix" method="post" action="#">
                    <!-- cart content -->
                    <div id="cartContent">
                        <div style="border-bottom: 5px solid #eaeaea;">
                            <table class="table table-striped table-hover margin-0" style="margin-bottom: 0;">
                                <colgroup>
                                    <col width="50" style="text-align: center;"/>
                                    <col/>
                                    <col width="200"/>
                                    <col width="100"/>
                                    <col width="80"/>
                                </colgroup>
                                <tr>
                                    <th>
                                        <input onclick="checkAll(this)" type="checkbox"/>
                                    </th>
                                    <th>
                                        商品
                                    </th>
                                    <th>
                                        数量
                                    </th>
                                    <th>
                                        小计
                                    </th>
                                    <th>
                                        &nbsp;
                                    </th>
                                </tr>
                                <c:forEach items="${cartData.items}" var="cartItem">
                                    <tr id="sku_${cartItem.skuId}">
                                        <td>
                                            <input type="checkbox" id="checkbox_${cartItem.skuId}" data-id="${cartItem.skuId}" <c:if test="${not emptycartItem.selectFlag && cartItem.selectFlag == '1'}">checked="checked"</c:if> />
                                        </td>
                                        <td>
                                            <div class="pull-left margin-right-20" style="width: 80px;">
                                                <img src="${cartItem.img}"
                                                     alt="" class="img-responsive"/>
                                            </div>
                                            <div>
                                                <h4><a class="size-14" href="${ctx}/mall/item-2387.html">${cartItem.name}</a></h4>
                                                <div class="size-12">作者 ${cartItem.author}</div>
                                                <div class="size-12">ISBN ${cartItem.ISBN}</div>
                                            </div>
                                        </td>
                                        <td>
                                            <input type="number" class="itemNumber" value="${cartItem.num}"  name="qty" maxlength="3" max="999" min="1" onfocus="saveNumFocus(this)" onchange="changeNumBySelloffer(this,${cartItem.skuId})" /> &times;
                                            ${cartItem.price}
                                        </td>
                                        <td>
                                            ${cartItem.price*cartItem.num}
                                        </td>
                                        <td>
                                            <a href="javascript:void(0)" onclick="deleteSellofferFromCart([${cartItem.skuId}])" class="btn btn-default btn-xs"><i class="fa fa-trash"></i> 删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div class="toggle-transparent toggle-bordered-full clearfix pull-right"
                             style="min-width: 400px;">
                            <div class="toggle active">
                                <div class="toggle-content">

										<span class="clearfix">
											<span class="pull-right"><span id="totalPrc">${cartData.totalPrc}</span>元</span>
											<strong class="pull-left">总计:</strong>
										</span>
										<span class="clearfix">
											<span class="pull-right">0.00元</span>
											<span class="pull-left">物流:</span>
										</span>

                                    <hr/>

										<span class="clearfix">
											<span class="pull-right size-20"><span id="payTotalPrc">${cartData.payTotalPrc}</span>元</span>
											<strong class="pull-left">合计:</strong>
										</span>

                                    <hr/>

                                    <a href="javascript:void(0)"  onclick="settlement()"
                                       class="btn btn-primary btn-lg btn-block size-15"><i
                                            class="fa fa-mail-forward"></i> 结算</a>
                                </div>
                            </div>
                        </div>

                        <a href="javascript:void(0)" onclick="delSelloffer()" class="btn btn-danger btn-sm margin-top-10 margin-right-10"><i class="fa fa-trash"></i> 删除</a>

                        <div class="clearfix"></div>
                    </div>
                    <!-- /cart content -->

                </form>
                <!-- /CART -->

            </div>

        </div>
        <!-- /CART -->

    </div>
</section>

<script type="text/javascript">

    var ids = [];
    var originalInputValue = 0;
    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class

        $("#cartContent td ").on("change","input[type='checkbox']",function () {
            const skuId = $(this).data("id");
            const selectFlag = $(this).is(':checked')?"1":"0";
            $.ajax({
                url:'${ctx}/mycart/selectItem',
                data:{'skuId':skuId,"selectFlag":selectFlag},
                dataType:'json',
                success:function(data){
                    if(data.flag=="1"){
                        const cartData = data.data;
                        if(cartData){
                            $("#totalPrc").html(cartData.totalPrc);
                            $("#payTotalPrc").html(cartData.payTotalPrc);
                        }
                        getShopCartBaseInfo();
                    }else{
                        toastError("选中或取消购物车商品失败");
                    }
                }
            })
        })

    });
    function deleteSellofferFromCart(ids) {
        $.ajax({
            url:'${ctx}/mycart/delete',
            data:{'skuIds':ids},
            dataType:'json',
            success:function(data){
                if(data.flag=="1"){
                    getShopCartBaseInfo();
                    $.each(ids,function (i,v) {
                        $("#sku_"+v).remove();
                    });
                    $("#totalPrc").html(data.data.totalPrc);
                    $("#payTotalPrc").html(data.data.payTotalPrc);
                    toastSuccess("移除商品成功", "您已成功从购物车中移除该商品！","toast-top-right");
                }else{
                    toastError("从购物车移除商品失败");
                }
            }
        })
    }
    
    function checkAll(obj){
        $("#cartContent input[type='checkbox']").prop('checked', $(obj).prop('checked'));
    }

    function delSelloffer() {
        ids.splice(0,ids.length);
        var allCheck = $("input[id^='checkbox_']");
        $.each(allCheck,function (i,v) {
            if($(v).is(':checked')){
                var id = $(v).attr("id").split("checkbox_")[1];
                ids.splice(ids.length,0,id);
            }
        });
        deleteSellofferFromCart(ids);
    }
    
    //商品数量输入框获取焦点时保存商品缩量到临时数据中
    function saveNumFocus(currentElement) {
        originalInputValue = $(currentElement).val();
    }

    //改变购物车商品数量
    function changeNumBySelloffer(currentElement,skuId) {
        var _this = $(currentElement);
        var currentNum = _this.val();
        if(!currentNum){
            _this.val(originalInputValue);
            return;
        }
        //将当前商品设置为选中状态
        var aaa = $("#sku_"+skuId).find(":checkbox");
        $(aaa).prop("checked",true);

        var priceElement = _this.parent().next();

        $.ajax({
            url:'${ctx}/mycart/changeNum',
            data:{'skuId':skuId,'num':currentNum},
            dataType:'json',
            success:function(data){
                if(data.flag=="1"){
                    if(data.num != currentNum){
                        _this.val(data.num);
                    }
                    priceElement.html(data.currentPrc);
                    $("#totalPrc").html(data.data.totalPrc);
                    $("#payTotalPrc").html(data.data.payTotalPrc);
                    getShopCartBaseInfo();
                }else{
                    _this.val(originalInputValue);
                }
            }
        })
    }
    
    //结算
    function settlement() {
        var hasSelected = false;
        var allCheck = $("input[id^='checkbox_']");
        $.each(allCheck,function (i,v) {
            if($(v).is(':checked')){
                hasSelected = true;
                return false;
            }
        });

        if(!hasSelected){
            toastInfo("您还未选择商品，请添加新的商品到购物车中！");
            return false;
        }
        $.ajax({
            url:'${ctx}/mycart/settlement',
            dataType:'json',
            success:function(data){
                if(data.flag == "0"){
                    toastInfo("您还未选择商品，请添加新的商品到购物车中！");
                }else if(data.flag == "-1"){
                    $(".button-login").attr("data-url","${ctx}/checkout");
                    logon();
                }else if(data.flag == "1"){
                    window.location.href="${ctx}/checkout";
                }
            }
        });
    }
</script>
