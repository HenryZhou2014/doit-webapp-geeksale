<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="roleDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='roleDetail.heading'/>"/>

    <meta name="module-group" content="system-management"/>
    <meta name="module" content="system-roles"/>

    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script src="${ctx}/resource/common/scripts/zTree-v3.5.02/js/jquery.ztree.all-3.5.js"></script>

    <style type="text/css">
        label{
            font-weight: 500;
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
                <a href="${ctx}/backend/admin/roles.html">角色管理</a>
            </li>
            <li class="active">
                <strong>新增</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>角色管理</h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="${ctx}/backend/admin/roleform.html">
                            <i class="fa fa-plus-circle"></i> 增加
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form:form commandName="role" method="post" class="form-horizontal" action="roleform" id="roleForm">
                        <form:errors path="*" cssClass="error" element="div"/>
                        <form:hidden path="id"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><fmt:message key="role.code"/></label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="code" id="code" cssClass="form-control" cssErrorClass="text medium error"
                                                maxlength="20"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><fmt:message key="role.name"/></label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="name" id="name" cssClass="form-control" cssErrorClass="text medium error"
                                                maxlength="20"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-2 text-right">
                                <label class="control-label">角色权限设置</label>
                                <div class="m-t">
                                    <a class="btn btn-default btn-xs" style="width: 60px;" onclick="checkAllRights(true);">全选</a>
                                </div>
                                <div>
                                    <a class="btn btn-default btn-xs" style="width: 60px;" onclick="checkAllRights(false);">全不选</a>
                                </div>
                            </div>
                            <div class="col-sm-10">
                                <div style="max-height: 350px; overflow-y: auto;">
                                    <ul id="treeDemo" class="ztree"></ul>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><fmt:message key="role.description"/></label>
                            <div class="col-sm-10 col-xl-4">
                                <form:textarea path="description" id="description" cssClass="form-control" style="height:80px;"
                                               cssErrorClass="text medium error"
                                               maxlength="64"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <div class="fl m-r-sm">
                                    <a class="btn btn-white" href="${ctx}/backend/admin/roles.html">取消</a>
                                </div>
                                <div class="fl m-r-sm">
                                    <button class="btn btn-primary" type="submit" name="action" value="save">保存</button>
                                </div>

                            </div>
                        </div>

                        <input type="hidden" name="checkedRights">
                    </form:form>
                </div>
            </div>
        </div>
    </div>

</div>


<script type="text/javascript">
    //    Form.focusFirstElement($('roleForm'));
    var setting = {
        check:{
            enable:true
        },
        data:{
            simpleData:{
                enable:false
            }
        },
        callback:{
            onClick:zTreeOnClick
        }
    };

    function checkAllRights(checkStatus){
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        treeObj.checkAllNodes(checkStatus);
    }

    function zTreeOnClick(event, treeId, treeNode) {

    }

    function zTreeCheckedNodeProcess() {
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getCheckedNodes(true);
        var json = $.toJSON(nodes);

        $("#roleForm input[name=checkedRights]").val(json);
    }

    var zNodes = [<%out.print(request.getAttribute("rightTreeJson"));%>];

    $(document).ready(function () {

        $.fn.zTree.init($("#treeDemo"), setting, zNodes);



        $('#roleForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                code: {
                    message: '角色编码不能为空',
                    validators: {
                        notEmpty: {
                            message: '角色编码不能为空'
                        },
                        regexp: {
                            regexp: /^[a-z|A-Z|0-9|_|\-]*$/,
                            message: '仅限字母数字下划线以及中横线,不能含有空格'
                        },
                        remote: {
                            type: 'GET',
                            url: '${ctx}/backend/json/admin/roleform/roleCodeCheck',
                            data:{"id": function(){return $("#id").val();}, "code":function(){return $("#code").val();}},
                            dataType: 'json',
                            message: '该角色编码已被使用',
                            delay: 1000
                        }
                    }
                },
                name: {
                    validators: {
                        notEmpty: {
                            message: '角色名称不能为空'
                        }
                    }
                }
            }
        }).on('success.form.bv', function(e) {
            zTreeCheckedNodeProcess();
            // Prevent form submission
//            e.preventDefault();
//            $("#namedTextModuleForm").submit();
//            submitMessage();
        });
    });

</script>
