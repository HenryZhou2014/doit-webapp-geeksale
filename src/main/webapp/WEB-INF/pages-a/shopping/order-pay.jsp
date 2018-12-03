<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>订单支付</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="cache-control" content="no-store">
    <meta http-equiv="expires" content="0">

    <link href="${ctx}/a/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>

    <style type="text/css">

        .cart_item_check{
            float: left;
            width: 30px;
            margin: 10px 5px;
        }

        .callout.alert{
            padding: 5px 0;
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
                        <li class="active">
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

                <div class="pull-right"><a href="${ctx}/usercenter/myOrders" rel="nofollow" target="_blank"
                                           class="btn btn-default btn-sm">查看我的订单</a>
                </div>

                <ul class="nav nav-tabs nav-top-border">
                    <li class="active"><a href="#home" data-toggle="tab">订单信息</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade in active" id="home">
                        请确认订单信息并完成订单支付！

                        <div>
                            订单编号  ${goodsOrder.orderNo}
                        </div>
                        <div>
                            下单时间   ${goodsOrder.createDate}
                        </div>
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
                            <span>收货地址</span>
                        </div><!-- /left text -->
                    </div>

                </div>
            </div>
        </div>

        <!-- CART -->

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

                    </table>
                </div>
            </div>
        </div>
        <!-- /CART -->
        <div class="margin-top-10">
            订单备注: 无
        </div>
    </div>
</section>
<%--支付宝支付--%>
<c:if test="${goodsOrder.paymentType eq '1'}">
    <section class="noborder margin-0 padding-0">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="callout alert alert-danger margin-top-20 margin-bottom-20">

                        <div class="row">

                            <div class="col-md-8 col-sm-8"><!-- left text -->
                                <h4>订单尚未完成支付</h4>
                                <p>
                                    请继续完成支付。
                                </p>
                            </div><!-- /left text -->

                            <div class="col-md-4 col-sm-4 text-right"><!-- right btn -->
                                <a href="${ctx}/payment/alipay/${goodsOrder.orderNo}" rel="nofollow" target="_blank" class="btn btn-danger btn-lg">立即支付</a>
                            </div><!-- /right btn -->

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
</c:if>

<%--微信支付--%>
<c:if test="${goodsOrder.paymentType eq '0'}">
    <section class="noborder margin-0 padding-0">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <img src="${ctx}/${payImgUrl}"/>
                </div>
            </div>
        </div>
    </section>
</c:if>


<section class="noborder margin-0 padding-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="callout alert alert-default margin-top-10 margin-bottom-10">
                    <div class="row">
                        <div class="col-md-12 col-sm-12"><!-- left text -->
                            <span>修改支付方式</span>
                        </div><!-- /left text -->
                    </div>

                </div>
            </div>
        </div>

        <!-- CART -->
        <div class="row">

            <!-- LEFT -->
            <div class="col-lg-12 col-sm-12 margin-bottom-20">
                <a class="btn btn-default btn-lg">货到付款</a>
                <a class="btn btn-default btn-lg">微信支付</a>
                <a class="btn btn-default btn-lg">支付宝支付</a>
            </div>

        </div>
        <!-- /CART -->
    </div>
</section>

<script type="text/javascript">

    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class



    });

</script>
