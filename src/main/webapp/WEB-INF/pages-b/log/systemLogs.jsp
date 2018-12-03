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

<display:table name="systemLogList" class="table" requestURI="" id="systemLogList" export="false" pagesize="25">
    <display:column property="pid" sortable="true" href="systemLogform" media="html"
        paramId="pid" paramProperty="pid" titleKey="systemLog.pid"/>
    <%--<display:column property="pid" media="csv excel xml pdf" titleKey="systemLog.pid"/>--%>
    <display:column property="logDate" sortable="true" titleKey="systemLog.logDate"/>
    <display:column property="logType" sortable="true" titleKey="systemLog.logType"/>
    <display:column property="module" sortable="true" titleKey="systemLog.module"/>
    <display:column property="log" sortable="false" titleKey="systemLog.log"/>

    <display:setProperty name="paging.banner.item_name"><fmt:message key="systemLogList.systemLog"/></display:setProperty>
    <display:setProperty name="paging.banner.items_name"><fmt:message key="systemLogList.systemLogs"/></display:setProperty>

    <display:setProperty name="export.excel.filename"><fmt:message key="systemLogList.title"/>.xls</display:setProperty>
    <display:setProperty name="export.csv.filename"><fmt:message key="systemLogList.title"/>.csv</display:setProperty>
    <display:setProperty name="export.pdf.filename"><fmt:message key="systemLogList.title"/>.pdf</display:setProperty>
</display:table>

<script type="text/javascript">
    highlightTableRows("systemLogList");
</script> 
