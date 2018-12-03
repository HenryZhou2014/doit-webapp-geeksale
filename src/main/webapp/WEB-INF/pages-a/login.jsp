<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp"%>
<%--会员登录页--%>
<head>
    <title>微推</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="menu" content="GoodsOrderMenu"/>

    <style type="text/css">
        body{
            background: #f6f6f6;
        }

        #login hr{
            margin-top:-12px;
            height:2px;
        }
        #login .login-header{
            text-align: center;
            position: relative;
            padding: 30px 0 10px 0;
        }
        #login .login-header span {
            border: 0;
            margin: 0;
            vertical-align: baseline;
            font: inherit;
            color: #999;
            font-size: 16px;
            font-weight: bold;
            display: inline-block;
            background: #fff;
            line-height: 30px;
            padding: 0 10px;
        }
        #login .login-header i {
            border: 1px solid #e0e0e0;
            display: block;
            margin-top: -13px;
            background: transparent;
            padding: 0;
            vertical-align: baseline;
            font-size: 100%;
            font: inherit;
            font-style: normal;
        }

        .input-group-addon {
            border-right: #ddd 2px solid;
        }

        .social-icon {
            /*background-color: #d0d0d0;*/
        }
        .social-icon:hover {
            /*background-color: #d9d9d9;*/
        }

        .form-horizontal .has-feedback .form-control-feedback{
            visibility: hidden;
            display: none;
        }

        @media only screen and (max-width: 768px) {
            #footer .row > div {
                margin-bottom: 0px;
            }
        }
    </style>
</head>

<!-- -->
<section id="login" class="padding-top-20 padding-bottom-20">
    <div class="container">
            <div class="row">
                <div class="col-lg-12">
                <!-- LOGIN -->
                <div class="col-xs-12 col-lg-6 col-lg-offset-3 margin-bottom-30 padding-bottom-20 bg-white" >
                    <!-- register form -->
                    <form id="loginFormx1" class="form-horizontal" action="${ctx}/loginProcess" method="post" style="border-width: 0;">

                        <input type="hidden" name="loginType" value="normal"/>

                        <div class="form-group">
                            <div class="col-lg-12">
                                <div class="text-center size-40 margin-top-20">
                                    微推 V2.0
                                </div>
                                <div class="text-center size-16 margin-top-20">
                                    一款裂变式精准整合营销系统
                                </div>
                                <div class="login-header margin-bottom-20">
                                    <span>用户登录</span>
                                    <i></i>
                                </div>
                            </div>
                        </div>

                        <c:if test="${param.login_error != null}">
                            <div class="form-group">
                                <div class="col-lg-12">
                                    <div style="padding: 5px; color: #B22222;">
                                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                        账号或密码错误！
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <div class="form-group">
                            <div class="col-lg-12">
                                <div class="input-group">
                                        <input type="text" id="j_username" name="j_username" placeholder="账号" autocomplete="off" class="form-control" value="13764590153">
                                        <div class="input-group-addon"><i class="fa fa-user fa-fw"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-12">
                                <div class="input-group">
                                    <input type="text" id="j_password" name="j_password" placeholder="密码" autocomplete="off" class="form-control" onfocus="this.type='password';" value="123456">
                                    <div class="input-group-addon"><i class="fa fa-lock fa-fw"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group margin-top-20">
                            <div class="col-lg-12">
                                <button type="submit" class="text-center btn btn-primary btn-block nomargin button-login"/>
                                登陆
                                </button>
                            </div>
                            <%--<div class="col-xs-12 margin-top-10 text-right">
                                忘记密码，<a href="${ctx}/forget-password" style="text-decoration: underline;">取回密码</a>
                            </div>
                            <div class="col-xs-12 margin-top-10 text-right">
                                没有账号，<a href="${ctx}/signup" style="text-decoration: underline;">注册账号</a>
                            </div>--%>
                        </div>

                    </form>
                    <!-- /register form -->
            </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">

    $(document).ready(function(){
        $(".test-account").bind("click", function(){
            $("#j_username").val($(this).attr("data-account"));
            $("#j_password").val($(this).attr("data-password"));
            $(".button-login").click();
        });

        $('#loginFormx1').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                j_username: {
                    message: '账号不能为空',
                    validators: {
                        notEmpty: {
                            message: '账号不能为空'
                        }
                    }
                }, j_password: {
                    message: '密码不能为空',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {

        });

    });

    function toLogin()
    {
        //以下为按钮点击事件的逻辑。注意这里要重新打开窗口
        //否则后面跳转到QQ登录，授权页面时会直接缩小当前浏览器的窗口，而不是打开新窗口
        var A=window.open("${ctx}/qq/login","TencentLogin",
                "width=450,height=320,menubar=0,scrollbars=1,resizable=1,status=1,titlebar=0,toolbar=0,location=1");
    }

</script>
