<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>账号信息</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="myProfile"/>

    <style type="text/css">
    </style>
</head>

<!-- -->

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">
            <input type="hidden" id="tableActive" value="${table}"/>
            <input type="hidden" id="id" value="${account.id}"/>
            <ul class="nav nav-tabs nav-top-border">
                <li><a href="#info" data-toggle="tab">个人信息</a></li>
                <%--<li><a href="#avatar" data-toggle="tab">头像设置</a></li>--%>
                <li><a href="#password" data-toggle="tab">修改密码</a></li>
            </ul>

            <div class="tab-content margin-top-20">
                <!-- PERSONAL INFO TAB -->
                <div class="tab-pane fade in active" id="info">
                    <div class="col-lg-12">
                        <form:form commandName="account" role="form" action="${ctx}/usercenter/updateAccountInfo.html" cssClass="form-horizonal"
                                   method="post" id="accountInfo">
                            <div class="form-group">
                                <label class="control-label">账号</label>
                                <form:input path="accountName" cssClass="form-control" readonly="true" disabled="true"/>
                            </div>
                            <div class="form-group">
                                <label class="control-label">姓名</label>
                                <form:input path="userName" cssClass="form-control"/>
                            </div>

                            <div class="form-group">
                                <label class="control-label">性别</label>
                                <div class="col-sm-12 nopadding margin-bottom-10">
                                    <div class="radio-inline">
                                        <form:radiobutton path="gender" id="M" value="M"/>
                                        <label for="M">男</label>
                                    </div>
                                    <div class="radio-inline">
                                        <form:radiobutton path="gender" id="F" value="F"/>
                                        <label for="F">女</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">电子邮件</label>
                                <form:input path="email" cssClass="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="control-label">手机号码</label>
                                <form:input path="mobileNumber" cssClass="form-control"/>
                            </div>

                            <hr/>
                            <%--<div class="form-group">
                                <label class="control-label">公司名称</label>
                                <form:input path="companyInfo.companyName" cssClass="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="control-label">品牌</label>
                                <form:input path="companyInfo.slogan" cssClass="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="control-label">联系人</label>
                                <form:input path="companyInfo.linkPerson" cssClass="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="control-label">联系电话</label>
                                <form:input path="companyInfo.phoneNumber" cssClass="form-control"/>
                            </div>--%>

                            <div class="form-group">
                                <label class="control-label">简介</label>
                                <form:input path="accountExtInfo.introduction" cssClass="form-control"/>
                            </div>

                            <div class="margiv-top10 text-center">
                                <button type="submit" class="btn btn-success"/>
                                保存</button>
                                <a href="#" class="btn btn-default">取消 </a>
                            </div>
                        </form:form>
                    </div>
                </div>
                <!-- /PERSONAL INFO TAB -->

                <!-- AVATAR TAB -->
                <%--<div class="tab-pane fade" id="avatar">
                    <form action="${ctx}/usercenter/uploadHeadPhoto.html" class="clearfix" method="post"
                          enctype="multipart/form-data" id="uploadHeadPhotForm">

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3 col-sm-4">
                                    <div class="thumbnail">
                                        &lt;%&ndash;<img class="img-responsive" src="assets/images/demo/people/460x700/8-min.jpg" alt="" />&ndash;%&gt;
                                        <img class="img-responsive" src="${ctx}/${accountHeadImage.imagePath}" alt=""/>
                                    </div>
                                </div>

                                <div class="col-md-9 col-sm-8">
                                    <div class="sky-form nomargin">
                                        <label class="label">Select File</label>
                                        <label for="file" class="input input-file">
                                            <div class="button">
                                                <input type="file" id="file" name="file"/>选择..
                                            </div>
                                            <input type="text" readonly="true">
                                        </label>
                                    </div>

                                    <a href="#" class="btn btn-danger btn-xs noradius"><i class="fa fa-times"></i>
                                        删除头像</a>

                                </div>
                            </div>
                        </div>

                        <div class="margiv-top10">
                            <a href="#" class="btn btn-primary" id="uploadHeadPhoto">保存 </a>
                            <a href="#" class="btn btn-default">取消 </a>
                        </div>
                    </form>
                </div>--%>

                <!-- PASSWORD TAB -->
                <div class="tab-pane fade" id="password">
                    <form action="${ctx}/usercenter/updatePassword.html" class="clearfix" method="post"
                          id="updatePasswordForm">

                        <div class="form-group">
                            <label class="control-label">当前密码</label>
                            <input type="password" class="form-control" name="currentPassword" value="">
                        </div>
                        <div class="form-group">
                            <label class="control-label">新密码</label>
                            <input type="password" class="form-control" name="newPassword" value="">
                        </div>
                        <div class="form-group">
                            <label class="control-label">重复新密码</label>
                            <input type="password" class="form-control" name="renewPassword" value="">
                        </div>

                        <div class="margiv-top10 text-center">

                            <button type="submit" class="btn btn-danger"/>
                            修改密码
                            </button>
                            <a href="#" class="btn btn-default">取消 </a>
                        </div>
                    </form>
                </div>
                <!-- /PASSWORD TAB -->
            </div>
        </div>
        <!-- LEFT -->
        <div class="col-lg-2 col-md-2 col-sm-3 col-lg-pull-10 col-md-pull-10 col-sm-pull-7">
            <jsp:include page="/app/usercenter/userCenterMenu"/>
        </div>

    </div>
</section>

<script type="text/javascript">

    $(document).ready(function () {

        //初始化选项卡
        updateTableActive();

        //用户基本信息表单校验
        accountInfoCheckout();

        //密码表单的校验
        updatePasswordFormCheckout();

        //头像选取事件
        $("#file").change(function () {
            var filePath = $(this).val();
            $(this).parent().siblings("input").val(filePath);
        });

        $("#uploadHeadPhoto").bind("click", function () {
            uploadHeadPhoto();
        });
        $("#updatePasswordBtn").bind("click", function () {
            uploadPassword();
        });


    });

    function showInfo() {

        var msg = $("#msg").val();
        _toastr(msg, "top-center", "success", false);

    }

    function accountInfoCheckout() {
        $('#accountInfo').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                userName: {
                    validators: {
                        regexp: {
                            regexp: "^[^\\s]+$",
                            message: '姓名不能包含空格'
                        },
                        notEmpty: {
                            message: '姓名不能为空'
                        }
                    }
                },
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
                                },
                                id: function () {
                                    return $("#id").val();
                                }
                            },
                            dataType: "json",
                            message: '该邮箱已被注册！',
                            delay: 1000
                        }
                    }
                },
                mobileNumber: {
                    validators: {
//                        regexp: {
//                            regexp: "^1[3|4|5|7|8]\d{9}$",
//                            message: '手机号格式不正确'
//                        },
                        notEmpty: {
                            message: '手机号不能为空'
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {

        });
    }

    function updatePasswordFormCheckout() {
        $('#updatePasswordForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                currentPassword: {
                    message: '旧密码不能为空',
                    validators: {
                        regexp: {
                            regexp: "^[^\\s]+$",
                            message: '用户名不能包含空格'
                        },
                        notEmpty: {
                            message: '旧密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '密码必须在 6-30 个字符！'
                        },
                    }
                },
                newPassword: {
                    message: '新密码不能为空',
                    validators: {
                        regexp: {
                            regexp: "^[^\\s]+$",
                            message: '用户名不能包含空格'
                        },
                        notEmpty: {
                            message: '新密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '密码必须在 6-30 个字符！'
                        },
                        identical: {
                            field: 'renewPassword',
                            message: '两次密码输入不一致，请重新输入！'
                        }
                    }
                },
                renewPassword: {
                    message: '确认密码不能为空',
                    validators: {
                        regexp: {
                            regexp: "^[^\\s]+$",
                            message: '用户名不能包含空格'
                        },
                        notEmpty: {
                            message: '确认密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '密码必须在 6-30 个字符！'
                        },
                        identical: {
                            field: 'newPassword',
                            message: '两次密码输入不一致，请重新输入！'
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {

        });
    }

    function updateTableActive() {
        var activeTableName = $("#tableActive").val();

        $("ul li").each(function () {
            $(this).removeClass("active");
        });
        $(".tab-content div").each(function () {
            $(this).removeClass("active");
            $(this).removeClass("in");
        });
        if ("avatar" == activeTableName) {
            $("a[href='#avatar']").parent().addClass("active");
            $("#avatar").addClass("active");
            $("#avatar").addClass("in");
        } else if ("password" == activeTableName) {
            $("a[href='#password']").parent().addClass("active");
            $("#password").addClass("active");
            $("#password").addClass("in");
        } else {
            $("a[href='#info']").parent().addClass("active");
            $("#info").addClass("active");
            $("#info").addClass("in");
        }
    }
    //提交密码修改订单
    function uploadPassword() {
        $("#updatePasswordForm").submit();
    }
    //提交表单
    function uploadHeadPhoto() {
        $("#uploadHeadPhotForm").submit();
    }
</script>
