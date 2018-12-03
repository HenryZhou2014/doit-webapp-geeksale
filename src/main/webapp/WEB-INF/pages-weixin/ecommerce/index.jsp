<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>

<head>
    <title>书城</title>
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
            border: 1px solid #F6F6F6;
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
            height:50px;
        }
        .category-search-box{
            height:40px;
            padding:5px 10px;
        }
        .category-search{
            border: 5px solid #EFEFF4;
            border-radius: 10px;
            color:#9B9B9B;
        }



    </style>
</head>
<div class="weui-flex weui-flex__item flex_column backend-color" style="height: 100%">
    <div class="category-search-box weui-flex front-color">
        <div id="categorySearch" class="category-search weui-flex weui-flex__item justify_center align_center">
            <i class="fa fa-search" style="margin-right:10px;"></i>分类查询
        </div>
    </div>

    <div class="weui-flex weui-flex__item" style="height: 100%;">
        <div class="front-color" style="width:100px">
            <ul id="categoryUL" class="tab-menu">
                <li data-id="all" class="flexbox justify_center align_center backend-color">全部</li>
                <c:forEach items="${goodsSaleCategoryList}" var="category" >
                    <li data-id="${category.id}" class="flexbox justify_center align_center">${category.title}</li>
                </c:forEach>
            </ul>
        </div>
        <div id="home_area" class="weui-flex__item scroll-y">

            <div style="padding-left:10px">
                <!-- Slider main container -->
                <div class="swiper-container">
                    <!-- Additional required wrapper -->
                    <div class="swiper-wrapper">
                        <!-- Slides -->
                        <a class="swiper-slide img-hover" href="#">
                            <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/news/2.jpg" width="300" height="150">
                        </a>
                        <a class="swiper-slide img-hover" href="#">
                            <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/news/5.jpg"  width="300" height="150">
                        </a>
                        <a class="swiper-slide img-hover" href="#">
                            <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/news/3.jpg"  width="300" height="150">
                        </a>
                    </div>
                    <!-- If we need pagination -->
                    <div class="swiper-pagination"></div>

                    <!-- If we need navigation buttons -->
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>

                    <!-- If we need scrollbar -->
                    <div class="swiper-scrollbar"></div>
                </div>
            </div>

            <!--上架新书 -->
            <section class="padding-0 noborder">
                <div class="container margin-top-15">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="heading-title heading-dotted">
                                <h2 class="size-20"><i class="fa fa-book"></i> 上架新书</h2>
                            </div>
                            <ul class="shop-item-list row list-inline nomargin front-color">
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

                            <ul class="shop-item-list row list-inline nomargin front-color">
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
                                <h2 class="size-20"><i class="fa fa-book"></i> 精品图书</h2>
                            </div>

                            <ul class="shop-item-list row list-inline nomargin front-color">
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
        </div>

        <div id="main_area" class="weui-flex__item scroll-y" style="display: none">

        </div>
    </div>
</div>
<script id="bookTemplate" type="text/html">
    {{each bookList as book i}}
    <li class="col-xs-6">
        <div class="shop-item">
            <div class="thumbnail noborder nopadding ">
                <!-- product image(s) -->
                <a class="shop-item-image" href="${ctx}/wx/mall/item-{{book.id}}.html">
                    <img class="img-responsive"
                         src="{{book.imageUrl}}" alt=""/>
                </a>
                <!-- /product image(s) -->
            </div>
            <div class="shop-item-summary">
                <div class="shop-item-name">{{book.title}}</div>
                <!-- price -->
                <div class="shop-item-price">
                    {{book.price}}元
                </div>
                <!-- /price -->
            </div>
        </div>
    </li>
    {{/each}}
</script>
<script id="bookListTemplate" type="text/html">
    <section id="books" class="padding-0 noborder">
        <div class="container margin-top-15">
            <div class="row">
                <div class="col-lg-12">
                    <ul id="booksUL" class="shop-item-list row list-inline nomargin front-color">
                        {{include 'bookTemplate' book}}
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <%--<div style="height:50px;">--%>
        <%--<div class="weui-loadmore">--%>
            <%--<i class="weui-loading"></i>--%>
            <%--<span class="weui-loadmore__tips">正在加载</span>--%>
        <%--</div>--%>
    <%--</div>--%>
</script>

<script id="bookAllListTemplate" type="text/html">
    <div style="padding-left:10px">
        <!-- Slider main container -->
        <div class="swiper-container">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
                <!-- Slides -->
                <a class="swiper-slide img-hover" href="#">
                    <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/news/2.jpg" width="300" height="150">
                </a>
                <a class="swiper-slide img-hover" href="#">
                    <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/news/5.jpg"  width="300" height="150">
                </a>
                <a class="swiper-slide img-hover" href="#">
                    <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/news/3.jpg"  width="300" height="150">
                </a>
            </div>
            <!-- If we need pagination -->
            <div class="swiper-pagination"></div>

            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>

            <!-- If we need scrollbar -->
            <div class="swiper-scrollbar"></div>
        </div>
    </div>

    <!--上架新书 -->
    <section class="padding-0 noborder">
        <div class="container margin-top-15">
            <div class="row">
                <div class="col-lg-12">
                    <div class="heading-title heading-dotted">
                        <h2 class="size-20"><i class="fa fa-book"></i> 上架新书</h2>
                    </div>
                    <ul class="shop-item-list row list-inline nomargin front-color">
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

                    <ul class="shop-item-list row list-inline nomargin front-color">
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

                    <ul class="shop-item-list row list-inline nomargin front-color">
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
</script>

<script id="loadMoreTemplate" type="text/html">
    <div class="weui-flex weui-flex__item flex-column justify_center align_center" style="height:100%">
        <div class="weui-loadmore">
            <i class="weui-loading"></i>
            <span class="weui-loadmore__tips">正在加载</span>
        </div>
    </div>
</script>


<script src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
<script type="text/javascript">

    var page = 1;
    var totalPage = 0;
    var categoryId = "all";
    var isLoading = false;

    $(document).ready(function () {
        var mySwiper = new Swiper ('.swiper-container', {
            // Optional parameters
            loop: true,
            pagination: '.swiper-pagination',
        });

        $("#categorySearch").click(function () {
            location.href = "${ctx}/wx/mall/categorySearch"
        })

        $("#categoryUL li").on("click",function () {
            categoryId = $(this).data("id");
            page = 1;
            totalPage = 0;

            if(categoryId == "all"){
                $("#home_area").show();
                $("#main_area").hide();
                //$("#main_area").html(template("bookAllListTemplate", {}));
            }else{
                $("#home_area").hide();
                $("#main_area").show();
                $("#main_area").html(template("loadMoreTemplate", {}));
                getBookList(categoryId);
            }


            $("#categoryUL li").each(function () {
                if($(this).hasClass("backend-color")){
                    $(this).removeClass("backend-color");
                }
            });
            $(this).addClass("backend-color");
        });

        //滚动注册事件
        $("#main_area").scroll(function(){
            if(categoryId == "all"){
                return;
            }

            if(isLoading){
                return;
            }

            if(totalPage>0&&totalPage==page){
                return;
            }
            var $this =$(this),
                viewH =$(this).height(),//可见高度
                contentH =$(this).get(0).scrollHeight,//内容高度
                scrollTop =$(this).scrollTop();//滚动高度
            //if(contentH - viewH - scrollTop <= 100) { //到达底部100px时,加载新内容
            //if(scrollTop/(contentH -viewH)>=0.95){ //到达底部50px时,加载新内容
            if(contentH - viewH - scrollTop <= 50){ //到达底部50px时,加载新内容
                // 这里加载数据..
                console.log("dd");
                refreshBookList(categoryId);
            }
        });
    });

    function getBookList(categoryId) {
        if(categoryId == "all"){
            return;
        }
        $.ajax({
            url: "${ctx}/wx/mall/list.json",
            data: {
                type:'goodsSaleCategory',
                categoryId: categoryId,
                page:page
            },
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    page = data.page;
                    totalPage = data.totalPage;

                    const html = template("bookListTemplate", data);
                    $("#main_area").html(html);
                } else {
                    //toastError("操作提示", data.msg);
                }
            }
        });
    }

    function refreshBookList(categoryId) {
        isLoading = true;
        $.ajax({
            url: "${ctx}/wx/mall/list.json",
            data: {
                type:'goodsSaleCategory',
                categoryId: categoryId,
                page:page+1
            },
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    page = data.page;
                    totalPage = data.totalPage;

                    const html = template("bookTemplate", data);
                    $("#booksUL").append(html);

                    isLoading = false;
                } else {
                    //toastError("操作提示", data.msg);
                }
            }
        });
    }
</script>
