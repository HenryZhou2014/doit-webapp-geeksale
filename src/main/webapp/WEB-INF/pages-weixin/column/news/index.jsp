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
        <div class="col-lg-12">

            <div class="margin-top-10">
                <jsp:include page="/app/cms/module/slides/xinwen/slides"/>
                <div class="clearfix"></div>
            </div>

            <div class="row margin-top-20">
                <div class="col-lg-12">
                    <div class="heading-title heading-dotted">
                        <h2 class="size-20"><i class="fa fa-bell-o"></i> 公告</h2>
                    </div>

                    <ul class="list-unstyled">
                        <li>
                            <span>
                                2011-05-12
                            </span>
                            <a>新版网站测试运行中，请大家多提出意见和建议！</a>
                        </li>
                        <li>
                            <span>
                                2011-05-12
                            </span>
                            <a>出版社网站正式开放了，欢迎大家访问！</a>

                        </li>
                        <li>
                            <span>
                                2011-03-10
                            </span>
                            <a>中国矿业大学出版社网站设计征集方案</a>
                        </li>
                        <li>
                            <span>
                                2011-05-12
                            </span>
                            <a>
                                新版网站测试运行中，请大家多提出意见和建议！
                            </a>

                        </li>
                    </ul>
                </div>
            </div>

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#home" data-toggle="tab">新闻动态</a></li>
                <li><a href="#profile" data-toggle="tab">最新书讯</a></li>
                <li><a href="#dropdown1" data-toggle="tab">学习交流</a></li>
                <li><a href="#dropdown2" data-toggle="tab">其他</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade in active" id="home">
                    <c:forEach items="${articleList}" var="item">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="article-item-panel">
                                    <div class="col-xs-3 col-lg-3">
                                        <div class="article-image">
                                            <a href="${ctx}/news/item-${item.id}.html">
                                                <c:if test="${not empty imageInfoMap[item.id].imagePath}">
                                                    <img class="img-responsive" src="${ctx}/${imageInfoMap[item.id].imagePath}"
                                                         alt=""/>
                                                </c:if>
                                                <c:if test="${empty imageInfoMap[item.id].imagePath}">
                                                    <img class="img-responsive" src="${ctx}/images/cumtp.com/default-article-image.jpg"
                                                         alt=""/>
                                                </c:if>

                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-xs-9 col-lg-9">
                                        <h4 class="article-title">
                                            <a href="${ctx}/news/item-${item.id}.html" style="display: block;">
                                                    ${item.title}
                                            </a>
                                        </h4>

                                        <div>
                                            <ul class="list-unstyled list-inline artile-author-items">
                                                <li>
                                                    <i class="fa fa-calendar-o"></i><fmt:formatDate value="${item.lastEditDate}" pattern="yyyy-MM-dd"/>
                                                </li>
                                                <li>
                                                    <c:if test="${not empty item.author}">
                                                        <i class="fa fa-pencil"></i>${item.author}
                                                    </c:if>
                                                        <%--文/刘峰 图/张洁--%>
                                                </li>
                                                <li></li>
                                            </ul>
                                        </div>

                                        <p class="article-abstract hidden-xs">
                                                ${item.introText}
                                        </p>

                                    </div><!-- /post -->
                                    <div class="clearfix"></div>
                                </div>
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
                <div class="tab-pane fade" id="profile">

                </div>
                <div class="tab-pane fade" id="dropdown1">

                </div>
                <div class="tab-pane fade" id="dropdown2">

                </div>
            </div>

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
