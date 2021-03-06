<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>

<head>
    <title>首页</title>
    <meta name="column-name" content="home"/>
    <link href="${ctx}/weixin/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">

        .margin-top-15{
            margin-top:15px !important;
        }
        .blog-post-item {
            border: none;
            padding: 10px 0 0 0;
            margin: 0;
        }

        .blog-post-info {
            border: none;
        }

        .blog-post-info h2 {
            border: none;
            font-size: 1rem;
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

        .blog-post-info .blog-post-image {
            width: 80px;
            margin-left: 10px;
            max-height: 100px;
            overflow-y: hidden;
        }

        div.heading-title {
            margin-bottom: 10px;
        }

        .price-clean h4 {
            font-size: 1rem;
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

        section div.row > div {
            margin-bottom: 10px;
        }

        ul.editor-info > li > i {
            margin-right: 2px;
        }

        ul.editor-info > li {
            font-size: 1rem;
        }

        div.shop-item-summary{
            height: 70px;
        }
        .owl-carousel{
            margin-bottom:0;
        }

        .owl-carousel.owl-padding-3 .owl-item{
            padding:0
        }
    </style>
</head>
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
<section class="noborder margin-0 padding-0">
    <div class="container margin-top-15">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title heading-dotted">
                    <h2 class="size-20">最新动态</h2>
                </div>
                <c:forEach items="${newsList}" var="news" varStatus="stat">
                    <div class="blog-post-item">
                        <!-- POST ITEM -->
                        <div class="row">
                            <div class="blog-post-info col-xs-12">
                                <div class="blog-post-image pull-right">
                                    <!-- IMAGE -->
                                    <figure>
                                        <img class="img-responsive" src="${news.imageUrl}" alt="">
                                    </figure>
                                </div>
                                <div>
                                    <h2><a href="${ctx}/wx/news/${news.id}">${news.title}</a></h2>
                                    <ul class="editor-info list-inline">
                                        <li>
                                            <i class="fa fa-calendar-o"></i>
                                            <span class="font-lato">${news.date}</span>
                                        </li>
                                        <li>
                                            <i class="fa fa-pencil"></i>
                                            <span class="font-lato">${news.author}</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /POST ITEM -->
                    </div>
                    <c:if test="${!stat.last}">
                        <hr class="nomargin"/>
                    </c:if>
                </c:forEach>
            </div>
        </div>

    </div>
</section>

<!--上架新书 -->
<section class="padding-0 noborder">
    <div class="container margin-top-15">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title heading-dotted">
                    <h2 class="size-20"><i class="fa fa-book"></i> 上架新书</h2>
                </div>
                <ul class="shop-item-list row list-inline nomargin">
                    <c:forEach items="${sellOfferList_latest}" var="item">
                        <!-- ITEM -->
                        <li class="col-xs-6">
                            <div class="shop-item">
                                <div class="thumbnail noborder nopadding ">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="${ctx}/wx/mall/item-${item.id}.html">
                                        <img class="img-responsive"
                                             src="${item.imageUrl}" alt=""/>
                                    </a>
                                    <!-- /product image(s) -->
                                </div>
                                <div class="shop-item-summary">
                                    <div class="shop-item-name">${item.title}</div>
                                    <!-- price -->
                                    <div class="shop-item-price">
                                            ${item.price}元
                                    </div>
                                    <!-- /price -->
                                </div>
                            </div>
                        </li>
                        <!-- /ITEM -->
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</section>

<!--编辑推荐 -->
<section class="padding-0 noborder">
    <div class="container margin-top-15">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title heading-dotted">
                    <h2 class="size-20"><i class="fa fa-book"></i> 编辑推荐</h2>
                </div>

                <ul class="shop-item-list row list-inline nomargin">
                    <c:forEach items="${sellOfferList_editor}" var="item">
                        <!-- ITEM -->
                        <li class="col-xs-6">
                            <div class="shop-item">
                                <div class="thumbnail noborder nopadding ">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="${ctx}/wx/mall/item-${item.id}.html">
                                        <img class="img-responsive"
                                             src="${item.imageUrl}" alt=""/>
                                    </a>
                                    <!-- /product image(s) -->
                                </div>
                                <div class="shop-item-summary">
                                    <div class="shop-item-name">${item.title}</div>
                                    <!-- price -->
                                    <div class="shop-item-price">
                                            ${item.price}元
                                    </div>
                                    <!-- /price -->
                                </div>
                            </div>
                        </li>
                        <!-- /ITEM -->
                    </c:forEach>
                </ul>

            </div>
        </div>
    </div>
</section>

<!--精品图书 -->
<section class="padding-0 noborder">
    <div class="container margin-top-15">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title heading-dotted">
                    <h2 class="size-20"><i class="fa fa-book"></i> 编辑推荐</h2>
                </div>

                <ul class="shop-item-list row list-inline nomargin">
                    <c:forEach items="${sellOfferList_excellent}" var="item">
                        <!-- ITEM -->
                        <li class="col-xs-6">
                            <div class="shop-item">
                                <div class="thumbnail noborder nopadding ">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="${ctx}/wx/mall/item-${item.id}.html">
                                        <img class="img-responsive"
                                             src="${item.imageUrl}" alt=""/>
                                    </a>
                                    <!-- /product image(s) -->
                                </div>
                                <div class="shop-item-summary">
                                    <div class="shop-item-name">${item.title}</div>
                                    <!-- price -->
                                    <div class="shop-item-price">
                                            ${item.price}元
                                    </div>
                                    <!-- /price -->
                                </div>
                            </div>
                        </li>
                        <!-- /ITEM -->
                    </c:forEach>
                </ul>

            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    $(document).ready(function () {


    });
</script>
