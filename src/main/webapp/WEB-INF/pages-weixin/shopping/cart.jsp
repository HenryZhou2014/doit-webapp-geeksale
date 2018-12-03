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


        <!-- EMPTY CART -->
        <%--<div class="panel panel-default">
            <div class="panel-body">
                <strong>Shopping cart is empty!</strong><br />
                You have no items in your shopping cart.<br />
                Click <a href="index.html">here</a> to continue shopping. <br />
                <span class="label label-warning">this is just an empty cart example</span>
            </div>
        </div>--%>
        <!-- /EMPTY CART -->

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
                                    <input type="checkbox"/>
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
                            <tr>
                                <td>
                                    <input type="checkbox"/>
                                </td>
                                <td>
                                    <div class="pull-left margin-right-20" style="width: 80px;">
                                        <img src="${ctx}/images/cumtp.com/demo/mall/dangdang/20481551-1_l_17.jpg"
                                             alt="" class="img-responsive"/>
                                    </div>
                                    <div>
                                        <h4><a class="size-14" href="${ctx}/mall/item-2387.html">平行世界</a></h4>
                                        <div class="size-12">作者 张继</div>
                                        <div class="size-12">ISBN 29873723</div>
                                    </div>
                                </td>
                                <td>
                                    <input type="number" class="itemNumber" value="1" name="qty" maxlength="3" max="999" min="1"/> &times;
                                    21.00
                                </td>
                                <td>
                                    21.00
                                </td>
                                <td>
                                    <a href="#" class="btn btn-default btn-xs"><i class="fa fa-trash"></i> 删除</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox"/>
                                </td>
                                <td>
                                    <div class="pull-left margin-right-20" style="width: 80px;">
                                        <img src="${ctx}/images/cumtp.com/demo/mall/dangdang/20531530-1_l_5.jpg"
                                             alt="" class="img-responsive"/>
                                    </div>
                                    <div>
                                        <h4><a class="size-14" href="${ctx}/mall/item-2387.html">平行世界</a></h4>
                                        <div class="size-12">作者 张继</div>
                                        <div class="size-12">ISBN 29873723</div>
                                    </div>
                                </td>
                                <td>
                                    <input type="number" class="itemNumber" value="1" name="qty" maxlength="3" max="999" min="1"/> &times;
                                    21.00
                                </td>
                                <td>
                                    21.00
                                </td>
                                <td>
                                    <a href="#" class="btn btn-default btn-xs"><i class="fa fa-trash"></i> 删除</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox"/>
                                </td>
                                <td>
                                    <div class="pull-left margin-right-20" style="width: 80px;">
                                        <img src="${ctx}/images/cumtp.com/demo/mall/dangdang/20598233-1_l_2.jpg"
                                             alt="" class="img-responsive"/>
                                    </div>
                                    <div>
                                        <h4><a class="size-14" href="${ctx}/mall/item-2387.html">平行世界</a></h4>
                                        <div class="size-12">作者 张继</div>
                                        <div class="size-12">ISBN 29873723</div>
                                    </div>
                                </td>
                                <td>
                                    <input type="number" class="itemNumber" value="1" name="qty" maxlength="3" max="999" min="1"/> &times;
                                    21.00
                                </td>
                                <td>
                                    21.00
                                </td>
                                <td>
                                    <a href="#" class="btn btn-default btn-xs"><i class="fa fa-trash"></i> 删除</a>
                                </td>
                            </tr>

                        </table>
                        </div>

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

                                    <a href="${ctx}/checkout"
                                       class="btn btn-primary btn-lg btn-block size-15"><i
                                            class="fa fa-mail-forward"></i> 结算</a>
                                </div>
                            </div>
                        </div>

                        <button class="btn btn-danger btn-sm margin-top-10 margin-right-10"><i class="fa fa-trash"></i> 删除</button>

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

    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class


    });

</script>
