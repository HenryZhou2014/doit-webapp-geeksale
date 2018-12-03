<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>${article.title}</title>
    <meta name="heading" content="新闻栏目"/>
    <meta name="column-name" content="news"/>
    <style type="text/css">
        .article-content p{
            margin-bottom: 10px;

            text-indent: 32px;
        }

        p, pre, ul, ol, dl, dd, blockquote, address, table, fieldset, form{
            margin-bottom: 10px;
        }
    </style>
</head>

<!-- REVOLUTION SLIDER -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="news_title margin-top-20">
                <h2>${article.title}</h2>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="row">
                <div class="col-lg-6">
                    <ul class="list-unstyled list-inline article-info">
                        <li>
                            <div class="article-time">
                                <fmt:formatDate value="${article.lastEditDate}"
                                                pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
                            </div>
                        </li>
                        <li>
                            <div class="article-source">
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
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="divider double-line nomargin"><!-- divider --></div>

            <div class="article-content">
                <jsp:include page="/app/article/item-${article.id}"/>
            </div>
        </div>
        <div class="col-lg-4">

            <div>
                <jsp:include page="/app/wx/news/relatedNews">
                    <jsp:param name="articleId" value="${article.id}"/>
                </jsp:include>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $(".article-content img").addClass("img-responsive");
    });
</script>