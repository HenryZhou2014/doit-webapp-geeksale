<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>新闻</title>
    <meta name="heading" content="新闻栏目"/>
    <meta name="column-name" content="news"/>

    <link href="${ctx}/a/resource/styles/column-articles.css" rel="stylesheet" type="text/css"/>

    <style type="text/css">
        body{
            background: #f6f6f6;
        }
        .blog-item-list > li {
            padding: 10px;
            border-bottom: 1px solid lightgrey;
        }

        .blog-item-list > li:last-child {
            border-bottom: none;
        }

        .blog-item-list p.article-abstract {
            padding: 10px 0 0 0;
            margin-bottom: 10px;
        }

        div.heading-title {
            margin-bottom: 20px;
        }

        ul.book-news-list {
            margin-bottom: 10px;
            padding-bottom: 10px;
        }

        ul.book-news-list li, ul.bullet-news-list li {
            margin-bottom: 10px;
        }

        ul.book-news-list li a, ul.bullet-news-list li a {
            color: #121212;
        }

        ul.book-news-list li a:hover, ul.bullet-news-list li a:hover {
            color: #656565;
        }

        ul.bullet-news-list li:last-child{
            margin-bottom: 10px;
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

        .article-image{
            width: 180px;
            margin-left: 10px;
            height: 120px;
            overflow: hidden;
        }
    </style>
</head>

<!-- REVOLUTION SLIDER -->
<div class="container">
    <div class="row">
        <div class="col-lg-9">
            <div class="col-lg-12 bg-white margin-top-20">
                <div class="row">
                    <jsp:include page="/app/cms/module/slides/column-news-slides/slides"/>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="col-lg-12 bg-white margin-top-20 padding-top-10 padding-bottom-30">

                <div class="heading-title heading-dotted">
                    <h2 class="size-14"><i class="fa fa-bell-o"></i> 公告</h2>
                </div>

                <ul class="list-unstyled bullet-news-list nomargin">
                    <doit:articleListByCategoryTag categoy="['bulletin']" num="4">
                        <li>
                            <a>${articleItem.title}</a>
                            <div class="text-right size-12 pull-right">
                                <fmt:formatDate value="${articleItem.lastEditDate}" pattern="yyyy-MM-dd"/>
                            </div>
                        </li>
                    </doit:articleListByCategoryTag>
                </ul>
            </div>
        </div>
    </div>
    <div class="row margin-bottom-20">
        <div class="col-lg-9">
            <div>
                <div class="col-lg-12 bg-white margin-top-20">
                    <div class="row">
                        <ul class="nav nav-tabs nav-top-border news-tabs">
                            <li data-cat="news"><a href="${ctx}/news">新闻资讯</a></li>
                            <li data-cat="news-institution"><a href="${ctx}/news.html?cat=news-institution">社内新闻</a></li>
                            <li data-cat="news-books"><a href="${ctx}/news.html?cat=news-books">新书预告</a></li>
                            <li data-cat="news-community"><a href="${ctx}/news.html?cat=news-community">行业动态</a></li>
                            <li data-cat="news-other"><a href="${ctx}/news.html?cat=news-other">图片新闻</a></li>
                        </ul>
                    </div>

                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="home">
                            <ul class="list-unstyled blog-item-list">

                                <c:forEach items="${articleList}" var="item">
                                    <li>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <c:if test="${not empty item.imageInfo and not empty item.imageInfo.imagePath}">
                                                    <div class="pull-right">
                                                        <div class="article-image">
                                                            <a href="${ctx}/news/item-${item.id}.html">
                                                                <c:if test="${not empty item.imageInfo.imagePath}">
                                                                    <img class="img-responsive"
                                                                         src="${ctx}/${item.imageInfo.imagePath}"
                                                                         alt=""/>
                                                                </c:if>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </c:if>

                                                <div>
                                                    <h4 class="article-title">
                                                        <a target="_blank" href="${ctx}/news/item-${item.id}.html" style="display: block;">
                                                                ${item.title}
                                                        </a>
                                                    </h4>

                                                    <div>
                                                        <ul class="list-unstyled list-inline artile-author-items">
                                                            <li>
                                                                <i class="fa fa-calendar-o"></i><fmt:formatDate
                                                                    value="${item.lastEditDate}" pattern="yyyy-MM-dd"/>
                                                            </li>
                                                            <li>
                                                                <c:if test="${not empty item.author}">
                                                                    <i class="fa fa-pencil"></i>${item.author}
                                                                </c:if>
                                                                    <%--文/刘峰 图/张洁--%>
                                                            </li>
                                                            <li>
                                                                <i class="fa fa-tag"></i>${item.articleCategory.title}
                                                            </li>
                                                        </ul>
                                                    </div>

                                                    <p class="article-abstract hidden-xs">
                                                            ${item.introText}
                                                    </p>
                                                </div>

                                            </div>

                                            <!-- /post -->
                                        </div>
                                        <div class="clearfix"></div>
                                    </li>
                                </c:forEach>
                            </ul>

                            <c:if test="${resultList.totalPage > 1}">
                                <div class="row margin-top-20 text-center">

                                    <ul class="pagination">
                                        <li>
                                            <a href="${ctx}/news.html?cat=${category}&page=1&sort=${sort}&dir=${dir}">&laquo;</a>
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
                                                <a href="${ctx}/news.html?cat=${category}&page=${item}&sort=${sort}&dir=${dir}">${item}</a>
                                            </li>
                                        </c:forEach>
                                        <li>
                                            <a href="${ctx}/news.html?cat=${category}&page=${resultList.totalPage}&sort=${sort}&dir=${dir}">&raquo;</a>
                                        </li>
                                    </ul>

                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div>
                <div class="col-lg-12 bg-white margin-top-20 padding-top-10 padding-bottom-10">
                    <div class="heading-title heading-dotted ">
                        <h2 class="size-14"><i class="fa fa-book"></i> 最新书讯</h2>
                    </div>

                    <div>
                        <ul class="list-unstyled book-news-list latest-book-list">
                            <doit:articleListByCategoryTag categoy="['news-latest-book']" num="8">
                                <li class="row col-lg-12 col-sm-6 nopadding nomargin margin-top-10">
                                    <div class="col-lg-3 nopadding nomargin">
                                        <img src="${ctx}/${articleItem.imageInfo.imagePath}" class="img-responsive"/>
                                    </div>
                                    <div class="col-lg-9">
                                        <a target="_blank" href="${ctx}/news/item-${articleItem.id}">${articleItem.title}</a>
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

</div>

<script type="text/javascript">

    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class
        $(".news-tabs li").each(function(){
            if($(this).attr("data-cat") == "${category}"){
                $(this).addClass("active");
            }
        });
    });

</script>
