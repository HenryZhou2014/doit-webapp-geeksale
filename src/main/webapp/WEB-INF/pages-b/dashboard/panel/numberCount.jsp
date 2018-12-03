<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>


<div class="col-lg-2">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <%--<span class="label label-success pull-right">Monthly</span>--%>
            <label class="label label-success">会员</label>
        </div>
        <div class="ibox-content">
            <h1><fmt:formatNumber value="653" groupingUsed=","/> </h1>
            <%--<div class="stat-percent font-bold text-success">98% <i class="fa fa-bolt"></i></div>
            <small>Total income</small>--%>
        </div>
    </div>
</div>
<div class="col-lg-2">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <%--<span class="label label-info pull-right">Annual</span>--%>
            <label class="label label-danger">代理</label>
        </div>
        <div class="ibox-content">
            <h1><fmt:formatNumber value="8923" groupingUsed=","/></h1>
            <%--<div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i></div>
            <small>New orders</small>--%>
        </div>
    </div>
</div>
<div class="col-lg-2">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <%--<span class="label label-info pull-right">Annual</span>--%>
            <label class="label label-info">OEM代理</label>
        </div>
        <div class="ibox-content">
            <h1><fmt:formatNumber value="27652" groupingUsed=","/></h1>
            <%--<div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i></div>
            <small>New orders</small>--%>
        </div>
    </div>
</div>
<div class="col-lg-2">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <%--<span class="label label-primary pull-right">Today</span>--%>
            <label class="label label-primary">今日刷单</label>
        </div>
        <div class="ibox-content">
            <h1><fmt:formatNumber value="982" groupingUsed=","/></h1>
            <%--<div class="stat-percent font-bold text-navy">44% <i class="fa fa-level-up"></i></div>
            <small>New visits</small>--%>
        </div>
    </div>
</div>
