<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<head>
    <title>出版社信息</title>
    <meta name="heading" content="<fmt:message key='productCategoryDetail.heading'/>"/>
    <meta name="module-group" content="ecommerce-management"/>
    <meta name="module" content="ecommerce-product-company"/>

    <style type="text/css">
        .bootstrap-dialog.type-primary .modal-header{
            background-color: #18a689;
        }

        .ibox{
            margin-bottom: 0;
        }

        .ibox-tools .dropdown-menu{
            left:-60px;
        }

        .ibox-tools .dropdown-menu > li > a{
            padding: 3px 5px;
            line-height: 20px;
        }

        .btn-group, .btn-group-vertical{
            top: -2px;
        }

        .float-e-margins .btn {
            margin-bottom: 0;
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
                <a>书城管理</a>
            </li>
            <li>
                <a href="${ctx}/backend/ecommerce/product/productCategories.html">出版社管理</a>
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
                    <h5>新增出版社信息</h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="${ctx}/backend/ecommerce/product/productCompanyInfoform.html">
                            <i class="fa fa-file-o"></i> 新增
                        </a>
                        <div class="btn-group">
                            <a id="toolbar_save"><i class="fa fa-save"></i> 保存</a>
                            <a class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-caret-down"></i>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a id="toolbar_save_new"><i class="fa fa-save"></i> <i class="fa fa-file-o"></i> 保存&新增</a></li>
                                <li><a id="toolbar_save_return"><i class="fa fa-save"></i> <i class="fa fa-mail-reply"></i> 保存&返回</a></li>
                            </ul>
                        </div>
                        <a href="${ctx}/backend/ecommerce/product/productCompanyInfos.html"><i class="fa fa-mail-reply"></i> 返回</a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form:form commandName="productCompanyInfo" class="form-horizontal" method="post" action="productCompanyInfoform" id="productCompanyInfoform">
                        <form:errors path="*" cssClass="error" element="div"/>
                        <form:hidden path="id"/>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">出版社名称</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="companyName" id="companyName" cssClass="form-control" cssErrorClass="text medium error" maxlength="30"/>
                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">编码</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <div class="input-group-addon">*</div>
                                    <form:input path="companyCode" id="companyCode" cssClass="form-control" cssErrorClass="text medium error" maxlength="15"/>
                                </div>
                                <span class="help-block m-b-none">注意不能与其他编码重复</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">备注</label>
                            <div class="col-sm-10">
                                <form:textarea path="memo" id="memo" cssClass="form-control" cssStyle="height: 80px;" cssErrorClass="text medium error" maxlength="100"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <a class="btn btn-white" href="${ctx}/backend/ecommerce/product/productCompanyInfos.html">取消</a>
                                <button class="btn btn-primary" type="submit">保存</button>
                            </div>
                        </div>

                        <div class="hidden">
                            <button type="submit" id="ButtonSave" name="action" value="save"/>
                            <button type="submit" id="ButtonSave2New" name="action" value="save2new"/>
                            <button type="submit" id="ButtonSave2List" name="action" value="save2list"/>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {


        // 工具栏按钮事件绑定
        initToolBarActions();

        $('#productCompanyInfoform').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                companyName: {
                    message: '分类名称不能为空',
                    validators: {
                        notEmpty: {
                            message: '分类名称不能为空'
                        }
                    }
                },
                companyCode: {
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
                                "companyCode":function(){return $("#companyCode").val();}
                            },
                            type: 'GET',
                            url: '${ctx}/backend/ecommerce/product/productCompanyInfo/checkCode.json',
                            dataType: 'json',
                            message: '该编码已被使用',
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
        // 保存&新增按钮
        $("#toolbar_save_new").bind("click", function () {
            $("#ButtonSave2New").click();
        });

        // 保存&返回按钮
        $("#toolbar_save_return").bind("click", function () {
            $("#ButtonSave2List").click();
        });
    }

    function action_reload(){
        location.href='productCategoryform?id=${productCategory.id}';
    }
</script>
