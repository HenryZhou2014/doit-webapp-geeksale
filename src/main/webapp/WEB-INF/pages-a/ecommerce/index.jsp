<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>书城</title>
    <meta name="heading" content="书城栏目"/>
    <meta name="column-name" content="news"/>

    <link href="${ctx}/a/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/a/resource/styles/menu.css" rel="stylesheet" type="text/css"/>


    <style type="text/css">
        body {
            background: #f6f6f6;
        }

        div.shop-item > .thumbnail > .shop-item-info > .label {
            min-width: 15px;
        }

        div.shop-item > .thumbnail > .shop-option-over {
            bottom: 8px !important;
            width: 100px;
        }

        div.shop-item > .thumbnail > a.shop-item-image {
            height: 160px;
            overflow: hidden;
        }

        div.shop-item {
            margin-bottom: 20px;
        }

        .ribbon-inner {
            text-shadow: none;
            background: darkred;
        }

        div.latestbooks div.shop-item > .thumbnail > a.shop-item-image {
            height: 150px;
        }

        .price-clean img {
            max-height: 180px;
        }

        .shop-item-title{
            overflow: hidden;
            white-space: nowrap;
        }

        .cat-item{
            height: 25px;
            overflow: hidden;
        }
    </style>
</head>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-mini alert-info nomargin"><!-- SUCCESS -->
                <button type="button" class="close" data-dismiss="alert">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
                <strong>商城建设中，暂不开放购买！</strong>
            </div>
        </div>
    </div>
</div>

<section class="noborder padding-0 margin-top-10">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">
                <jsp:include page="/app/cms/module/slides/column-mall-main/slides"/>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3 col-lg-pull-9 col-md-pull-9 col-sm-pull-9 ">
                <div class="col-lg-12 bg-white">
                    <div class="row">
                        <ul class="nav nav-tabs nav-top-border">
                            <li class="active margin-left-10"><a href="#cat1" data-toggle="tab">社内分类</a></li>
                            <li><a href="#cat2" data-toggle="tab">中图法分类</a></li>
                        </ul>
                    </div>

                    <div class="tab-content" style="padding:0 0 15px 0">
                        <div class="tab-pane fade in active" id="cat1">
                            <div class="side-nav" style="position: relative">
                                <!--所有分类 Start-->
                                <div class="wrap">
                                    <div class="all-sort-list nav-height">
                                        <doit:goodsSaleCategoryList root="sale-category">
                                        <div class="item bo">
                                            <h3><span>·</span><a href="${ctx}/mall/list/sale-${categoryItem.aliasName}">${categoryItem.title}</a></h3>
                                            <c:if test="${categoryItem.childCategories != null && fn:length(categoryItem.childCategories) > 0}">
                                                <div class="item-list clearfix">
                                                    <div class="close">x</div>
                                                    <div class="subitem">
                                                        <c:forEach items="${categoryItem.childCategories}" var="subItem" varStatus="status">
                                                            <div class="col-lg-6 margin-top-10 cat-item">
                                                                <a href="${ctx}/mall/list/sale-${subItem.aliasName}" title="${subItem.title}">${subItem.title}</a>
                                                            </div>
                                                            <%--<c:if test="${(status.index + 1) mod 3 eq (1)}">
                                                                <dl class="fore1">
                                                                    <dd>
                                                            </c:if>
                                                            <c:if test="${(status.index + 1) mod 3 != 0}">
                                                                    &lt;%&ndash;<dt><a href="#">电子书0</a></dt>&ndash;%&gt;
                                                                <em><a href="${ctx}/mall/list/sale-${subItem.aliasName}">${subItem.title}</a></em>
                                                            </c:if>
                                                            <c:if test="${(status.index + 1) mod 3 eq (0)}">
                                                                <em><a href="${ctx}/mall/list/sale-${subItem.aliasName}">${subItem.title}</a></em>
                                                                </dd>
                                                                </dl>
                                                            </c:if>--%>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                        </doit:goodsSaleCategoryList>
                                    </div>
                                </div>
                                <!--所有分类 End-->
                            </div>
                        </div>
                        <div class="tab-pane fade" id="cat2">
                            <div class="side-nav" style="position: relative">
                                <!--所有分类 Start-->
                                <div class="wrap">
                                    <div class="all-sort-list nav-height">
                                        <doit:productCategoryList>
                                            <div class="item bo">
                                                <h3><span>·</span><a href="${ctx}/mall/list?category=${categoryItem.id}">${categoryItem.title}</a></h3>
                                                <c:if test="${categoryItem.childCategories != null && fn:length(categoryItem.childCategories) > 0}">
                                                    <div class="item-list clearfix">
                                                        <div class="close">x</div>
                                                        <div class="subitem">
                                                            <c:forEach items="${categoryItem.childCategories}" var="subItem" varStatus="status">
                                                                <div class="col-lg-6 margin-top-10 cat-item">
                                                                    <a href="${ctx}/mall/list?category=${subItem.id}" title="${subItem.title}">${subItem.title}</a>
                                                                </div>
                                                                <%--<c:if test="${(status.index + 1) mod 3 eq (1)}">
                                                                    <dl class="fore1">
                                                                    <dd>
                                                                </c:if>
                                                                <c:if test="${(status.index + 1) mod 3 != 0}">
                                                                    &lt;%&ndash;<dt><a href="#">电子书0</a></dt>&ndash;%&gt;
                                                                    <em><a href="${ctx}/mall/ztlist?category=${subItem.id}">${subItem.title}</a></em>
                                                                </c:if>
                                                                <c:if test="${(status.index + 1) mod 3 eq (0)}">
                                                                    <em><a href="${ctx}/mall/ztlist?category=${subItem.id}">${subItem.title}</a></em>
                                                                    </dd>
                                                                    </dl>
                                                                </c:if>--%>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </doit:productCategoryList>
                                    </div>
                                </div>
                                <!--所有分类 End-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="noborder padding-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-8 margin-top-20">
                <div class="col-lg-12 bg-white">
                    <div class="row">
                        <a href="${ctx}/mall/list/sale-latest" class="btn btn-default btn-xs pull-right margin-top-10 margin-right-10">更多 <i class="fa fa-angle-right"></i></a>

                        <ul class="nav nav-tabs nav-top-border">
                            <li class="active margin-left-10"><a href="#home1" data-toggle="tab">上架新书</a></li>
                            <li><a href="#profile2" data-toggle="tab">电子书</a></li>
                        </ul>
                    </div>

                    <div class="tab-content latestbooks">
                        <div class="tab-pane fade in active" id="home1">

                            <ul class="shop-item-list row list-inline nomargin">
                                <doit:saleCategoryOffers categoy="latest" num="10">
                                    <!-- ITEM -->
                                    <li class="col-lg-5th col-sm-4">

                                        <div class="shop-item">

                                            <div class="thumbnail noborder nopadding">
                                                <!-- product image(s) -->
                                                <a class="shop-item-image" href="${ctx}/mall/item-${offerItem.id}.html">
                                                    <img style="max-height: 150px;"
                                                         src="${offerItem.additionInfoMap['thumbnail']}" alt=""/>
                                                </a>
                                                <!-- /product image(s) -->

                                            </div>

                                            <div class="shop-item-summary text-center">
                                                <div class="size-14 shop-item-title">
                                                    <a href="${ctx}/mall/item-${offerItem.id}.html" title="${offerItem.title}" target="_blank">${offerItem.title}</a>
                                                </div>

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
                        <div class="tab-pane fade" id="profile2">
                            <ul class="shop-item-list row list-inline nomargin">
                                <doit:saleCategoryOffers categoy="ebooks" num="10">
                                    <!-- ITEM -->
                                    <li class="col-lg-5th col-sm-4">

                                        <div class="shop-item">

                                            <div class="thumbnail noborder nopadding">
                                                <!-- product image(s) -->
                                                <a class="shop-item-image" href="${ctx}/mall/item-${offerItem.id}.html">
                                                    <img style="max-height: 150px;"
                                                         src="${offerItem.additionInfoMap['thumbnail']}" alt=""/>
                                                </a>
                                                <!-- /product image(s) -->

                                            </div>

                                            <div class="shop-item-summary text-center">
                                                <div class="size-14 shop-item-title">
                                                    <a href="${ctx}/mall/item-${offerItem.id}.html" title="${offerItem.title}" target="_blank">${offerItem.title}</a>
                                                </div>

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
                </div>

            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 margin-top-20">
                <div class="col-lg-12 bg-white padding-bottom-30">
                    <div class="row">
                        <ul class="nav nav-tabs nav-top-border">
                            <li class="active margin-left-10"><a href="#home" data-toggle="tab">编辑推荐</a></li>
                            <li><a href="#profile" data-toggle="tab">热销排行榜</a></li>
                        </ul>
                    </div>

                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="home">
                            <div>

                                <!-- tabs content -->
                                <div class="col-md-9 col-sm-9 nopadding">
                                    <div class="tab-content tab-stacked">
                                        <doit:saleCategoryOffers categoy="editor-recommendation" num="4" var="editorItems"/>
                                        <c:forEach items="${editorItems}" var="topItem" varStatus="status">
                                            <div id="tab_a_${status.index}" class="tab-pane <c:if test='${status.index == 0}'>active</c:if>">
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
                                                <div style="min-height: 262px;">
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
                                                <a href="#tab_a_${status.index}" data-toggle="tab">
                                                    <img src="${topItem.additionInfoMap['thumbnail']}"
                                                         class="img-responsive"/>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <div class="tab-pane fade in" id="profile">
                            <div>

                                <!-- tabs content -->
                                <div class="col-md-9 col-sm-9 nopadding">
                                    <div class="tab-content tab-stacked">
                                        <doit:saleCategoryOffers categoy="top-sales" num="4" var="topSaleItems"/>
                                        <c:forEach items="${topSaleItems}" var="topItem" varStatus="status">
                                            <div id="tab_b_${status.index}" class="tab-pane <c:if test='${status.index == 0}'>active</c:if>">
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
                                                <div style="min-height: 262px;">
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
                                        <c:forEach items="${topSaleItems}" var="topItem" varStatus="status">
                                            <li class="<c:if test='${status.index == 0}'>active</c:if>">
                                                <a href="#tab_b_${status.index}" data-toggle="tab">
                                                    <img src="${topItem.additionInfoMap['thumbnail']}"
                                                         class="img-responsive"/>
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
        </div>
    </div>
</section>

<section class="padding-0 noborder margin-top-20">
    <div class="container">
        <div class="col-lg-12 bg-white padding-top-10">

            <div class="heading-title heading-dotted margin-bottom-20">
                <h2 class="size-20"><i class="fa fa-bookmark text-danger"></i> 获奖图书</h2>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="callout alert alert-transparent margin-bottom-20">

                        <div class="row">

                            <div class="col-md-8 col-sm-8"><!-- left text -->
                                <h4>我社合计有35种图书获中国出版政府（图书）奖、中华优秀出版物奖、“三个一百”原创出版工程、国家图书奖、中国图书奖、国家技进奖（图 书）、全国优秀图书奖、国家级优秀教材奖等国家级奖项，有400多种图书获全国高校出版社优秀著作奖、江苏省和煤炭部科技进步奖、江苏省“五个一”工程 奖、江苏图书奖等省部级奖励。</h4>
                            </div><!-- /left text -->


                            <div class="col-md-4 col-sm-4 text-right"><!-- right btn -->
                                <a href="${ctx}/aboutus/medal-books" rel="nofollow" target="_blank" class="btn btn-default btn-lg">浏览更多获奖图书</a>
                            </div><!-- /right btn -->

                        </div>

                    </div>
                </div>
            </div>

            <div class="row margin-top-10 margin-bottom-20">
                <div class="col-lg-12">
                    <doit:namedTextModuleRichProperty var="medal-books-primary" property="fullText"/>
                </div>
            </div>

        </div>

    </div>
</section>

<section class="noborder padding-0 margin-top-20 margin-bottom-20">
    <div class="container">
        <div class="col-lg-12 bg-white padding-top-10">

            <div class="heading-title heading-dotted">
                <div class="pull-right bg-white" style="padding-left: 20px;">
                    <a href="${ctx}/mall/list/sale-excellent" class="btn btn-default btn-xs">浏览更多</a>
                </div>
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
                                <div class="size-14 shop-item-title">
                                    <a href="${ctx}/mall/item-${offerItem.id}.html" target="_blank" title="${offerItem.title}">${offerItem.title}</a>
                                </div>

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

<!-- REVOLUTION SLIDER -->

<script id="goodsItemTemplate" type="text/html">

    {{each goodsItems as dataItem i}}

    <li class="col-lg-3 col-sm-3">

        <div class="shop-item">

            <div class="thumbnail">
                <!-- product image(s) -->
                <a class="shop-item-image" href="${ctx}/mall/item-2805.html">
                    <img class="img-responsive"
                         src="{{dataItem.img}}"
                         alt="shop first image"/>
                </a>
                <!-- /product image(s) -->

                <!-- hover buttons -->
                <div class="shop-option-over">
                    <!-- replace data-item-id width the real item ID - used by js/view/demo.shop.js -->
                    <a class="btn btn-default add-wishlist" href="#" data-item-id="1"
                       data-toggle="tooltip" title="收藏"><i class="fa fa-heart nopadding"></i></a>
                    <a class="btn btn-default add-compare" href="#" data-item-id="1"
                       data-toggle="tooltip" title="购物车"><i class="fa fa-cart-plus nopadding"
                                                            data-toggle="tooltip"></i></a>
                </div>
                <!-- /hover buttons -->
                {{if (dataItem.flagNew == "1" || dataItem.flagRecommend == "1") }}
                <!-- product more info -->
                <div class="shop-item-info">
                    {{if (dataItem.flagNew == "1") }}
                    <span class="label label-success">新</span>
                    {{/if}}
                    {{if (dataItem.flagRecommend == "1") }}
                    <span class="label label-danger">荐</span>
                    {{/if}}
                </div>
                <!-- /product more info -->
                {{/if}}

            </div>

            <div class="shop-item-summary text-center">
                <h2>{{dataItem.name}}</h2>
                <div>作者: {{dataItem.author}}</div>
                <!-- price -->
                <div class="shop-item-price">
                    <span class="line-through">￥{{dataItem.priceMarket}}.00</span>
                    ￥{{dataItem.priceSale}}
                </div>
                <!-- /price -->
            </div>

        </div>

    </li>

    {{/each}}
</script>

<script type="text/javascript">
    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class
        $('.all-sort-list > .item').hover(function(){
//            var eq = $('.all-sort-list > .item').index(this),				//获取当前滑过是第几个元素
//                h = $('.all-sort-list').offset().top,						//获取当前下拉菜单距离窗口多少像素
//                s = $(window).scrollTop(),									//获取游览器滚动了多少高度
//                i = $(this).offset().top,									//当前元素滑过距离窗口多少像素
//                item = $(this).children('.item-list').height(),				//下拉菜单子类内容容器的高度
//                sort = $('.all-sort-list').height();						//父类分类列表容器的高度
//
//            if ( item < sort ){												//如果子类的高度小于父类的高度
//                if ( eq == 0 ){
//                    $(this).children('.item-list').css('top', (i-h));
//                } else {
//                    $(this).children('.item-list').css('top', (i-h)+1);
//                }
//            } else {
//                if ( s > h ) {												//判断子类的显示位置，如果滚动的高度大于所有分类列表容器的高度
//                    if ( i-s > 0 ){											//则 继续判断当前滑过容器的位置 是否有一半超出窗口一半在窗口内显示的Bug,
//                        $(this).children('.item-list').css('top', (s-h)+2 );
//                    } else {
//                        $(this).children('.item-list').css('top', (s-h)-(-(i-s))+2 );
//                    }
//                } else {
//                    $(this).children('.item-list').css('top', -20 );
//                }
//            }

            $(this).children('.item-list').css('top', -20 );


            $(this).addClass('hover');
            $(this).children('.item-list').css('display','block');
        },function(){
            $(this).removeClass('hover');
            $(this).children('.item-list').css('display','none');
        });

        $('.item > .item-list > .close').click(function(){
            $(this).parent().parent().removeClass('hover');
            $(this).parent().hide();
        });

        $('.all-sort-list').hover(function () {
            $(this).removeClass("nav-height");
            $(this).css("z-index","900");
        },function () {
            $(this).addClass("nav-height");
            $(this).css("z-index","0");
        });
    });

</script>
