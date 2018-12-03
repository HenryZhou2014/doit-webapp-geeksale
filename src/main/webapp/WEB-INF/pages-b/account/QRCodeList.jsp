<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="accountList.title"/></title>
    <meta name="heading" content="<fmt:message key='accountList.heading'/>"/>
    <meta name="menu" content="AccountMenu"/>
</head>

<form:form commandName="accountQueryParameter" method="post" action="joinAccounts" id="form1">

    <div style="border:1px solid #ddd; background: #eee;">
        <a href="javascript:void(0);" class="easyui-linkbutton" onclick="javascript:location.href='${ctx}/backend/account/QRCodeList';"
           data-options="plain:true,iconCls:'icon-reload'">刷新</a>
    </div>
    <spring:bind path="accountQueryParameter">
    <div id="accordion">
        <table style="margin: 10px auto;">
            <tr>
                <td><label class="title">账户</label></td>
                <td>
                    <form:input path="accountName" id="accountName" maxlength="16" cssClass="text medium"/>
                </td>
                <td><label class="title">姓名</label></td>
                <td>
                    <form:input path="username" id="username" cssClass="text medium" maxlength="16"/>
                </td>
                <td>
                    <input type="submit" value="查询"/>
                    <input type="button" value="清除" onclick="javascript:clearForm(this.form);"/>
                </td>
            </tr>
        </table>
    </div>
    </spring:bind>

    <div style="margin: 15px;">
    <display:table name="accountList" class="table" requestURI="" id="rowItem" export="false" pagesize="25">
        <display:column title="序号" style="width:20px;">${accountList.objectsPerPage * (accountList.pageNum-1) + rowItem_rowNum}</display:column>
        <display:column property="accountName" sortable="true" titleKey="account.accountName"/>
        <display:column property="newIndex" sortable="true" titleKey="account.newIndex"></display:column>
        <display:column property="userName" sortable="true" titleKey="account.userName"/>


        <display:column property="email" sortable="false" titleKey="account.photoShops[0].name"/>

        <display:column property="province" sortable="false" titleKey="account.province"/>
        <display:column property="cityName" sortable="false" titleKey="account.cityName"/>
        <display:column property="registerDate" sortable="true" titleKey="account.registerDate"/>

        <display:column title="图片空间二维码">
            <img src="<c:url value='/shop/${rowItem.newIndex}/qrcodeImage'/>" width="100" height="100" />
        </display:column>

    </display:table>
    </div>

</form:form>

<script type="text/javascript">
    highlightTableRows("accountList");
</script>
