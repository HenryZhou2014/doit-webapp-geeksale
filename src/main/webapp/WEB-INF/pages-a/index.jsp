<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>

<head>
    <title>首页</title>
    <meta name="column-name" content="home"/>
    <link href="${ctx}/a/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        body {
            background: #f6f6f6;
        }

        .blog-post-item {
            border: none;
            padding: 10px 0;
            margin: 0;
        }

        .blog-post-info {
            border: none;
        }

        .blog-post-info h2 {
            border: none;
            font-size: 16px;
        }

        .blog-post-info ul {
            border: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .blog-post-info p {
            margin-top: 15px;
            margin-bottom: 10px;
        }

        div.heading-title {
            margin-bottom: 20px;
        }

        .price-clean h4 {
            font-size: 18px;
            padding: 10px 0;
            line-height: 28px;
        }

        .price-clean img {
            max-height: 180px;
        }

        .ribbon-inner {
            text-shadow: none;
            background: darkred;
        }

        div.shop-item {
            margin-bottom: 20px;
        }

        .toggle.toggle-transparent-body label {
            font-size: 14px;
            margin: 0;
            padding: 3px 5px;
        }

        div.toggle {
            margin: 1px 0;
        }

        .shop_title {
            font-size: 12px;
            color: #666;
            height: 36px;
            overflow: hidden;
        }

        ul.latest-book-list li {
            margin-top: 5px;
        }

        .latest-book-list img {
            max-width: 200px;
        }

        ul.latest-book-list li:after {
            height: 5px;
        }

        ul.latest-news-list {

        }

        ul.latest-news-list li {
            line-height: 25px;
        }

        ul.latest-news-list li a {
            color: #666;
        }

        ul.latest-news-list li a.title {
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
            width: 280px;
            display: inline-block;
            line-height: 25px;
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
    <div class="fullwidthbanner" data-height="360" data-shadow="0" data-navigationStyle="preview1">
        <ul class="hide">

            <!-- SLIDE  -->
            <li data-transition="fade" data-slotamount="1" data-masterspeed="1000" data-saveperformance="off"
                data-title="Slide title 1" data-thumb="${ctx}/images/cumtp.com/demo/slide/index-min.jpg">

                <img src="${ctx}/images/cumtp.com/demo/slide/1x1.png"
                     data-lazyload="${ctx}/images/cumtp.com/demo/slide/index-min.jpg" alt="" data-bgfit="cover"
                     data-bgposition="center bottom" data-bgrepeat="no-repeat"/>

                <div class="overlay dark-1"><!-- dark overlay [1 to 9 opacity] --></div>

                <div class="tp-caption customin ltl tp-resizeme text_white"
                     data-x="center"
                     data-y="65"
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
                    <span class="weight-300">教材 / 培训教材 / 科技 / 设计</span>
                </div>

                <div class="tp-caption customin ltl tp-resizeme large_bold_white"
                     data-x="center"
                     data-y="125"
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
                    中国矿业大学出版社有限责任公司欢迎你
                </div>

                <div class="tp-caption customin ltl tp-resizeme small_light_white font-lato"
                     data-x="center"
                     data-y="205"
                     data-customin="x:0;y:150;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                     data-speed="800"
                     data-start="1400"
                     data-easing="easeOutQuad"
                     data-splitin="none"
                     data-splitout="none"
                     data-elementdelay="0.01"
                     data-endelementdelay="0.1"
                     data-endspeed="1000"
                     data-endeasing="Power4.easeIn"
                     style="z-index: 10; width: 100%; max-width: 750px; white-space: normal; text-align:center; font-size:20px;">
                    植根教育、繁荣学术、特色立社、精品强社。
                </div>

                <div class="tp-caption customin ltl tp-resizeme"
                     data-x="center"
                     data-y="253"
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
            <li data-transition="fade" data-slotamount="7" data-masterspeed="300" data-saveperformance="off"
                data-title="Slide title 5" data-thumb="${ctx}/images/cumtp.com/demo/slide/wall2.jpg">
                <img src="${ctx}/images/cumtp.com/demo/slide/1x1.png"
                     data-lazyload="${ctx}/images/cumtp.com/demo/slide/wall2.jpg" alt="" data-bgfit="cover"
                     data-bgposition="left top" data-bgrepeat="no-repeat"/>

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
                    <img src="${ctx}/images/cumtp.com/demo/slide/1x1.png"
                         data-lazyload="${ctx}/images/cumtp.com/demo/slide/ipad.png" height="260px" alt=""/>
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
                     style="z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;">在线免费阅读
                </div>

                <div class="tp-caption block_theme_color sft"
                     data-x="right" data-hoffset="-70"
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
                     data-x="right" data-hoffset="-70"
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

<div class="container margin-top-20">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-mini alert-info"><!-- SUCCESS -->
                <button type="button" class="close" data-dismiss="alert">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
                <strong>网站改版中，欢迎提供宝贵建议！</strong>
            </div>
        </div>
    </div>
</div>
<section class="noborder margin-0 padding-0">
    <div class="container <%--margin-top-20--%>">
        <div class="row">
            <div class="col-lg-9">
                <div class="col-lg-12 bg-white">
                    <div class="row margin-top-10">
                        <div class="col-lg-5">
                            <div class="text-center">
                                <div class="owl-carousel owl-padding-3 buttons-autohide controlls-over"
                                     data-plugin-options='{"singleItem": false, "items": "1", "autoPlay": true, "navigation": true, "pagination": true}'>
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

                        <div class="col-lg-7">
                            <ul class="list-unstyled latest-news-list">
                                <doit:articleListByCategoryTag categoy="['news', 'news-institution']" num="8">
                                    <li>
                                        <div class="pull-right margin-left-20">
                                            <fmt:formatDate value="${articleItem.lastEditDate}" pattern="yy-MM-dd"/>
                                        </div>
                                        <c:if test="${not empty articleItem.articleCategory}">
                                            <div class="pull-left" style="margin-right: 5px;">
                                                <a href="#">${articleItem.articleCategory.title}</a> |
                                            </div>
                                        </c:if>

                                        <a class="title" href="${ctx}/news/item-${articleItem.id}.html" target="_blank"
                                           title="${articleItem.title}">${articleItem.title}</a>
                                    </li>
                                </doit:articleListByCategoryTag>
                            </ul>
                        </div>
                    </div>

                    <div class="margin-top-10" style="background: lightgrey; height: 2px;"></div>

                    <div class="row">

                        <div class="col-md-3">

                            <div class="box-icon box-icon-center box-icon-transparent box-icon-large">
                                <a class="box-icon-title" href="${ctx}/mall/list/sale-safe-edu-complex-publish">
                                    <i class="noborder fa fa-tablet" style="background-color:#ee7954; color:#fff;"></i>
                                    <h2>安全教育复合出版</h2>
                                </a>
                                <p>安全教育复合出版书籍</p>
                            </div>

                        </div>

                        <div class="col-md-3">

                            <div class="box-icon box-icon-center box-icon-transparent box-icon-large">
                                <a id="e_resource" class="box-icon-title" href="javascript:void(0)">
                                    <i class="noborder fa fa-random" style="background-color:#f06793; color:#fff;"></i>
                                    <h2>交互式教材数字资源</h2>
                                </a>
                                <p>下载交互式教材数字资源</p>
                            </div>

                        </div>

                        <div class="col-md-3">

                            <div class="box-icon box-icon-center box-icon-transparent box-icon-large">
                                <a class="box-icon-title" href="${ctx}/mall/list/sale-ebooks">
                                    <i class="noborder fa fa-book" style="background-color:#ebba63; color:#fff;"></i>
                                    <h2>电子书免费试读</h2>
                                </a>
                                <p>3千册电子图书免费试读。</p>
                            </div>

                        </div>

                        <div class="col-md-3">

                            <div class="box-icon box-icon-center box-icon-transparent box-icon-large">
                                <a class="box-icon-title" href="${ctx}/agent">
                                    <i class="noborder fa fa-cogs" style="background-color:#ab71bd; color:#fff;"></i>
                                    <h2>经销商服务</h2>
                                </a>
                                <p>联系方式 / 发货退货查询 / 合作伙伴</p>
                            </div>

                        </div>

                    </div>
                </div>

            </div>

            <div class="col-lg-3">
                <div class="col-lg-12 bg-white">
                    <div class="heading-title heading-dotted margin-top-10">
                        <h2 class="size-14"><i class="fa fa-book"></i> 最新书讯</h2>
                    </div>

                    <div>
                        <ul class="list-unstyled book-news-list latest-book-list">
                            <doit:articleListByCategoryTag categoy="['news-latest-book']" num="5">
                                <li class="row col-lg-12 col-sm-6 nopadding nomargin margin-top-10">
                                    <div class="col-lg-3 nopadding nomargin">
                                        <img src="${ctx}/${articleItem.imageInfo.imagePath}" class="img-responsive"/>
                                    </div>
                                    <div class="col-lg-9">
                                        <a target="_blank"
                                           href="${ctx}/news/item-${articleItem.id}">${articleItem.title}</a>
                                        <div class="size-12 margin-top-10">${articleItem.author}</div>
                                    </div>
                                </li>
                            </doit:articleListByCategoryTag>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</section>

<section class="padding-0 noborder">
    <div class="container margin-top-20">
        <div class="row">
            <div class="col-lg-8 ">
                <div class="col-lg-12 bg-white">
                    <div class="heading-title heading-dotted margin-top-10">
                        <h2 class="size-20"><i class="fa fa-book"></i> 上架新书</h2>
                    </div>
                    <ul class="shop-item-list row list-inline nomargin">
                        <doit:saleCategoryOffers categoy="latest" num="8">
                            <!-- ITEM -->
                            <li class="col-lg-3 col-md-3 col-sm-3">
                                <div class="shop-item">
                                    <div class="thumbnail noborder nopadding">
                                        <!-- product image(s) -->
                                        <a class="shop-item-image" href="${ctx}/mall/item-${offerItem.id}.html">
                                            <img style="max-height: 150px;" src="${offerItem.additionInfoMap['thumbnail']}"
                                                 alt=""/>
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
            </div>
            <div class="col-lg-4">
                <div class="col-lg-12 bg-white">
                    <div class="heading-title heading-dotted margin-top-10">
                        <h2 class="size-20"><i class="fa fa-star"></i> 编辑推荐</h2>
                    </div>

                    <div>

                        <!-- tabs content -->
                        <div class="col-md-9 col-sm-9 nopadding">
                            <div class="tab-content tab-stacked">
                                <doit:saleCategoryOffers categoy="editor-recommendation" num="4" var="editorItems"/>
                                <c:forEach items="${editorItems}" var="topItem" varStatus="status">
                                    <div id="tab_${status.index}" class="tab-pane <c:if test='${status.index == 0}'>active</c:if>">
                                        <h4>${topItem.productName}</h4>
                                        <ul class="list-unstyled">
                                            <li>
                                                作者: ${topItem.author}
                                            </li>
                                            <li>
                                                定价: ${topItem.price}元
                                            </li>
                                            <li>
                                                装帧: ${topItem.propertyMap['binding'].propertyValue}
                                            </li>
                                            <li>
                                                出版社: ${topItem.pressName}
                                            </li>
                                            <li>
                                                ISBN: ${topItem.isbn}
                                            </li>

                                        </ul>
                                        <div style="min-height: 312px;">
                                            <doit:rawHtml value="${topItem.richPropertyMap['introduction'].propertyValue}"/>
                                            <%--${editorItem.richPropertyMap['introduction'].propertyValue}--%>
                                        </div>
                                        <div>
                                            <a href="${ctx}/mall/item-${topItem.id}" class="btn btn-default">浏览详细</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <!-- tabs -->
                        <div class="col-md-3 col-sm-3 nopadding">
                            <ul class="nav nav-tabs nav-stacked">
                                <c:forEach items="${editorItems}" var="topItem" varStatus="status">
                                    <li class="<c:if test='${status.index == 0}'>active</c:if>">
                                        <a href="#tab_${status.index}" data-toggle="tab">
                                            <img src="${topItem.additionInfoMap['thumbnail']}" class="img-responsive"/>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

<section class="padding-0 noborder margin-top-20">
    <div class="container">
        <div class="col-lg-12 bg-white">
            <div class="heading-title heading-dotted margin-top-10">
                <h2 class="size-20"><i class="fa fa-bookmark text-danger"></i> 获奖图书</h2>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="callout alert alert-transparent margin-top-20 margin-bottom-20">

                        <div class="row">

                            <div class="col-md-8 col-sm-8"><!-- left text -->
                                <h4>我社合计有35种图书获中国出版政府（图书）奖、中华优秀出版物奖、“三个一百”原创出版工程、国家图书奖、中国图书奖、国家技进奖（图 书）、全国优秀图书奖、国家级优秀教材奖等国家级奖项，有400多种图书获全国高校出版社优秀著作奖、江苏省和煤炭部科技进步奖、江苏省“五个一”工程 奖、江苏图书奖等省部级奖励。</h4>
                            </div><!-- /left text -->


                            <div class="col-md-4 col-sm-4 text-right"><!-- right btn -->
                                <a href="${ctx}/aboutus/medal-books" rel="nofollow" target="_blank"
                                   class="btn btn-default btn-lg">浏览更多获奖图书</a>
                            </div><!-- /right btn -->

                        </div>

                    </div>
                </div>
            </div>
            <div class="row margin-top-10 margin-bottom-20">
                <div class="col-lg-12">
                    <doit:namedTextModuleRichProperty var="medal-books-primary" property="fullText"/>
                </div>
                <%--<doit:saleCategoryOffers categoy="medal-books" num="4">
                    <div class="col-md-3 col-sm-3">

                        <div class="price-clean price-clean-popular">
                            <c:if test="${not empty offerItem.propertyMap['WIN_NO'].propertyValue}">
                                <div class="ribbon">
                                    <div class="ribbon-inner">${offerItem.propertyMap['WIN_NO'].propertyValue}</div>
                                </div>
                            </c:if>

                            <div>
                                <img src="${ctx}/${offerItem.imageInfo.imagePath}"/>
                            </div>

                            <div class="size-12 margin-top-20 height-30">
                                <c:if test="${not empty offerItem.propertyMap['WIN_NAME'].propertyValue}">
                                    ${offerItem.propertyMap['WIN_NAME'].propertyValue}
                                </c:if>
                            </div>

                            <div class="size-16 margin-top-10 weight-600">${offerItem.productName}</div>
                            <div class="margin-top-10">${offerItem.author}</div>
                            <div class="margin-top-20">
                                <a href="${ctx}/aboutus/medal-books" target="_blank" class="btn btn-3d btn-primary">详情</a>
                            </div>
                        </div>

                    </div>
                </doit:saleCategoryOffers>--%>
            </div>
        </div>
    </div>
</section>

<section class="padding-0 margin-top-20 margin-bottom-20 noborder">
    <div class="container ">

        <div class="col-lg-12 bg-white">

            <div class="heading-title heading-dotted margin-top-10">
                <h2 class="size-20"><i class="fa fa-windows text-info"></i> 精品图书</h2>
            </div>

            <ul class="shop-item-list row list-inline nomargin">
                <doit:saleCategoryOffers categoy="excellent" num="12">
                    <!-- ITEM -->
                    <li class="col-lg-2 col-sm-4">

                        <div class="shop-item">

                            <div class="thumbnail noborder nopadding">
                                <!-- product image(s) -->
                                <a class="shop-item-image" href="${ctx}/mall/item-${offerItem.id}.html">
                                    <img style="max-height: 150px;" src="${offerItem.additionInfoMap['thumbnail']}" alt=""/>
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

    </div>
</section>

<div id="e_resource_modal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <!-- header modal -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="mySmallModalLabel">交互式教程数字资源</h4>
            </div>

            <!-- body modal -->
            <div class="modal-body">
                <div class="row" style="margin:30px;padding:30px;">
                    <div class="col-sm-6 col-md-6">
                        <a href="${ctx}/download?cat=resource-video" class="btn btn-featured btn-danger">
                            <span>视频资源</span>
                            <i class="fa fa-play"></i>
                        </a>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <a href="${ctx}/download?cat=resource-materials " class="btn btn-featured btn-info">
                            <span>电子课件资源</span>
                            <i class="fa fa-file-pdf-o"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">


    $(document).ready(function () {
        $("#e_resource").click(function () {
            $('#e_resource_modal').modal('show')
        })

    });


</script>
