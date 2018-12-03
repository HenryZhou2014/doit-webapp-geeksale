<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>员工账号信息</title>
    <meta name="heading" content="<fmt:message key='accountDetail.heading'/>"/>
    <meta name="module-group" content="account-management"/>
    <meta name="module" content="user-employee-accounts"/>

    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/zTreeStyle.css"
          type="text/css">
    <script src="${ctx}/resource/common/scripts/zTree-v3.5.02/js/jquery.ztree.all-3.5.js"></script>

    <style type="text/css">
        .page-title {
            /*clear: both;*/
            font-family: "Microsoft YaHei", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, sans-serif !important;
            /*line-height: 150% !important;*/
            font-size: 18px;
            height: 12px;
            font-weight: bolder;
        }

        .page-title li {
            float: left;
            margin-right: 20px;
            list-style: none;
        }

        .page-title li.current {
        }

        .page-title li a {
            margin-top: 25px;
        }

        .p-r {
            /*padding-right: 10px;*/
        }

        .head-photo {
            width: 30px;
            height: 30px;
            border-radius: 15px;
            overflow: hidden;
            float: left;
        }

        .account-name {
            position: relative;
            float: left;
            width: 200px;
            height: 50px;
            margin-left: 20px;
            padding-top: 10px;
        }

        .account-name span {
            line-height: 20px;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 3px;
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
                <a>会员管理</a>
            </li>
            <li>
                <a href="${ctx}/backend/agentaccount/accounts.html">员工账号管理</a>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <form:form commandName="account" class="form-horizontal" method="post"
                       action="accountform" id="accountForm" autocomplete="false">
                <form:hidden path="id"/>

                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>员工账号信息</h5>
                        <div class="ibox-tools">
                            <a id="toolbar_new" href="${ctx}/backend/agentaccount/accountform?id=${account.id}">
                                <i class="fa fa-refresh"></i> 刷新
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                            <%--<form:hidden path="version"/>--%>

                            <%--<form:hidden path="accountExpired"/>--%>
                            <%--<form:hidden path="credentialsExpired"/>--%>

                        <input type="hidden" name="checkedRoles"/>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">会员账号</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <c:choose>
                                        <c:when test="${not empty account.id}">
                                            <form:input path="accountName" id="accountName" cssClass="form-control" cssErrorClass="form-control" maxlength="60" readonly="true"/>
                                        </c:when>
                                        <c:otherwise>
                                            <form:input path="accountName" id="accountName" cssClass="form-control" cssErrorClass="form-control" maxlength="60"/>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="userName" id="userName" cssClass="form-control"
                                                cssErrorClass="text medium error" maxlength="32"/>
                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">手机号</label>
                            <div class="col-sm-10">
                                <form:input path="mobileNumber" id="mobileNumber" cssClass="form-control"
                                            cssErrorClass="text medium error" maxlength="32"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <form:input path="email" id="email" cssClass="form-control"
                                            cssErrorClass="text medium error" maxlength="32"/>
                            </div>
                        </div>
                        <hr/>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
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

                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系电话</label>
                            <div class="col-sm-10">
                                <form:input path="phoneNumber" id="phoneNumber" cssClass="form-control"
                                            cssErrorClass="text medium error" maxlength="32"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系地址</label>
                            <div class="col-sm-10">
                                <form:input path="contactAddress" id="contactAddress" cssClass="form-control"
                                            cssErrorClass="text medium error" maxlength="32"/>
                            </div>
                        </div>
                        <hr/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">QQ</label>
                            <div class="col-sm-10">
                                <c:if test="${account.accountQq.id != null}">
                                    <div class="head-photo">
                                        <img class="img-responsive" src="${account.accountQq.figureurl1}"/>
                                    </div>
                                    <div class="account-name">
                                        <span>${account.accountQq.nickname}</span>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">微信</label>
                            <div class="col-sm-10">
                                <c:if test="${account.accountWeixin.id != null}">
                                    <div class="head-photo">
                                        <img class="img-responsive" src="${account.accountWeixin.headimgurl}"/>
                                    </div>
                                    <div class="account-name">
                                        <span>${account.accountWeixin.nickname}</span>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新浪微博</label>
                            <div class="col-sm-10">
                                <c:if test="${account.accountSlweiboInfo.id != null}">
                                    <div class="head-photo">
                                        <img class="img-responsive"
                                             src="${account.accountSlweiboInfo.profileimageurl}"/>
                                    </div>
                                    <div class="account-name">
                                        <span>${account.accountSlweiboInfo.screenname}</span>
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <c:if test="${not empty account.id}">
                            <hr/>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">账号状态</label>
                                <div class="col-sm-10">
                                    <div class="form-control" style="border: none;">
                                        <c:choose>
                                            <c:when test="${account.accountEnabled}">
                                                <label class="label label-primary">启用</label>
                                            </c:when>
                                            <c:otherwise>
                                                <label class="label label-danger">停用</label>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">注册日期</label>
                                <div class="col-sm-10">
                                    <label class="form-control" style="border: none; font-weight: normal;">
                                        <fmt:formatDate value="${account.registerDate}" pattern="yyyy/MM/dd HH:mm:ss"/>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">最近登陆</label>
                                <div class="col-sm-10">
                                    <label class="form-control" style="border: none; font-weight: normal;">
                                        <fmt:formatDate value="${account.lastVistDate}" pattern="yyyy/MM/dd HH:mm:ss"/>
                                        <c:if test="${not empty account.lastVisitIp}">
                                            从 ${user.loginIp}
                                        </c:if>
                                        <c:if test="${empty account.lastVistDate and empty account.lastVisitIp}">
                                            暂无登陆记录
                                        </c:if>
                                    </label>
                                </div>
                            </div>

                        </c:if>
                    </div>
                </div>

                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>公司信息</h5>
                    </div>
                    <div class="ibox-content">
                        <form:hidden path="companyInfo.id"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">公司名称</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="companyInfo.companyName" id="companyName"
                                                cssClass="form-control" cssErrorClass="form-control" maxlength="60"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">产品品牌</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="companyInfo.slogan" id="slogan"
                                                cssClass="form-control" cssErrorClass="form-control" maxlength="60"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系人</label>
                            <div class="col-sm-10">
                                <form:input path="companyInfo.linkPerson" id="linkPerson"
                                            cssClass="form-control" cssErrorClass="form-control" maxlength="60"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系电话</label>
                            <div class="col-sm-10">
                                <form:input path="companyInfo.phoneNumber" id="phoneNumber"
                                            cssClass="form-control" cssErrorClass="form-control" maxlength="60"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text-center">
                    <a class="btn btn-white" href="accounts">返回</a>
                    <button class="btn btn-primary" type="submit">保存</button>
                </div>

            </form:form>

        </div>
    </div>
</div>


<script type="text/javascript">

    var setting = {
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            onClick: zTreeOnClick
        },
        async: {
            type: "get",
            enable: true,
            dataType: "text",
            otherParam: {userId: "${user.id}"},
            url: "${ctx}/backend/json/admin/roles/userRoleTreeItems"
        }
    };

    function zTreeOnClick(event, treeId, treeNode) {

    }

    <%--var zNodes = <%out.print(request.getAttribute("roleTreeJson"));%>;--%>


    $(document).ready(function () {

        // 工具栏按钮事件绑定
        initToolBarActions();

        $.fn.zTree.init($("#treeDemo"), setting, []);

        $('#accountForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {
                    message: '账号不能为空',
                    validators: {
                        notEmpty: {
                            message: '账号不能为空'
                        },
                        regexp: {
                            regexp: /^[a-z|A-Z|0-9|_|\-]*$/,
                            message: '仅限字母数字下划线以及中横线,不能含有空格'
                        }
                        ,
                        remote: {
                            type: 'GET',
                            url: '${ctx}/backend/json/admin/userform/usernameCheck',
                            data: {
                                "id": function () {
                                    return $("#id").val();
                                }, "username": function () {
                                    return $("#username").val();
                                }
                            },
                            dataType: 'json',
                            message: '该账号已被使用',
                            delay: 1000
                        }
                    }
                },
                userName: {
                    validators: {
                        notEmpty: {
                            message: '姓名不能为空'
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
        }).on('success.form.bv', function (e) {
//            preSaveProcess();
        });

    });

    <!-- This is here so we can exclude the selectAll call when roles is hidden -->

    function preSaveProcess() {

        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getCheckedNodes(true);
        var json = $.toJSON(nodes);

        $("#userForm input[name=checkedRoles]").val(json);
    }

    function initToolBarActions() {

        // 新增按钮
        $("#toolbar_new").bind("click", function () {
            $('#action_save_and_new').click();
        });


    }

    function action_reload() {
        location.href = "${ctx}/admin/userform?id=${user.id}";
    }

    function checkAllRoles(checkStatus) {
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        treeObj.checkAllNodes(checkStatus);
    }
</script>