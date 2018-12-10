<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title><fmt:message key="webapp.name"/></title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <style type="text/css">
        ul.side-nav > li > a {
            font-size: 14px;
        }

        ul.side-nav ul li.active a{
            font-weight: 800;
            color: #257DB6;
        }
    </style>
</head>

<!-- -->

<div class="text-center">
    <div style="overflow: hidden;">
        <c:choose>
            <c:when test="${not empty profileImage}">
                <img class="img-responsive" src="${ctx}/images/no_portrait.png" alt=""/>
            </c:when>
            <c:otherwise>
                <img class="img-responsive" src="${ctx}/images/no_portrait.png" alt=""/>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="size-14 margin-top-10 margin-bottom-0">
        <div>
            <security:authentication property="principal.userName"/>
        </div>
        <div>
            ${accountCompanyInfo.companyName}
        </div>
    </div>
    <%--<h3 class="size-11 margin-top-0 margin-bottom-10 text-muted">DEVELOPER</h3>--%>
</div>

<!-- SIDE NAV -->
<ul class="side-nav list-group margin-bottom-60 margin-top-30" id="sidebar-nav">
    <%--<li class="list-group-item" data-menu="myNotifications">
        <a href="${ctx}/usercenter/myNotifications"><i class="fa fa-envelope-o"></i> 通知</a>
    </li>--%>
    <li class="list-group-item menu-item-module" data-menu-module="00">
        <a href="${ctx}/usercenter/dashboard"><i class="fa fa-th-large"></i> 首页${currentAccount.accountType}</a>
    </li>
    <li class="list-group-item list-toggle menu-item-group" data-menu-group="01">   <!-- NOTE: "active" to be open on page load -->
        <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-3"><i class="fa fa-share-alt"></i> 功能</a>
        <ul id="collapse-3" class="collapse in"><!-- NOTE: "collapse in" to be open on page load -->
            <li class="menu-item-module" data-menu-module="0110"><a href="${ctx}/usercenter/myWebWeixin/"><i class="fa fa-angle-right"></i> 微信裂变</a></li>
            <li class="menu-item-module" data-menu-module="0120"><a href="${ctx}/usercenter/commingsoon/"><i class="fa fa-angle-right"></i> 小说裂变</a></li>
            <li class="menu-item-module" data-menu-module="0130"><a href="${ctx}/usercenter/commingsoon/"><i class="fa fa-angle-right"></i> 视频裂变</a></li>
            <%--<li><a href="${ctx}/usercenter/yellow-pages"><i class="fa fa-angle-right"></i> 商户库</a></li>--%>
            <li class="menu-item-module" data-menu-module="0140"><a href="${ctx}/usercenter/commingsoon/"><i class="fa fa-angle-right"></i> 增值服务</a></li>
            <%--
            <li class="menu-item-module" data-menu-module="0160"><a href="${ctx}/usercenter/htmlEdit"><i class="fa fa-angle-right"></i> 编辑网页</a></li>
            <li class="menu-item-module" data-menu-module="0170"><a href="${ctx}/usercenter/showAll"><i class="fa fa-angle-right"></i> 查看网页</a></li>
             --%>
            <li class="menu-item-module" data-menu-module="0150"><a href="${ctx}/usercenter/commingsoon"><i class="fa fa-plus"></i> 添加功能</a></li>
        </ul>
    </li>
    <li class="list-group-item list-toggle menu-item-group" data-menu-group="02">   <!-- NOTE: "active" to be open on page load -->
        <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-1"><i class="fa fa-paw"></i> 管理</a>
        <ul id="collapse-1" class="collapse"><!-- NOTE: "collapse in" to be open on page load -->
            <li class="menu-item-module" data-menu-module="0210"><a href="${ctx}/usercenter/myMaterial"><i class="fa fa-angle-right"></i> 素材管理</a></li>
            <li class="menu-item-module" data-menu-module="0230"><a href="${ctx}/usercenter/showAll"><i class="fa fa-angle-right"></i> 网页管理</a></li>
            <li class="menu-item-module" data-menu-module="0220">
                <a href="${ctx}/usercenter/myCompany"><i class="fa fa-angle-right"></i> 公司管理</a>
            </li>
            <%--<li class="menu-item-module" data-menu-module="0230"><a href="${ctx}/usercenter/myClient"><i class="fa fa-angle-right"></i> 客户管理</a></li>--%>
            <%--<li class="menu-item-module" data-menu-module="0240"><a href="${ctx}/usercenter/commingsoon"><i class="fa fa-angle-right"></i> 礼品管理</a></li>--%>
            <%--<li class="menu-item-module" data-menu-module="0250"><a href="${ctx}/usercenter/employeeAchievement"><i class="fa fa-angle-right"></i> 业绩分配</a></li>--%>
        </ul>
    </li>
        <c:if test="${accountInfo.accountType eq 'A'}">
    <li class="list-group-item list-toggle menu-item-group" data-menu-group="03">   <!-- NOTE: "active" to be open on page load -->
        <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-2"><i class="fa fa-renren"></i> 代理</a>
        <ul id="collapse-2" class="collapse"><!-- NOTE: "collapse in" to be open on page load -->
            <li class="menu-item-module" data-menu-module="0310"><a href="${ctx}/usercenter/newMemberApply"><i class="fa fa-angle-right"></i> 客户开户</a></li>
            <li class="menu-item-module" data-menu-module="0320">
                <a href="${ctx}/usercenter/myMember"><i class="fa fa-angle-right"></i> 客户查询</a>
            </li>
            <%--<li class="active"><a href="${ctx}/usercenter/mySubCompany"><i class="fa fa-angle-right"></i> 营销人员管理</a></li>--%>
        </ul>
    </li>
        </c:if>
    <li class="list-group-item list-toggle menu-item-group" data-menu-group="04">   <!-- NOTE: "active" to be open on page load -->
        <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-4"><i class="fa fa-area-chart"></i> 统计</a>
        <ul id="collapse-4" class="collapse"><!-- NOTE: "collapse in" to be open on page load -->
            <li class="menu-item-module" data-menu-module="0410"><a href="${ctx}/usercenter/clientStatistic"><i class="fa fa-angle-right"></i> 客户统计</a></li>
            <li class="menu-item-module" data-menu-module="0420"><a href="${ctx}/usercenter/commingsoon"><i class="fa fa-angle-right"></i> 员工推广统计</a></li>
            <%--<li><a href="#"><i class="fa fa-angle-right"></i> 开户统计</a></li>
            <li><a href="#"><i class="fa fa-angle-right"></i> 会员传播统计</a></li>
            <li><a href="#"><i class="fa fa-angle-right"></i> 营销推广考核</a></li>--%>
        </ul>
    </li>
    <%--<li class="list-group-item list-toggle">   <!-- NOTE: "active" to be open on page load -->
        <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-5"><i class="fa fa-leaf"></i> 开发</a>
        <ul id="collapse-5" class="collapse"><!-- NOTE: "collapse in" to be open on page load -->
            <li><a href="#"><i class="fa fa-angle-right"></i> 开发配置</a></li>
            <li><a href="#"><i class="fa fa-angle-right"></i> 开发接口</a></li>
            &lt;%&ndash;<li><a href="#"><i class="fa fa-angle-right"></i> 开户统计</a></li>
            <li><a href="#"><i class="fa fa-angle-right"></i> 会员传播统计</a></li>
            <li><a href="#"><i class="fa fa-angle-right"></i> 营销推广考核</a></li>&ndash;%&gt;
        </ul>
    </li>--%>
    <li class="list-group-item list-toggle menu-item-group" data-menu-group="05">   <!-- NOTE: "active" to be open on page load -->
        <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-6"><i class="fa fa-cog"></i> 设置</a>
        <ul id="collapse-6" class="collapse"><!-- NOTE: "collapse in" to be open on page load -->
            <li class="menu-item-module" data-menu-module="0510"><a href="${ctx}/usercenter/myProfile?table=info"><i class="fa fa-angle-right"></i> 基本信息</a></li>
            <li class="menu-item-module" data-menu-module="0520"><a href="${ctx}/usercenter/myProfile?table=password"><i class="fa fa-angle-right"></i> 修改密码</a></li>
            <%--<li><a href="#"><i class="fa fa-angle-right"></i> 开户统计</a></li>
            <li><a href="#"><i class="fa fa-angle-right"></i> 会员传播统计</a></li>
            <li><a href="#"><i class="fa fa-angle-right"></i> 营销推广考核</a></li>--%>
        </ul>
    </li>
</ul>
<!-- /SIDE NAV -->


<script type="text/javascript">

    $(document).ready(function () {

        refreshMenu();
    });

    function refreshMenu() {
        var group = $("meta[name='menu-item-group']").attr("content");
        var menu = $("meta[name='menu-item-module']").attr("content");
        $("#sidebar-nav li.menu-item-module").each(function () {
//            $(this).removeClass("active");
            var data = $(this).attr("data-menu-module");
            if (menu == data){
                $(this).addClass("active");
                var groupLi = $(this).parent();
                if (! groupLi.hasClass("in")){
                    groupLi.addClass("in");
                }
            }
        });

//        $("#sidebar-nav li[data-menu='" + currentMenu + "']").addClass("active");
    }

</script>
