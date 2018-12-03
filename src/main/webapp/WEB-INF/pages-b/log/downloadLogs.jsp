<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="operateLogList.title"/></title>
    <meta name="heading" content="<fmt:message key='operateLogList.heading'/>"/>
    <meta name="menu" content="SystemAdminMenu"/>
</head>
<form:form commandName="downloadLogQueryParameter" method="post" action="downloadLogList" id="form">
    <div class="page_toolbar">
        <div style="border:1px solid #ddd; background: #eee;">
            <%--<div class="fl">--%>
            <%--</div>--%>
            <div class="fr">
                <a id="toolbar_reload" href="javascript:void(0);" class="easyui-linkbutton"   data-options="plain:true,iconCls:'icon-reload'">刷新</a>
                <a id="toolbar_close" href="javascript:void(0);" class="easyui-linkbutton"   data-options="plain:true,iconCls:'icon-close'">关闭</a>
            </div>
            <div class="clear"></div>
        </div>
    </div>

    <spring:bind path="downloadLogQueryParameter">
        <div id="accordion">
            <table style="margin: 10px auto;">
                <tr>
                    <!-- 输入需要的年份、月份 -->
                    <td><label class="title">请选择年月：</label></td>
                    <td>
                        <form:select path="yearMonthStr" cssClass="easyui-combobox" cssStyle="width: 120px">
                            <c:forEach begin="0" end="4" step="1" varStatus="i">
                                <form:option value="${yearMonthList[i.index]}">${yearMonthList[i.index]}</form:option>
                            </c:forEach>
                        </form:select>
                    </td>
                    <td>
                        <input type="submit" value="查询"/>
                        <input type="button" value="清除" onclick="javascript:clearForm(this.form);"/>
                    </td>
                </tr>
            </table>
        </div>
    </spring:bind>
</form:form>


<!-- 显示一个月的上传下载量 -->
<table class="table" style="width: 100%">
    <tr style="height: 20px">
        <th>下载统计</th>
        <c:forEach begin="1" end="${daysByMonth}"  step="1" varStatus="i">
        <th>${i.index}号</th>
        </c:forEach>
        <th>总和</th>
    </tr>
    <c:forEach items="${dataTypeMap }" var = "dataType">
        <tr>
            <td>${dataType.value}</td>
                <c:set var="rowTotal" value="0"/>
                <c:forEach begin="1" end="${daysByMonth}"  step="1" varStatus="i">
                    <c:set var="key" value="${dataType.key}_${i.index}"/>
                    <td>${dataMap[key]}</td>
                    <c:set var="rowTotal" value="${rowTotal + dataMap[key]}"/>
                </c:forEach>
            <td>${rowTotal}</td>
        </tr>
    </c:forEach>
</table>


<display:table name="logList" class="table" requestURI="" id="rowItem" export="false" pagesize="25">

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

    $(function(){

        //工具栏事件绑定
        initToolBarActions();

    });
    function initToolBarActions(){

        // 刷新按钮
        $("#toolbar_reload").bind("click", function(){
            action_reload();
        });

        // 关闭按钮
        $("#toolbar_close").bind("click", function(){
            closeFrameworkCurrentTab();
        });
    }

    function action_reload(){
        location.href='${ctx}/backend/log/downloadLogList';
    }

</script>
