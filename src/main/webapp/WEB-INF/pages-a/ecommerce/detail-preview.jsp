<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>图书信息</title>
    <meta name="heading" content="新闻栏目"/>

    <link href="${ctx}/a/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>

    <style type="text/css">

        .callout.alert {
            padding: 3px 0;
        }

    </style>
</head>

<!-- REVOLUTION SLIDER -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div>
                    <ul class="list-unstyled list-inline navigator-bar">
                        <li><a href="${ctx}/mall"><i class="fa fa-book"></i> 全部图书</a></li>
                        <li><i class="fa fa-angle-right"></i></li>
                        <li><a href="${ctx}/mall/list">哲学、宗教</a></li>
                        <li><i class="fa fa-angle-right"></i></li>
                        <li><a href="${ctx}/mall/list">逻辑学(伦理学)</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row margin-top-30">

            <!-- IMAGE -->
            <div class="col-lg-4 col-sm-4">

                <div class="thumbnail relative margin-bottom-3">

                    <!--
                        IMAGE ZOOM

                        data-mode="mouseover|grab|click|toggle"
                    -->
                    <figure id="zoom-primary" class="zoom" data-mode="mouseover">
                        <!--
                            zoom buttton

                            positions available:
                                .bottom-right
                                .bottom-left
                                .top-right
                                .top-left
                        -->
                        <a class="lightbox bottom-right"
                           href="${ctx}/images/cumtp.com/demo/mall/books/581c5ffdNcef169e5(3).jpg"
                           data-plugin-options='{"type":"image"}'><i class="glyphicon glyphicon-search"></i></a>

                        <!--
                            image

                            Extra: add .image-bw class to force black and white!
                        -->
                        <img class="img-responsive"
                             src="${ctx}/images/cumtp.com/demo/mall/books/581c5ffdNcef169e5.jpg" width="1200"
                             height="1500" alt="This is the product title"/>
                    </figure>

                </div>

                <!-- Thumbnails (required height:100px) -->
                <div data-for="zoom-primary" class="zoom-more owl-carousel owl-padding-3 featured"
                     data-plugin-options='{"singleItem": false, "autoPlay": false, "navigation": true, "pagination": false}'>
                    <a class="thumbnail active"
                       href="${ctx}/images/cumtp.com/demo/mall/books/581c5ffdNcef169e5.jpg">
                        <img src="${ctx}/images/cumtp.com/demo/mall/books/581c5ffdNcef169e5(3).jpg" height="100"
                             alt=""/>
                    </a>
                </div>
                <!-- /Thumbnails -->

            </div>
            <!-- /IMAGE -->

            <!-- ITEM DESC -->
            <div class="col-lg-8 col-sm-8">

                <div style="position: absolute; right: 20px; top: 30px;">
                    <div class="text-center" style="width: 150px;">
                        <div>
                            <img src="${ctx}/images/cumtp.com/demo/weixin.jpg" class="img-responsive"/>
                        </div>
                        <div class="text-center">
                            <p>
                                扫描二维码，到我社天猫书城购买
                            </p>
                        </div>
                    </div>
                </div>

                <div>
                    <div>
                        <h4>${sellOffer.title}</h4>
                    </div>

                    <div>
                        作者: 马伯庸
                    </div>

                    <!-- price -->
                    <div class="shop-item-price ">
                        <span class="size-20 weight-800">78.00</span> 元
                    </div>
                    <!-- /price -->

                    <div class="clearfix margin-bottom-30 margin-top-30">
                        <div class="row">
                            <div class="col-sm-3">ISBN</div>
                            <div class="col-sm-9">9787302253280</div>
                        </div>
                        <div class="row margin-top-5">
                            <div class="col-sm-3">出版社</div>
                            <div class="col-sm-9">徐州大学出版社</div>
                        </div>
                        <div class="row margin-top-5">
                            <div class="col-xs-3">版次</div>
                            <div class="col-xs-9">1</div>
                        </div>
                        <div class="row margin-top-5">
                            <div class="col-xs-3">页数</div>
                            <div class="col-xs-9">239</div>
                        </div>
                        <div class="row margin-top-5">
                            <div class="col-xs-3">出版日期</div>
                            <div class="col-xs-9">2015-08-20</div>
                        </div>
                    </div>
                </div>

                <!-- short description -->
                <p>
                    <doit:sellOfferRichProperty var="${sellOffer}" property="introduction" defaultText="暂无内容"/>
                </p>
                <!-- /short description -->

                <!-- FORM -->
                <form class="clearfix nomargin" method="get" action="shop-cart.html">
                    <input type="hidden" name="product_id" value="1"/>

                    <!-- see assets/js/view/demo.shop.js -->
                    <input type="hidden" id="color" name="color" value="yellow"/>
                    <input type="hidden" id="qty" name="qty" value="1"/>
                    <input type="hidden" id="size" name="size" value="5"/>
                    <!-- see assets/js/view/demo.shop.js -->
                    <div class="row">
                        <div class="col-xs-3">数量</div>
                        <div class="col-xs-9">
                            <div style="width: 100px;">
                                <input type="text" value="1" min="1" max="10" class="form-control stepper">
                            </div>
                        </div>
                    </div>

                    <div>
                        <button class="btn btn-default pull-left product-add-cart noradius"><i class="fa fa-shopping-cart"></i> 加入购物车</button>

                        <button class="btn btn-primary pull-left product-add-cart noradius margin-left-10"><i class="fa fa-check"></i> 立即购买</button>
                    </div>

                </form>
                <!-- /FORM -->

            </div>
            <!-- /ITEM DESC -->

        </div>
        <div class="row">

            <!-- RIGHT -->
            <div class="col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">


                <ul id="myTab" class="nav nav-tabs nav-top-border margin-top-30" role="tablist">
                    <li role="presentation" class="active"><a href="#description" role="tab" data-toggle="tab">商品详情</a>
                    </li>
                    <li role="presentation"><a href="#reviews" role="tab" data-toggle="tab">评论 (2)</a></li>
                </ul>

                <div class="tab-content padding-top-20">
                    <!-- DESCRIPTION -->
                    <div role="tabpanel" class="tab-pane fade in active" id="description">

                        <div class="row margin-bottom-20 size-13">
                            <div class="col-lg-12">

                                <div class="col-lg-4">
                                    ISBN：19876236681-872
                                </div>
                                <div class="col-lg-4">
                                    版次：1
                                </div>
                                <div class="col-lg-4">
                                    页数：200
                                </div>
                                <div class="col-lg-4">
                                    字数：128000
                                </div>
                                <div class="col-lg-4">
                                    印刷时间：2015年01月01日
                                </div>
                                <div class="col-lg-4">
                                    开本：16开
                                </div>
                                <div class="col-lg-4">
                                    纸张：胶版纸
                                </div>
                                <div class="col-lg-4">
                                    印次：1
                                </div>
                                <div class="col-lg-4">
                                    包装：精装
                                </div>
                                <div class="col-lg-4">
                                    分类：图书 / 小说 / 侦探
                                </div>
                            </div>
                        </div>

                        <div class="callout alert alert-info margin-top-10 margin-bottom-10">

                            <div class="row">

                                <div class="col-md-8 col-sm-8"><!-- left text -->
                                    <span class="size-14">编辑推荐</span>
                                </div><!-- /left text -->
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-lg-12" style="padding-left: 30px;">
                                <doit:sellOfferRichProperty var="${sellOffer}" property="editorRecommend" defaultText="暂无内容"/>
                            </div>
                        </div>

                        <div class="callout alert alert-info margin-top-10 margin-bottom-10">

                            <div class="row">

                                <div class="col-md-8 col-sm-8"><!-- left text -->
                                    <span class="size-14">作者简介</span>
                                </div><!-- /left text -->
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-lg-12" style="padding-left: 30px;">
                                <doit:sellOfferRichProperty var="${sellOffer}" property="authorInfo" defaultText="暂无内容"/>
                            </div>
                        </div>

                        <div class="callout alert alert-info margin-top-10 margin-bottom-10">

                            <div class="row">

                                <div class="col-md-8 col-sm-8"><!-- left text -->
                                    <span class="size-14">目录</span>
                                </div><!-- /left text -->
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-lg-12" style="padding-left: 30px;">
                                <doit:sellOfferRichProperty var="${sellOffer}" property="catalogue" defaultText="暂无内容"/>
                            </div>
                        </div>

                        <div class="callout alert alert-info margin-top-10 margin-bottom-10">

                            <div class="row">

                                <div class="col-md-8 col-sm-8"><!-- left text -->
                                    <span class="size-14">前言</span>
                                </div><!-- /left text -->
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-lg-12 padding-left-10" style="padding-left: 30px;">
                                <doit:sellOfferRichProperty var="${sellOffer}" property="preface" defaultText="暂无内容"/>
                            </div>
                        </div>

                    </div>

                    <!-- REVIEWS -->
                    <div role="tabpanel" class="tab-pane fade" id="reviews">
                        <!-- REVIEW ITEM -->
                        <div class="block margin-bottom-60">

                            <div class="media-body">
                                <h4 class="media-heading size-14">
                                    五棵松 &ndash;
                                    <span class="text-muted">2016-09-09 10:20</span> &ndash;
                                    <span class="size-14 text-muted"><!-- stars -->
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
												</span>
                                </h4>

                                <p>
                                    书的内容很经典，性价比高，很满意，活动买的非常优惠，好好品读。
                                </p>

                            </div>

                        </div>
                        <!-- /REVIEW ITEM -->

                        <!-- REVIEW ITEM -->
                        <div class="block margin-bottom-60">

                            <div class="media-body">
                                <h4 class="media-heading size-14">
                                    下里巴人 &ndash;
                                    <span class="text-muted">2016-10-09 10:20</span> &ndash;
                                    <span class="size-14 text-muted"><!-- stars -->
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
												</span>
                                </h4>

                                <p>
                                    电子书很好，现在能定下心看书的机会太少了.
                                </p>

                            </div>

                        </div>
                        <!-- /REVIEW ITEM -->


                        <!-- REVIEW FORM -->
                        <h4 class="page-header margin-bottom-40">我来评论</h4>
                        <form method="post" action="#" id="form">

                            <!-- Comment -->
                            <div class="margin-bottom-30">
                                <textarea name="text" id="text" class="form-control" rows="6" placeholder="在这里写下你的评论！"
                                          maxlength="1000"></textarea>
                            </div>

                            <!-- Send Button -->
                            <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> 提交评论</button>

                        </form>
                        <!-- /REVIEW FORM -->

                    </div>
                </div>

                <h2 class="owl-featured">相关图书</h2>
                <div class="owl-carousel featured nomargin owl-padding-10"
                     data-plugin-options='{"singleItem": false, "items": "4", "stopOnHover":false, "autoPlay":4500, "autoHeight": false, "navigation": true, "pagination": false}'>

                    <!-- item -->
                    <div class="shop-item nomargin">

                        <div class="thumbnail">
                            <!-- product image(s) -->
                            <a class="shop-item-image" href="shop-single-left.html">
                                <img class="img-responsive"
                                     src="${ctx}/images/cumtp.com/demo/mall/jd/57c4ff70N08df249f.jpg"
                                     alt="shop first image"/>
                            </a>
                            <!-- /product image(s) -->

                        </div>

                        <div class="shop-item-summary text-center">
                            <h2>鞋狗</h2>

                            <!-- price -->
                            <div class="shop-item-price">
                                98.00元
                            </div>
                            <!-- /price -->
                        </div>

                    </div>
                    <!-- /item -->

                    <!-- item -->
                    <div class="shop-item nomargin">

                        <div class="thumbnail">
                            <!-- product image(s) -->
                            <a class="shop-item-image" href="shop-single-left.html">
                                <!-- CAROUSEL -->
                                <div class="owl-carousel owl-padding-0 nomargin"
                                     data-plugin-options='{"singleItem": true, "autoPlay": 3000, "navigation": false, "pagination": false, "transitionStyle":"fadeUp"}'>
                                    <img class="img-responsive"
                                         src="${ctx}/images/cumtp.com/demo/mall/jd/ec326fcd-683c-41c7-864e-c97d88772c48.jpg"
                                         alt="">
                                </div>
                                <!-- /CAROUSEL -->
                            </a>
                            <!-- /product image(s) -->
                        </div>

                        <div class="shop-item-summary text-center">
                            <h2>是寂寞撒的谎</h2>

                            <!-- price -->
                            <div class="shop-item-price">
                                44.00元
                            </div>
                            <!-- /price -->
                        </div>

                    </div>
                    <!-- /item -->

                    <!-- item -->
                    <div class="shop-item nomargin">

                        <div class="thumbnail">
                            <!-- product image(s) -->
                            <a class="shop-item-image" href="shop-single-left.html">
                                <img class="img-responsive"
                                     src="${ctx}/images/cumtp.com/demo/mall/jd/rBEGElAkffoIAAAAAABLtWimJLgAABWrQMj66YAAEvN055.jpg"
                                     alt="shop first image"/>
                            </a>
                            <!-- /product image(s) -->

                        </div>

                        <div class="shop-item-summary text-center">
                            <h2>每天温暖自己一点点</h2>

                            <!-- price -->
                            <div class="shop-item-price">
                                65.00元
                            </div>
                            <!-- /price -->
                        </div>

                    </div>
                    <!-- /item -->

                    <!-- item -->
                    <div class="shop-item nomargin">

                        <div class="thumbnail">
                            <!-- product image(s) -->
                            <a class="shop-item-image" href="shop-single-left.html">
                                <img class="img-responsive"
                                     src="${ctx}/images/cumtp.com/demo/mall/jd/rBEGEVAkfgUIAAAAAACv9UYy5k8AABWrgAhkB0AALAN322.jpg"
                                     alt="shop first image"/>
                            </a>
                            <!-- /product image(s) -->

                        </div>

                        <div class="shop-item-summary text-center">
                            <h2>福尔摩斯探案全集</h2>

                            <!-- price -->
                            <div class="shop-item-price">
                                56.00元
                            </div>
                            <!-- /price -->
                        </div>

                    </div>
                    <!-- /item -->

                    <!-- item -->
                    <div class="shop-item nomargin">

                        <div class="thumbnail">
                            <!-- product image(s) -->
                            <a class="shop-item-image" href="shop-single-left.html">
                                <img class="img-responsive"
                                     src="${ctx}/images/cumtp.com/demo/mall/jd/575f6a58Nd5ad670b.jpg"
                                     alt="shop first image"/>
                            </a>
                            <!-- /product image(s) -->
                        </div>

                        <div class="shop-item-summary text-center">
                            <h2>爸爸的故事</h2>

                            <!-- price -->
                            <div class="shop-item-price">
                                154.00元
                            </div>
                            <!-- /price -->
                        </div>


                    </div>
                    <!-- /item -->

                    <!-- item -->
                    <div class="shop-item nomargin">

                        <div class="thumbnail">
                            <!-- product image(s) -->
                            <a class="shop-item-image" href="shop-single-left.html">
                                <img class="img-responsive"
                                     src="${ctx}/images/cumtp.com/demo/mall/jd/554b05faN2b70692d.jpg"
                                     alt="shop first image"/>
                            </a>
                            <!-- /product image(s) -->
                        </div>

                        <div class="shop-item-summary text-center">
                            <h2>心探索</h2>

                            <!-- price -->
                            <div class="shop-item-price">
                                167.00元
                            </div>
                            <!-- /price -->
                        </div>

                    </div>
                    <!-- /item -->

                    <!-- item -->
                    <div class="shop-item nomargin">

                        <div class="thumbnail">
                            <!-- product image(s) -->
                            <a class="shop-item-image" href="shop-single-left.html">
                                <img class="img-responsive"
                                     src="${ctx}/images/cumtp.com/demo/mall/jd/57284160N0f20f5bc.jpg"
                                     alt="shop hover image"/>
                            </a>
                            <!-- /product image(s) -->
                        </div>

                        <div class="shop-item-summary text-center">
                            <h2>折耳兔奇奇</h2>

                            <!-- price -->
                            <div class="shop-item-price">
                                128.00元
                            </div>
                            <!-- /price -->
                        </div>

                    </div>
                    <!-- /item -->

                </div>

            </div>


            <!-- LEFT -->
            <div class="col-lg-3 col-md-3 col-sm-3 col-lg-pull-9 col-md-pull-9 col-sm-pull-9">

                <!-- CATEGORIES -->
                <div class="side-nav margin-bottom-60">

                    <div class="side-nav-head">
                        <button class="fa fa-bars"></button>
                        <h4>图书目录</h4>
                    </div>

                    <ul class="list-group list-group-bordered list-group-noicon uppercase">
                        <li class="list-group-item active">
                            <a class="dropdown-toggle" href="#">马克思主义、列宁主义、毛泽东思想、邓小平理论</a>
                            <ul>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(123)</span> 马克思、恩格斯著作</a></li>
                                <li class="active"><a href="#"><span class="size-11 text-muted pull-right">(331)</span> 列宁著作</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(331)</span> 斯大林著作</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(331)</span> 毛泽东著作</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(331)</span> 邓小平著作</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(331)</span> 马克思、恩格斯、列宁、斯大林、毛泽东、邓小平著作汇编</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(331)</span> 马克思、恩格斯、列宁、斯大林、毛泽东、邓小平生平和传记</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(331)</span> 马克思主义、列宁主义、毛泽东思想、邓小平理论的学习和研究</a></li>
                            </ul>
                        </li>
                        <li class="list-group-item">
                            <a class="dropdown-toggle" href="#">哲学、宗教</a>
                            <ul>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(123)</span> 哲学理论</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(331)</span> 世界哲学</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(331)</span> 思维科学</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(331)</span> 逻辑学（论理学）</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(331)</span> 心理学</a></li>
                            </ul>
                        </li>

                        <li class="list-group-item">
                            <a class="dropdown-toggle" href="#">社会科学总论</a>
                            <ul>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(88)</span> 社会科学理论与方法论</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(88)</span> 统计学</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(22)</span> 社会学</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(31)</span> 人口学</a></li>
                            </ul>
                        </li>
                        <li class="list-group-item">
                            <a class="dropdown-toggle" href="#">政治、法律</a>
                            <ul>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(88)</span> 政治理论</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(22)</span> 国际共产主义运动</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(22)</span> 中国共产党</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(22)</span> 工人、农民、青年、妇女运动与组织</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(31)</span> 世界政治</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(18)</span> 中国政治</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(18)</span> 外交、国际关系</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(18)</span> 法律</a></li>
                            </ul>
                        </li>
                        <li class="list-group-item">
                            <a class="dropdown-toggle" href="#">经济</a>
                            <ul>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(88)</span> 经济学</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(22)</span> 世界各国经济概况、经济史、经济地理</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(22)</span> 经济计划与管理</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(22)</span> 农业经济</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(22)</span> 工业经济</a></li>
                            </ul>
                        </li>
                        <li class="list-group-item"><a href="#"><span class="size-11 text-muted pull-right">(189)</span> 数理科学和化学</a></li>
                        <li class="list-group-item">
                            <a class="dropdown-toggle" href="#">综合性图书</a>
                            <ul>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(88)</span> 百科全书、类书</a></li>
                                <li><a href="#"><span class="size-11 text-muted pull-right">(22)</span> 论文集、全集、选集、杂著</a></li>
                            </ul>
                        </li>

                    </ul>

                </div>
                <!-- /CATEGORIES -->


                <!-- BANNER ROTATOR -->
                <div class="owl-carousel buttons-autohide controlls-over margin-bottom-60 text-center"
                     data-plugin-options='{"singleItem": true, "autoPlay": 4000, "navigation": true, "pagination": false, "transitionStyle":"goDown"}'>
                    <a href="#">
                        <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/mall/jd/58006bc9N0af3b3ac.jpg"
                             width="270"
                             height="350" alt="">
                    </a>
                    <a href="#">
                        <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/mall/jd/5800a5a4Nf3d135fe.jpg"
                             width="270"
                             height="350" alt="">
                    </a>
                </div>
                <!-- /BANNER ROTATOR -->

            </div>

        </div>

    </div>
</section>

<script type="text/javascript">

    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class


    });
</script>
