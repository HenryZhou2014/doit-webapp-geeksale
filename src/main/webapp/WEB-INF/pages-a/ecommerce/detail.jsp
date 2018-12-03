<%@ page import="com.doit.common.model.UniversalRichProperty" %>
<%@ page import="org.apache.commons.collections.map.ListOrderedMap" %>
<%@ page import="com.sun.javafx.collections.MappingChange" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>《${selloffer.title}》</title>
    <meta name="heading" content="新闻栏目"/>

    <link href="${ctx}/a/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/a/resource/styles/menu-adapt.css" rel="stylesheet" type="text/css"/>

    <style type="text/css">
        body {
            background: #f6f6f6;
        }

        .callout.alert {
            padding: 3px 0;
        }

        .overflow_hide {
            max-height: 300px;
            overflow-y: hidden;
        }

        .owl-carousel {
            margin-bottom: 0;
        }

        .nav > li > a > img {
            max-width: 100%;
        }
    </style>
</head>

<c:set value="${richPropertyMap}" var="richProperty"/>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-12 line-height-50">
                <ul class="list-unstyled list-inline navigator-bar">
                    <li><a href="${ctx}/mall"><i class="fa fa-book"></i> 图书商城</a></li>
                    <li><i class="fa fa-angle-right"></i></li>
                    <li><a href="${ctx}/mall/list">全部图书</a></li>
                    <c:if test="${ztCategory != null and not empty ztCategory.title}">
                        <c:if test="${ztCategory.parentCategory != null and not empty ztCategory.parentCategory.title and not category.parentCategory.title eq 'books'}">
                            <li><i class="fa fa-angle-right"></i></li>
                            <li>
                                <a href="${ctx}/mall/list?category=${ztCategory.parentCategory.id}">${ztCategory.parentCategory.title}</a>
                            </li>
                        </c:if>
                        <li><i class="fa fa-angle-right"></i></li>
                        <li><a href="${ctx}/mall/list?category=${ztCategory.id}">${ztCategory.title}</a></li>
                    </c:if>
                    <li><i class="fa fa-angle-right"></i></li>
                    <li><a>${selloffer.productName}</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- REVOLUTION SLIDER -->
<section class="nopadding nomargin">
    <div class="container">
        <div class="col-lg-12 margin-bottom-20">
            <div class="col-lg-3 nopadding-left">

                <div class="col-lg-12 bg-white">
                    <div class="row">
                        <ul class="nav nav-tabs nav-top-border">
                            <li class="active margin-left-10"><a href="#cat1" data-toggle="tab">社内分类</a></li>
                            <li><a href="#cat2" data-toggle="tab">中图法分类</a></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="tab-content" style="padding:0 0 15px 0">
                            <div class="tab-pane fade in active" id="cat1">
                                <div class="side-nav">
                                    <!--所有分类 Start-->
                                    <div class="wrap">
                                        <div class="all-sort-list">
                                            <doit:goodsSaleCategoryList>
                                                <div class="item bo">
                                                    <h3><span>·</span><a
                                                            href="${ctx}/mall/list/sale-${categoryItem.aliasName}">${categoryItem.title}</a>
                                                    </h3>
                                                    <c:if test="${categoryItem.childCategories != null && fn:length(categoryItem.childCategories) > 0}">
                                                    <div class="item-list clearfix">
                                                        <div class="close">x</div>
                                                        <div class="subitem">
                                                            <c:forEach items="${categoryItem.childCategories}"
                                                                       var="subItem" varStatus="status">
                                                                <div class="col-lg-6 margin-top-10 cat-item">
                                                                    <a href="${ctx}/mall/list/sale-${subItem.aliasName}"
                                                                       title="${subItem.title}">${subItem.title}</a>
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
                                <div class="side-nav">
                                    <!--所有分类 Start-->
                                    <div class="wrap">
                                        <div class="all-sort-list">
                                            <doit:productCategoryList>
                                                <div class="item bo">
                                                    <h3><span>·</span><a
                                                            href="${ctx}/mall/list?category=${categoryItem.id}">${categoryItem.title}</a>
                                                    </h3>
                                                    <c:if test="${categoryItem.childCategories != null && fn:length(categoryItem.childCategories) > 0}">
                                                    <div class="item-list clearfix">
                                                        <div class="close">x</div>
                                                        <div class="subitem">
                                                            <c:forEach items="${categoryItem.childCategories}"
                                                                       var="subItem" varStatus="status">
                                                                <div class="col-lg-6 margin-top-10 cat-item">
                                                                    <a href="${ctx}/mall/list?category=${subItem.id}"
                                                                       title="${subItem.title}">${subItem.title}</a>
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

                <div class="col-lg-12 bg-white padding-bottom-30 margin-top-20">
                    <div class="row">
                        <ul class="nav nav-tabs nav-top-border">
                            <li class="active margin-left-10"><a href="#home" data-toggle="tab">编辑推荐</a></li>
                            <li><a href="#profile" data-toggle="tab">热销排行榜</a></li>
                        </ul>
                    </div>

                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="home">
                            <div class="row">

                                <!-- tabs content -->
                                <div class="col-md-9 col-sm-9 nopadding">
                                    <div class="tab-content tab-stacked">
                                        <doit:saleCategoryOffers categoy="editor-recommendation" num="4"
                                                                 var="editorItems"/>
                                        <c:forEach items="${editorItems}" var="topItem" varStatus="status">
                                            <div id="tab_a_${status.index}"
                                                 class="tab-pane <c:if test='${status.index == 0}'>active</c:if>">
                                                <span class="size-16">${topItem.productName}</span>
                                                <ul class="list-unstyled">
                                                    <li>
                                                        作者: ${topItem.author}
                                                    </li>
                                                    <li>
                                                        定价: ${topItem.price}元
                                                    </li>
                                                    <li>
                                                        装帧: 平装
                                                    </li>
                                                    <li>
                                                        出版社: ${topItem.pressName}
                                                    </li>
                                                    <li>
                                                        ISBN: ${topItem.isbn}
                                                    </li>

                                                </ul>
                                                <div style="min-height: 262px;">
                                                    <doit:rawHtml
                                                            value="${topItem.richPropertyMap['introduction'].propertyValue}"/>
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
                                                    <img src="${thumbnail}"
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
                                            <div id="tab_b_${status.index}"
                                                 class="tab-pane <c:if test='${status.index == 0}'>active</c:if>">
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
                                                    <doit:rawHtml
                                                            value="${topItem.richPropertyMap['introduction'].propertyValue}"/>
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
                                                    <img src="${thumbnail}"
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
            <div class="col-lg-9 bg-white nopadding-right">
                <div class="row">
                    <div>
                        <!-- IMAGE -->
                        <div class="col-lg-4 col-sm-4">
                            <div class="margin-top-20">
                                <c:if test="${empty imgUrl}">
                                    <c:set var="imgUrl" value="${ctx}/images/cumtp.com/TRLOGO.jpg"/>;
                                </c:if>

                                <div class="thumbnail relative margin-bottom-3">

                                    <!--
                                        IMAGE ZOOM
                                        data-mode="mouseover|grab|click|toggle"
                                    -->
                                    <figure id="zoom-primary" class="zoom text-center" data-mode="mouseover"
                                            style="width: 100%; height: 240px;">
                                        <!--
                                            zoom buttton

                                            positions available:
                                                .bottom-right
                                                .bottom-left
                                                .top-right
                                                .top-left
                                        -->
                                        <a class="lightbox bottom-right"
                                           href="${imgUrl}"
                                           data-plugin-options='{"type":"image"}'><i
                                                class="glyphicon glyphicon-search"></i></a>

                                        <!--
                                            image

                                            Extra: add .image-bw class to force black and white!
                                        -->
                                        <img
                                                src="${ctx}/${imgUrl}" alt="This is the product title"
                                                style="max-height: 300px;"/>
                                    </figure>

                                </div>

                                <!-- Thumbnails (required height:100px) -->
                                <div data-for="zoom-primary" class="zoom-more owl-carousel owl-padding-3 featured"
                                     data-plugin-options='{"singleItem": false, "autoPlay": false, "navigation": true, "pagination": false}'>
                                    <c:forEach items="${imageInfos}" var="image">
                                        <a class="thumbnail"
                                           href="${ctx}/${image.imagePath}">
                                            <img src="${ctx}/${image.imagePath}" height="100"
                                                 alt=""/>
                                        </a>
                                    </c:forEach>
                                    <%--<a class="thumbnail active"
                                       href="${imgUrl}">
                                        <img src="${thumbImageUrl}" height="100"
                                             alt=""/>
                                    </a>
                                    <a class="thumbnail"
                                       href="${imgUrl}">
                                        <img src="${thumbImageUrl}" height="100"
                                             alt=""/>
                                    </a>
                                    <a class="thumbnail"
                                       href="${imgUrl}">
                                        <img src="${thumbImageUrl}" height="100"
                                             alt=""/>
                                    </a>--%>
                                </div>
                                <!-- /Thumbnails -->
                            </div>
                        </div>
                        <!-- /IMAGE -->
                        <!-- ITEM DESC -->
                        <div class="col-lg-8 col-sm-8">

                            <div style="position: absolute; right: 60px; top: 50px;height: 200px;">
                                <div class="flexbox flex1 flex_column justify_center align_center">
                                    <c:choose>
                                        <c:when test="${taobao_url_flag == '1'}">
                                            <div class="text-center" style="width: 150px;">
                                                <div>
                                                    <img src="${ctx}/files/sellOffer/sellOffer-${selloffer.id}/qrcode/taobao_${selloffer.id}.png"
                                                         class="img-responsive"/>
                                                </div>
                                                <div class="text-center">
                                                    <p>
                                                        扫描二维码，到我社天猫书城购买
                                                    </p>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <doit:namedTextModuleRichProperty var="taobao-shop" property="fullText"/>
                                        </c:otherwise>
                                        <%--<c:when test="${selloffer.buyable != '1'}">--%>
                                            <%--<div class="text-center" style="width: 150px;">--%>
                                                <%--<div>--%>
                                                    <%--<img src="${src}/images/taobao_default.png" class="img-responsive"/>--%>
                                                <%--</div>--%>
                                                <%--<div class="text-center">--%>
                                                    <%--<p>--%>
                                                        <%--扫描二维码，本社淘宝官网店购买--%>
                                                    <%--</p>--%>
                                                <%--</div>--%>
                                            <%--</div>--%>
                                       <%--</c:when>--%>
                                        <%--<c:otherwise>--%>
                                            <%--<div class="text-center" style="width: 150px;">--%>
                                                <%--<div>--%>
                                                    <%--<img src="${src}/images/wx_qr_code.jpg" class="img-responsive"/>--%>
                                                <%--</div>--%>
                                                <%--<div class="text-center">--%>
                                                    <%--<p>--%>
                                                        <%--扫描二维码，关注微信号图书最近状态--%>
                                                    <%--</p>--%>
                                                <%--</div>--%>
                                            <%--</div>--%>
                                        <%--</c:otherwise>--%>
                                    </c:choose>
                                </div>
                            </div>

                            <div class="margin-top-20">
                                <div>
                                    <h3 class="weight-800 nomargin-bottom">
                                        <c:if test="${selloffer.mediaType == 'EBOOK'}">
                                            <span class="badge badge-red"><i class="fa fa-bookmark"></i> 电子书</span>
                                        </c:if>
                                        ${selloffer.title}
                                    </h3>
                                </div>

                                <div class="margin-top-10">
                                    <div class="row">
                                        <div class="col-sm-3 col-md-2">作者</div>
                                        <div class="col-sm-9 col-md-10">${selloffer.author}</div>
                                    </div>
                                </div>

                                <!-- price -->
                                <div class="shop-item-price margin-top-10"
                                     style="width: 200px; background: #f6f6f6;padding-left: 30px;">
                                    <div class="line-height-50" style="height: 50px;">
                                    <span class="size-30 line-height-50"
                                          style="color: #E52222;">
                                        &yen;<fmt:formatNumber value="${selloffer.price}" minFractionDigits="2"/>
                                    </span>
                                    </div>
                                </div>
                                <!-- /price -->

                                <div class="row margin-top-30 size-12">
                                    <div class="col-lg-12">
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2">原定价</div>
                                            <div class="col-sm-9 col-md-10">
                                                &yen;<fmt:formatNumber value="${selloffer.priceMartket}" minFractionDigits="2"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2">书号</div>
                                            <div class="col-sm-9 col-md-10">${selloffer.isbn}</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2">出版社</div>
                                            <div class="col-sm-9 col-md-10">${selloffer.pressName}</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-3 col-md-2">责编</div>
                                            <div class="col-xs-9 col-md-10">${selloffer.editor}</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-3 col-md-2">装帧</div>
                                            <div class="col-xs-9 col-md-10">${selloffer.propertyMap['binding'].propertyValue}</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-3 col-md-2">版次</div>
                                            <div class="col-xs-9 col-md-10">${selloffer.propertyMap['revision'].propertyValue}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- short description -->
                            <%--<div class="padding-right-20 margin-top-20">
                                <doit:sellOfferRichProperty var="${selloffer}" property="introduction"
                                                            defaultText="暂无内容"/>
                            </div>--%>
                            <!-- /short description -->

                            <c:if test="${selloffer.buyable == '1'}">
                                <%--</form>--%>
                                <%--电子书的数量是1，纸质书可以选择数量--%>
                                <c:choose>
                                    <c:when test="${selloffer.mediaType == 'EBOOK'}">
                                        <div class="margin-top-20">
                                            <input id="sku_num" type="hidden" value="1" class="form-control">
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="row margin-top-20">
                                            <div class="col-sm-3 col-md-2"><span
                                                    class="weight-600 line-height-40">数量</span>
                                            </div>
                                            <div class="col-sm-9 col-md-10">
                                                <div style="width: 100px;">
                                                    <input id="sku_num" type="text" value="1" min="1" max="10"
                                                           class="form-control stepper">
                                                </div>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                                <div>

                                    <button id="shopping_cart_btn"
                                            class="btn btn-default pull-left product-add-cart noradius margin-right-10 margin-top-10">
                                        <i class="fa fa-shopping-cart"></i> 加入购物车
                                    </button>

                                    <a href="javascript:void(0)" onclick="buyNow()"
                                       class="btn btn-primary pull-left product-add-cart noradius margin-right-10 margin-top-10"><i
                                            class="fa fa-check"></i> 立即购买</a>

                                </div>
                                <!-- /FORM -->
                            </c:if>

                            <c:choose>
                                <c:when test="${selloffer.propertyMap['onlineReadingAble'].propertyValue == '1'}">
                                    <a href="${ctx}/ebook/book-${selloffer.id}?file=/ebook/pdfdata-${selloffer.id}"
                                       target="_blank"
                                       class="btn btn-danger pull-left product-add-cart noradius margin-right-10 margin-top-10"><i
                                            class="fa fa-file-pdf-o"></i> 免费阅读</a>
                                </c:when>
                                <c:when test="${selloffer.propertyMap['onlinePreviewable'].propertyValue == '1'}">
                                    <a href="${ctx}/ebook/bookpreview-${selloffer.id}?file=/ebook/pdfdata-preview-${selloffer.id}" target="_blank"
                                       class="btn btn-success pull-left product-add-cart noradius margin-right-10 margin-top-10"><i
                                            class="fa fa-file-powerpoint-o"></i> 在线试读</a>
                                </c:when>
                            </c:choose>

                        </div>
                        <!-- /ITEM DESC -->
                    </div>

                </div>

                <div class="row">
                    <!-- RIGHT -->
                    <div class="col-lg-12 col-md-12 col-sm-12">

                        <div class="col-lg-12">
                            <ul id="myTab" class="nav nav-tabs nav-top-border" role="tablist">
                                <li role="presentation" class="active"><a href="#description" role="tab"
                                                                          data-toggle="tab">版权声明</a>
                                </li>
                            </ul>

                            <div class="tab-content padding-top-20">
                                <!-- DESCRIPTION -->
                                <div role="tabpanel" class="tab-pane fade in active" id="description">
                                    <div class="row margin-bottom-20 size-12">
                                        <div class="col-lg-12">
                                            <div class="col-lg-4">
                                                ISBN：${selloffer.isbn}
                                            </div>
                                            <div class="col-lg-4">
                                                版次：${selloffer.propertyMap['revision'].propertyValue}
                                            </div>
                                            <div class="col-lg-4">
                                                页数：${selloffer.propertyMap['pageTotal'].propertyValue}
                                            </div>
                                            <div class="col-lg-4">
                                                字数：${selloffer.propertyMap['wordNm'].propertyValue}
                                            </div>
                                            <div class="col-lg-4">
                                                印刷时间：${selloffer.propertyMap['printingDate'].propertyValue}
                                            </div>
                                            <div class="col-lg-4">
                                                开本：${selloffer.propertyMap['bookSize'].propertyValue}
                                            </div>
                                            <%--<div class="col-lg-4">
                                                纸张：${selloffer.propertyMap['paperType']}
                                            </div>--%>
                                            <div class="col-lg-4">
                                                印次：${selloffer.propertyMap['impression'].propertyValue}
                                            </div>
                                            <div class="col-lg-4">
                                                装帧：${selloffer.propertyMap['binding'].propertyValue}
                                            </div>
                                            <div class="col-lg-4">
                                                分类：${selloffer.productCategory.title}
                                            </div>
                                            <%--<div class="col-lg-4">
                                                出版单位：${selloffer.pressName}
                                            </div>--%>
                                            <div class="col-lg-4">
                                                丛书：${selloffer.propertyMap['seriesName'].propertyValue}
                                            </div>
                                            <div class="col-lg-4">
                                                责编：${selloffer.editor}
                                            </div>
                                        </div>
                                    </div>

                                    <%--<div class="callout alert alert-info margin-top-10 margin-bottom-10">

                                        <div class="row">

                                            <div class="col-md-8 col-sm-8"><!-- left text -->
                                                <span class="size-14">编辑推荐</span>
                                            </div><!-- /left text -->
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12" style="padding-left: 30px;">
                                            <doit:sellOfferRichProperty var="${selloffer}" property="editorRecommend" defaultText="暂无内容"/>
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
                                            <doit:sellOfferRichProperty var="${selloffer}" property="authorInfo" defaultText="暂无内容"/>
                                        </div>
                                    </div>--%>

                                    <div class="callout alert alert-info margin-top-10 margin-bottom-10">

                                        <div class="row">

                                            <div class="col-md-8 col-sm-8"><!-- left text -->
                                                <span class="size-14">简介</span>
                                            </div><!-- /left text -->
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12" style="padding: 0 30px;">
                                            <doit:sellOfferRichProperty var="${selloffer}" property="fullText"
                                                                        defaultText="暂无内容"/>
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
                                        <div class="col-lg-12" style="padding: 0 30px;">
                                            <doit:sellOfferRichProperty var="${selloffer}" property="preface"
                                                                        defaultText="暂无内容"/>
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
                                        <div class="col-lg-12" style="padding: 0 30px;">
                                            <doit:sellOfferRichProperty var="${selloffer}" property="catalogue"
                                                                        defaultText="暂无内容"/>
                                        </div>
                                    </div>

                                </div>

                            </div>

                            <h2 class="owl-featured margin-top-20">相关图书</h2>
                            <div class="owl-carousel featured nomargin owl-padding-10"
                                 data-plugin-options='{"singleItem": false, "items": "6", "stopOnHover":false, "autoPlay":4500, "autoHeight": false, "navigation": true, "pagination": false}'>

                                <c:forEach items="${rSellOffer}" var="sellOffer">
                                    <!-- item -->
                                    <div class="shop-item nomargin">

                                        <div class="thumbnail">
                                            <!-- product image(s) -->
                                            <a class="shop-item-image" href="${ctx}/mall/item-${sellOffer.id}.html">
                                                <img class="img-responsive"
                                                     src="${sellOffer.imageUrl}"
                                                     alt="shop first image"/>
                                            </a>
                                            <!-- /product image(s) -->

                                        </div>

                                        <div class="shop-item-summary text-center">
                                            <h2>${sellOffer.title}</h2>

                                            <!-- price -->
                                            <div class="shop-item-price">
                                                    ${sellOffer.price}元
                                            </div>
                                            <!-- /price -->
                                        </div>

                                    </div>
                                    <!-- /item -->
                                </c:forEach>
                            </div>

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
        $('.all-sort-list > .item').hover(function () {
//            var eq = $('.all-sort-list > .item').index(this),				//获取当前滑过是第几个元素
//                h = $('.all-sort-list').offset().top,						//获取当前下拉菜单距离窗口多少像素
//                s = $(window).scrollTop(),									//获取游览器滚动了多少高度
//                i = $(this).offset().top,									//当前元素滑过距离窗口多少像素
//                item = $(this).children('.item-list').height(),				//下拉菜单子类内容容器的高度
//                sort = $('.all-sort-list').height();						//父类分类列表容器的高度
//
//            if (item < sort) {												//如果子类的高度小于父类的高度
//                if (eq == 0) {
//                    $(this).children('.item-list').css('top', (i - h));
//                } else {
//                    $(this).children('.item-list').css('top', (i - h) + 1);
//                }
//            } else {
//                if (s > h) {												//判断子类的显示位置，如果滚动的高度大于所有分类列表容器的高度
//                    if (i - s > 0) {											//则 继续判断当前滑过容器的位置 是否有一半超出窗口一半在窗口内显示的Bug,
//                        $(this).children('.item-list').css('top', (s - h) + 2);
//                    } else {
//                        $(this).children('.item-list').css('top', (s - h) - (-(i - s)) + 2);
//                    }
//                } else {
//                    $(this).children('.item-list').css('top', -20);
//                }
//            }

            $(this).children('.item-list').css('top', -20);

            $(this).addClass('hover');
            $(this).children('.item-list').css('display', 'block');
        }, function () {
            $(this).removeClass('hover');
            $(this).children('.item-list').css('display', 'none');
        });

        $('.item > .item-list > .close').click(function () {
            $(this).parent().parent().removeClass('hover');
            $(this).parent().hide();
        });
    });

    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class
        $("#shopping_cart_btn").click(function () {
            $.ajax({
                url: '${ctx}/mycart/add',
                data: {skuId:${sku_id}},
                dataType: 'json',
                success: function (data) {
                    if (data.flag == "1") {
                        getShopCartBaseInfo();
                        toastSuccess("添加到购物车成功", "您已成功添加该商品到您的购物车中！", "toast-top-right");
                    } else {
                        toastError("添加失败");
                    }
                }
            })
        });
    });

    function buyNow() {
        const skuId = ${sku_id};
        const num = $("#sku_num").val();
        if (!skuId || !num || num <= 0) {
            toastError("未知的商品或购买数量不能少于一个！");
            return;
        }
        <security:authorize  access="isAnonymous()">
        $(".button-login").attr("data-url", "${ctx}/mycart/buyNow?skuId=" + skuId + "&num=" + num);
        logon();
        </security:authorize>
        <security:authorize  access="isAuthenticated()">
        location.href = "${ctx}/mycart/buyNow?skuId=" + skuId + "&num=" + num;
        </security:authorize>

    }

</script>
