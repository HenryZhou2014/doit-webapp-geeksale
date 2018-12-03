<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="userProfile.title"/></title>
    <meta name="heading" content="<fmt:message key='userProfile.heading'/>"/>
    <meta name="menu" content="UserPanelMenu"/>
    <style type="text/css">
        .radio-inline label{
            font-weight: normal;
        }
    </style>
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
                <strong>用户信息</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>用户信息</h5>
                </div>
                <div class="ibox-content">

                    <form:form commandName="user" class="form-horizontal" method="post" action="userform" id="userForm">
                        <form:hidden path="id"/>
                        <form:hidden path="version"/>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <fmt:message key="user.username"/>
                            </label>
                            <div class="col-sm-10">
                                <div class="form-control">
                                    ${user.accountName}
                                </div>
                                <form:hidden path="accountName"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <fmt:message key="user.name"/>
                            </label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="userName" id="firstName" cssClass="form-control" cssErrorClass="text medium error"
                                                maxlength="16"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                系统角色
                            </label>
                            <div class="col-sm-10">
                                <div class="form-control" style="border: none;">
                                    <%--<c:forEach items="${user.roles}" var="item">
                                        <div class="label label-plain">${item.name}</div>
                                    </c:forEach>--%>
                                </div>
                            </div>
                        </div>

                        <hr/>

                        <%--<div class="form-group">
                            <label class="col-sm-2 control-label">
                                <fmt:message key="user.departmentCode"/>
                            </label>
                            <div class="col-sm-10 col-lg-2">
                                &lt;%&ndash;<form:select path="departmentCode" cssClass="form-control">
                                    <form:option value=""></form:option>
                                    <form:options items="${departmentsInfo}" itemLabel="departmentName" itemValue="departmentCode"/>
                                </form:select>&ndash;%&gt;
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <fmt:message key="user.officeTitle"/>
                            </label>
                            <div class="col-sm-10">
                                <form:input path="officeTitle" id="officeTitle" cssClass="form-control" cssErrorClass="text medium error"
                                            maxlength="16"/>
                            </div>
                        </div>--%>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <fmt:message key="user.gender"/>
                            </label>
                            <div class="col-sm-10">
                                <div class="radio-inline">
                                    <form:radiobutton path="gender" id="c1" value="F"/>
                                    <label for="c1"> 女 </label>
                                </div>
                                <div class="radio-inline">
                                    <form:radiobutton path="gender" id="c2" value="M"/>
                                    <label for="c2"> 男 </label>
                                </div>
                            </div>
                        </div>

                        <hr/>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <fmt:message key="user.email"/>
                            </label>
                            <div class="col-sm-10">
                                <form:input path="email" id="email" cssClass="form-control" maxlength="32"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <fmt:message key="user.phoneNumber"/>
                            </label>
                            <div class="col-sm-10">
                                <form:input path="phoneNumber" id="phoneNumber" cssClass="form-control"
                                            cssErrorClass="text medium error" maxlength="32"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <fmt:message key="user.memo"/>
                            </label>
                            <div class="col-sm-10">
                                <form:textarea path="memo" id="memo" cssClass="form-control"/>
                            </div>
                        </div>

                        <hr/>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <fmt:message key="user.lastVisitIp"/>
                            </label>
                            <div class="col-sm-10">
                                <div class="form-control" style="border:none;">
                                        ${user.lastVisitIp}
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <fmt:message key="user.lastVistDate"/>
                            </label>
                            <div class="col-sm-10">
                                <div class="form-control" style="border:none;">
                                    <fmt:formatDate value="${user.lastVistDate}" pattern="yyyy/MM/dd HH:mm:ss"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-10 col-sm-offset-2">
                                <a class="btn btn-default" href="userform">取消</a>
                                <button class="btn btn-primary" type="submit">保存</button>
                                <a class="btn btn-default pull-right" href="resetPassword">修改密码</a>
                            </div>
                        </div>
                    </form:form>

                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

    $(document).ready(function () {

        $('#userForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {
                    message: '请输入姓名',
                    validators: {
                        notEmpty: {
                            message: '请输入姓名'
                        }
                    }
                },
                email: {
                    message: '非正确的电子邮件格式',
                    validators: {
                        emailAddress: {
                            message: '非正确的电子邮件格式'
                        }
                    }
                }
            }
        }).on('success.form.bv', function(e) {
            // Prevent form submission
//            e.preventDefault();
//            $("#namedTextModuleForm").submit();
//            submitMessage();
        });


    });

</script>

