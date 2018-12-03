<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title><fmt:message key="webapp.name"/></title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <style type="text/css">
        ul.side-nav>li>a{
            font-size: 14px;
        }
    </style>
</head>

<!-- -->

<div class="thumbnail text-center">
    <div style="overflow: hidden;">
        <img class="img-responsive" src="${profileImage}" alt=""/>
    </div>
    <h2 class="size-18 margin-top-10 margin-bottom-0">${accountInfo.userName}</h2>
    <%--<h3 class="size-11 margin-top-0 margin-bottom-10 text-muted">DEVELOPER</h3>--%>
</div>

<!-- SIDE NAV -->
<ul class="side-nav list-group margin-bottom-60" id="sidebar-nav">
    <li class="list-group-item" data-menu="myNotifications"><a href="${ctx}/usercenter/myNotifications"><i
            class="fa fa-envelope-o"></i> 通知</a></li>
    <li class="list-group-item" data-menu="myProfile"><a href="${ctx}/usercenter/myProfile"><i
            class="fa fa-user"></i> 账号信息</a></li>
    <li class="list-group-item" data-menu="myOrders"><a href="${ctx}/usercenter/myOrders"><i
            class="fa fa-file-text"></i> 我的订单</a></li>
    <li class="list-group-item" data-menu="myBooks"><a href="${ctx}/usercenter/myBooks"><i
            class="fa fa-gift"></i> 我的书柜</a></li>
    <li class="list-group-item" data-menu="myFavorites"><a href="${ctx}/usercenter/myFavorites"><i
            class="fa fa-star"></i> 我的收藏</a></li>
    <li class="list-group-item" data-menu="myComments"><a href="${ctx}/usercenter/myComments"><i
            class="fa fa-comments-o"></i> 我的书评</a></li>
    <%--<li class="list-group-item"><a href="page-profile-history.html"><i class="fa fa-history"></i> HISTORY</a></li>--%>
    <%--<li class="list-group-item" data-menu="mySetting"><a href="${ctx}/usercenter/mySetting"><i class="fa fa-gears"></i>
        设置</a></li>--%>

    <%--<li class="list-group-item list-toggle">   <!-- NOTE: "active" to be open on page load -->
        <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-1">DROPDOWN EXAMPLE</a>
        <ul id="collapse-1" class="collapse"><!-- NOTE: "collapse in" to be open on page load -->
            <li><a href="#"><i class="fa fa-angle-right"></i> SUMBENU 1</a></li>
            <li>
                <span class="badge badge-red">New</span>
                <a href="#"><i class="fa fa-angle-right"></i> SUMBENU 2</a>
            </li>
            <li class="active"><a href="#"><i class="fa fa-angle-right"></i> SUMBENU 3</a></li>
            <li><a href="#"><i class="fa fa-angle-right"></i> SUMBENU 4</a></li>
        </ul>
    </li>--%>
</ul>
<!-- /SIDE NAV -->


<script type="text/javascript">

    $(document).ready(function () {

        refreshMenu();
    });

    function refreshMenu() {
        var currentMenu = $("meta[name='user-center-menu']").attr("content");
        $("#sidebar-nav li").each(function () {
            $(this).removeClass("active");
        });
        $("#sidebar-nav li[data-menu='" + currentMenu + "']").addClass("active");
    }

</script>
