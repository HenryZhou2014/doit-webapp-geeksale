<%@ page import="com.doit.cms.model.NamedTextModule" %>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="namedTextModuleDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='namedTextModuleDetail.heading'/>"/>
    <meta name="module-group" content="website-management"/>
    <meta name="module" content="website-content"/>

   <%-- <script src="${ctx}/resource/common/scripts/ueditor1.4/ueditor.config.js"></script>
    <script src="${ctx}/resource/common/scripts/ueditor1.4/ueditor.all.js"></script>--%>
    <script src="${ctx}/resource/common/scripts/ueditor1.4/ueditor.config.js"></script>
    <script src="${ctx}/resource/common/scripts/ueditor1.4/ueditor.all.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/resource/common/scripts/ueditor1.4/lang/zh-cn/zh-cn.js"></script>
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
                <a href="${ctx}/backend/cms/namedTextModules.html">网站内容列表</a>
            </li>
            <li>
                <a>维护</a>
            </li>
            <li class="active">
                <c:choose>
                    <c:when test="${not empty namedTextModule.id}">
                        <strong>${namedTextModule.title}</strong>
                    </c:when>
                    <c:otherwise>
                        <strong>新增</strong>
                    </c:otherwise>
                </c:choose>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>
                        <c:choose>
                            <c:when test="${not empty namedTextModule.id}">
                                <strong>${namedTextModule.title}</strong>
                            </c:when>
                            <c:otherwise>
                                <strong>新增</strong>
                            </c:otherwise>
                        </c:choose>
                    </h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="${ctx}/backend/cms/namedTextModuleform.html">
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
                    <form:form commandName="namedTextModule" method="post" action="namedTextModuleform" id="namedTextModuleForm"
                               class="form-horizontal">
                        <form:errors path="*" cssClass="error" element="div"/>
                        <form:hidden path="id"/>
                        <form:hidden path="createBy"/>
                        <form:hidden path="createDate"/>
                        <form:hidden path="updateBy"/>
                        <form:hidden path="updateDate"/>
                        <form:hidden path="publishDate"/>
                        <form:hidden path="publishFlag"/>
                        <form:hidden path="unpublishDate"/>
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="form-group"><label class="col-sm-2 control-label">名称</label>

                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <div class="input-group-addon">*</div>
                                            <form:input path="title" id="title" cssClass="form-control" cssErrorClass="text medium error"
                                                        maxlength="30" required=""/>
                                        </div>

                                    </div>
                                </div>
                                <div class="form-group"><label class="col-sm-2 control-label">别名</label>

                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <div class="input-group-addon">*</div>
                                            <form:input path="aliasName" id="aliasName" cssClass="form-control" cssErrorClass="text medium error"
                                                        maxlength="30" required=""/>
                                        </div>
                                        <p class="text-muted">唯一，系统通过别名获取该模块的内容并显示</p>
                                    </div>
                                </div>
                                <div class="form-group"><label class="col-sm-2 control-label">显示标题</label>

                                    <div class="col-sm-10">
                                        <form:input path="displayTitle" id="displayTitle" cssClass="form-control"
                                                    maxlength="128" required=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-2 control-label">内容</label>

                                    <div class="col-lg-10">
                                        <%
                                            NamedTextModule namedTextModule = (NamedTextModule) request.getAttribute("namedTextModule");
                                            String moduleContent = (String) request.getAttribute("moduleContent");
                                        %>
                                        <SCRIPT id="moduleContent" type="text/plain" name="moduleContent"><%
                                            if (moduleContent != null) {
                                                out.print(moduleContent);
                                            }
                                        %></SCRIPT>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-4">
                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>其他设置</h5>
                                        <div class="ibox-tools">
                                            <a class="collapse-link">
                                                <i class="fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="ibox-content">
                                        <div class="form-group"><label class="col-sm-2 control-label">分类</label>

                                            <div class="col-sm-10">
                                                <form:select path="categoryId" cssClass="form-control">
                                                    <form:option value="">无</form:option>
                                                    <form:options items="${categoryList}" itemLabel="label" itemValue="value"/>
                                                </form:select>
                                            </div>
                                        </div>
                                        <div class="form-group"><label class="col-sm-2 control-label">说明</label>

                                            <div class="col-sm-10">
                                                <form:input path="memo" id="memo" cssClass="form-control" cssErrorClass="text medium error"
                                                            maxlength="80"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>创建/修改/信息</h5>
                                        <div class="ibox-tools">
                                            <a class="collapse-link">
                                                <i class="fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="ibox-content">
                                        <div class="form-group">
                                            <div class="col-sm-2">创建人</div>
                                            <div class="col-sm-10">
                                                    ${namedTextModule.createBy}
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2">创建时间</div>
                                            <div class="col-sm-10">
                                                <fmt:formatDate value="${namedTextModule.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-2">更新人</div>
                                            <div class="col-sm-10">
                                                    ${namedTextModule.updateBy}
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2">更新时间</div>
                                            <div class="col-sm-10">
                                                <fmt:formatDate value="${namedTextModule.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
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


<%--<v:javascript formName="namedTextModule" cdata="false" dynamicJavascript="true" staticJavascript="false"/>--%>
<%--<script type="text/javascript" src="<c:url value='/resource/common/scripts/validator.jsp'/>"></script>--%>

<script type="text/javascript">

    $(document).ready(function () {

        var options = {
            initialFrameHeight: 300,
            minFrameHeight: 300,
//            initialFrameWidth: "100%",
            autoClearinitialContent: false,
            initialContent: ''
        };
        var editor = new UE.ui.Editor(options);
        editor.render("moduleContent");
//        var ue = UE.getEditor('moduleContent', options);

        $('#namedTextModuleForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                title: {
                    message: '请输入名称',
                    validators: {
                        notEmpty: {
                            message: '请输入名称'
                        }
                    }
                },
                aliasName: {
                    validators: {
                        notEmpty: {
                            message: '请输入别名'
                        },
                        regexp: {
                            regexp: /^[a-z|A-Z|0-9|_|\-]*$/,
                            message: '仅限字母数字下划线以及中横线,不能含有空格'
                        },
                        remote: {
                            type: 'GET',
                            url: '${ctx}/backend/json/cms/namedTextModuleform/aliasNameCheck',
                            data:{"id": function(){return $("#id").val();}, "aliasName":function(){return $("#aliasName").val();}},
                            dataType: 'json',
                            message: '该别名已存在',
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

        initToolBarActions();
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
