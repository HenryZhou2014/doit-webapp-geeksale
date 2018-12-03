<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>${article.title}</title>
    <meta name="heading" content="新闻栏目"/>
    <meta name="column-name" content="news"/>
    <style type="text/css">
        body {
            background: #f6f6f6;
        }

        .article-content {
            overflow: hidden;
            min-height: 450px;
        }

        .article-content p {
            /*margin-bottom: 10px;*/
            text-indent: 32px;
        }

        p, pre, ul, ol, dl, dd, blockquote, address, table, fieldset, form {
            margin-bottom: 10px;
        }

        div.divider.double-line:before {
            border-top: 1px solid #2C3E50;
        }

        div.divider.double-line:after {
            border-top: 2px solid #2C3E50;
        }
    </style>
</head>

<!-- REVOLUTION SLIDER -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div>
                <ul class="list-unstyled list-inline navigator-bar line-height-50">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="${ctx}/index">首页</a>
                    </li>
                    <c:if test="${not empty articleCategory}">
                        <li class="nopadding"><i class="fa fa-angle-right nomargin-right"></i></li>
                        <li>
                            <a>${articleCategory.title}</a>
                        </li>
                    </c:if>
                    <li class="nopadding"><i class="fa fa-angle-right nomargin-right"></i></li>
                    <li>
                        <a href="#">${article.title}</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-9">
            <div class="col-lg-12 bg-white margin-bottom-20">
                <div class="news_title">
                    <h2 class="weight-800 nomargin"
                        style="font-size: 24px;">${article.title}</h2>
                </div>

                <div>
                    <ul class="list-unstyled list-inline article-info">
                        <li>
                            <div class="article-time">
                                <i class="fa fa-calendar-o"></i> <fmt:formatDate value="${article.lastEditDate}"
                                                                                 pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
                            </div>
                        </li>
                        <li>
                            <div class="article-source">
                                <i class="fa fa-pencil"></i>
                                <c:choose>
                                    <c:when test="${not empty article.author}">
                                        ${article.author}
                                    </c:when>
                                    <c:otherwise>
                                        中国矿业大学出版社
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="divider double-line nomargin" style="border-color: #2C3E50;"><!-- divider --></div>

                <div class="article-content padding-30">
                    <doit:articleRichProperty var="${article}" property="fullText"/>
                </div>
            </div>
        </div>

        <div class="col-lg-3">
            <div class="col-lg-12 bg-white margin-bottom-20">
                <jsp:include page="/app/cms/module/relatedArticles">
                    <jsp:param name="articleId" value="${article.id}"/>
                </jsp:include>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
//        $(".article-content img").addClass("img-responsive");
    });
</script>