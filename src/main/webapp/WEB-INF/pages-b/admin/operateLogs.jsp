<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="operateLogList.title"/></title>
    <meta name="heading" content="<fmt:message key='operateLogList.heading'/>"/>
    <meta name="menu" content="SystemAdminMenu"/>
</head>
<div class="navigateDiv">
    <a href="<c:url value='/mainMenu'/>">首页</a>
    &gt;
    <a href="<c:url value='/admin/operateLogs'/>">操作日志</a>
</div>
<div id="search">
<form method="get" action="${ctx}/operateLogs" id="searchForm">
    <input type="text" size="20" name="q" id="query" value="${param.q}"
           placeholder="Enter search terms"/>
    <input type="submit" value="<fmt:message key="button.search"/>"/>
</form>
</div>

<display:table name="operateLogList" class="table" requestURI="" id="operateLogList" export="false" pagesize="25">
    <display:column property="pid" sortable="true" href="operateLogform" media="html"
        paramId="pid" paramProperty="pid" titleKey="operateLog.pid"/>
    <%--<display:column property="pid" media="csv excel xml pdf" titleKey="operateLog.pid"/>--%>
    <display:column property="fromIp" sortable="true" titleKey="operateLog.fromIp"/>
    <display:column property="dataType" sortable="true" titleKey="operateLog.dataType"/>
    <display:column property="userInfo" sortable="true" titleKey="operateLog.userInfo"/>
    <display:column property="dataBefore" sortable="false" titleKey="operateLog.dataBefore"/>
    <display:column property="dataAfter" sortable="false" titleKey="operateLog.dataAfter"/>
    <display:column property="operateDate" sortable="true" titleKey="operateLog.operateDate"/>

    <display:setProperty name="paging.banner.item_name"><fmt:message key="operateLogList.operateLog"/></display:setProperty>
    <display:setProperty name="paging.banner.items_name"><fmt:message key="operateLogList.operateLogs"/></display:setProperty>

    <display:setProperty name="export.excel.filename"><fmt:message key="operateLogList.title"/>.xls</display:setProperty>
    <display:setProperty name="export.csv.filename"><fmt:message key="operateLogList.title"/>.csv</display:setProperty>
    <display:setProperty name="export.pdf.filename"><fmt:message key="operateLogList.title"/>.pdf</display:setProperty>
</display:table>

<script type="text/javascript">
    highlightTableRows("operateLogList");
</script> 
