<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title>修改密码</title>
    <meta name="heading" content="<fmt:message key='userProfile.heading'/>"/>
    <meta name="menu" content="UserPanelMenu"/>
</head>

<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <%--<h2>Basic Form</h2>--%>
        <ol class="breadcrumb">
            <li>
                <a href="${ctx}/backend/index.html">首页</a>
            </li>
            <li>
                <a>用户中心</a>
            </li>
            <li class="active">
                <strong>修改密码</strong>
            </li>
        </ol>
    </div>
</div>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>修改密码</h5>
                </div>
                <div class="ibox-content">
                    <form action="resetPassword" class="form-horizontal" method="post" name="form1" id="form1">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">原密码</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <input type="password" class="form-control" name="password1" id="password1"/>
                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新密码</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <input type="password" class="form-control" name="password2" id="password2"/>
                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">重复新密码</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <input type="password" class="form-control" name="password3" id="password3"/>
                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary" type="submit">修改密码</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

    $(document).ready(function () {

        $('#form1').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                password1: {
                    message: '请输入原密码',
                    validators: {
                        notEmpty: {
                            message: '请输入原密码'
                        }
                    }
                },
                password2: {
                    message: '请输入新密码',
                    validators: {
                        notEmpty: {
                            message: '请输入新密码'
                        }
                    }
                },
                password3: {
                    message: '请重复输入新密码',
                    validators: {
                        notEmpty: {
                            message: '请重复输入新密码'
                        }
                    }
                },
            }
        }).on('success.form.bv', function(e) {
            // Prevent form submission
//            e.preventDefault();
//            $("#namedTextModuleForm").submit();
//            submitMessage();
        });


    });

</script>
