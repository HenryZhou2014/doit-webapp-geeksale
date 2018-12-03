<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<%@ include file="/weixin/common/taglibs.jsp" %>
<html>
<head>
    <%@ include file="/weixin/common/meta.jsp" %>
    <title><decorator:title/> | <fmt:message key='webapp.name'/></title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="shortcut icon" href="${ctx}/images/favicon.ico">
    <meta name="menu" content="home"/>
    <link rel="stylesheet" href="${resource}/common/scripts/bootstrap-3.3.2-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${resource}/common/styles/font-awesome-4.4.0/css/font-awesome.min.css"/>
    <link href="${ctx}/resource/common/scripts/bootstrapvalidator-0.53/dist/css/bootstrapValidator.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css"/>
<%--<link rel="stylesheet" href="${ctx$resource}/styles/simplicity-cumtp/nav-bar.css"/>--%>
    <%--<link rel="stylesheet" href="${ctx$resource}/styles/simplicity-cumtp/tools.css"/>--%>

    <%--<link rel="stylesheet" href="${ctx$resource}/styles/common/animate.css">--%>
    <%--<link rel="stylesheet" href="${ctx$resource}/styles/common/jquery.bxslider.css">--%>
    <%--<link rel="stylesheet" href="${ctx$resource}/styles/common/isotope.css" media="screen" type="text/css"/>--%>
    <%--<link rel="stylesheet" href="${resource}/common/scripts/common/fancybox/jquery.fancybox.css" type="text/css"--%>
    <%--media="screen"/>--%>


    <!-- mobile settings -->
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0"/>
    <!-- CORE CSS -->
    <link href="${ctx}/resource/common/smarty/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    <!-- REVOLUTION SLIDER -->
    <link href="${ctx}/resource/common/smarty/assets/plugins/slider.revolution/css/extralayers.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/resource/common/smarty/assets/plugins/slider.revolution/css/settings.css" rel="stylesheet" type="text/css"/>

    <!-- THEME CSS -->
    <link href="${ctx}/weixin/resource/styles/simplicity-cumtp/essentials.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/weixin/resource/styles/simplicity-cumtp/layout.css" rel="stylesheet" type="text/css"/>
    <!-- PAGE LEVEL SCRIPTS -->
    <link href="${ctx}/weixin/resource/styles/simplicity-cumtp/header-1.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/resource/common/smarty/assets/css/color_scheme/darkblue.css" rel="stylesheet" type="text/css" id="color_scheme" />
    <%--<link href="${ctx}/a/resource/styles/header.css" rel="stylesheet" type="text/css"/>--%>
    <link href="${ctx}/weixin/resource/styles/simplicity-cumtp/cumtp.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/resource/common/styles/flexstyle.css" rel="stylesheet" type="text/css" />

    <script src="${resource}/common/scripts/jquery-2.1.4.min.js"></script>
    <%--<script src="${resource}/common/scripts/jquery-ui-1.9.2.custom/js/jquery-ui-1.9.2.custom.min.js"></script>--%>
    <%--<script src="${resource}/common/scripts/jquery.json-2.4.js"></script>--%>
    <script src="${resource}/common/scripts/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    <script src="${resource}/common/scripts/plugins/stickUp/stickUp.js"></script>

    <%--<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>--%>
    <%--<script src="http://connect.qq.com/widget/loader/loader.js" widget="shareqq" charset="utf-8"></script>--%>
    <%--<script src="http://qzonestyle.gtimg.cn/qzone/app/qzlike/qzopensl.js#jsdate=20111201" charset="utf-8"></script>--%>


    <decorator:head/>

    <script type="text/javascript">
        var isAuthenticatedToken = false;
        <security:authorize  access="isAuthenticated()">
        isAuthenticatedToken = true;
        </security:authorize>

        function isAuthenticated(){
            return isAuthenticatedToken;
        }
    </script>

    <style type="text/css">
        #header{
            background: #2c3e50;
        }

        #header li.quick-cart .quick-cart-box h4{
            color: #ffffff;
        }

        #topMain.nav-pills>li.active>a{
            color: #ffffff;
            font-weight:bold;
        }

        #topMain.nav-pills>li>a{
            color: #ffffff;
            min-width: 96px;
            font-family: "Microsoft Yahei", "微软雅黑", "宋体", "新宋体", "黑体", STHeiti;
        }

        #topMain.nav-pills>li:hover>a, #topMain.nav-pills>li:focus>a{
            color: #ffffff;
            background: #3c556e;
        }

        #topNav div.submenu-dark ul.dropdown-menu{
            background: #3c556e;
        }

        #header li.search i.fa{
            color: #ffffff;
        }

        #header ul.nav-second-main li i{
            color: #ffffff;
        }

        #header li.quick-cart .quick-cart-box h4{
            color: #444;
        }

        .front-color{
            background: white;
        }

        .backend-color{
            background: #F6F6F6;
        }

        .container{
            /*background: #ffffff;*/
        }

        .scroll-y{
            overflow-y: scroll
        }
    </style>
</head>

<body >

<c:choose>
    <c:when test="${not empty hideTab}">
        <div class="flexbox flex_column flex1 backend-color" style="height:100%">
            <decorator:body/>
        </div>
    </c:when>
    <c:otherwise>
        <div class="weui-tab">
            <div class="weui-tab__panel backend-color">
                <decorator:body/>
            </div>
            <jsp:include page="/weixin/common/footer.jsp"/>
        </div>
    </c:otherwise>
</c:choose>


<script type="text/javascript" src="${ctx}/resource/common/scripts/bootstrapvalidator-0.53/dist/js/bootstrapValidator.min.js"></script>

<!-- JAVASCRIPT FILES -->
<script type="text/javascript">var plugin_path = '${ctx}/resource/common/smarty/assets/plugins/';</script>
<script type="text/javascript" src="${ctx}/resource/common/smarty/assets/js/scripts.js"></script>


<script type="text/javascript" src="${ctx}/resource/common/smarty/assets/plugins/slider.revolution/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="${ctx}/resource/common/smarty/assets/plugins/slider.revolution/js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="${ctx}/resource/common/smarty/assets/js/view/demo.revolution_slider.js"></script>
<script type="text/javascript" src="${ctx}/a/resource/scripts/logon.js"></script>
<script type="text/javascript" src="${ctx}/resource/common/scripts/artTemplate/template.js"></script>
<script type="text/javascript" src="https://res.wx.qq.com/open/libs/weuijs/1.1.1/weui.min.js"></script>

</body>
</html>


