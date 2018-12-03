<%@ page import="com.doit.cms.model.NamedTextModule" %>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>${namedTextModule.title}-${columnMenu}</title>
    <meta name="module-group" content="column-management"/>
    <meta name="module-subgroup" content="column-${columnName}"/>
    <meta name="module" content="column-${columnName}-fixedcontent"/>

    <script src="${ctx}/resource/common/scripts/ueditor1.4/ueditor.config.js"></script>
    <script src="${ctx}/resource/common/scripts/ueditor1.4/ueditor.all.min.js"></script>

</head>

<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <%--<h2>Basic Form</h2>--%>
        <ol class="breadcrumb">
            <li>
                <a href="${ctx}/backend/index.html">首页</a>
            </li>
            <li>
                <a>栏目管理</a>
            </li>
            <li>
                <a>${columnMenu}</a>
            </li>
            <li>
                <a>内容管理</a>
            </li>
            <li>
                <a class="active">${namedTextModule.title}</a>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>内容编辑</h5>
                    <div class="ibox-tools">
                        <a id="toolbar_reload" href="javascript:void(0);">
                            <i class="fa fa-refresh"></i> 刷新
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <form:form commandName="namedTextModule" method="post" action="fixed-articleform" id="articleForm"
                               class="form-horizontal">
                        <form:errors path="*" cssClass="error" element="div"/>
                        <form:hidden path="id"/>

                        <input type="hidden" name="columns" value="${columns}"/>

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
                                                maxlength="30" required="" readonly="true"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group"><label class="col-sm-2 control-label">内容类型</label>

                            <div class="col-sm-10">
                                <div class="radio-inline">
                                    <form:radiobutton path="contentType" id="c1" value="HTML"/>
                                    <label for="c1"> HTML </label>
                                </div>
                                <div class="radio-inline">
                                    <form:radiobutton path="contentType" id="c2" value="TEXT"/>
                                    <label for="c2"> TEXT </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group"><label class="col-sm-2 control-label">说明</label>

                            <div class="col-sm-10">
                                <form:input path="memo" id="memo" cssClass="form-control" cssErrorClass="text medium error"
                                            maxlength="80"/>
                            </div>
                        </div>
                        <div class="form-group"><label class="col-sm-2 control-label">内容</label>

                            <div class="col-sm-10">
                                <%
                                    NamedTextModule namedTextModule = (NamedTextModule) request.getAttribute("namedTextModule");
                                %>
                                <SCRIPT id="moduleContent" type="text/plain" name="moduleContent" style="width:100%"><%
                                    if (namedTextModule != null && namedTextModule.getModuleContent() != null) {
                                        out.print(namedTextModule.getModuleContent());
                                    }
                                %></SCRIPT>
                            </div>
                        </div>

                        <c:if test="${not empty namedTextModule.id}">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">创建时间</label>
                                <div class="col-sm-10">
                                    <div class="form-control" style="border: none;">
                                        <fmt:formatDate value="${namedTextModule.createDate}"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/> ${namedTextModule.createBy}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">更新时间</label>
                                <div class="col-sm-10">
                                    <div class="form-control" style="border: none;">
                                        <fmt:formatDate value="${namedTextModule.updateDate}"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/> ${namedTextModule.updateBy}
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <%--<a class="btn btn-white" href="${ctx}/backend/column-${columnName}/fixed-articles" onclick="history.back();">取消</a>--%>
                                <a class="btn btn-white" href="javascript:void(0);" onclick="history.back();">取消</a>
                                <security:authorize ifAnyGranted="ROLE_WEBSITE_FIXED_CONTENT_EDIT">
                                    <button class="btn btn-primary" type="submit">保存</button>
                                </security:authorize>
                            </div>
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
        initToolBarActions();
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

    });

    function initToolBarActions() {
        // 刷新按钮
        $("#toolbar_reload").bind("click", function () {
            action_reload();
        });

        $("#toolbar_save").click(function(){
            $("#articleForm").submit();
        });
    }

    function action_reload() {
        location.href = '${ctx}/backend/column-${columnName}/fixed-articleform?id=${namedTextModule.id}';
    }
</script>
