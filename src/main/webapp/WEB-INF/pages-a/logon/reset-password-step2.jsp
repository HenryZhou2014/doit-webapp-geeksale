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
                            <div class="alert alert-mini alert-info margin-top-20">
                                <strong>系统已经发送邮件到 ${email}，</strong>请检查你的电子邮件收件箱，查收邮件并且按照邮件的指示重新设置你的账号密码！
                            </div>
                        </div>
                    </div>

                    <!-- /register form -->
            </div>
            </div>
        </div>
    </div>
</section>

