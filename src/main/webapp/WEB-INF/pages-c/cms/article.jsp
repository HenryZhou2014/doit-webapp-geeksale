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
        <div class="col-lg-12 margin-bottom-80">

            <ul class="nav nav-tabs nav-bottom-border">
                <li class="active"><a href="#info" data-toggle="tab">${article.title}</a></li>
            </ul>

            <div class="tab-content">
                <div class="col-lg-12">
                    <div class="margin-top-20">
                        <doit:articleRichProperty var="${article}" property="fullText"/>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>


<script type="text/javascript">

    $(document).ready(function () {

    });

</script>
