<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>

<head>
    <title>分类查询</title>
    <meta name="column-name" content="home"/>
    <link href="${ctx}/weixin/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.bootcss.com/Swiper/3.4.2/css/swiper.min.css" rel="stylesheet">
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

        .shop-item{
            background: white;
        }

        .owl-carousel.owl-padding-3 .owl-item{
            padding:0
        }

        .swiper-container { height: 180px; }
        .swiper-slide {
            color:black;
        }
        .weui-cell p{
            margin-bottom:0;
        }

        .tab-menu li{
            border-bottom: solid 1px #F5F5F5;
            height:30px;
        }
    </style>
</head>

<div id="tab" class="weui-tab">
    <div  class="weui-navbar">
        <div class="weui-navbar__item weui-bar__item_on">
            中图法分类
        </div>
        <div class="weui-navbar__item">
            社内分类
        </div>
    </div>

    <div id="tab_panel" class="weui-tab__panel">
        <div>
            <c:forEach items="${productCategoryList}" var="category">
                <div class="weui-cells__title">${category.title}</div>
                <div class="weui-cells">
                    <c:forEach items="${category.childCategories}" var="sub_category">
                        <a class="weui-cell weui-cell_access" href="${ctx}/wx/mall/list?type=productCategory&categoryId=${sub_category.id}">
                            <div class="weui-cell__bd">
                                <p>${sub_category.title}</p>
                            </div>
                            <div class="weui-cell__ft">
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>
        <div style="display:none">
            <c:forEach items="${goodsSaleCategoryList}" var="category">
                <div class="weui-cells__title">${category.title}</div>
                <div class="weui-cells">
                    <c:forEach items="${category.childCategories}" var="sub_category">
                        <a class="weui-cell weui-cell_access" href="${ctx}/wx/mall/list?type=goodsSaleCategory&categoryId=${sub_category.id}">
                            <div class="weui-cell__bd">
                                <p>${sub_category.title}</p>
                            </div>
                            <div class="weui-cell__ft">
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>
    </div>
</div>


<script src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
<script type="text/javascript" src="https://res.wx.qq.com/open/libs/weuijs/1.1.1/weui.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        weui.tab('#tab',{
            defaultIndex: 0,
            onChange: function(index){
                $("#tab_panel").children().hide();
                $("#tab_panel").children().eq(index).show();
            }
        });
    });
</script>
