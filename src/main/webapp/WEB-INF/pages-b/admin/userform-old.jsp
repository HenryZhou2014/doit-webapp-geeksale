<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="userProfile.title"/></title>
    <meta name="heading" content="<fmt:message key='userProfile.heading'/>"/>
    <meta name="module-group" content="system-management"/>
    <meta name="module" content="system-users"/>

    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/zTreeStyle.css" type="text/css">
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

        .p-r{
            /*padding-right: 10px;*/
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
                <a>系统管理</a>
            </li>
            <li>
                <a href="${ctx}/backend/admin/users.html">用户管理</a>
            </li>
            <c:choose>
                <c:when test="${not empty user.id}">
                    <li class="active">
                        <a>修改</a>
                    </li>
                    <li class="active">
                        <strong>${user.username}</strong>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="active">
                        <strong>新增用户</strong>
                    </li>
                </c:otherwise>
            </c:choose>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>账号信息</h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="${ctx}/backend/admin/userform.html">
                            <i class="fa fa-plus-circle"></i> 增加
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form:form commandName="user" class="form-horizontal" method="post" action="userform" id="userForm" autocomplete="false">
                        <form:hidden path="id"/>
                        <form:hidden path="version"/>

                        <form:hidden path="accountExpired"/>
                        <form:hidden path="credentialsExpired"/>

                        <input type="hidden" name="checkedRoles"/>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><fmt:message key="user.username"/></label>
                            <div class="col-sm-10">
                                <c:choose>
                                    <c:when test="${empty user.id}">
                                        <div class="input-group">
                                            <div class="input-group-addon">*</div>
                                            <form:input path="username" id="username" cssClass="form-control" cssErrorClass="form-control" maxlength="60"/>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="form-control">
                                            ${user.username}
                                        </div>
                                        <form:hidden path="username"/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><fmt:message key="user.name"/></label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="name" id="name" cssClass="form-control" cssErrorClass="text medium error" maxlength="16" autocomplete="false"/>
                                </div>
                            </div>
                        </div>

                        <c:if test="${empty user.id}">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">初始密码</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <div class="input-group-addon">*</div>
                                        <form:password path="password" id="password" cssClass="form-control" cssErrorClass="form-control" maxlength="32" autocomplete="false"/>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <hr/>

                        <div class="form-group">
                            <div class="col-sm-2 text-right">
                                <label class="control-label">角色设置</label>
                                <div class="m-t">
                                    <a class="btn btn-default btn-xs" style="width: 60px;" onclick="checkAllRoles(true);">全选</a>
                                </div>
                                <div>
                                    <a class="btn btn-default btn-xs" style="width: 60px;" onclick="checkAllRoles(false);">全不选</a>
                                </div>
                            </div>

                            <div class="col-sm-10" style="max-height: 455px;overflow: auto;">
                                <ul id="treeDemo" class="ztree"></ul>
                            </div>
                        </div>

                        <hr/>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><fmt:message key="user.departmentCode"/></label>
                            <div class="col-sm-10 col-lg-2">
                                <form:select path="departmentCode" cssClass="form-control">
                                    <form:option value=""></form:option>
                                    <form:options items="${departmentsInfo}" itemLabel="departmentName" itemValue="departmentCode"/>
                                </form:select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><fmt:message key="user.officeTitle"/></label>
                            <div class="col-sm-10">
                                <form:input path="officeTitle" id="officeTitle" cssClass="form-control" cssErrorClass="text medium error" maxlength="16"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><fmt:message key="user.gender"/></label>
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
                            <label class="col-sm-2 control-label"><fmt:message key="user.email"/></label>
                            <div class="col-sm-10">
                                <form:input path="email" id="email" cssClass="form-control" cssErrorClass="text medium error" maxlength="32"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><fmt:message key="user.phoneNumber"/></label>
                            <div class="col-sm-10">
                                <form:input path="phoneNumber" id="phoneNumber" cssClass="form-control" cssErrorClass="text medium error" maxlength="32"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><fmt:message key="user.memo"/></label>
                            <div class="col-sm-10">
                                <form:input path="memo" id="memo" cssClass="form-control" cssErrorClass="text medium error" maxlength="16"/>
                            </div>
                        </div>

                        <c:if test="${not empty user.id}">

                        <hr/>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">账号状态</label>
                            <div class="col-sm-10">
                                <div class="form-control" style="border: none;">
                                    <c:choose>
                                        <c:when test="${user.accountEnabled}">
                                            <label class="label label-primary">正常</label>
                                        </c:when>
                                        <c:otherwise>
                                            <label class="label label-danger">停用</label>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">最近登陆</label>
                            <div class="col-sm-10">
                                <label class="form-control" style="border: none; font-weight: normal;">
                                    <fmt:formatDate value="${user.loginDate}" pattern="yyyy/MM/dd HH:mm:ss"/>
                                    <c:if test="${not empty user.loginIp}">
                                        从 ${user.loginIp}
                                    </c:if>
                                    <c:if test="${empty user.loginDate and empty user.loginIp}">
                                        暂无登陆记录
                                    </c:if>
                                </label>
                            </div>
                        </div>

                        </c:if>

                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <a class="btn btn-white" href="${ctx}/backend/admin/users.html">取消</a>
                                <button class="btn btn-primary" type="submit">保存</button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

    var setting = {
        check:{
            enable:true
        },
        data:{
            simpleData:{
                enable:true
            }
        },
        callback:{
            onClick:zTreeOnClick
        },
        async:{
            type : "get",
            enable: true,
            dataType :"text",
            otherParam: {userId : "${user.id}"},
            url:"${ctx}/backend/json/admin/roles/userRoleTreeItems"
        }
    };

    function zTreeOnClick(event, treeId, treeNode) {

    }

    <%--var zNodes = <%out.print(request.getAttribute("roleTreeJson"));%>;--%>


    $(document).ready(function () {

        // 工具栏按钮事件绑定
        initToolBarActions();

        $.fn.zTree.init($("#treeDemo"), setting, []);

        $('#userForm').bootstrapValidator({
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
                            data:{"id": function(){return $("#id").val();}, "username":function(){return $("#username").val();}},
                            dataType: 'json',
                            message: '该账号已被使用',
                            delay: 1000
                        }
                    }
                },
                name: {
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
        }).on('success.form.bv', function(e) {
            preSaveProcess();
        });

    });

    <!-- This is here so we can exclude the selectAll call when roles is hidden -->

    function preSaveProcess(){

        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getCheckedNodes(true);
        var json = $.toJSON(nodes);

        $("#userForm input[name=checkedRoles]").val(json);
    }

    function initToolBarActions(){

        // 新增按钮
        $("#toolbar_new").bind("click", function(){
            $('#action_save_and_new').click();
        });


    }

    function action_reload(){
        location.href="${ctx}/admin/userform?id=${user.id}";
    }

    function checkAllRoles(checkStatus){
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        treeObj.checkAllNodes(checkStatus);
    }
</script>