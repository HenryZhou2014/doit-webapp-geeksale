<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>客户开户申请</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="menu-item-group" content="03"/>
    <meta name="menu-item-module" content="0310"/>

    <style type="text/css">
        .form-control-feedback{
            right: 20px;
            color: darkred;
        }
        .bv-form .help-block{
            color: darkred;
        }

        form label {
            margin-top: 10px;
        }
    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#tab1" data-toggle="tab">客户开户申请</a></li>
            </ul>

            <div class="tab-content margin-top-20">
                <div class="tab-pane fade in active" id="tab1">
                    <form name="" action="newMemberApply" method="post"></form>
                    <div class="row">
                        <div class="col-lg-10 col-lg-offset-2">
                            <div class="alert alert-default margin-bottom-30"><!-- SUCCESS -->
                                <strong>开户说明!</strong> 请在提交开户资料后，与技术支持方联系。
                            </div>
                        </div>
                    </div>

                    <form:form commandName="account" cssClass="form" name="accountApplyForm" action="newMemberApply" method="post" id="accountApplyForm">
                        <div class="row">
                            <div class="col-lg-2">
                                <label class="desc text-right">手机号</label>
                            </div>
                            <div class="col-lg-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="accountName" cssClass="form-control" placeholder="填写11位手机号码" maxlength="11"/>
                                </div>
                                <div>
                                    (注：手机号将作为登陆账号使用！)
                                </div>
                            </div>
                        </div>

                        <div class="row margin-top-10">
                            <div class="col-lg-2">
                                <label class="desc text-right">姓名</label>
                            </div>
                            <div class="col-lg-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="userName" cssClass="form-control" placeholder="客户姓名" maxlength="12"/>
                                </div>
                            </div>
                        </div>

                        <div class="row margin-top-10">
                            <div class="col-lg-2">
                                <label class="desc text-right">公司名称</label>
                            </div>
                            <div class="col-lg-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="companyInfo.companyName" cssClass="form-control" placeholder="填写客户单位名称或姓名（个人用户）" maxlength="32"/>
                                </div>
                            </div>
                        </div>

                        <div class="row margin-top-10">
                            <div class="col-lg-2">
                                <label class="desc text-right">客户简称（品牌名称）</label>
                            </div>
                            <div class="col-lg-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="companyInfo.slogan" cssClass="form-control" placeholder="客户简称或品牌名称" maxlength="128"/>
                                </div>
                                <div>
                                    (注：客户名称将在发送的消息中显示，且开户后，客户名称不能更改，请慎重！)
                                </div>
                            </div>
                        </div>

                        <%--<div class="row margin-top-10">
                            <div class="col-lg-2">
                                <label class="desc text-right">联系人</label>
                            </div>
                            <div class="col-lg-10">
                                <form:input path="companyInfo.linkPerson" cssClass="form-control" placeholder="公司联系人" maxlength="32"/>
                            </div>
                        </div>
--%>
                        <%--<div class="row margin-top-10">
                            <div class="col-lg-2">
                                <label class="desc text-right">城市</label>
                            </div>
                            <div class="col-lg-10">
                                <select>
                                    <option>湖南省</option>
                                </select>
                                <select>
                                    <option>邵阳市</option>
                                </select>
                                <select>
                                    <option>隆回县</option>
                                </select>
                            </div>
                        </div>--%>

                        <%--<div class="row margin-top-10">
                            <div class="col-lg-2">
                                <label class="desc text-right">证件上传</label>
                            </div>
                            <div class="col-lg-10">
                                <input type="text" class="form-control"/>
                            </div>
                        </div>--%>

                        <div class="row margin-top-10">
                            <div class="col-lg-2">
                            </div>
                            <div class="col-lg-10">
                                <button type="submit" class="btn btn-success btn-lg width-100">申请</button>
                            </div>
                        </div>
                    </form:form>
                </div>
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

        $('#accountApplyForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                accountName: {
                    message: '手机号不能为空',
                    validators: {
                        notEmpty: {
                            message: '手机号不能为空'
                        },
                        regexp: {
                            regexp: /^[0-9]{11}$/,
                            message: '仅限11位的手机号码'
                        },
                        remote: {
                            type: 'GET',
                            url: "${ctx}/usercenter/myCompany/checkEmployeeInfo",
                            data: {
                                "accountName": function () {
                                    return $("#accountApplyForm [name=accountName]").val();
                                }
                            },
                            dataType: 'json',
                            message: '该手机号码已经被使用',
                            delay: 1000
                        }
                    }
                },
                userName: {
                    message: '客户姓名不能为空',
                    validators: {
                        notEmpty: {
                            message: '客户姓名不能为空'
                        }
                    }
                },
                "companyInfo.companyName": {
                    message: '公司名称不能为空',
                    validators: {
                        notEmpty: {
                            message: '公司名称不能为空'
                        }
                    }
                },
                "companyInfo.slogan": {
                    message: '客户简称（品牌名称）不能为空',
                    validators: {
                        notEmpty: {
                            message: '客户简称（品牌名称）不能为空'
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {
            // 转换、获取附件列表信息

        });
    });

</script>
