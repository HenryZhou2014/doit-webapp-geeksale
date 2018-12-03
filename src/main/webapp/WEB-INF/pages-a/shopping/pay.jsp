<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>支付</title>

    <link href="${ctx}/a/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>

    <style type="text/css">


    </style>
</head>
<section class="noborder margin-bottom-0 padding-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="callout alert alert-success margin-top-60 margin-bottom-60">
                    <div class="row">
                        <div class="col-md-8 col-sm-8"><!-- left text -->
                            订单提交成功，请您尽快付款！ 订单号：48368603161
                            <p>

                            </p>
                        </div><!-- /left text -->
                    </div>
                    <div class="row">
                        <!-- LEFT -->
                        <div id="pay_type_view" class="col-lg-12 col-sm-12">
                            <button class="btn pay_type_item" data-paytype="5" >货到付款</button>
                            <button class="btn pay_type_item" data-paytype="0">微信支付</button>
                            <a href="${ctx}/payment/alipay?id=${order_id}" class="btn pay_type_item" data-paytype="1">支付宝支付</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">

    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class



    });

</script>
