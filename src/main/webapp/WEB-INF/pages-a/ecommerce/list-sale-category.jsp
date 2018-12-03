<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>${goodsSaleCategory.title}</title>
    <meta name="heading" content="书城栏目"/>
    <meta name="column-name" content="news"/>

    <link href="${ctx}/a/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>

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
            height: 165px;
            overflow: hidden;
        }

        div.shop-item > .thumbnail > a.shop-item-image img {
            max-height: 165px;
        }

        div.shop-item {
            margin-bottom: 10px;
        }

        .nav > li > a > img {
            max-width: 100%;
        }
    </style>
</head>

<div class="container">
    <div class="col-lg-12">
        <div class="line-height-50">
            <ul class="list-unstyled list-inline navigator-bar">
                <li><a href="${ctx}/mall"><i class="fa fa-book"></i> 图书商城</a></li>
                <li><i class="fa fa-angle-right"></i></li>
                <li><a href="${ctx}/mall/list">全部图书</a></li>
                <li><i class="fa fa-angle-right"></i></li>
                <li><a>${goodsSaleCategory.title}</a></li>
            </ul>
        </div>
    </div>
</div>

<!-- REVOLUTION SLIDER -->

<div class="container">
    <div class="col-lg-8 col-md-8 col-sm-8 ">
        <div class="col-lg-12 bg-white margin-bottom-20">
            <div class="margin-top-20">
                <ul class="shop-item-list row list-inline nomargin">
                    <c:forEach items="${bookItems}" var="bookItem" varStatus="status">
                        <li class="col-lg-3 col-sm-3">

                            <div class="shop-item">

                                <div class="thumbnail">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="${ctx}/mall/item-${bookItem.id}.html">
                                        <img src="${bookItem.additionInfoMap['thumbnail']}"/>
                                    </a>
                                    <!-- /product image(s) -->
                                </div>

                                <div class="shop-item-summary text-center">
                                    <h2>${bookItem.productName}</h2>
                                    <div>${bookItem.author}</div>
                                    <!-- price -->
                                    <div class="shop-item-price">
                                        ￥${bookItem.price}
                                    </div>
                                    <!-- /price -->
                                </div>

                            </div>

                        </li>
                    </c:forEach>
                </ul>
            </div>


            <c:if test="${resultList.totalPage > 1}">

                <hr/>

                <div class="row margin-top-20 text-center">

                    <ul class="pagination">
                        <li>
                            <a href="${ctx}/mall/list/sale-${category}.html">&laquo;</a>
                        </li>
                        <c:set var="minPage" value="${resultList.pageNum-3}"/>
                        <c:set var="maxPage" value="${resultList.pageNum+3}"/>
                        <c:if test="${minPage < 1}">
                            <c:set var="minPage" value="1"/>
                        </c:if>
                        <c:if test="${maxPage > resultList.totalPage}">
                            <c:set var="maxPage" value="${resultList.totalPage}"/>
                        </c:if>
                        <c:forEach begin="${minPage}" end="${maxPage}" var="item">
                            <c:set var="activeClass" value=""/>
                            <c:if test="${item == resultList.pageNum}">
                                <c:set var="activeClass" value="active"/>
                            </c:if>
                            <li class="${activeClass}">
                                <a href="${ctx}/mall/list/sale-${category}.html?page=${item}">${item}</a>
                            </li>
                        </c:forEach>
                        <li>
                            <a href="${ctx}/mall/list/sale-${category}.html?page=${resultList.totalPage}">&raquo;</a>
                        </li>
                    </ul>

                </div>
            </c:if>

        </div>

    </div>

    <div class="col-lg-4 col-md-4 col-sm-4">
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
                                            <img src="${topItem.additionInfoMap['thumbnail']}" class="img-responsive"/>
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


<script id="goodsItemTemplate" type="text/html">

    {{each goodsItems as dataItem i}}

    <li class="col-lg-5th col-sm-3">

        <div class="shop-item">

            <div class="thumbnail">
                <!-- product image(s) -->
                <a class="shop-item-image" href="${ctx}/mall/item-9823.html">
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
                <div>{{dataItem.author}}</div>
                <!-- price -->
                <div class="shop-item-price">
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
        var data = {};
        data.goodsItems = [
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/58042c8cN191022f1.jpg",
                name: "再见，爱琴海",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "1",
                flagRecommend: ""
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57de382fNd3aaf6e7.jpg",
                name: "哈利波特全集",
                author: "J.K 罗琳",
                tauthor: "文风",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "1",
                flagRecommend: "1"
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57f9abadNbf327f3b.jpg",
                name: "超级网红",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: ""
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57f9abadNbf327f3b.jpg",
                name: "超级网红",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: ""
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57f9abadNbf327f3b.jpg",
                name: "超级网红",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: ""
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57be61acN507eeee7.jpg",
                name: "故宫曰麽",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: "1"
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57be61acN507eeee7.jpg",
                name: "故宫曰麽",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: "1"
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/575f6a58Nd5ad670b.jpg",
                name: "爸爸的故事",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "1",
                flagRecommend: ""
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57b6e24dN56572026.jpg",
                name: "谁在收藏中国",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: ""
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57d0b123Nc685d518.jpg",
                name: "远参之光",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: ""
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57d0b123Nc685d518.jpg",
                name: "远参之光",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: ""
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/rBEGElAkffoIAAAAAABLtWimJLgAABWrQMj66YAAEvN055.jpg",
                name: "每天温暖自己一点点",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "1",
                flagRecommend: ""
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/548e883eNaae1885a.jpg",
                name: "从你的世界路过",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: ""
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57eccafeNe7a0b6b9.jpg",
                name: "技巧",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "1",
                flagRecommend: ""
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57d65e79N407d41a7.jpg",
                name: "丹麦女孩",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: "1"
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57d65e79N407d41a7.jpg",
                name: "丹麦女孩",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: "1"
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57d65e79N407d41a7.jpg",
                name: "丹麦女孩",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: "1"
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57d65e79N407d41a7.jpg",
                name: "丹麦女孩",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: "1"
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57d65e79N407d41a7.jpg",
                name: "丹麦女孩",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: "1"
            },
            {
                img: "${ctx}/images/cumtp.com/demo/mall/jd/57c4ff70N08df249f.jpg",
                name: "鞋狗",
                author: "王玉春",
                tauthor: "",
                priceMarket: "98.00",
                priceSale: "78.00",
                flagNew: "",
                flagRecommend: ""
            }
        ];

//        var html = template("goodsItemTemplate", data);
//        $(".shop-item-list").append(html);

    });

</script>
