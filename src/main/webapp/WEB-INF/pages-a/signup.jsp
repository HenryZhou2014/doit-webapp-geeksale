<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员注册页--%>
<head>
    <title>注册</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>

    <style type="text/css">
        #login hr {
            margin-top: -12px;
            height: 2px;
        }

        #login .login-header {
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

        .form-horizontal .has-feedback .form-control-feedback {
            display: none;
            visibility: hidden;
        }

        .input-group-addon {
            border-right: #ddd 2px solid;
        }

        .agree a {
            position: absolute;
            top: 2px;
            left: 130px;
        }

        .agree .help-block, .agree .form-control-feedback {
            display: none;
            visibility: hidden;
        }

        #myModal .modal-dialog {
            width: 700px;
        }

        #myModal p{
            margin-bottom: 3px;
        }

        .icon-qq{
            background: url(${ctx}/a/resource/styles/simplicity-cumtp/images/logo_qq.png) 50% 20% no-repeat;
        }

        .icon-weixin{
            background: url(${ctx}/a/resource/styles/simplicity-cumtp/images/logo_weixin.png) 50% 20% no-repeat;
        }
    </style>
</head>

<section id="login" class="padding-top-40 padding-bottom-70">
    <div class="container">

        <div class="row">
            <!-- LOGIN -->
            <div class="col-xs-10 col-xs-offset-1 col-lg-6 col-lg-offset-3 margin-bottom-30 padding-bottom-20">
                <!-- register form -->
                <div>

                    <div>
                        <div class="login-header margin-bottom-20">
                            <span>用户注册</span>
                            <i></i>
                        </div>
                    </div>

                    <form id="signupForm" class="form-horizontal"
                          action="${ctx}/signup.html"
                          method="post" style="border-width: 0;">
                        <div class="form-group">
                            <div class="col-lg-12">
                                <div class="input-group">
                                    <input type="text" id="email" name="email" placeholder="邮箱"
                                           autocomplete="off" class="form-control">
                                    <div class="input-group-addon">
                                        <i class="ico-append fa fa-envelope fa-fw"></i>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-12">
                                <div class="input-group">
                                    <input type="text" id="userName" name="userName" placeholder="姓名"
                                           autocomplete="off" class="form-control">
                                    <div class="input-group-addon">
                                        <i class="ico-append fa fa-user fa-fw"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-12">
                                <div class="input-group">
                                    <input type="text" id="passwd" name="passwd" placeholder="密码"
                                           onfocus="this.type='password';"
                                           autocomplete="off" class="form-control">
                                    <div class="input-group-addon">
                                        <i class="ico-append fa fa-lock fa-fw"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-12">
                                <div class="input-group">
                                    <input type="text" id="repassword" name="repassword"
                                           placeholder="确认密码" onfocus="this.type='password';"
                                           autocomplete="off" class="form-control">
                                    <div class="input-group-addon">
                                        <i class="ico-append fa fa-lock fa-fw"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-12">
                                <div class="input-group">
                                    <input type="text" id="validCode" name="validCode" placeholder="验证码"
                                           autocomplete="off" class="form-control">
                                                <span class="input-group-btn" style="padding-left: 5px;">
                                                    <div style="display:inline;width:70px;height: 36px;">
                                                        <img id="validCodeImg" src="/validCode?time=1465898787699"
                                                             style="max-height: 36px;">
                                                    </div>
                                                </span>
                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-12 agree" style="height: 30px;">
                                <div class="input-group nomargin padding-top-0">
                                    <label class="" for="agree">
                                        <input class="checked-agree" type="checkbox" id="agree" name="agree"
                                               autocomplete="off" style="margin:0 5px 0 0;">
                                        <i></i>我已阅读并同意
                                    </label>
                                </div>
                                <a href="javascript:void(0);" class="openProtocol">《注册协议》</a>
                            </div>
                        </div>


                        <div class="form-group margin-top-10">
                            <div class="col-xs-12">
                                <button type="submit"
                                        class="text-center btn btn-primary btn-block nomargin">
                                    注册
                                </button>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group margin-top-20">
                            <div class="col-xs-12">
                                我已经有账号，<a href="${ctx}/login">点击此处登陆</a>
                            </div>
                        </div>

                        <div class="form-group margin-top-10">
                            <div class="col-lg-12 text-left">
                                &ndash; <b>社交账号直接登陆</b> &ndash;
                            </div>
                        </div>

                        <div class="form-group margin-top-10">
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
                <!-- /register form -->
            </div>
        </div>
    </div>

</section>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    注册协议
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div style="margin: 20px auto;max-height: 500px;overflow-y: scroll;">
                            <jsp:include page="/app/cms/module/namedArticle/signup-protocol"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <%--<a href="javascript:void(0);" class="btn btn-primary agreeProtocol">--%>
                    <%--同意--%>
                <%--</a>--%>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/javascript">
    //标记验证码是否验证成功
    var validCodeCheck = false;
    $(document).ready(function () {
        //初始化模态框
//        $("#myModal").modal("hide");
        $(".openProtocol").click(function () {
            openProtocol();
        });
        $(".agreeProtocol").click(function () {
            agreeProtocol();
        });

        $(".footer").addClass("navbar-fixed-bottom");
        //refreshValidCode();
        $("#validCodeImg").click(function () {
            $(this).attr("src", "/validCode?time=" + new Date().getTime());
        });

        $('#signupForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                email: {
                    validators: {
                        notEmpty: {
                            message: '电子邮件地址不能为空'
                        },
                        emailAddress: {
                            message: '电子邮件地址格式不对'
                        },
                        remote: {
                            type: 'GET',
                            url: '${ctx}/isExistEmail',
                            data: {
                                email: function () {
                                    return $("#email").val();
                                }
                            },
                            dataType: "json",
                            message: '该邮箱已被注册！',
                            delay: 1000
                        }
                    }
                },
                userName: {
                    validators: {
                        regexp: {
                            regexp: "^[^\\s]+$",
                            message: '用户名不能包含空格'
                        },
                        notEmpty: {
                            message: '用户名不能为空'
                        }
                    }
                },
                passwd: {
                    validators: {
                        regexp: {
                            regexp: "^[^\\s]+$",
                            message: '用户名不能包含空格'
                        },
                        notEmpty: {
                            message: '密码不能为空！'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '密码必须在 6-30 个字符！'
                        },
                        identical: {
                            field: 'repassword',
                            message: '两次密码输入不一致，请重新输入！'
                        }
                    }
                },
                repassword: {
                    validators: {
                        regexp: {
                            regexp: "^[^\\s]+$",
                            message: '用户名不能包含空格'
                        },
                        notEmpty: {
                            message: '确认密码不能为空'
                        },
                        identical: {
                            field: 'passwd',
                            message: '两次密码输入不一致，请重新输入！'
                        }
                    }
                },
                validCode: {
                    validators: {
                        notEmpty: {
                            message: '请输入验证码'
                        },
                        remote: {
                            type: 'GET',
                            url: '${ctx}/ajax/checkValidCode',
                            data: {
                                code: function () {
                                    return $("#validCode").val();
                                }
                            },
                            dataType: "json",
                            message: '验证码错误！',
                            delay: 1000
                        }
                    }
                },
                agree: {
                    validators: {
                        notEmpty: {
                            message: ''
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {


        });
    });

    //显示协议模态框
    function openProtocol() {
        $('#myModal').modal('show');
    }
    //同意协议
    function agreeProtocol() {
        $("#agree").prop("checked",true);
        $("#myModal").modal("hide");
    }

</script>
