<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<%@ include file="/a/common/taglibs.jsp" %>
<html>
<head>
    <%@ include file="/a/common/meta.jsp" %>
    <title><decorator:title/> | <fmt:message key='webapp.title'/></title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <link rel="shortcut icon" href="${ctx}/images/favicon.ico">
    <meta name="menu" content="home"/>
    <!-- mobile settings -->
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0"/>

    <%--<link rel="stylesheet" href="${resource}/common/scripts/bootstrap-3.3.2-dist/css/bootstrap.min.css"/>--%>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.min.css">
    <%--<link rel="stylesheet" href="${resource}/common/styles/font-awesome-4.4.0/css/font-awesome.min.css"/>--%>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/fontawesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/resource/common/scripts/bootstrap3-dialog-master/dist/css/bootstrap-dialog.min.css"/>

    <link href="${ctx}/resource/common/scripts/bootstrapvalidator-0.53/dist/css/bootstrapValidator.min.css" rel="stylesheet">
<%--<link rel="stylesheet" href="${ctx$resource}/styles/simplicity-cumtp/nav-bar.css"/>--%>
    <%--<link rel="stylesheet" href="${ctx$resource}/styles/simplicity-cumtp/tools.css"/>--%>

    <%--<link rel="stylesheet" href="${ctx$resource}/styles/common/animate.css">--%>
    <%--<link rel="stylesheet" href="${ctx$resource}/styles/common/jquery.bxslider.css">--%>
    <%--<link rel="stylesheet" href="${ctx$resource}/styles/common/isotope.css" media="screen" type="text/css"/>--%>
    <%--<link rel="stylesheet" href="${resource}/common/scripts/common/fancybox/jquery.fancybox.css" type="text/css"--%>
    <%--media="screen"/>--%>



    <!-- CORE CSS -->
    <%--<link href="${ctx}/resource/common/smarty/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>--%>

    <!-- REVOLUTION SLIDER -->
    <%--<link href="${ctx}/resource/common/smarty/assets/plugins/slider.revolution/css/extralayers.css" rel="stylesheet" type="text/css"/>--%>
    <%--<link href="${ctx}/resource/common/smarty/assets/plugins/slider.revolution/css/settings.css" rel="stylesheet" type="text/css"/>--%>

    <!-- THEME CSS -->
    <link href="${ctx}/a/resource/styles/simplicity-cumtp/essentials.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/a/resource/styles/simplicity-cumtp/layout.css" rel="stylesheet" type="text/css"/>
    <!-- PAGE LEVEL SCRIPTS -->
    <link href="${ctx}/a/resource/styles/simplicity-cumtp/header-1.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/resource/common/smarty/assets/css/color_scheme/darkblue.css" rel="stylesheet" type="text/css" id="color_scheme" />
    <%--<link href="${ctx}/a/resource/styles/header.css" rel="stylesheet" type="text/css"/>--%>
    <link href="${ctx}/a/resource/styles/simplicity-cumtp/cumtp.css" rel="stylesheet" type="text/css" />

    <%--<script src="${resource}/common/scripts/jquery-2.1.4.min.js"></script>--%>
    <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <%--<script src="${resource}/common/scripts/jquery-ui-1.9.2.custom/js/jquery-ui-1.9.2.custom.min.js"></script>--%>
    <script src="${resource}/common/scripts/jquery.json-2.4.js"></script>
    <%--<script src="${resource}/common/scripts/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>--%>
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <%--<script src="${resource}/common/scripts/plugins/stickUp/stickUp.js"></script>--%>

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

        .container{
            /*background: #ffffff;*/
        }
    </style>
</head>

<body class="smoothscroll enable-animation">
<div id="wrapper">
    <div>
        <jsp:include page="/a/common/header.jsp"/>
    </div>

    <div>
        <decorator:body/>
    </div>

    <a href="#" id="toTop"></a>

    <div>
        <jsp:include page="/a/common/footer.jsp"/>
    </div>
</div>

<div class="modal fade" id="logonModal" tabindex="-1" role="dialog"
     aria-labelledby="logonModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    登陆
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">

                    <div class="col-lg-10 col-lg-offset-1 margin-top-20">
                        <form id="loginForm" class="form-horizontal" <%--action="${ctx}/j_security_check" method="post" --%> style="border-width: 0;">

                            <input type="hidden" name="loginType" value="silent"/>

                            <div class="form-group login-hint hidden">
                                <div class="col-lg-12">
                                    <div style="padding: 5px; color: #B22222;">
                                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                        账号或密码错误！
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-12">
                                    <div class="input-group">
                                        <input type="text" id="j_username" name="j_username" placeholder="电子邮件地址" autocomplete="off" class="form-control">
                                        <div class="input-group-addon" style="border-right: #ddd 2px solid;"><i class="fa fa-user fa-fw"></i></div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-12">
                                    <div class="input-group">
                                        <input type="text" id="j_password" name="j_password" placeholder="账号密码" autocomplete="off" class="form-control" onfocus="this.type='password';">
                                        <div class="input-group-addon" style="border-right: #ddd 2px solid;"><i class="fa fa-lock fa-fw"></i></div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group margin-top-20">
                                <div class="col-lg-12">
                                    <button type="button" class="text-center btn btn-primary btn-block nomargin button-login"/>
                                    登陆
                                    </button>
                                </div>
                                <div class="col-xs-12 margin-top-10 text-right">
                                    忘记密码，<a href="#" data-toggle="modal" data-target="#termsModal" style="text-decoration: underline;">取回密码</a>
                                </div>
                                <div class="col-xs-12 margin-top-10 text-right">
                                    没有账号，<a href="${ctx}/signup" style="text-decoration: underline;">注册账号</a>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-12 text-left">
                                    &ndash; <b>社交账号登陆</b> &ndash;
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12 socials text-left"><!-- more buttons: ui-buttons.html -->
                                    <a href="${ctx}/qq/login" class="social-icon social-facebook" data-toggle="tooltip" data-placement="top" title="QQ">
                                        <i class="icon-qq"></i>
                                        <i class="icon-qq"></i>
                                    </a>
                                    <a href="${ctx}/wechat/login" class="social-icon social-twitter" data-toggle="tooltip" data-placement="top" title="微信">
                                        <i class="icon-weixin"></i>
                                        <i class="icon-weixin"></i>
                                    </a>
                                    <%--<a href="https://api.weibo.com/oauth2/authorize?client_id=731429745&redirect_uri=http%3A%2F%2Fwww.cumtp.com%2Fsina%2Fcallback&state=27a90db4002a656b636f711a843ed19e&display=default&response_type=code" class="social-icon social-youtube" data-toggle="tooltip" data-placement="top" title="微博">
                                        <i class="fa fa-weibo"></i>
                                        <i class="fa fa-weibo"></i>
                                    </a>--%>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%--<script src="${ctx$resource}/scripts/lhs-arts/common.js"></script>--%>
<script type="text/javascript" src="${ctx}/resource/common/scripts/bootstrapvalidator-0.53/dist/js/bootstrapValidator.min.js"></script>

<!-- JAVASCRIPT FILES -->
<script type="text/javascript">var plugin_path = '${ctx}/resource/common/smarty/assets/plugins/';</script>
<script type="text/javascript" src="${ctx}/resource/common/smarty/assets/js/scripts.js"></script>

<%--<script type="text/javascript" src="${ctx}/resource/common/smarty/assets/plugins/slider.revolution/js/jquery.themepunch.tools.min.js"></script>--%>
<%--<script type="text/javascript" src="${ctx}/resource/common/smarty/assets/plugins/slider.revolution/js/jquery.themepunch.revolution.min.js"></script>--%>
<%--<script type="text/javascript" src="${ctx}/resource/common/smarty/assets/js/view/demo.revolution_slider.js"></script>--%>
<script type="text/javascript" src="${ctx}/a/resource/scripts/logon.js"></script>
<script src="${ctx}/resource/common/scripts/bootstrap3-dialog-master/dist/js/bootstrap-dialog.min.js"></script>

<!-- Toastr -->
<script src="${ctx}/resource/common/scripts/plugins/toastr/toastr.min.js"></script>
<%--<script type="text/javascript" src="${ctx}/a/resource/scripts/cmxgc.js"></script>--%>
<script type="text/javascript" src="${ctx}/resource/common/scripts/artTemplate/template.js"></script>

<script type="text/javascript">

    $(document).ready(function(){
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "progressBar": true,
            "preventDuplicates": false,
            "positionClass": "toast-top-center",
            "showDuration": "400",
            "hideDuration": "1000",
            "timeOut": "7000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
    });

    function toastSuccess(title, message, direction){
        if(direction){
            toastr.options.positionClass = direction;
        }
        var $toast = toastr["success"](message, title);
    }

    function toastError(title, message, direction){
        if(direction){
            toastr.options.positionClass = direction;
        }
        var $toast = toastr["error"](message, title);
    }

    function toastWarning(title, message, direction){
        if(direction){
            toastr.options.positionClass = direction;
        }
        var $toast = toastr["warning"](message, title);
    }

    function toastInfo(title, message, direction){
        if(direction){
            toastr.options.positionClass = direction;
        }
        var $toast = toastr["info"](message, title);
    }
</script>
</body>
</html>

<jsp:include page="/a/common/messages.jsp"/>

