<%@ page import="com.doit.cms.model.Article" %>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>${article.title}</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="newArticle"/>
    <style type="text/css">

    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <ul class="nav nav-tabs nav-bottom-border">
                <li class="active"><a href="#info" data-toggle="tab">${article.title}</a></li>
            </ul>

            <div class="tab-content">
                <div class="col-lg-12">
                    <div>
                        <fmt:formatDate value="${article.lastEditDate}" pattern="yyyy-MM-dd"/>
                    </div>
                    <div class="margin-top-20">
                        <doit:articleRichProperty var="${article}" property="fullText"/>
                    </div>
                </div>

            </div>

        </div>

        <!-- LEFT -->
        <div class="col-lg-2 col-md-2 col-sm-3 col-lg-pull-10 col-md-pull-10 col-sm-pull-7">
            <jsp:include page="/app/usercenter/userCenterMenu"/>
        </div>

    </div>
</section>


<script type="text/javascript">

    $(document).ready(function () {

    });

</script>
