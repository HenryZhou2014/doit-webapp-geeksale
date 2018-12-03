<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="productCategoryDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='productCategoryDetail.heading'/>"/>
    <meta name="module-group" content="ecommerce-management"/>
    <meta name="module-subgroup" content="ecommerce-product"/>
    <meta name="module" content="ecommerce-product-categories"/>

    <style type="text/css">
        .bootstrap-dialog.type-primary .modal-header{
            background-color: #18a689;
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
                <a>商品管理</a>
            </li>
            <li>
                <a href="${ctx}/backend/ecommerce/product/productCategories.html">商品分类管理</a>
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
                    <h5>新增商品分类</h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="${ctx}/backend/ecommerce/product/productCategoryform.html">
                            <i class="fa fa-plus-circle"></i> 增加
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form:form commandName="productCategory" class="form-horizontal" method="post" action="productCategoryform" id="productCategoryForm">
                        <form:errors path="*" cssClass="error" element="div"/>
                        <form:hidden path="id"/>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><fmt:message key="productCategory.parent.title"/></label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:select path="parentId" id="parentId" cssClass="form-control">
                                        <form:option value="">请选择</form:option>
                                        <c:forEach items="${productCategoryList}" var="item">
                                            <form:option value="${item.id}">${item.title}</form:option>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><fmt:message key="productCategory.title"/></label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="title" id="title" cssClass="form-control" cssErrorClass="text medium error" maxlength="60"/>
                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><fmt:message key="productCategory.aliasName"/></label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="aliasName" id="aliasName" cssClass="form-control" cssErrorClass="text medium error" maxlength="15"/>
                                </div>
                                <span class="help-block m-b-none">注意不能与其他别名重复</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <appfuse:label styleClass="col-sm-2 control-label" key="productCategory.seqNo"/>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <input type="text" class="form-control" name="sufSeqNo" id="sufSeqNo" value="${sufSeqNo}" maxlength="2"/>
                                    <%--<form:input path="seqNo" id="seqNo" cssClass="form-control" cssErrorClass="text medium error" maxlength="2"/>--%>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <appfuse:label styleClass="col-sm-2 control-label" key="productCategory.memo"/>
                            <div class="col-sm-10">
                                <form:textarea path="memo" id="memo" cssClass="form-control" cssStyle="height: 80px;" cssErrorClass="text medium error" maxlength="100"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <a class="btn btn-white" href="${ctx}/backend/ecommerce/product/productCategories.html">取消</a>
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
    $(document).ready(function () {
        $("#academyName").focus();

        // 工具栏按钮事件绑定
//        initToolBarActions();

        $('#productCategoryForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                title: {
                    message: '分类名称不能为空',
                    validators: {
                        notEmpty: {
                            message: '分类名称不能为空'
                        }
                    }
                },
                aliasName: {
                    validators: {
                        notEmpty: {
                            message: '别名不能为空'
                        },
                        regexp: {
                            regexp: /^[a-z|A-Z|0-9|_|\-]*$/,
                            message: '仅限字母数字下划线以及中横线,不能含有空格'
                        },
                        remote: {
                            data:{
                                "id": function(){return $("#id").val();},
                                "aliasName":function(){return $("#aliasName").val();}
                            },
                            type: 'GET',
                            url: '${ctx}/backend/json/ecommerce/product/productCategoryform/aliasNameCheck',
                            dataType: 'json',
                            message: '该别名已被使用',
                            delay: 1000
                        }
                    }
                },sufSeqNo: {
                    message: '顺序号不正确！',
                    validators: {
                        notEmpty: {
                            message: '顺序号不能为空！'
                        },
                        regexp: {
                            regexp: /^\d{2}$/,
                            message: '顺序号必须是两位数字！'
                        },
                        remote: {
                            data:{
                                "parentId": function(){return $("#parentId").val();},
                                "sufSeqNo":function(){return $("#sufSeqNo").val();}
                            },
                            type: 'GET',
                            url: '${ctx}/backend/json/ecommerce/product/productCategoryform/seqNoCheck',
                            dataType: 'json',
                            message: '该顺序号已被使用',
                            delay: 1000
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

    function initToolBarActions(){
        // 保存按钮
        $("#toolbar_save").bind("click", function(){
            $('#action_save').click();
        });

        // 新增按钮
        $("#toolbar_new").bind("click", function(){
            $('#action_save_and_new').click();
        });

        // 刷新按钮
        $("#toolbar_reload").bind("click", function(){
            action_reload();
        });

        // 关闭按钮
        $("#toolbar_close").bind("click", function(){
            closeFrameworkCurrentTab();
        });
    }



    function action_reload(){
        location.href='productCategoryform?id=${productCategory.id}';
    }
</script>
