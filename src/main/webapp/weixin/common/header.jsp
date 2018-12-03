<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<style type="text/css">

    .user-menus li{
        width: 100px;
    }
</style>

<nav class="navbar navbar-fixed-top bg-gray">
    <div class="container">
        <ul class="list-inline">
            <li class="active"><a href="${ctx}/wx/index">首页</a></li>
            <li><a href="${ctx}/wx/mall">书城</a></li>
        </ul>
    </div>
</nav>