<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="accessLogList.title"/></title>
    <meta name="heading" content="<fmt:message key='accessLogList.heading'/>"/>
    <meta name="menu" content="SystemAdminMenu"/>
</head>
<div class="navigateDiv">
    <a href="<c:url value='/mainMenu'/>">首页</a>
    &gt;
    <a href="<c:url value='/admin/accessLogs'/>">访问日志</a>
</div>
<display:table name="accessLogList" class="table" requestURI="" id="accessLogList" export="false" pagesize="25">
    <display:column title="#">
        ${accessLogList_rowNum}
    </display:column>
    <%--<display:column property="pid" media="csv excel xml pdf" titleKey="accessLog.pid"/>--%>
    <display:column property="accessDate" sortable="true" titleKey="accessLog.accessDate"/>
    <display:column property="fromIp" sortable="true" titleKey="accessLog.fromIp"/>
    <display:column property="sessionId" sortable="true" titleKey="accessLog.sessionId"/>
    <display:column property="userInfo" sortable="true" titleKey="accessLog.userInfo"/>
    <display:column property="accessUrl" sortable="true" titleKey="accessLog.accessUrl"/>
    <display:column property="clientInfo" sortable="false" titleKey="accessLog.clientInfo"/>

    <display:setProperty name="paging.banner.item_name"><fmt:message key="accessLogList.accessLog"/></display:setProperty>
    <display:setProperty name="paging.banner.items_name"><fmt:message key="accessLogList.accessLogs"/></display:setProperty>

    <display:setProperty name="export.excel.filename"><fmt:message key="accessLogList.title"/>.xls</display:setProperty>
    <display:setProperty name="export.csv.filename"><fmt:message key="accessLogList.title"/>.csv</display:setProperty>
    <display:setProperty name="export.pdf.filename"><fmt:message key="accessLogList.title"/>.pdf</display:setProperty>
</display:table>

<script type="text/javascript">
    highlightTableRows("accessLogList");
</script> 
