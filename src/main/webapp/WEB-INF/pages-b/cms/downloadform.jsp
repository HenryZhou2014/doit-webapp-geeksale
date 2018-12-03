<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>

<%@ page import="com.doit.cms.model.Article" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>下载管理</title>
    <meta name="heading" content="<fmt:message key='articleDetail.heading'/>"/>
    <meta name="module-group" content="content-management"/>
    <meta name="module" content="download-management"/>

    <link href="${ctx}/resource/common/styles/plugins/dropzone/dropzone.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/font-awesome-zTree.css" type="text/css">

    <script src="${ctx}/resource/common/scripts/ueditor1.4/ueditor.config.js"></script>
    <script src="${ctx}/resource/common/scripts/ueditor1.4/ueditor.all.min.js"></script>

    <script src="${ctx}/resource/common/scripts/plugins/dropzone/dropzone.js"></script>

    <link href="${ctx}/resource/common/scripts/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <script type="text/javascript" src="${ctx}/resource/common/scripts/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${ctx}/resource/common/scripts/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

    <script src="${ctx}/resource/common/scripts/zTree-v3.5.02/js/jquery.ztree.all-3.5.js"></script>


    <style type="text/css">
        /* overlay */
        .overlay {
            background: rgba(0, 0, 0, 0.2);
            position: absolute;
            z-index: 1; /* required for IE */

            -webkit-transition: all 1s;
            -moz-transition: all 1s;
            -o-transition: all 1s;
            transition: all 1s;
        }

        .bottom{
            left: 15px;
            right: 15px;
            bottom: 0;
        }

        .top{
            left: 15px;
            right: 15px;
            top: 0;
        }

        a.overlay:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        /* dark overlay */
        .overlay.dark-0 {
            background-color: rgba(0, 0, 0, 0);
        }

        .picturePanel {
            /*background: #efefef;*/
            margin-top: 5px;
            padding-top: 5px;
        }

        .imageWrapper {
            height: 150px;
            overflow: hidden;
            background: whitesmoke;
        }

        .productImage {
            display: block;
        }

        .empty-image {
            /*margin-top: 45px;*/
        }

        .form-group{
            margin-bottom: 5px;
        }

        .control-label{
            font-weight: normal;
        }

        .right-panels .ibox {
            margin-bottom: 5px;
        }

        .ibox-content {
            padding: 10px;
        }

        .right-panels .ibox-title {
            padding: 5px 15px;
            min-height: 20px;
        }

        .float-e-margins .btn {
            margin-bottom: 0;
        }

        .panel-images{
            max-height : 400px;
            overflow-y: auto;
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

<c:set var="articleTitle" value="新增下载"/>

<c:if test="${not empty article.id}">
    <c:set var="articleTitle" value="${article.title}"/>
</c:if>

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
                <a>下载管理</a>
            </li>
            <li class="active">
                <strong>${articleTitle}</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>${articleTitle}</h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="${ctx}/backend/cms/downloadform.html">
                            <i class="fa fa-file-o"></i> 新增
                        </a>
                        <a id="toolbar_preview">
                            <i class="fa fa-eye"></i> 预览
                        </a>
                        <div class="btn-group">
                            <a id="toolbar_save"><i class="fa fa-save"></i> 保存</a>
                            <a class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-caret-down"></i>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a id="toolbar_save_new"><i class="fa fa-save"></i> <i class="fa fa-file-o"></i> 保存&新增</a></li>
                                <li><a id="toolbar_save_return"><i class="fa fa-save"></i> <i class="fa fa-mail-reply"></i> 保存&返回</a></li>
                                <li class="divider"></li>
                                <li><a id="toolbar_publish"><i class="fa fa-hand-o-up"></i> 发布</a></li>
                                <li><a id="toolbar_unpublish"><i class="fa fa-hand-o-down"></i> 下架</a></li>
                            </ul>
                        </div>
                        <a href="${ctx}/backend/cms/downloads.html"><i class="fa fa-mail-reply"></i> 返回</a>
                    </div>
                </div>
                <div class="ibox-content">

                    <form:form commandName="article" method="post" action="downloadform" id="articleForm"
                               class="form-horizontal"
                               enctype="multipart/form-data">
                        <form:errors path="*" cssClass="error" element="div"/>
                        <form:hidden path="id"/>
                        <form:hidden path="categoryId"/>

                        <div class="row">
                            <div class="col-lg-8">
                                <div class="tabs-container">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a data-toggle="tab" href="#tab-1">基本信息</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="tab-1" class="tab-pane active">
                                            <div class="panel-body">

                                                <div class="form-group">
                                                    <div class="col-sm-2 control-label">分类</div>
                                                    <div class="col-sm-10">
                                                        <div style="position: relative;">
                                                            <div>
                                                                <input id="citySel" name="citySel" type="text" class="form-control pull-left" readonly value="" style="width:180px;" onclick="showMenu();"/>
                                                                <a id="menuBtn" class="btn btn-default btn-md margin-left-10 pull-left" href="#" onclick="showMenu(); return false;">选择</a>
                                                            </div>

                                                            <div id="menuContent" class="menuContent" style="display:none; position: absolute;z-index: 99999; border: 1px solid lightgrey; background: #fff;">
                                                                <ul id="treeDemo2" class="ztree" style="margin-top:0; width:260px; height: 180px; background: #fff;overflow-y: auto;"></ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">标题</label>
                                                    <div class="col-sm-10">
                                                        <div class="input-group">
                                                            <div class="input-group-addon">*</div>
                                                            <form:input path="title" id="title" cssClass="form-control"
                                                                        cssErrorClass="text large error" maxlength="200"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">摘要</label>
                                                    <div class="col-sm-10">
                                                        <form:textarea path="introText" id="introText" cssClass="form-control"
                                                                       cssErrorClass="text medium error" maxlength="400" cssStyle="height:80px; max-height: 100px;"/>
                                                        <p>(不超过400个字)</p>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-2 control-label">简介</label>
                                                    <div class="col-lg-10">
                                                        <div class="input-group">
                                                            <SCRIPT id="fullText" type="text/plain" name="fullText"><%
                                                                if (request.getAttribute("fullText") != null) {
                                                                    out.print(request.getAttribute("fullText"));
                                                                }
                                                            %></SCRIPT>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 right-panels">
                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>封面</h5>
                                        <div class="ibox-tools">
                                            <a class="btn btn-default btn-xs newImageSlotButton">
                                                <i class="fa fa-picture-o"></i> 增加
                                            </a>

                                            <a id="btn-upload" class="btn btn-default btn-xs"
                                               data-toggle="modal"
                                               data-target="#myModal-upload">
                                                <i class="fa fa-upload"></i> 上传图片
                                            </a>

                                            <a class="collapse-link">
                                                <i class="fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="ibox-content">

                                        <div class="row panel-images">

                                            <c:forEach items="${article.imageInfos}" var="imageItem" varStatus="status">
                                                <div class="col-lg-6 text-center picturePanelWrapper">
                                                    <div class="picturePanel">
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <input type="text" name="pictureMemo"
                                                                       class="form-control"
                                                                       placeholder="添加图片的描述"
                                                                       value="${imageItem.memo}"
                                                                       title="${imageItem.memo}"/>
                                                            </div>
                                                        </div>
                                                        <div class="imageWrapper">
                                                            <a class="productImage" data-toggle="modal"
                                                               data-target="#myModal"
                                                               data-image-index="${status.index + 10}">
                                                                <img class="img-responsive center-block"
                                                                     src="${ctx}/${imageItem.imagePath}"/>
                                                            </a>
                                                            <input type="hidden" name="pictureUrl"
                                                                   value="${imageItem.imagePath}"/>
                                                            <input type="hidden" name="pictureId"
                                                                   value="${imageItem.id}"/>
                                                            <div class="tools overlay bottom hidden">
                                                                <a class="btn btn-sm" href="javascript:void(0);"
                                                                   onclick="changeDisplayOrder(this, 1);" title="前移"><i
                                                                        class="fa fa-arrow-left"></i></a>
                                                                <a class="btn btn-sm" href="javascript:void(0);"
                                                                   onclick="deleteImage(this);" title="删除"><i
                                                                        class="fa fa-trash"></i></a>
                                                                <a class="btn btn-sm" href="javascript:void(0);"
                                                                   onclick="changeDisplayOrder(this, -1);" title="后移"><i
                                                                        class="fa fa-arrow-right"></i></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>

                                    </div>
                                </div>

                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>附件</h5>
                                        <div class="ibox-tools">
                                            <a id="btn-uploadattachment" class="btn btn-default btn-xs"
                                               data-toggle="modal"
                                               data-target="#myModal-upload-attachments">
                                                <i class="fa fa-upload"></i> 上传附件
                                            </a>

                                            <a class="collapse-link">
                                                <i class="fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="ibox-content">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <ul id="ul-attachments" class="list-unstyled">
                                                    <c:forEach items="${article.fileInfos}" var="fileItem">
                                                        <li class="row margin-top-5">
                                                            <div class="col-lg-7">
                                                                <a class="attachment" data-path="${fileItem.filePath}" data-size="${fileItem.fileSize}" data-file-name="${fileItem.fileName}" data-file-type="${fileItem.extension}" data-id="${fileItem.id}">${fileItem.fileName}</a>
                                                            </div>
                                                            <div class="col-lg-2">
                                                                <c:choose>
                                                                    <c:when test="${(fileItem.fileSize / (1024 * 1024)) > 1.0}">
                                                                        <fmt:formatNumber value="${fileItem.fileSize / (1024 * 1024)}" maxFractionDigits="2" />MB
                                                                    </c:when>
                                                                    <c:when test="${(fileItem.fileSize / (1024)) > 1.0}">
                                                                        <fmt:formatNumber value="${fileItem.fileSize / (1024)}" maxFractionDigits="2" />KB
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        ${fileItem.fileSize}B
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <div class="pull-right">
                                                                    <a class="btn btn-default btn-xs"><i class="fa fa-fw fa-eye"></i></a>
                                                                    <a class="btn btn-default btn-xs delete"><i class="fa fa-fw fa-trash"></i></a>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>下载设置</h5>
                                        <div class="ibox-tools">
                                            <a class="collapse-link">
                                                <i class="fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="ibox-content">
                                        <div class="form-group">
                                            <div class="col-sm-3">下载范围</div>
                                            <div class="col-sm-9">
                                                <label><input type="radio" name="property.scope" value="0"/>所有人</label>
                                                <label><input type="radio" name="property.scope" value="m"/>会员</label>
                                                <label><input type="radio" name="property.scope" value="p"/>密码</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-3">下载密码</div>
                                            <div class="col-sm-9">
                                                <input type="text" name="property.passwd" class="form-control" value="${propertyMap['passwd'].propertyValue}"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>显示设置</h5>
                                        <div class="ibox-tools">
                                            <a class="collapse-link">
                                                <i class="fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="ibox-content">
                                        <div class="form-group">
                                            <div class="col-sm-3">作者</div>
                                            <div class="col-sm-9">
                                                <form:input path="author" id="author" cssClass="form-control"
                                                            cssErrorClass="text medium error" maxlength="32"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-3">标签</div>
                                            <div class="col-sm-9">
                                                <form:input path="tag" id="tag" cssClass="form-control"
                                                            cssErrorClass="text medium error" maxlength="64"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>发布设置</h5>
                                        <div class="ibox-tools">
                                            <a class="collapse-link">
                                                <i class="fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="ibox-content">
                                        <div class="form-group">
                                            <div class="col-sm-3">发布状态</div>
                                            <div class="col-sm-9">
                                                <c:choose>
                                                    <c:when test="${article.publishFlag eq '1'}">
                                                        <i class="fa fa-check"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="m-t-xs">
                                                            <label class="label label-default">未发布</label>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-3">编辑发布时间</div>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i
                                                            class="fa fa-calendar"></i></span>
                                                        <%--<form:input path="lastEditDate" id="lastEditDate" cssClass="form-control datebox"--%>
                                                        <%--cssErrorClass="text medium error" maxlength="21"/>--%>
                                                    <fmt:formatDate value="${article.lastEditDate}" pattern="yyyy-MM-dd HH:mm:ss"
                                                                    var="lastEdtiDateView"></fmt:formatDate>
                                                    <input type="text" name="lastEditDate" id="lastEditDate"
                                                           class="form-control datebox" maxlength="21"
                                                           value="${lastEdtiDateView}"/>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-3">发布人</div>
                                            <div class="col-sm-9">
                                                ${article.publishBy}
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-3">发布时间</div>
                                            <div class="col-sm-9">
                                                <fmt:formatDate value="${article.publishDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
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
                                            <div class="col-sm-3">创建人</div>
                                            <div class="col-sm-9">
                                                ${article.createBy}
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-3">创建时间</div>
                                            <div class="col-sm-9">
                                                    <fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-3">更新人</div>
                                            <div class="col-sm-9">
                                                ${article.updateBy}
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-3">更新时间</div>
                                            <div class="col-sm-9">
                                                <fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <input type="hidden" name="deletedPictures" id="deletedPictures"/>
                        <input type="hidden" name="attachmentItems" id="attachmentItems"/>
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

        <div class="modal inmodal" id="myModal-upload" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated fadeIn">
                    <div class="modal-header">
                        <h4 class="modal-title">上传文件</h4>
                    </div>
                    <div class="modal-body">
                        <div id="dropzone-images" class="dropzone">
                            <div class="dropzone-previews"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
	
	<div class="modal inmodal" id="myModal-upload-attachments" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated fadeIn">
                    <div class="modal-header">
                        <h4 class="modal-title">上传附件</h4>
                    </div>
                    <div class="modal-body">
                        <div id="dropzone-attachments" class="dropzone">
                            <div class="dropzone-previews"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content animated">
                    <div class="modal-header">
                        图库一览
                    </div>
                    <div class="modal-body">
                        <div class="row galleryWrapper">

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button"
                                class="btn btn-white modal-close-button"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script id="imagePanelTemplate" type="text/html">
    <div class="col-lg-6 text-center picturePanelWrapper">
        <div class="picturePanel">
            <div class="row">
                <div class="col-sm-12">
                    <input type="text" name="pictureMemo"
                           class="form-control"
                           placeholder="添加图片的描述"/>
                </div>
            </div>
            <div class="imageWrapper">
                <a class="productImage" data-toggle="modal"
                   data-target="#myModal" data-image-index="{{imageIndex}}">
                    <img class="img-responsive center-block empty-image"
                         src="${ctx$resource$b}/images/document-image-128.png"/>
                </a>
                <input type="hidden" name="pictureUrl"/>
                <input type="hidden" name="pictureId"/>
                <div class="tools overlay bottom hidden">
                    <a class="btn btn-sm" href="javascript:void(0);"
                       onclick="changeDisplayOrder(this, 1);" title="前移"><i
                            class="fa fa-arrow-left"></i></a>
                    <a class="btn btn-sm" href="javascript:void(0);"
                       onclick="deleteImage(this);" title="删除"><i
                            class="fa fa-trash"></i></a>
                    <a class="btn btn-sm" href="javascript:void(0);"
                       onclick="changeDisplayOrder(this, -1);" title="后移"><i
                            class="fa fa-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</script>

<script id="attachmentItemTemplate" type="text/html">
    <li class="row margin-top-5">
        <div class="col-lg-7">
            <a class="attachment" data-path="{{path}}" data-size="{{fileSize}}" data-file-name="{{fileName}}" data-file-type="{{fileType}}" data-id="">{{fileName}}</a>
        </div>
        <div class="col-lg-2">
            {{fileSizeText}}
        </div>
        <div class="col-lg-3">
            <div class="pull-right">
                <a class="btn btn-default btn-xs"><i class="fa fa-fw fa-eye"/></a>
                <a class="btn btn-default btn-xs"><i class="fa fa-fw fa-trash"/></a>
            </div>
        </div>
    </li>
</script>
<%--<v:javascript formName="article" cdata="false" dynamicJavascript="true" staticJavascript="false"/>--%>
<%--<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>--%>

<script type="text/javascript">
    //    Form.focusFirstElement($('articleForm'));
    $(document).ready(function () {
        Dropzone.autoDiscover = false;
        <c:choose>
            <c:when test="${not empty propertyMap['scope'].propertyValue}">
                <%--$("input[name='property.scope']").val('${propertyMap['scope'].propertyValue}');--%>
                $("input[name='property.scope'][value='${propertyMap['scope'].propertyValue}']").attr("checked",true);
        </c:when>
            <c:otherwise>
            $("input[name='property.scope'][value='0']").attr("checked",true);
            </c:otherwise>
        </c:choose>
        <%--$("div.dropzone").dropzone({url: "${ctx}/backend/json/gallery-article/upload?objectId=${article.id}"});--%>

        $("div#dropzone-images").dropzone({
            url: "${ctx}/backend/json/gallery-article/upload?objectId=${article.id}",
            addRemoveLinks: false,
            dictRemoveLinks: "x",
            dictCancelUpload: "x",
            maxFiles: 10,
            maxFilesize: 15,
            acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg",
            init: function() {
                this.on("success", function(file) {

                    var data = JSON.parse(file.xhr.response);


                    var dealed = false;

                    $(".picturePanelWrapper").find(".productImage img").each(function(){
                        if (dealed){
                            return;
                        }
                        if($(this).attr("src") == "${ctx}/b/resource/images/document-image-128.png"){
                            $(this).attr("src", "${ctx}/" + data.url);
                            $(this).parents(".picturePanelWrapper").find("input[name='pictureUrl']").val(data.url);
                            dealed = true;
                        }
                    });

                });
                this.on("removedfile", function(file) {

                });
            }
        });

        $("div#dropzone-attachments").dropzone({
            url: "${ctx}/backend/json/attachment-article/upload?objectId=${article.id}",
            addRemoveLinks: false,
            dictRemoveLinks: "x",
            dictCancelUpload: "x",
            maxFiles: 10,
            maxFilesize: 2000,
//            acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg",
            init: function() {
                this.on("success", function(file) {

                    var data = JSON.parse(file.xhr.response);

                    var dealed = false;

                    var html = template("attachmentItemTemplate", data);
                    $("#ul-attachments").append(html);

                });
                this.on("removedfile", function(file) {

                });
            }
        });

        var options = {
            minFrameHeight: 500,
            initialFrameHeight: 300,
            autoClearinitialContent: false,
            initialContent: ''
        };

        var editor = new UE.ui.Editor(options);
        editor.render("fullText");

        $('.datebox').datetimepicker({
            todayHighlight: true,
            todayBtn: "linked",
            keyboardNavigation: false,
            autoclose: true,
            weekStart: 1,
            startView: 2,
            forceParse: true,
            format: 'yyyy-mm-dd hh:ii:ss'
        });

        $('#articleForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                title: {
                    message: '文章标题不能为空',
                    validators: {
                        notEmpty: {
                            message: '文章标题不能为空'
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {
            // 转换、获取附件列表信息
            var attachments = new Array();
            $("#ul-attachments li a.attachment").each(function(){
                var filePath = $(this).attr("data-path");
                var fileSize = $(this).attr("data-size");
                var fileName = $(this).attr("data-file-name");
                var fileType = $(this).attr("data-file-type");
                var id = $(this).attr("data-id");
                var item = {id: id, filePath: filePath, fileSize: fileSize, fileName: fileName, fileType: fileType};
                attachments.push(item);
            });
            $("input[name='attachmentItems']").val(JSON.stringify(attachments));
        });

        $(".newImageSlotButton").click(function () {
            var newImageindex = $(".productImage").size();

            var data = {imageIndex: newImageindex};
            var html = template("imagePanelTemplate", data);

            $(".panel-images").append(html);
        });

        $(document).on("mouseover", ".imageWrapper", function () {
            $(this).find(".tools").toggleClass("hidden");
        });

        $(document).on("mouseout", ".imageWrapper", function () {
            $(this).find(".tools").toggleClass("hidden");
        });

        $(document).on("click", ".productImage", function () {
            var imageIndex = $(this).attr("data-image-index");
            $(".galleryWrapper").html("");
            $(".galleryWrapper").load("${ctx}/backend/panel/file-management/images",
                    {objectType: "article", objectId: "${article.id}", imageIndex: imageIndex},
                    function () {
                        $(".tagFile").on("click", function () {
                            processImage(this);
                        });
                    });
        });

//        $('.datebox').datetimepicker('hide');

        initToolBarActions();

        if($(".productImage").size() == 0){
            $(".newImageSlotButton").click();
        }

        var setting2 = {
            check: {
                enable: true,
                chkStyle: "radio",
                radioType: "all"
            },
            view: {
                dblClickExpand: false
            },
            data: {
                simpleData: {
                    enable: false
                }
            },
            callback: {
                onClick: onClick2,
                onCheck: onCheck
            },
            async: {
                url: "${ctx}/backend/json/articleCategories/ztree",
                otherParam:{
                    root: "download",
                    include:true,
                    depth:0,
                    open:2
                },
                enable: true,
                type: "post"
            }

        };

        var zNodes2 = [
            {id: 1, pId: 0, name: "北京"},
            {id: 2, pId: 0, name: "天津"},
            {id: 3, pId: 0, name: "上海"},
            {id: 6, pId: 0, name: "重庆"},
            {id: 4, pId: 0, name: "河北省", open: true, nocheck: true},
            {id: 41, pId: 4, name: "石家庄"},
            {id: 42, pId: 4, name: "保定"},
            {id: 43, pId: 4, name: "邯郸"},
            {id: 44, pId: 4, name: "承德"},
            {id: 5, pId: 0, name: "广东省", open: true, nocheck: true},
            {id: 51, pId: 5, name: "广州"},
            {id: 52, pId: 5, name: "深圳"},
            {id: 53, pId: 5, name: "东莞"},
            {id: 54, pId: 5, name: "佛山"},
            {id: 6, pId: 0, name: "福建省", open: true, nocheck: true},
            {id: 61, pId: 6, name: "福州"},
            {id: 62, pId: 6, name: "厦门"},
            {id: 63, pId: 6, name: "泉州"},
            {id: 64, pId: 6, name: "三明"}
        ];

        $.fn.zTree.init($("#treeDemo2"), setting2, []);

        $("#citySel").val("${article.articleCategory.title}");

        $("#btn-uploadattachment").click(function(){

        });

        // 附件删除按钮
        $("#ul-attachments").on("click", ".delete", function(){
            var li = $(this).closest("li");
            var file = $(li).find(".attachment");

            var itemId = $(file).attr("data-id");
            if (itemId == ""){
                // 新增的附件，直接删除
                $(li).remove();
            }
            else{
                // 已经增加的附件，请求删除
                $.ajax({
                    type: "POST",
                    url: "${ctx}/backend/json/attachment/delete",
                    data: {attachmentId : itemId},
                    success: function(data){
                        if (data && data.flag == "1"){
                            $(li).remove();
                        }
                        else{
                            toastError("错误", data.msg);
                        }
                    },
                    dataType: "json"
                });
            }
        });
    });

    function initToolBarActions() {

        // 预览按钮
        $("#toolbar_preview").bind("click", function () {

        });

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

        // 发布
        $("#toolbar_publish").bind("click", function () {
            $("#ButtonPublish").click();
        });

        // 取消发布
        $("#toolbar_unpublish").bind("click", function () {
            $("#ButtonUnpublish").click();
        });
    }

    function processImage(choosedImage) {
        var choosedImageUrl = $(choosedImage).attr("data-image-url");

        var imageIndex = $(choosedImage).attr("data-trigger-index");

        $(".productImage[data-image-index='" + imageIndex + "']").parent().find("input[name='mainPictureUrl']").val(choosedImageUrl);
        $(".productImage[data-image-index='" + imageIndex + "']").parent().find("input[name='pictureUrl']").val(choosedImageUrl);

        $(".productImage[data-image-index='" + imageIndex + "'] img").attr("src", "${ctx}/" + choosedImageUrl);

        $(".modal-close-button").click();
    }

    function deleteImage(imageItself) {
        var panelWrapper = $(imageItself).parents(".picturePanelWrapper").first();

        var pictureId = $(panelWrapper).find("input[name=pictureId]").val();
        if (pictureId) {
            $("#deletedPictures").val($("#deletedPictures").val() + "," + pictureId);
        }
        $(panelWrapper).remove();
    }

    function changeDisplayOrder(imageItself, order) {
        var image = $(imageItself).parents(".picturePanelWrapper").first();

        if (order == 1) {
            if ($(image).index() == 0) {
                return;
            }
            var prev = $(image).prev();
            if (prev) {
                $(image).remove();
                $(prev).before($(image));
            }
        }
        else if (order == -1) {
            var next = $(image).next();
            if ($(image).index() == $(".picturePanelWrapper").length - 1) {
                return;
            }
            if (next) {
                $(image).remove();
                $(next).after($(image));
            }
        }
    }

    function showMenu() {
        var cityObj = $("#citySel");
        var cityOffset = $("#citySel").offset();
        $("#menuContent").css({left: "0px", top: cityObj.outerHeight() + "px", display: "block"}).slideDown("fast");

        $("body").bind("mousedown", onBodyDown);
    }
    function hideMenu() {
        $("#menuContent").fadeOut("fast");
        $("body").unbind("mousedown", onBodyDown);
    }

    function onBodyDown(event) {
        if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
            hideMenu();
        }
    }

    function onClick2(e, treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo2");
        zTree.checkNode(treeNode, !treeNode.checked, null, true);
        return false;
    }

    function onCheck(e, treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo2"),
            nodes = zTree.getCheckedNodes(true),
            v = "";
        var groupId = "";
        for (var i = 0, l = nodes.length; i < l; i++) {
            v += nodes[i].name + ",";
            groupId = nodes[i].id;
        }
        if (v.length > 0) v = v.substring(0, v.length - 1);
        console.log("selected:" + v);
        $("#citySel").val(v);
        $("#categoryId").val(groupId);
    }
</script>
