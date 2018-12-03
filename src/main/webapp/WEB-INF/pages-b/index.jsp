<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="webapp.name"/></title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="module-group" content="website-dashboard"/>
    <meta name="menu" content="website-dashboard"/>
</head>

<div class="row m-t">
    <jsp:include page="/app/backend/panel/dashboard/numberCount"/>
</div>
<div class="row">
    <div class="col-lg-6">
        <jsp:include page="/app/backend/panel/dashboard/myActivities"/>
    </div>

    <div class="col-lg-6">
        <jsp:include page="/app/backend/panel/dashboard/recentPublishedArticles"/>
    </div>

    <div class="col-lg-4">
        <jsp:include page="/app/backend/panel/dashboard/recentLoginInfo"/>
    </div>

    <div class="col-lg-6">
        <jsp:include page="/app/backend/panel/dashboard/mostVisitedArticles"/>
    </div>
</div>

<script>
    $(document).ready(function () {

    });
</script>