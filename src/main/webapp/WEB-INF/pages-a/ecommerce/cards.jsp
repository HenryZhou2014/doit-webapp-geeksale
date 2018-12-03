<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>新闻</title>
    <meta name="heading" content="新闻栏目"/>
    <meta name="column-name" content="news"/>

    <link href="${ctx}/a/resource/styles/column-articles.css" rel="stylesheet" type="text/css"/>

    <style type="text/css">


    </style>
</head>

<!-- REVOLUTION SLIDER -->
<div class="container">
    <div class="row">
        <div class="col-lg-2">
            <div>
                <div class="menu-stickup">

                    <!-- side navigation -->
                    <div class="side-nav margin-bottom-60 margin-top-30">

                        <div class="side-nav-head">
                            <button class="fa fa-bars"></button>
                            <h4>新闻目录</h4>
                        </div>
                        <ul class="list-group list-group-bordered list-group-noicon uppercase">
                            <c:forEach items="${subCategories}" var="category">
                                <c:set var="liClass" value=""/>
                                <c:if test="${category.id eq articleCategory.id}">
                                    <c:set var="liClass" value="active"/>
                                </c:if>
                                <li class="list-group-item ${liClass}"><a
                                        href="${ctx}/news?cat=${category.id}">${category.title}</a></li>
                            </c:forEach>
                        </ul>
                        <!-- /side navigation -->
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>

        <div class="col-lg-10">

            <div class="margin-top-10">
                <jsp:include page="/app/cms/module/slides/xinwen/slides"/>
                <div class="clearfix"></div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="pull-right margin-top-20">
                        排序
                        <c:set var="sort" value="${resultList.sortCriterion}"/>
                        <c:set var="dir" value="${resultList.sortDirection}"/>
                        <c:set var="newDir" value=""/>

                        <c:choose>
                            <c:when test="${dir eq 'descending'}">
                                <c:set var="dir" value="desc"/>
                                <c:set var="newDir" value="asc"/>
                            </c:when>
                            <c:when test="${dir eq 'ascending'}">
                                <c:set var="dir" value="asc"/>
                                <c:set var="newDir" value="desc"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="dir" value="desc"/>
                                <c:set var="newDir" value="asc"/>
                            </c:otherwise>
                        </c:choose>

                        <c:if test="${empty sort}">
                            <c:set var="sort" value="lastEditDate"/>
                        </c:if>
                        <c:choose>
                            <c:when test="${sort eq 'lastEditDate'}">
                                <a href="${ctx}/news.html?cat=${categoryId}&sort=lastEditDate&dir=${newDir}"
                                   class="btn btn-default btn-xs">日期
                                    <c:choose>
                                        <c:when test="${dir eq 'desc'}">
                                            <i class="fa fa-arrow-down"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fa fa-arrow-up"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                                <a href="${ctx}/news.html?cat=${categoryId}&sort=hits&dir=desc"
                                   class="btn btn-default btn-xs">访问</a>
                            </c:when>
                            <c:when test="${sort eq 'hits'}">
                                <a href="${ctx}/news.html?cat=${categoryId}&sort=lastEditDate&dir=desc"
                                   class="btn btn-default btn-xs">日期</a>
                                <a href="${ctx}/news.html?cat=${categoryId}&sort=hits&dir=${newDir}"
                                   class="btn btn-default btn-xs">访问
                                    <c:choose>
                                        <c:when test="${dir eq 'desc'}">
                                            <i class="fa fa-arrow-down"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fa fa-arrow-up"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>

            <div class="margin-top-10 areaLine"></div>

            <c:forEach items="${articleList}" var="item">
                <div class="row">
                    <div class="article-item-panel">
                        <div class="col-xs-4 col-lg-4">
                            <div class="article-image">
                                <a href="${ctx}/news/item-${item.id}.html">
                                    <c:if test="${not empty imageInfoMap[item.id].imagePath}">
                                        <img class="img-responsive" src="${ctx}/${imageInfoMap[item.id].imagePath}"
                                             alt=""/>
                                    </c:if>
                                    <c:if test="${empty imageInfoMap[item.id].imagePath}">
                                        <img class="img-responsive" src="${ctx}/a/resource/images/demo/default.jpg"
                                             alt=""/>
                                    </c:if>

                                </a>
                            </div>
                        </div>
                        <div class="col-xs-8 col-lg-8">
                            <h4 class="article-title">
                                <span class="article-tag pull-left">${categoryInfoMap[item.categoryId].title}</span>
                                <a href="${ctx}/news/item-${item.id}.html" style="display: block;">
                                        ${item.title}
                                </a>
                            </h4>

                            <div>
                                <ul class="list-unstyled list-inline artile-author-items">
                                    <li>
                                        <fmt:formatDate value="${item.lastEditDate}" pattern="yyyy-MM-dd"/>
                                    </li>
                                    <li>
                                        <c:if test="${not empty item.author}">
                                            文/${item.author}
                                        </c:if>
                                        <c:if test="${not empty item.authorImage}">
                                            图/${item.authorImage}
                                        </c:if>
                                        <c:if test="${not empty item.authorVideo}">
                                            摄影/${item.authorVideo}
                                        </c:if>
                                        <c:if test="${not empty item.authorDecorate}">
                                            排版/${item.authorDecorate}
                                        </c:if>
                                            <%--文/刘峰 图/张洁--%>
                                    </li>
                                    <li></li>
                                </ul>
                            </div>

                            <p class="article-abstract hidden-xs">
                                    ${item.introText}
                            </p>

                            <ul class="list-inline list-separator article-toolbar-items">
                                <li>
                                    <a href="${ctx}/news/item-${item.id}.html#comments">
                                        <i class="fa fa-comments-o"></i>
                                            ${item.commentNum}
                                    </a>
                                </li>
                                <li>
                                    <a class="shareButton" href="javascript:void(0);" data-container="body"
                                       data-toggle="popover" data-placement="top" data-content=""
                                       data-original-title="">
                                        <i class="fa fa-share" data-toggle="popover"></i>
                                        分享
                                    </a>
                                    <div class="sharePanel hidden">
                                        <div>
                                            <wb:share-button appkey="731429745" addition="simple" type="button"
                                                             title="${item.title}"
                                                             url="http://www.cumtp.com"></wb:share-button>
                                        </div>
                                        <div>
                                            <a class="qcShareQQDiv"
                                               href="http://connect.qq.com/widget/shareqq/index.html" target="_blank"
                                               data-url="http://www.cumtp.com/news/item-${item.id}"
                                               data-title="${item.title}" data-summary="${item.introText}" data-pics=""
                                               data-flash="">分享到QQ</a>
                                        </div>
                                        <div>
                                            <a class="qzOpenerDiv"
                                               href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey"
                                               target="_blank" data-url="http://www.cumtp.com/news/item-${item.id}"
                                               data-title="${item.title}" data-summary="${item.introText}" data-pics=""
                                               data-flash="">分享到QQ空间</a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <a>
                                        <i class="fa fa-thumbs-o-up"></i>
                                            ${item.likeNum}
                                    </a>
                                </li>
                            </ul>
                        </div><!-- /post -->
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="areaLine"></div>
            </c:forEach>

            <c:if test="${resultList.totalPage > 1}">
                <div class="row margin-top-20 text-center">

                    <ul class="pagination">
                        <li><a href="${ctx}/news.html?cat=${categoryId}&page=1&sort=${sort}&dir=${dir}">&laquo;</a></li>
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
                                <a href="${ctx}/news.html?cat=${categoryId}&page=${item}&sort=${sort}&dir=${dir}">${item}</a>
                            </li>
                        </c:forEach>
                        <li>
                            <a href="${ctx}/news.html?cat=${categoryId}&page=${resultList.totalPage}&sort=${sort}&dir=${dir}">&raquo;</a>
                        </li>
                    </ul>

                </div>
            </c:if>
        </div>
    </div>

</div>

<script type="text/javascript">

    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class

        $(".qcShareQQDiv").each(function (index, element) {
            var p = {
                url: $(element).attr("data-url"), /*获取URL，可加上来自分享到QQ标识，方便统计*/
                desc: '来看看我推荐的文章', /*分享理由(风格应模拟用户对话),支持多分享语随机展现（使用|分隔）*/
                title: $(element).attr("data-title"), /*分享标题(可选)*/
                summary: $(element).attr("data-summary"), /*分享摘要(可选)*/
                pics: $(element).attr("data-pics"), /*分享图片(可选)*/
                flash: $(element).attr("data-flash"), /*视频地址(可选)*/
                site: '<a href="http://www.cumtp.com">传媒新观察</a>', /*分享来源(可选) 如：QQ分享*/
                style: '102',
                width: 63,
                height: 24
            };

            var s = [];
            for (var i in p) {
                s.push(i + '=' + encodeURIComponent(p[i] || ''));
            }
            var url = ['http://connect.qq.com/widget/shareqq/index.html?', s.join('&')].join('');
            $(element).attr("href", url);
        });

        // QQ空间分享
        $(".qzOpenerDiv").each(function (index, element) {
            var p = {
                url: $(element).attr("data-url"), /*获取URL，可加上来自分享到QQ标识，方便统计*/
                showcount: '1', /*是否显示分享总数,显示：'1'，不显示：'0' */
                desc: '来看看我推荐的文章', /*分享理由(风格应模拟用户对话),支持多分享语随机展现（使用|分隔）*/
                title: $(element).attr("data-title"), /*分享标题(可选)*/
                summary: $(element).attr("data-summary"), /*分享摘要(可选)*/
                pics: $(element).attr("data-pics"), /*分享图片(可选)*/
                flash: $(element).attr("data-flash"), /*视频地址(可选)*/
                site: '<a href="http://www.cumtp.com">传媒新观察</a>', /*分享来源(可选) 如：QQ分享*/
                style: '102',
                width: 63,
                height: 24
            };

            var s = [];
            for (var i in p) {
                s.push(i + '=' + encodeURIComponent(p[i] || ''));
            }
            var url = ['http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?', s.join('&')].join('');
            $(element).attr("href", url);
        });

        $("[data-toggle=popover]").popover({
            html: true,
            hide: 300,
            content: function () {
                var content = $(this).parent().find(".sharePanel").html();
                return content;
            }
        });

        console.log("menu-stickup width = " + $(".menu-stickup").width());

        $(".menu-stickup").css("width", $(".menu-stickup").width());

    });

    //initiating jQuery
    jQuery(function ($) {
        $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class

            console.log("menu-stickup width = " + $(".menu-stickup").width());

            $('.menu-stickup').stickUp({
                marginTop: "180"
            });
        });
    });

</script>
