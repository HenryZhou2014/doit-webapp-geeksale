<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<style type="text/css">

    .user-menus li {
        width: 100px;
    }

    #header ul.nav-second-main {
        margin-top: 14px;
    }

    .quick-cart a.quick-cart-link {
        margin-top: 5px;
        margin-left: 10px;
        padding: 5px 10px;
        /*background: #fefefe;*/
        color: #ffffff;
    }

    .quick-cart a.quick-cart-link:hover, .quick-cart a.quick-cart-link:focus {
        background: none;
        color: #dddddd;
    }
</style>

<div id="topBar">
    <div class="container">
        <div class="col-lg-12">
            <ul class="top-links list-inline pull-left">
                <li>
                    <a>微推 v2.0</a>
                </li>
                <li>
                    <a>一款裂变式精准整合营销系统</a>
                </li>
            </ul>

            <!-- right -->
            <ul class="top-links list-inline pull-right">
                <security:authorize access="isAuthenticated()">
                    <c:choose>
                        <c:when test="${not empty currentAccount.accountQq}">
                            <li class="text-welcome">欢迎您！
                                <img src="${currentAccount.accountQq.figureurl}" style="max-width: 28px;max-height: 28px;"/>
                                <strong>
                                    <a href="${ctx}/usercenter/myProfile?table=info">${currentAccount.accountQq.nickname}</a>
                                </strong>
                            </li>
                        </c:when>
                        <c:when test="${not empty currentAccount.accountWeixin}">
                            <li class="text-welcome">欢迎您！
                                <img src="${currentAccount.accountWeixin.headimgurl}" style="max-width: 28px;max-height: 28px;"/>
                                <strong>
                                    <a href="${ctx}/usercenter/myProfile?table=info">${currentAccount.accountWeixin.nickname}</a>
                                </strong>
                            </li>
                        </c:when>
                        <c:when test="${not empty currentAccount.accountSlweiboInfo}">
                            <li class="text-welcome">欢迎您！
                                <img src="${currentAccount.accountSlweiboInfo.profileimageurl}" style="max-width: 28px;max-height: 28px;"/>
                                <strong>
                                    <a href="${ctx}/usercenter/myProfile?table=info">${currentAccount.accountSlweiboInfo.screenname}</a>
                                </strong>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <%--<li class="text-welcome">欢迎您！<strong><a href="${ctx}/usercenter/myProfile?table=info"><security:authentication property="username"/></a></strong></li>--%>
                            <li class="text-welcome">欢迎您！<strong><a href="${ctx}/usercenter/myProfile?table=info"><security:authentication property="principal.userName"/></a></strong></li>
                        </c:otherwise>
                    </c:choose>
                    <li>
                        <a href="${ctx}/usercenter/myNotifications"><i class="fa fa-envelope-o"></i> 通知</a>
                    </li>
                    <li>
                        <a tabindex="-1" href="${ctx}/logout"><i class="fa fa-sign-out"></i> 退出 </a>
                    </li>
                </security:authorize>
                <security:authorize access="isAnonymous()">
                    <li class="hidden-xs"><a href="${ctx}/login"><i class="fa fa-user" style="font-size: 13px;"></i> 登陆</a></li>
                    <%--<li class="hidden-xs"><a href="${ctx}/signup.html"><i class="fa fa-tv" style="font-size: 13px;"></i> 注册</a></li>--%>
                </security:authorize>
            </ul>
        </div>

    </div>

</div>

<script type="text/javascript">

</script>