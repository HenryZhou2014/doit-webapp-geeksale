<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp"%>
<%--会员登录页--%>
<head>
    <title>取回密码</title>
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
            padding: 50px 0 10px 0;
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
    </style>
</head>

<!-- -->
<section id="login" class="padding-top-20 padding-bottom-20">
    <div class="container">
            <div class="row">
                <div class="col-lg-12 bg-white">
                <!-- LOGIN -->
                <div class="col-xs-10 col-xs-offset-1 col-lg-6 col-lg-offset-3 margin-bottom-30 padding-bottom-20" >
                    <!-- register form -->
                    <form id="loginFormx1" class="form-horizontal" action="${ctx}/forget-password/step2" method="post" style="border-width: 0;">

                        <input type="hidden" name="loginType" value="normal"/>

                        <div class="form-group">
                            <div class="col-lg-12">
                                <div class="login-header margin-bottom-20">
                                    <span>取回密码</span>
                                    <i></i>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-12">
                                <div class="input-group">
                                    <input type="text" id="j_username" name="j_username" placeholder="电子邮件地址" autocomplete="off" class="form-control">
                                    <div class="input-group-addon"><i class="fa fa-user fa-fw"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-12">
                                <div class="alert alert-mini alert-info margin-top-20">
                                    请输入你的电子邮件，查收邮件并且按照邮件的指示重新设置你的账号密码！
                                </div>
                            </div>
                        </div>

                        <div class="form-group margin-top-20">
                            <div class="col-lg-12">
                                <button type="submit" class="text-center btn btn-primary btn-block nomargin button-login"/>
                                取回密码
                                </button>
                            </div>
                            <div class="col-xs-12 margin-top-10 text-right">
                                已有账号，<a href="#" data-toggle="modal" data-target="#termsModal" style="text-decoration: underline;">账号登陆</a>
                            </div>
                            <div class="col-xs-12 margin-top-10 text-right">
                                没有账号，<a href="${ctx}/signup" style="text-decoration: underline;">注册账号</a>
                            </div>
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

        $('#loginFormx1').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                j_username: {
                    message: '电子邮件地址不能为空',
                    validators: {
                        notEmpty: {
                            message: '电子邮件地址不能为空'
                        },
                        emailAddress: {
                            message: '电子邮件地址格式不对'
                        },
                        remote: {
                            data:{
                                "email":function(){return $("#j_username").val();}
                            },
                            type: 'GET',
                            url: '${ctx}/forget-password/accountCheck.json',
                            dataType: 'json',
                            message: '该账号信息不存在！',
                            delay: 1000
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {

        });

    });
</script>
