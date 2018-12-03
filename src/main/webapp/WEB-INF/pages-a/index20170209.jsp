<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>

<head>
    <title>首页</title>
    <meta name="column-name" content="home"/>
    <link href="${ctx}/a/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        .blog-post-item{
            border: none;
            padding: 10px 0;
            margin: 0;
        }

        .blog-post-info{
            border: none;
        }

        .blog-post-info h2{
            border: none;
            font-size: 16px;
        }

        .blog-post-info ul{
            border: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .blog-post-info p{
            margin-top: 15px;
            margin-bottom: 10px;
        }

        div.heading-title{
            margin-bottom: 20px;
        }

        .price-clean h4{
            font-size: 18px;
            padding: 10px 0;
            line-height: 28px;
        }

        .price-clean img{
            max-height: 180px;
        }

        .ribbon-inner{
            text-shadow: none;
            background: darkred;
        }

        div.shop-item{
            margin-bottom: 20px;
        }

        .toggle.toggle-transparent-body label{
            font-size:14px;
            margin: 0;
            padding: 3px 5px;
        }

        div.toggle{
            margin: 1px 0;
        }

        .shop_title{
            font-size:12px;
            color: #666;
            height:36px;
            overflow: hidden;
        }

        ul.latest-book-list li{
            margin-top: 5px;
        }

        .latest-book-list img{
            max-width: 200px;
        }

        ul.latest-book-list li:after{
            height: 5px;
        }
    </style>
</head>

<div class="slider fullwidthbanner-container roundedcorners">
    <!--
        Navigation Styles:

            data-navigationStyle="" theme default navigation

            data-navigationStyle="preview1"
            data-navigationStyle="preview2"
            data-navigationStyle="preview3"
            data-navigationStyle="preview4"

        Bottom Shadows
            data-shadow="1"
            data-shadow="2"
            data-shadow="3"

        Slider Height (do not use on fullscreen mode)
            data-height="300"
            data-height="350"
            data-height="400"
            data-height="450"
            data-height="500"
            data-height="550"
            data-height="600"
            data-height="650"
            data-height="700"
            data-height="750"
            data-height="800"
    -->
    <div class="fullwidthbanner" data-height="490" data-shadow="0" data-navigationStyle="preview1">
        <ul class="hide">

            <!-- SLIDE  -->
            <li data-transition="fade" data-slotamount="1" data-masterspeed="1000" data-saveperformance="off" data-title="Slide title 1" data-thumb="${ctx}/images/cumtp.com/demo/slide/index-min.jpg">

                <img src="${ctx}/images/cumtp.com/demo/slide/1x1.png" data-lazyload="${ctx}/images/cumtp.com/demo/slide/index-min.jpg" alt="" data-bgfit="cover" data-bgposition="center bottom" data-bgrepeat="no-repeat" />

                <div class="overlay dark-1"><!-- dark overlay [1 to 9 opacity] --></div>

                <div class="tp-caption customin ltl tp-resizeme text_white"
                     data-x="center"
                     data-y="155"
                     data-customin="x:0;y:150;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                     data-speed="800"
                     data-start="1000"
                     data-easing="easeOutQuad"
                     data-splitin="none"
                     data-splitout="none"
                     data-elementdelay="0.01"
                     data-endelementdelay="0.1"
                     data-endspeed="1000"
                     data-endeasing="Power4.easeIn" style="z-index: 10;">
                    <span class="weight-300">教材 / 教辅 / 科技 / 设计</span>
                </div>

                <div class="tp-caption customin ltl tp-resizeme large_bold_white"
                     data-x="center"
                     data-y="205"
                     data-customin="x:0;y:150;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                     data-speed="800"
                     data-start="1200"
                     data-easing="easeOutQuad"
                     data-splitin="none"
                     data-splitout="none"
                     data-elementdelay="0.01"
                     data-endelementdelay="0.1"
                     data-endspeed="1000"
                     data-endeasing="Power4.easeIn" style="z-index: 10;">
                    矿业大学出版社欢迎你
                </div>

                <div class="tp-caption customin ltl tp-resizeme small_light_white font-lato"
                     data-x="center"
                     data-y="295"
                     data-customin="x:0;y:150;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                     data-speed="800"
                     data-start="1400"
                     data-easing="easeOutQuad"
                     data-splitin="none"
                     data-splitout="none"
                     data-elementdelay="0.01"
                     data-endelementdelay="0.1"
                     data-endspeed="1000"
                     data-endeasing="Power4.easeIn" style="z-index: 10; width: 100%; max-width: 750px; white-space: normal; text-align:center; font-size:20px;">
                    数十万册图书，5000多册电子图书
                </div>

                <div class="tp-caption customin ltl tp-resizeme"
                     data-x="center"
                     data-y="383"
                     data-customin="x:0;y:150;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                     data-speed="800"
                     data-start="1550"
                     data-easing="easeOutQuad"
                     data-splitin="none"
                     data-splitout="none"
                     data-elementdelay="0.01"
                     data-endelementdelay="0.1"
                     data-endspeed="1000"
                     data-endeasing="Power4.easeIn" style="z-index: 10;">
                    <a href="${ctx}/mall" class="btn btn-default btn-lg">
                        <span>进入在线商城</span>
                    </a>
                </div>

            </li>

            <!-- SLIDE  -->
            <li data-transition="fade" data-slotamount="7" data-masterspeed="300"  data-saveperformance="off" data-title="Slide title 5" data-thumb="${ctx}/images/cumtp.com/demo/slide/wall2.jpg">
                <img src="${ctx}/images/cumtp.com/demo/slide/1x1.png" data-lazyload="${ctx}/images/cumtp.com/demo/slide/wall2.jpg" alt="" data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat" />

                <div class="tp-caption lfr"
                     data-x="left" data-hoffset="60"
                     data-y="85"
                     data-speed="1500"
                     data-start="500"
                     data-easing="easeOutExpo"
                     data-elementdelay="0.1"
                     data-endelementdelay="0.1"
                     data-endspeed="300"
                     style="z-index: 2;">
                    <img src="${ctx}/images/cumtp.com/demo/slide/1x1.png" data-lazyload="${ctx}/images/cumtp.com/demo/slide/ipad.png" alt="" />
                </div>

                <div class="tp-caption block_black sft"
                     data-x="right" data-hoffset="-70"
                     data-y="137"
                     data-speed="750"
                     data-start="1100"
                     data-easing="easeOutExpo"
                     data-splitin="none"
                     data-splitout="none"
                     data-elementdelay="0.1"
                     data-endelementdelay="0.1"
                     data-endspeed="300"
                     style="z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;">电子图书
                </div>

                <div class="tp-caption block_black sfb"
                     data-x="right" data-hoffset="-70"
                     data-y="176"
                     data-speed="750"
                     data-start="1400"
                     data-easing="easeOutExpo"
                     data-splitin="none"
                     data-splitout="none"
                     data-elementdelay="0.1"
                     data-endelementdelay="0.1"
                     data-endspeed="300"
                     style="z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;">超过10000册在线免费阅读
                </div>

                <div class="tp-caption block_theme_color sft"
                     data-x="right"  data-hoffset="-70"
                     data-y="239"
                     data-speed="750"
                     data-start="1700"
                     data-easing="easeOutExpo"
                     data-splitin="none"
                     data-splitout="none"
                     data-elementdelay="0.1"
                     data-endelementdelay="0.1"
                     data-endspeed="300"
                     style="z-index: 5; max-width: auto; max-height: auto; white-space: nowrap;">
                    教材教辅
                </div>

                <div class="tp-caption block_theme_color sfb"
                     data-x="right"  data-hoffset="-70"
                     data-y="278"
                     data-speed="750"
                     data-start="2000"
                     data-easing="easeOutExpo"
                     data-splitin="none"
                     data-splitout="none"
                     data-elementdelay="0.1"
                     data-endelementdelay="0.1"
                     data-endspeed="300"
                     style="z-index: 6; max-width: auto; max-height: auto; white-space: nowrap;">
                    好帮手
                </div>
            </li>

        </ul>

        <div class="tp-bannertimer"><!-- progress bar --></div>
    </div>
</div>

<section class="noborder margin-0 padding-0">
    <div class="container margin-top-10 padding-top-20">
        <div class="row">
            <div class="col-lg-9">

                <div class="row">
                    <div class="col-lg-4">
                        <div class="text-center">
                            <div class="owl-carousel owl-padding-3 buttons-autohide controlls-over" data-plugin-options='{"singleItem": false, "items": "1", "autoPlay": true, "navigation": true, "pagination": true}'>
                                <a class="img-hover" href="#">
                                    <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/news/2.jpg" alt="">
                                </a>
                                <a class="img-hover" href="#">
                                    <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/news/5.jpg" alt="">
                                </a>
                                <a class="img-hover" href="#">
                                    <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/news/3.jpg" alt="">
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-8">
                        <ul class="list-unstyled">
                            <li>
                                <a href="blog-single-default.html">江苏省第六届书展系列活动报道之二：《徐州汉画像石音乐图像研究》分享会</a>
                            </li>
                            <li>
                                <a href="blog-single-default.html">“品味书香 悦读人生”校园阅读推广会</a>
                            </li>
                            <li>
                                <a href="blog-single-default.html">我社召开2016年度选题论证会</a>
                            </li>
                            <li>
                                <a href="blog-single-default.html">江苏省第六届书展系列活动报道之一：再现大风歌——楚风汉韵歌舞表演</a>
                            </li>
                            <li>
                                <a href="blog-single-default.html">我社“全民应急安全科普纸数互动出版项目”受到验收专家组一致好评</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="heading-title heading-dotted">
                    <h2 class="size-20">最新动态</h2>
                </div>

                <div class="blog-post-item nomargin nopadding">
                    <div class="row">

                    <!-- POST ITEM -->
                        <div class="blog-post-info col-md-12 col-sm-12">
                            <div class="title">
                                <div class="pull-right">
                                    <span class="font-lato">2016-10-14</span>
                                </div>
                                <span class="pull-left">
                                    <i class="fa fa-bell-o"></i> [公告]
                                </span>
                                 <h2 class="pull-left" style="margin-left: 5px;"> <a href="blog-single-default.html">2017年度大专教材招标公告</a></h2>
                            </div>

                        </div>

                    </div>
                    <!-- /POST ITEM -->

                </div>
                <div class="blog-post-item nomargin nopadding">
                    <div class="row">

                        <!-- POST ITEM -->
                        <div class="blog-post-info col-md-12 col-sm-12">
                            <div class="title">
                                <div class="pull-right">
                                    <span class="font-lato">2016-09-14</span>
                                </div>
                                <span class="pull-left">
                                    <i class="fa fa-bell-o"></i> [公告]
                                </span>
                                <h2 class="pull-left" style="margin-left: 5px;"> <a href="blog-single-default.html">2017年度采购招标公告</a></h2>
                            </div>

                        </div>

                    </div>
                    <!-- /POST ITEM -->

                </div>
                <hr class="nomargin"/>
                <div class="blog-post-item">

                    <!-- POST ITEM -->
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <!-- IMAGE -->
                            <figure>
                                <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/news/4.jpg" alt="">
                            </figure>
                        </div>

                        <div class="blog-post-info col-md-9 col-sm-9">

                            <h2><a href="blog-single-default.html">江苏省第六届书展系列活动报道之二：《徐州汉画像石音乐图像研究》分享会</a></h2>

                            <ul class="editor-info list-inline">
                                <li>
                                    <i class="fa fa-calendar-o"></i>
                                    <span class="font-lato">2016-07-14 15:07:03</span>
                                </li>
                                <li>
                                    <i class="fa fa-pencil"></i>
                                    <span class="font-lato">社人文中心</span>
                                </li>
                            </ul>

                            <p class="abstract">传承汉文化，弘扬汉音乐， 2016年7月8号下午2点，中国矿业大学出版社《徐州汉画像石音乐图像研究》分享会在扬州综合馆举行，会场座无虚席。</p>
                        </div>

                    </div>
                    <!-- /POST ITEM -->

                </div>

                <hr class="nomargin"/>

                <div class="blog-post-item">
                    <!-- POST ITEM -->
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <!-- IMAGE -->
                            <figure>
                                <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/news/2.jpg" alt="">
                            </figure>

                        </div>
                        <div class="blog-post-info col-md-9 col-sm-9">

                            <h2><a href="blog-single-default.html">“品味书香 悦读人生”校园阅读推广会</a></h2>

                            <ul class="editor-info list-inline">
                                <li>
                                    <i class="fa fa-calendar-o"></i>
                                    <span class="font-lato">2016-04-26 16:59:10</span>
                                </li>
                                <li>
                                    <i class="fa fa-pencil"></i>
                                    <span class="font-lato">社人文编辑出版中心</span>
                                </li>
                            </ul>

                            <p class="abstract">为迎接第二十一个世界读书日和第二个江苏全民阅读日，根据江苏省新闻出版广电局的布置，我社于4月20日下午在徐州市奎园小学举行“品味书香  悦读人生”校园阅读推广会。</p>
                        </div>

                    </div>
                    <!-- /POST ITEM -->
                </div>

                <hr class="nomargin"/>

                <div class="blog-post-item">

                    <!-- POST ITEM -->
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <!-- IMAGE -->
                            <figure>
                                <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/news/5.jpg" alt="">
                            </figure>

                        </div>
                        <div class="blog-post-info col-md-9 col-sm-9">

                            <h2><a href="blog-single-default.html">我社召开2016年度选题论证会</a></h2>

                            <ul class="editor-info list-inline">
                                <li>
                                    <i class="fa fa-calendar-o"></i>
                                    <span class="font-lato">2016-01-14 15:53:00</span>
                                </li>
                                <li>
                                    <i class="fa fa-pencil"></i>
                                    <span class="font-lato">赵阳</span>
                                </li>
                            </ul>

                            <p class="abstract">2016年1月13日，我社在210会议室召开2016年度选题论证会。</p>
                        </div>

                    </div>
                    <!-- /POST ITEM -->

                </div>

                <hr class="nomargin"/>

                <div class="blog-post-item">
                    <!-- POST ITEM -->
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <!-- IMAGE -->
                            <figure>
                                <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/news/3.jpg" alt="">
                            </figure>
                        </div>

                        <div class="blog-post-info col-md-9 col-sm-9">

                            <h2><a href="blog-single-default.html">江苏省第六届书展系列活动报道之一：再现大风歌——楚风汉韵歌舞表演</a></h2>

                            <ul class="editor-info list-inline">
                                <li>
                                    <i class="fa fa-calendar-o"></i>
                                    <span class="font-lato">2016-07-14 10:19:27</span>
                                </li>
                                <li>
                                    <i class="fa fa-pencil"></i>
                                    <span class="font-lato">社人文中心</span>
                                </li>
                            </ul>

                            <p class="abstract">2016年7月8号下午，中国矿业大学出版社倾力打造的《再现大风歌---楚风汉韵歌舞表演》在江苏省第六届书展扬州中心舞台隆重开演。</p>
                        </div>

                    </div>
                    <!-- /POST ITEM -->

                </div>

                <hr class="nomargin"/>

                <div class="blog-post-item">
                    <!-- POST ITEM -->
                    <div class="row">

                        <div class="blog-post-info col-md-12 col-sm-12">

                            <h2><a href="blog-single-default.html">我社“全民应急安全科普纸数互动出版项目”受到验收专家组一致好评</a></h2>

                            <ul class="editor-info list-inline">
                                <li>
                                    <i class="fa fa-calendar-o"></i>
                                    <span class="font-lato">2015-11-06 11:03:08</span>
                                </li>
                                <li>
                                    <i class="fa fa-pencil"></i>
                                    <span class="font-lato">社办公室</span>
                                </li>
                            </ul>

                            <p class="abstract">2015年11月3日下午，由江苏省文化厅、省新闻出版广电局、省财政厅共同组成的项目验收专家组来到我社，对我社2014年申报的江苏省文化产业引导资金项目“全民应急安全科普纸数互动出版项目”进行了专项检查验收。</p>
                        </div>

                    </div>
                    <!-- /POST ITEM -->
                </div>

            </div>

            <div class="col-lg-3">

                <div class="heading-title heading-dotted margin-top-10">
                    <h2 class="size-14"><i class="fa fa-book"></i> 最新书讯</h2>
                </div>

                <div>
                    <ul class="list-unstyled book-news-list latest-book-list">
                        <li class="row col-lg-12 col-sm-6 nopadding nomargin">
                            <div class="col-lg-3 nopadding nomargin">
                                <img src="${ctx}/images/cumtp.com/demo/news/book-news/1.jpg" class="img-responsive"/>
                            </div>
                            <div class="col-lg-9 nopadding-right nomargin-right">
                                <a>冲击地压启动理论与成套技术</a>
                                <div class="size-12 margin-top-10">潘俊锋等著</div>
                            </div>
                        </li>
                        <li class="row col-lg-12 col-sm-6 nopadding nomargin margin-top-10">
                            <div class="col-lg-3 nopadding nomargin">
                                <img src="${ctx}/images/cumtp.com/demo/news/book-news/2.jpg" class="img-responsive"/>
                            </div>
                            <div class="col-lg-9">
                                <a>《岩层采动裂隙演化规律与应用》出版</a>
                                <div class="size-12 margin-top-10">许家林 著</div>
                            </div>
                        </li>
                        <li class="row col-lg-12 col-sm-6 nopadding nomargin">
                            <div class="col-lg-3 nopadding nomargin">
                                <img src="${ctx}/images/cumtp.com/demo/news/book-news/3.jpg" class="img-responsive"/>
                            </div>
                            <div class="col-lg-9">
                                <a>建筑设备工程</a>
                                <div class="size-12 margin-top-10">张宁 张统华</div>
                            </div>
                        </li>
                        <li class="row col-lg-12 col-sm-6 nopadding nomargin">
                            <div class="col-lg-3 nopadding nomargin">
                                <img src="${ctx}/images/cumtp.com/demo/news/book-news/4.jpg" class="img-responsive"/>
                            </div>
                            <div class="col-lg-9">
                                <a>《煤矿安全规程》条款修订说明（2016）出版</a>
                                <div class="size-12 margin-top-10">《煤矿安全规程》编委会</div>
                            </div>
                        </li>
                        <li class="row col-lg-12 col-sm-6 nopadding nomargin">
                            <div class="col-lg-3 nopadding nomargin">
                                <img src="${ctx}/images/cumtp.com/demo/news/book-news/5.jpg" class="img-responsive"/>
                            </div>
                            <div class="col-lg-9">
                                <a>《〈煤矿安全规程》专家释义（2016）》即将出版面市</a>
                                <div class="size-12 margin-top-10">主编：周连春 赵启峰</div>
                            </div>
                        </li>
                        <li class="row col-lg-12 col-sm-6 nopadding nomargin">
                            <div class="col-lg-3 nopadding nomargin">
                                <img src="${ctx}/images/cumtp.com/demo/news/book-news/6.jpg" class="img-responsive"/>
                            </div>
                            <div class="col-lg-9">
                                <a>《中国煤矿瓦斯地质规律及编图》出版</a>
                                <div class="size-12 margin-top-10">主编：张子敏 吴吟</div>
                            </div>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>


                <div class="margin-top-30">
                    <a href="${ctx}/agent" class="btn btn-3d btn-xlg btn-dirtygreen">
                        <div class="size-20">经销商服务</div>
                        <div class="margin-top-10">
                            <span class="size-13">联系方式 / 发货退货查询 / 合作伙伴</span>
                        </div>
                    </a>
                </div>

            </div>
        </div>

    </div>
</section>

<section class="padding-0 noborder">
    <div class="container margin-top-10 padding-top-20">
        <div class="row">
            <div class="col-lg-8">
                <div class="heading-title heading-dotted">
                    <h2 class="size-20"><i class="fa fa-book"></i> 上架新书</h2>
                </div>
                <ul class="shop-item-list row list-inline nomargin">
                    <doit:saleCategoryOffers categoy="23" num="12">
                        <!-- ITEM -->
                        <li class="col-lg-3 col-md-3 col-sm-3">
                            <div class="shop-item">
                                <div class="thumbnail noborder nopadding">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="${ctx}/mall/item-${offerItem.id}.html">
                                        <img width="160" height="160" src="${ctx}/${offerItem.imageInfo.imagePath}" alt="" />
                                    </a>
                                    <!-- /product image(s) -->
                                </div>
                                <div class="shop-item-summary text-center">
                                    <div class="shop_title">${offerItem.title}</div>
                                    <!-- price -->
                                    <div class="shop-item-price">
                                            ${offerItem.price}元
                                    </div>
                                </div>
                            </div>
                        </li>
                        <!-- /ITEM -->
                    </doit:saleCategoryOffers>
                </ul>
            </div>
            <div class="col-lg-4">
                <div class="heading-title heading-dotted">
                    <h2 class="size-20"><i class="fa fa-star"></i> 编辑推荐</h2>
                </div>

                <div>

                        <!-- tabs content -->
                        <div class="col-md-9 col-sm-9 nopadding">
                            <div class="tab-content tab-stacked">
                                <div id="tab_a" class="tab-pane active">
                                    <h4>偷猎者</h4>
                                    <ul class="list-unstyled">
                                        <li>
                                            作者: 张之一
                                        </li>
                                        <li>
                                            定价: 13.00元
                                        </li>
                                        <li>
                                            装帧: 平装
                                        </li>
                                        <li>
                                            丛书: 矿业大学出版社
                                        </li>
                                        <li>
                                            ISBN: 9787215051119
                                        </li>

                                    </ul>
                                    <p>
                                        在这部充满爱与想象的词典里， 法兰西学院院士，“骨灰级猫奴”弗雷德里克·维杜，以对猫的狂热与深情，研究了猫和人类难以分离的故事。他轻松诙谐地讲述了，猫现身文学、艺术、历史、战争、戏剧、音乐等人类地盘，留下的各种精彩轶事，展开一幅关于猫、又不只有猫的文化“浮世绘”。你会发现在我们的历史文化中，没有猫的世界会多么无聊。
                                    </p>
                                    <div>
                                        <a class="btn btn-default">浏览详细</a>
                                    </div>
                                </div>

                                <div id="tab_b" class="tab-pane">
                                    <h4>教授疯子</h4>
                                    <ul class="list-unstyled">
                                        <li>
                                            作者: 张之一
                                        </li>
                                        <li>
                                            定价: 13.00元
                                        </li>
                                        <li>
                                            装帧: 平装
                                        </li>
                                        <li>
                                            丛书: 矿业大学出版社
                                        </li>
                                        <li>
                                            ISBN: 9787215051119
                                        </li>

                                    </ul>
                                    <p>
                                        陈丹青说：“宗陶嘛，总归写得很好的。”龙应台评价她有“难得的功力”。著名汉学家墨子刻在7小时访问后说，如果自己年轻二十岁，会对她产生爱情。她访干露露的报道，得了非虚构写作大奖。
                                        </p>
                                    <div>
                                        <a class="btn btn-default">浏览详细</a>
                                    </div>
                                </div>

                                <div id="tab_c" class="tab-pane">
                                    <h4>世界简史</h4>
                                    <ul class="list-unstyled">
                                        <li>
                                            作者: 张之一
                                        </li>
                                        <li>
                                            定价: 13.00元
                                        </li>
                                        <li>
                                            装帧: 平装
                                        </li>
                                        <li>
                                            丛书: 矿业大学出版社
                                        </li>
                                        <li>
                                            ISBN: 9787215051119
                                        </li>

                                    </ul>
                                    <p>
                                        他和宫崎骏一起创造了吉卜力的神话，执导了多部成为经典的动画电影。他是粉丝心中无可救药的完美主义者，也是追求日本动画极致之美的殿堂级拖延家。
                                    </p>
                                    <div>
                                        <a class="btn btn-default">浏览详细</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- tabs -->
                        <div class="col-md-3 col-sm-3 nopadding">
                            <ul class="nav nav-tabs nav-stacked">
                                <li class="active">
                                    <a href="#tab_a" data-toggle="tab">
                                        <img src="${ctx}/images/cumtp.com/demo/mall/dangdang/24039255-1_l_3.jpg" class="img-responsive"/>
                                    </a>
                                </li>
                                <li>
                                    <a href="#tab_b" data-toggle="tab">
                                        <img src="${ctx}/images/cumtp.com/demo/mall/dangdang/24032349-1_l_6.jpg" class="img-responsive"/>
                                    </a>
                                </li>
                                <li>
                                    <a href="#tab_c" data-toggle="tab">
                                        <img src="${ctx}/images/cumtp.com/demo/mall/dangdang/23994896-1_l_6.jpg" class="img-responsive"/>
                                    </a>
                                </li>
                            </ul>
                        </div>

                    </div>
            </div>
        </div>
    </div>
</section>

<section class="padding-0 noborder">
    <div class="container">
        <div class="heading-title heading-dotted">
            <h2 class="size-20"><i class="fa fa-bookmark text-danger"></i> 获奖图书</h2>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="callout alert alert-transparent margin-top-20 margin-bottom-20">

                    <div class="row">

                        <div class="col-md-8 col-sm-8"><!-- left text -->
                            <h4>我社合计获各类奖项图书多达80多册，在同行中处于领先水平！</h4>
                        </div><!-- /left text -->


                        <div class="col-md-4 col-sm-4 text-right"><!-- right btn -->
                            <a href="#purchase" rel="nofollow" target="_blank" class="btn btn-default btn-lg">浏览更多获奖图书</a>
                        </div><!-- /right btn -->

                    </div>

                </div>
            </div>
        </div>
        <div class="row margin-top-10">

            <div class="col-md-3 col-sm-3">

                <div class="price-clean price-clean-popular">
                    <div class="ribbon">
                        <div class="ribbon-inner">畅销书一等奖</div>
                    </div>
                    <div>
                        <img src="${ctx}/images/cumtp.com/demo/books/114.gif"/>
                    </div>

                    <div class="size-12 margin-top-20">2011年普通高等教育精品教材奖</div>

                    <div class="size-16 margin-top-10 weight-600">测量学</div>
                    <div class="margin-top-10">张澜</div>
                    <div class="margin-top-20">
                        <a href="#" class="btn btn-3d btn-primary">详情</a>
                    </div>
                </div>

            </div>

            <div class="col-md-3 col-sm-3">

                <div class="price-clean price-clean-popular">
                    <div class="ribbon">
                        <div class="ribbon-inner">精品教材奖</div>
                    </div>
                    <div>
                        <img src="${ctx}/images/cumtp.com/demo/books/112.gif"/>
                    </div>

                    <div class="size-12 margin-top-20">第二届中国出版政府奖（图书奖）提名奖</div>

                    <div class="size-16 margin-top-10 weight-600">中国洁净煤</div>
                    <div class="margin-top-10">陈清如、刘炯天</div>
                    <div class="margin-top-20">
                        <a href="#" class="btn btn-3d btn-primary">详情</a>
                    </div>
                </div>

            </div>

            <div class="col-md-3 col-sm-3">

                <div class="price-clean price-clean-popular">
                    <div class="ribbon">
                        <div class="ribbon-inner">精品教材奖</div>
                    </div>
                    <div>
                        <img src="${ctx}/images/cumtp.com/demo/books/111.gif" />
                    </div>

                    <div class="size-12 margin-top-20">第二届中国出版政府奖（图书奖）提名奖</div>

                    <div class="size-16 margin-top-10 weight-600">煤矿瓦斯防治技术与工程实践</div>
                    <div class="margin-top-10">何学秋</div>
                    <div class="margin-top-20">
                        <a href="#" class="btn btn-3d btn-primary">详情</a>
                    </div>
                </div>

            </div>

            <div class="col-md-3 col-sm-3">

                <div class="price-clean price-clean-popular">
                    <div class="ribbon">
                        <div class="ribbon-inner">精品教材奖</div>
                    </div>
                    <div>
                        <img src="${ctx}/images/cumtp.com/demo/books/110.gif"/>
                    </div>

                    <div class="size-12 margin-top-20">2011年普通高等教育精品教材奖</div>

                    <div class="size-16 margin-top-10 weight-600">瓦斯地质学</div>
                    <div class="margin-top-10">张澜</div>
                    <div class="margin-top-20">
                        <a href="#" class="btn btn-3d btn-primary">详情</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

<section class="padding-0 margin-top-30">
    <div class="container">

        <div class="heading-title heading-dotted">
            <h2 class="size-20"><i class="fa fa-windows text-info"></i> 精品图书</h2>
        </div>

        <ul class="shop-item-list row list-inline nomargin">
            <doit:saleCategoryOffers categoy="23" num="12">
                <!-- ITEM -->
                <li class="col-lg-2 col-sm-4">

                    <div class="shop-item">

                        <div class="thumbnail noborder nopadding">
                            <!-- product image(s) -->
                            <a class="shop-item-image" href="${ctx}/mall/item-${offerItem.id}.html">
                                <img class="img-responsive" src="${ctx}/${offerItem.imageInfo.imagePath}" alt="" />
                            </a>
                            <!-- /product image(s) -->

                        </div>

                        <div class="shop-item-summary text-center">
                            <h2 class="size-14">${offerItem.title}</h2>

                            <!-- price -->
                            <div class="shop-item-price">
                                    ${offerItem.price}元
                            </div>
                            <!-- /price -->
                        </div>

                    </div>

                </li>
                <!-- /ITEM -->
            </doit:saleCategoryOffers>
        </ul>

    </div>
</section>

<script type="text/javascript">


    $(document).ready(function () {


    });


</script>
