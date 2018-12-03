<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<style type="text/css">
    #footer address .footer-sprite{
        padding-left:0;
    }

    small{
        font-family: "Microsoft Yahei", "微软雅黑", "宋体", "新宋体", "黑体", STHeiti;
    }

    .weui-tabbar p{
        margin-bottom:0;
    }
</style>

<%--<!-- Top Bar -->
<nav class="navbar navbar-inverse navbar-fixed-bottom">
    <div class="container">
        <ul class="list-inline">
            <li class="col-xs-4 text-center">
                首页
            </li>
            <li class="col-xs-4 text-center">
                图书
            </li>
            <li class="col-xs-4 text-center">
                我的
            </li>
        </ul>
    </div>
</nav>--%>

<div class="weui-tabbar">
    <a href="${ctx}/wx/index" class="weui-tabbar__item <c:if test="${tabName == 'home'}">weui-bar__item_on</c:if>">
        <i class="fa fa-home weui-tabbar__icon" ></i>
        <p class="weui-tabbar__label">首页</p>
    </a>
    <a href="${ctx}/wx/mall" class="weui-tabbar__item <c:if test="${tabName == 'mall'}">weui-bar__item_on</c:if>">
        <i class="fa fa-book weui-tabbar__icon" ></i>
        <p class="weui-tabbar__label">书城</p>
    </a>
    <a href="${ctx}/wx/news" class="weui-tabbar__item <c:if test="${tabName == 'news'}">weui-bar__item_on</c:if>">
        <i class="fa fa-list weui-tabbar__icon" ></i>
        <p class="weui-tabbar__label">资讯</p>
    </a>
    <a href="${ctx}/wx/usercenter/index" class="weui-tabbar__item <c:if test="${tabName == 'my'}">weui-bar__item_on</c:if>">
        <i class="fa fa-user weui-tabbar__icon" ></i>
        <p class="weui-tabbar__label">我的</p>
    </a>
</div>

<%--<footer id="footer" class="navbar navbar-fixed-bottom">--%>
    <%--<div class="container">--%>
        <%--<div class="weui-tab">--%>
            <%--<div class="weui-tab__panel">--%>
                <%--<div>Page 1</div>--%>
                <%--<div style="display:none">首页</div>--%>
                <%--<div style="display:none">书城</div>--%>
            <%--</div>--%>
            <%--<div class="weui-tabbar">--%>

            <%--</div>--%>
        <%--</div>--%>
        <%--<ul class="pull-right nomargin list-inline list-unstyled mobile-block">--%>
            <%--<li><a href="${ctx}/wx/index">首页</a></li>--%>
            <%--<li>&bull;</li>--%>
            <%--<li><a href="${ctx}/wx/mall">书城</a></li>--%>
            <%--<li>&bull;</li>--%>
            <%--<li><a href="${ctx}/wx/list">分类</a></li>--%>
            <%--<li>&bull;</li>--%>
            <%--<li><a href="${ctx}/wx/usercenter/index">我的</a></li>--%>
        <%--</ul>--%>
    <%--</div>--%>
<%--</footer>--%>


    
    
    

