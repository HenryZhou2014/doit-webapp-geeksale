<%@ page import="com.doit.cms.model.WebLink" %>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>

<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>友情链接</title>
    <meta name="module-group" content="website-management"/>
    <meta name="module" content="web-links"/>
    <style type="text/css">
        .radio-inline label{
            font-weight:normal;
        }

        .form-group{
            margin-bottom: 10px;
        }

        .control-label{
            font-weight: normal;
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
                <a>网站管理</a>
            </li>
            <li>
                <a>友情链接</a>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>友情链接</h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="${ctx}/backend/cms/webLinkform.html">
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
                        <a href="${ctx}/backend/cms/namedTextModules.html"><i class="fa fa-mail-reply"></i> 返回</a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form:form commandName="webLink" method="post" action="webLinkform" id="webLink"
                               class="form-horizontal"
                               enctype="multipart/form-data">
                        <form:errors path="*" cssClass="error" element="div"/>
                        <form:hidden path="id"/>
                        <input type="hidden" name="isBack" value="N"/>

                        <div class="tabs-container">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#tab-1">基本信息</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane active">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">单位名称</label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <div class="input-group-addon">*</div>
                                                    <form:input path="targetName" id="targetName" cssClass="form-control"
                                                                cssErrorClass="text medium error" maxlength="30"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">链接标题</label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <div class="input-group-addon">*</div>
                                                    <form:input path="title" id="title" cssClass="form-control"
                                                                cssErrorClass="text medium error" maxlength="30"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">链接网址</label>
                                            <div class="col-sm-10">
                                                <form:input path="url" id="url" cssClass="form-control"
                                                            cssErrorClass="text large error" maxlength="50"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">图片</label>
                                            <div class="col-sm-10">
                                                <form:input path="logoUrl" id="logoUrl" cssClass="form-control"
                                                            cssErrorClass="text medium error" maxlength="50"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">显示顺序</label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <form:input path="seqNo" id="seqNo" cssClass="form-control"
                                                                cssErrorClass="text medium error" maxlength="50"/>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">备注</label>
                                            <div class="col-sm-10">
                                                <form:input path="memo" id="memo" cssClass="form-control"
                                                            cssErrorClass="text medium error" maxlength="50"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">状态</label>
                                            <div class="col-sm-10">

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hidden">
                            <button type="submit" id="ButtonSave" name="action" value="save"/>
                            <button type="submit" id="ButtonSave2New" name="action" value="save2new"/>
                            <button type="submit" id="ButtonSave2List" name="action" value="save2list"/>
                            <button type="submit" id="ButtonPublish" name="action" value="publish"/>
                            <button type="submit" id="ButtonUnpublish" name="action" value="unpublish"/>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    //    Form.focusFirstElement($('articleForm'));
    $(document).ready(function () {

        initToolBarActions();

        $('#webLink').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                title: {
                    message: '单位名称不能为空',
                    validators: {
                        notEmpty: {
                            message: '单位名称不能为空'
                        }
                    }
                },
                url: {
                    message: '单位网址不能为空',
                    validators: {
                        notEmpty: {
                            message: '单位网址不能为空'
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {

        });

    });

    function initToolBarActions() {

        // 保存按钮
        $("#toolbar_save").bind("click", function () {
            $("#ButtonSave").click();
        });

        // 保存&新增按钮
        $("#toolbar_save_new").bind("click", function () {
            $("#ButtonSave2New").click();
        });

        // 保存&返回按钮
        $("#toolbar_save_return").bind("click", function () {
            $("#ButtonSave2List").click();
        });

    }

</script>
