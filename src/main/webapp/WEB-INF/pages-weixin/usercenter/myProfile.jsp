<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>账号信息</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="myProfile"/>

    <style type="text/css">
        .weui-panel p{
            margin-bottom:0;
        }
        .justify{
            justify-content: center;
        }
        .align{
            align-items: center;
        }
        .wid{
            height: 5em;
        }
        .flex-column{
            flex-direction: column;
        }
    </style>
</head>

<div class="weui-flex" style="height:230px;">
    <div class="weui-flex__item weui-flex flex-column justify align">
        <img src="https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=497430597,3304326358&fm=117&gp=0.jpg" alt="..." class="img-circle" style="width: 100px;height:100px;display: block">
        <div class="placeholder">
            <c:choose>
                <c:when test="${not empty accountWeixinInfo.nickname}">
                    ${accountWeixinInfo.nickname}
                </c:when>
                <c:when test="${not empty accountInfo.accountName}" >
                    ${accountInfo.accountName}
                </c:when>
                <c:otherwise>
                    未登录
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<!--列表项区域-->
<div class="weui-panel">
    <div class="weui-panel__bd">
        <div class="weui-media-box weui-media-box_small-appmsg">
            <div class="weui-cells">
                <a class="weui-cell weui-cell_access" href="javascript:;">
                    <div class="weui-cell__hd">
                        <i class="fa fa-user" style="margin-right:10px;"></i>
                    </div>
                    <div class="weui-cell__bd weui-cell_primary">
                        <p>账号信息</p>
                    </div>
                    <span class="weui-cell__ft"></span>
                </a>
                <a class="weui-cell weui-cell_access" href="javascript:;">
                    <div class="weui-cell__hd"><i class="fa fa-file-text" style="margin-right:10px;"></i></div>
                    <div class="weui-cell__bd weui-cell_primary">
                        <p>我的订单</p>
                    </div>
                    <span class="weui-cell__ft"></span>
                </a>
                <a class="weui-cell weui-cell_access" href="javascript:;">
                    <div class="weui-cell__hd"><i class="fa fa-gift" style="margin-right:10px;"></i></div>
                    <div class="weui-cell__bd weui-cell_primary">
                        <p>我的书柜</p>
                    </div>
                    <span class="weui-cell__ft"></span>
                </a>
            </div>
        </div>
    </div>
</div>
<%--<section>--%>
    <%--<div class="container">--%>


        <%--<!-- RIGHT -->--%>
        <%--&lt;%&ndash;<div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<input type="hidden" id="tableActive" value="${table}"/>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<input type="hidden" id="id" value="${account.id}"/>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<ul class="nav nav-tabs nav-top-border">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<li><a href="#info" data-toggle="tab">个人信息</a></li>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<li><a href="#avatar" data-toggle="tab">头像设置</a></li>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<li><a href="#password" data-toggle="tab">登陆密码修改</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>

            <%--&lt;%&ndash;<div class="tab-content margin-top-20">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<!-- PERSONAL INFO TAB -->&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="tab-pane fade in active" id="info">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<form:form commandName="account" role="form" action="${ctx}/usercenter/updateAccountInfo.html"&ndash;%&gt;--%>
                               <%--&lt;%&ndash;method="post" id="accountInfo">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="control-label">账号名</label>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<form:input path="accountName" cssClass="form-control" readonly="true" disabled="true"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="control-label">姓名</label>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<form:input path="userName" cssClass="form-control"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="control-label">性别</label>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div class="col-sm-12 nopadding margin-bottom-10">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<div class="radio-inline">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<form:radiobutton path="gender" id="M" value="M"/>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<label for="M">男</label>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<div class="radio-inline">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<form:radiobutton path="gender" id="F" value="F"/>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<label for="F">女</label>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="control-label">电子邮件</label>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<form:input path="email" cssClass="form-control"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="control-label">手机号码</label>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<form:input path="mobileNumber" cssClass="form-control"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="control-label">头衔</label>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<form:input path="accountExtInfo.title" cssClass="form-control"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="control-label">职业</label>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<form:input path="accountExtInfo.career" cssClass="form-control"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="control-label">工作单位</label>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<form:input path="accountExtInfo.companyName" cssClass="form-control"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="control-label">地址</label>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<form:input path="contactAddress" rows="3" cssClass="form-control"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="control-label">简介</label>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<form:input path="accountExtInfo.introduction" cssClass="form-control"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

                        <%--&lt;%&ndash;<div class="margiv-top10 text-center">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<button type="submit" class="btn btn-danger"/>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;保存</button>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<a href="#" class="btn btn-default">取消 </a>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</form:form>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<!-- /PERSONAL INFO TAB -->&ndash;%&gt;--%>

                <%--&lt;%&ndash;<!-- AVATAR TAB -->&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="tab-pane fade" id="avatar">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<form action="${ctx}/usercenter/uploadHeadPhoto.html" class="clearfix" method="post"&ndash;%&gt;--%>
                          <%--&lt;%&ndash;enctype="multipart/form-data" id="uploadHeadPhotForm">&ndash;%&gt;--%>

                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div class="row">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<div class="col-md-3 col-sm-4">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<div class="thumbnail">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;&lt;%&ndash;<img class="img-responsive" src="assets/images/demo/people/460x700/8-min.jpg" alt="" />&ndash;%&gt;&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<img class="img-responsive" src="${ctx}/${accountHeadImage.imagePath}" alt=""/>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

                                <%--&lt;%&ndash;<div class="col-md-9 col-sm-8">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<div class="sky-form nomargin">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<label class="label">Select File</label>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<label for="file" class="input input-file">&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<div class="button">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<input type="file" id="file" name="file"/>选择..&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<input type="text" readonly="true">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</label>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

                                    <%--&lt;%&ndash;<a href="#" class="btn btn-danger btn-xs noradius"><i class="fa fa-times"></i>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;删除头像</a>&ndash;%&gt;--%>

                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

                        <%--&lt;%&ndash;<div class="margiv-top10">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<a href="#" class="btn btn-primary" id="uploadHeadPhoto">保存 </a>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<a href="#" class="btn btn-default">取消 </a>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</form>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

                <%--&lt;%&ndash;<!-- PASSWORD TAB -->&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="tab-pane fade" id="password">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<form action="${ctx}/usercenter/updatePassword.html" class="clearfix" method="post"&ndash;%&gt;--%>
                          <%--&lt;%&ndash;id="updatePasswordForm">&ndash;%&gt;--%>

                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="control-label">当前密码</label>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<input type="password" class="form-control" name="currentPassword" value="">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="control-label">新密码</label>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<input type="password" class="form-control" name="newPassword" value="">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="control-label">重复新密码</label>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<input type="password" class="form-control" name="renewPassword" value="">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

                        <%--&lt;%&ndash;<div class="margiv-top10 text-center">&ndash;%&gt;--%>

                            <%--&lt;%&ndash;<button type="submit" class="btn btn-danger"/>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;修改密码&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</button>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<a href="#" class="btn btn-default">取消 </a>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</form>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<!-- /PASSWORD TAB -->&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--<!-- LEFT -->--%>


    <%--</div>--%>
<%--</section>--%>

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
