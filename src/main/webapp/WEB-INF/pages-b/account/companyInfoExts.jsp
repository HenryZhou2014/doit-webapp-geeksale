<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="companyInfoExtList.title"/></title>
    <meta name="heading" content="<fmt:message key='companyInfoExtList.heading'/>"/>
    <meta name="menu" content="CompanyInfoExtMenu"/>
</head>

<div id="search">
<form method="get" action="${ctx}/companyInfoExts" id="searchForm">
    <input type="text" size="20" name="q" id="query" value="${param.q}"
           placeholder="Enter search terms"/>
    <input type="submit" value="<fmt:message key="button.search"/>"/>
</form>
</div>

<input type="button" style="margin-right: 5px" onclick="location.href='<c:url value="/companyInfoExtform"/>'" value="<fmt:message key="button.add"/>"/>
<input type="button" onclick="location.href='<c:url value="/mainMenu"/>'" value="<fmt:message key="button.done"/>"/>

<display:table name="companyInfoExtList" class="table" requestURI="" id="companyInfoExtList" export="true" pagesize="25">
    <display:column property="id" sortable="true" href="companyInfoExtform" media="html"
        paramId="id" paramProperty="id" titleKey="companyInfoExt.id"/>
    <display:column property="id" media="csv excel xml pdf" titleKey="companyInfoExt.id"/>
    <display:column property="aliasName" sortable="true" titleKey="companyInfoExt.aliasName"/>
    <display:column property="companyId" sortable="true" titleKey="companyInfoExt.companyId"/>
    <display:column property="createBy" sortable="true" titleKey="companyInfoExt.createBy"/>
    <display:column property="createDate" sortable="true" titleKey="companyInfoExt.createDate"/>
    <display:column property="extContent" sortable="true" titleKey="companyInfoExt.extContent"/>
    <display:column property="extType" sortable="true" titleKey="companyInfoExt.extType"/>
    <display:column property="title" sortable="true" titleKey="companyInfoExt.title"/>
    <display:column property="updateBy" sortable="true" titleKey="companyInfoExt.updateBy"/>
    <display:column property="updateDate" sortable="true" titleKey="companyInfoExt.updateDate"/>

    <display:setProperty name="paging.banner.item_name"><fmt:message key="companyInfoExtList.companyInfoExt"/></display:setProperty>
    <display:setProperty name="paging.banner.items_name"><fmt:message key="companyInfoExtList.companyInfoExts"/></display:setProperty>

    <display:setProperty name="export.excel.filename"><fmt:message key="companyInfoExtList.title"/>.xls</display:setProperty>
    <display:setProperty name="export.csv.filename"><fmt:message key="companyInfoExtList.title"/>.csv</display:setProperty>
    <display:setProperty name="export.pdf.filename"><fmt:message key="companyInfoExtList.title"/>.pdf</display:setProperty>
</display:table>

<input type="button" style="margin-right: 5px" onclick="location.href='<c:url value="/companyInfoExtform"/>'" value="<fmt:message key="button.add"/>"/>
<input type="button" onclick="location.href='<c:url value="/mainMenu"/>'" value="<fmt:message key="button.done"/>"/>

<script type="text/javascript">
    highlightTableRows("companyInfoExtList");
</script> 
