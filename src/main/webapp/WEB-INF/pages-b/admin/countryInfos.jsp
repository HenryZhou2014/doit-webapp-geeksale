<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="systemLogList.title"/></title>
    <meta name="heading" content="<fmt:message key='systemLogList.heading'/>"/>
    <meta name="menu" content="SystemAdminMenu"/>
</head>
<div class="navigateDiv">
    <a href="<c:url value='/mainMenu'/>">首页</a>
    &gt;
    <a href="<c:url value='/admin/systemLogs'/>">系统日志</a>
</div>
<div id="search">
<form method="get" action="${ctx}/systemLogs" id="searchForm">
    <input type="text" size="20" name="q" id="query" value="${param.q}"
           placeholder="Enter search terms"/>
    <input type="submit" value="<fmt:message key="button.search"/>"/>
</form>
</div>

countryInfoes

<script type="text/javascript">
    highlightTableRows("systemLogList");
</script> 
