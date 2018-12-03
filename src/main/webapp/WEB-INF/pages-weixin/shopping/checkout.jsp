<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>确认订单</title>

    <link href="${ctx}/a/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>
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
                            <a href="javascript:void(0);">3</a>
                            <h5>订单确认</h5>
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
                                <a class="btn btn-default btn-xs">管理收货地址</a>
                            </div>
                            <span>收货地址</span>
                        </div><!-- /left text -->
                    </div>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">

                <ul class="list-unstyled">
                    <li>
                        <label class="radio">
                            <input type="radio" name="radio-btn" value="1" checked="checked">
                            <i></i> 廖国彬（13764590153） 上海（上海） 黄浦区老西门中华路1359号康宁大厦7楼B33
                        </label>
                        <div class="pull-right">
                            <a class="btn btn-default btn-xs">修改</a>
                        </div>
                    </li>
                    <li>
                        <label class="radio">
                            <input type="radio" name="radio-btn" value="2">
                            <i></i> 廖国彬（13764590153） 上海（上海） 黄浦区老西门中华路1359号康宁大厦7楼B33
                        </label>
                        <div class="pull-right">
                            <a class="btn btn-default btn-xs">修改</a>
                        </div>
                    </li>
                    <li>
                        <label class="radio">
                            <input type="radio" name="radio-btn" value="3">
                            <i></i> 廖国彬（13764590153） 上海（上海） 黄浦区老西门中华路1359号康宁大厦7楼B33
                        </label>
                        <div class="pull-right">
                            <a class="btn btn-default btn-xs">修改</a>
                        </div>
                    </li>
                </ul>

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
            <div class="col-lg-12 col-sm-12">
                <a class="btn btn-default btn-lg">货到付款</a>
                <a class="btn btn-default btn-lg">微信支付</a>
                <a class="btn btn-default btn-lg">支付宝支付</a>
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
                        <tr>
                            <td>
                                <div class="pull-left margin-right-20" style="width: 120px;">
                                    <img src="${ctx}/images/cumtp.com/demo/mall/dangdang/20481551-1_l_17.jpg"
                                         alt="" class="img-responsive"/>
                                </div>
                                <div>
                                    <h4><a href="${ctx}/mall/item-2387.html">平行世界</a></h4>
                                    <div>作者:张继</div>
                                    <div>ISBN:29873723</div>
                                </div>
                            </td>
                            <td>
                                1 &times;
                                21.00
                            </td>
                            <td>
                                21.00
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <div class="pull-left margin-right-20" style="width: 120px;">
                                    <img src="${ctx}/images/cumtp.com/demo/mall/dangdang/20531530-1_l_5.jpg"
                                         alt="" class="img-responsive"/>
                                </div>
                                <div>
                                    <h4><a href="${ctx}/mall/item-2387.html">平行世界</a></h4>
                                    <div>作者:张继</div>
                                    <div>ISBN:29873723</div>
                                </div>
                            </td>
                            <td>
                                1 &times;
                                21.00
                            </td>
                            <td>
                                21.00
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <div class="pull-left margin-right-20" style="width: 120px;">
                                    <img src="${ctx}/images/cumtp.com/demo/mall/dangdang/20598233-1_l_2.jpg"
                                         alt="" class="img-responsive"/>
                                </div>
                                <div>
                                    <h4><a href="${ctx}/mall/item-2387.html">平行世界</a></h4>
                                    <div>作者:张继</div>
                                    <div>ISBN:29873723</div>
                                </div>
                            </td>
                            <td>
                                1 &times;
                                21.00
                            </td>
                            <td>
                                21.00
                            </td>

                        </tr>

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

<section class="noborder margin-0 padding-0">
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
</section>

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
											<span class="pull-right">120.75元</span>
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
											<span class="pull-right size-20">120.75元</span>
											<strong class="pull-left">合计:</strong>
										</span>

                            <hr/>

                            <a href="${ctx}/checkout/confirm-order"
                               class="btn btn-danger btn-lg btn-block size-15 weight-800"><i
                                    class="fa fa-mail-forward"></i> 提交订单</a>
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
        $("#selectable").selectable();

    });

</script>
