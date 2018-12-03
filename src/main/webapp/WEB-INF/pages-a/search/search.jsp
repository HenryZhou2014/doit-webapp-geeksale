<%@ page import="com.doit.xiaowanjia.frontend.webapp.viewobject.SearchResultItem" %>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title><fmt:message key="webapp.name"/></title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="menu" content="GoodsOrderMenu"/>

    <style type="text/css">
        body {
            background: #f6f6f6;
        }

        .bookinfos span{
            display: inline-block;
            width: 60px;
            margin-right: 10px;
        }
    </style>
</head>

<div class="container">
    <div>
        <!-- LEFT COLUMNS -->
        <div class="col-md-9 col-sm-9 col-md-push-3 col-sm-push-3 margin-top-20 margin-bottom-30">
            <div class="col-lg-12 bg-white">

                <c:choose>
                    <c:when test="${not empty resultList}">
                        <div class="row callout alert alert-success">

                            <div class="row">

                                <div class="col-md-8 col-sm-8"><!-- left text -->
                                    <h4>
                                        共找到 <strong>${resultList.fullsize}</strong> 条记录
                                    </h4>
                                    <p>
                                        当前显示 第${resultList.pageNum}/${resultList.totalPage}页
                                    </p>
                                </div><!-- /left text -->

                            </div>

                        </div>
                    </c:when>

                    <c:otherwise>
                        <div class="callout alert alert-default  ">

                            <div class="row">

                                <div class="col-md-8 col-sm-8"><!-- left text -->
                                    <h4>
                                        请输入搜索条件
                                    </h4>

                                </div><!-- /left text -->

                            </div>

                        </div>
                    </c:otherwise>
                </c:choose>

                <!-- SEARCH RESULTS -->

                <c:forEach items="${resultData}" var="item" varStatus="status">

                    <div class="clearfix search-result"><!-- item -->
                        <c:if test="${item.dataType eq 'S'}">
                            <h4><a href="${ctx}/mall/item-${item.entity.id}" target="_blank">${item.title}</a></h4>
                            <div class="col-lg-3">
                                <a href="${ctx}/mall/item-${item.entity.id}" target="_blank">
                                    <c:set var="imageSrc" value="${ctx}/images/cumtp.com/TRLOGO.jpg"/>
                                    <c:if test="${not empty item.entity.imageInfo.imagePath}">
                                        <c:set var="imageSrc" value="${item.entity.additionInfoMap['thumbnail']}"/>
                                    </c:if>
                                    <img src="${imageSrc}" class="img-responsive"/>
                                </a>
                            </div>
                            <div class="col-lg-9">
                                <ul class="list-unstyled bookinfos size-13">
                                    <li><span>ISBN</span>${item.entity.isbn}</li>
                                    <li class="margin-top-10"><span>作者</span>${item.entity.author}</li>
                                    <li class="margin-top-10"><span>出版社</span>${item.entity.pressName}</li>
                                    <li class="margin-top-10"><span>出版日期</span>${item.entity.publicationDate}</li>
                                </ul>
                            </div>
                        </c:if>
                        <c:if test="${item.dataType eq 'A'}">
                            <div class="size-14 margin-bottom-0">
                                <a href="${ctx}/news/item-${item.entity.id}" target="_blank">${item.title}</a>
                            </div>
                            <ul class="list-inline list-unstyled size-13 margin-top-10">
                                <li>
                                    日期 <fmt:formatDate value="${item.entity.lastEditDate}" pattern="yyyy-MM-dd"/>
                                </li>
                                <li>
                                    作者 ${item.entity.author}
                                </li>
                            </ul>
                            <p>
                                    ${item.entity.introText}
                            </p>
                        </c:if>
                    </div>
                    <!-- /item -->

                </c:forEach>

                <!-- /SEARCH RESULTS -->

                <!-- PAGINATION -->
                <c:if test="${resultList.totalPage > 1}">
                    <div class="row margin-top-40 text-center">

                        <ul class="pagination">
                            <li><a data-page="1" data-action="${action}">&laquo;</a></li>
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
                                    <a data-page="${item}" data-action="${action}">${item}</a>
                                </li>
                            </c:forEach>
                            <li><a data-page="${resultList.totalPage}" data-action="${action}">&raquo;</a></li>
                        </ul>

                    </div>
                </c:if>
                <!-- /PAGINATION -->

            </div>
        </div>
        <!-- /LEFT COLUMNS -->

        <!-- RIGHT COLUMNS -->
        <div class="col-md-3 col-sm-3 col-md-pull-9 col-sm-pull-9 bg-white margin-top-20 margin-bottom-30">
            <div class="bg-white">
                <c:set var="type1Class" value=""/>
                <c:set var="type2Class" value=""/>
                <c:choose>
                    <c:when test="${action eq 'books'}">
                        <c:set var="type2Class" value="active"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="type1Class" value="active"/>
                    </c:otherwise>
                </c:choose>

                <ul class="nav nav-tabs nav-bottom-border">
                    <li class="${type1Class}"><a href="#home" data-toggle="tab">全站搜索</a></li>
                    <li class="${type2Class}"><a href="#profile" data-toggle="tab">图书搜索</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade in ${type1Class}" id="home">

                        <form action="search" method="get" id="fullTextSearchForm">
                            <input type="text" name="q" value="${q}" class="form-control" placeholder="关键字"/>
                            <input type="hidden" name="page"/>
                            <label class="size-12 margin-top-10">在分类下搜索</label>
                            <select name="targetType" class="form-control" id="targetType">
                                <option value="">不限</option>
                                <option value="news">公告新闻</option>
                                <option value="book">图书</option>
                                <%--<option value="download">资源下载</option>--%>
                            </select>

                            <div class="text-right margin-top-20">
                                <button type="submit" class="btn btn-default form-control searchBtn" name="action" value="fullText">搜索</button>
                            </div>
                        </form>
                    </div>

                    <div class="tab-pane fade in ${type2Class}" id="profile">

                        <form action="search" method="get" id="booksSearchForm">
                            <input type="hidden" name="page"/>
                            书名
                            <input type="text" name="q" value="${bookName}" class="form-control" placeholder="书名"/>

                            ISBN
                            <input type="text" name="isbn" value="${isbn}" class="form-control" placeholder="ISBN"/>

                            作者
                            <input type="text" name="author" value="${author}" class="form-control" placeholder="作者"/>
                            <div class="hidden">
                            编辑
                            <input type="text" name="editor" value="${editor}" class="form-control" placeholder="编辑"/>
                            </div>
                            出版日期
                            <input type="text" name="publishDate" value="${publishDate}" class="form-control" placeholder="出版日期"/>
                            <div class="text-right margin-top-20">
                                <button type="submit" class="btn btn-default form-control searchBtn" name="action" value="books">搜索</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!-- /RIGHT COLUMNS -->
    </div>
</div>


<script type="text/javascript">

    $(document).ready(function () {
        <c:if test="${empty action or action eq 'fullText'}">
        $("#targetType option[value='${targetType}']").attr("selected", true);
        </c:if>

        $(".pagination").on("click", "a", function(){
            var action = $(this).attr("data-action");
            var page = $(this).attr("data-page");

            if (action == "books"){
                $("#booksSearchForm input[name=page]").val(page);
                $("#booksSearchForm .searchBtn").click();
            }
            else {
                $("#fullTextSearchForm input[name=page]").val(page);
                $("#fullTextSearchForm .searchBtn").click();
            }
        });
    });

    function gotoPage(page){

    }

</script>
