<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>

<%@ page import="com.doit.cms.model.Article" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>新闻详情</title>
    <meta name="heading" content="<fmt:message key='articleDetail.heading'/>"/>
    <meta name="module-group" content="column-management"/>
    <meta name="module-subgroup" content="column-${columnName}"/>
    <meta name="module" content="${categoryName}"/>

    <link href="${ctx}/resource/common/styles/plugins/dropzone/dropzone.css" rel="stylesheet">

    <script src="<c:url value='/resource/common/scripts/ueditor1.4/ueditor.config.js'/>"></script>
    <script src="<c:url value='/resource/common/scripts/ueditor1.4/ueditor.all.min.js'/>"></script>

    <script src="${ctx}/resource/common/scripts/plugins/dropzone/dropzone.js"></script>

    <style type="text/css">
        /* overlay */
        .overlay {
            background: rgba(0, 0, 0, 0.2);
            position: absolute;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 1; /* required for IE */

            -webkit-transition: all 1s;
            -moz-transition: all 1s;
            -o-transition: all 1s;
            transition: all 1s;
        }

        a.overlay:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        /* dark overlay */
        .overlay.dark-0 {
            background-color: rgba(0, 0, 0, 0);
        }

        .picturePanel {
            background: #efefef;
            margin-top: 5px;
            padding-top: 5px;
        }

        .imageWrapper {
            height: 250px;
            overflow: hidden;
            background: whitesmoke;

        }

        .productImage {
            display: block;
        }

        .empty-image {
            /*margin-top: 45px;*/
        }
    </style>
</head>

<c:set var="articleTitle" value="新增文章"/>

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
                <a>栏目管理</a>
            </li>
            <li>
                <a><fmt:message key="${columnMenu}"></fmt:message> </a>
            </li>
            <li>
                <a><fmt:message key="${moduleMenu}"></fmt:message></a>
            </li>
            <li>
                <a>${articleTitle}</a>
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
                        <a id="toolbar_new" href="${ctx}/backend/cms/articleform.html">
                            <i class="fa fa-plus-circle"></i> 增加
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <c:if test="${article.publishFlag eq '1'}">
                        <div style="text-align: center;">
                            <div class="label label-warning text-center">
                                该内容已经发布，不能修改
                            </div>
                        </div>
                    </c:if>

                    <form:form commandName="article" method="post" action="articleform" id="articleForm"
                               class="form-horizontal"
                               enctype="multipart/form-data">
                        <form:errors path="*" cssClass="error" element="div"/>
                        <form:hidden path="id"/>

                        <div class="tabs-container">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#tab-1">基本信息</a></li>
                                <li class=""><a data-toggle="tab" href="#tab-2">图片管理</a></li>
                                <li class=""><a data-toggle="tab" href="#tab-3">SEO设置</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane active">
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">文章分类</label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <div class="input-group-addon">*</div>
                                                    <form:select path="categoryId" cssClass="form-control">
                                                        <c:forEach items="${articleCategoryList}" var="item">
                                                            <form:option value="${item.id}"
                                                                         label="${item.title}"></form:option>
                                                        </c:forEach>
                                                    </form:select>
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
                                            <label class="col-sm-2 control-label">别名</label>
                                            <div class="col-sm-10">
                                                <form:input path="aliasName" id="aliasName" cssClass="form-control"
                                                            cssErrorClass="text medium error" maxlength="30"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">标签</label>
                                            <div class="col-sm-10">
                                                <form:input path="tag" id="tag" cssClass="form-control"
                                                            cssErrorClass="text medium error" maxlength="64"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">引用来源</label>
                                            <div class="col-sm-10">
                                                <form:input path="refSource" id="refSource" cssClass="form-control"
                                                            cssErrorClass="text medium error" maxlength="64"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">作者</label>
                                            <div class="col-sm-10">
                                                <form:input path="author" id="author" cssClass="form-control"
                                                            cssErrorClass="text medium error" maxlength="32"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">摘要</label>
                                            <div class="col-sm-10">
                                                <form:textarea path="introText" id="introText" cssClass="form-control"
                                                               cssErrorClass="text medium error" maxlength="40000"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">正文</label>
                                            <div class="col-lg-10">
                                                <div class="input-group">
                                                    <%
                                                        Article article = (Article) request.getAttribute("article");
                                                    %>
                                                    <SCRIPT id="fullText" type="text/plain" name="fullText"><%
                                                        if (article != null && article.getFullText() != null) {
                                                            out.print(article.getFullText());
                                                        }
                                                    %></SCRIPT>
                                                </div>
                                            </div>
                                        </div>

                                        <c:if test="${not empty article.id}">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">发布状态</label>
                                                <div class="col-sm-10">
                                                    <div class="form-control" style="border: none;">
                                                        <c:choose>
                                                            <c:when test="${article.publishFlag eq '1'}">
                                                                <fmt:formatDate value="${article.publishDate}"
                                                                                pattern="yyyy-MM-dd HH:mm:ss"/>
                                                                ${article.publishBy}
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
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">创建时间</label>
                                                <div class="col-sm-10">
                                                    <div class="form-control" style="border: none;">
                                                        <fmt:formatDate value="${article.createDate}"
                                                                        pattern="yyyy-MM-dd HH:mm:ss"/> ${article.createBy}
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">更新时间</label>
                                                <div class="col-sm-10">
                                                    <div class="form-control" style="border: none;">
                                                        <fmt:formatDate value="${article.updateDate}"
                                                                        pattern="yyyy-MM-dd HH:mm:ss"/> ${article.updateBy}
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                    </div>
                                </div>
                                <div id="tab-2" class="tab-pane">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="pull-right">
                                                    <button class="btn btn-default newImageSlotButton">
                                                        <i class="fa fa-picture-o"></i> 增加
                                                    </button>

                                                    <a id="btn-upload" class="btn btn-default" data-toggle="modal"
                                                       data-target="#myModal-upload">
                                                        <i class="fa fa-upload"></i> 上传图片
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 text-center picturePanelWrapper mainPictureWrapper">
                                                <div class="picturePanel">
                                                    <div>
                                                        <h4>主图
                                                        </h4>
                                                    </div>
                                                    <div>
                                                        <a class="btn btn-sm" href="javascript:void(0);" title="删除"><i
                                                                class="fa fa-trash"></i></a>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <input type="text" name="mainPictureMemo"
                                                                   class="form-control" value="${mainPicture.memo}"
                                                                   placeholder="添加图片的描述"/>
                                                        </div>
                                                    </div>
                                                    <div class="imageWrapper">
                                                        <a class="productImage mainImage" data-toggle="modal"
                                                           data-target="#myModal" data-image-index="1">
                                                            <c:choose>
                                                                <c:when test="${not empty mainPicture}">
                                                                    <img class="img-responsive center-block"
                                                                         src="${ctx}/${mainPicture.imagePath}"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img class="img-responsive center-block empty-image"
                                                                         src="${ctx$b}/resource/images/document-image-128-02.png"/>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </a>
                                                        <input type="hidden" name="mainPictureUrl"
                                                               value="${mainPicture.imagePath}"/>
                                                        <input type="hidden" name="mainPictureId"
                                                               value="${mainPicture.id}"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <c:forEach items="${displayPictures}" var="imageItem" varStatus="status">
                                                <div class="col-lg-3 text-center picturePanelWrapper">
                                                    <div class="picturePanel">
                                                        <div>
                                                            <h4>
                                                                展示图
                                                            </h4>
                                                        </div>
                                                        <div>
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
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <input type="text" name="pictureMemo"
                                                                       class="form-control" placeholder="添加图片的描述"
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
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                            <div class="col-lg-3 text-center picturePanelWrapper pictureTemplate hidden">
                                                <div class="picturePanel">
                                                    <div>
                                                        <h4>
                                                            展示图
                                                        </h4>
                                                    </div>
                                                    <div>
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
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <input type="text" name="pictureMemo" class="form-control"
                                                                   placeholder="添加图片的描述"/>
                                                        </div>
                                                    </div>
                                                    <div class="imageWrapper">
                                                        <a class="productImage" data-toggle="modal"
                                                           data-target="#myModal" data-image-index="0">
                                                            <img class="img-responsive center-block empty-image"
                                                                 src="${ctx$b}/resource/images/document-image-128-02.png"/>
                                                        </a>
                                                        <input type="hidden" name="pictureUrl"/>
                                                        <input type="hidden" name="pictureId"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div id="tab-3" class="tab-pane">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">meta keywords</label>
                                            <div class="col-sm-10">
                                                <form:input path="metaKey" id="metaKey" cssClass="form-control"
                                                            cssErrorClass="text medium error" maxlength="100"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">meta description</label>
                                            <div class="col-sm-10">
                                                <form:input path="metaDesc" id="metaDesc" cssClass="form-control"
                                                            cssErrorClass="text medium error" maxlength="200"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group m-t">
                            <div class="col-sm-12 text-center">
                                <a class="btn btn-white" href="${ctx}/backend/column-${columnName}/${categoryName}/articles.html">取消</a>
                                <c:if test="${article.publishFlag != '1'}">
                                    <button class="btn btn-primary" type="submit">保存</button>
                                </c:if>
                                <c:if test="${article.id != null && columnName != 'supplement'}">
                                    <a class="btn btn-success" href="${ctx}/${columnName}/item-${article.id}.html" target="_bland">预览</a>
                                </c:if>
                            </div>
                        </div>
                        <input type="hidden" name="deletedPictures" id="deletedPictures"/>
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
                        <div class="dropzone">
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


<%--<v:javascript formName="article" cdata="false" dynamicJavascript="true" staticJavascript="false"/>--%>
<%--<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>--%>

<script type="text/javascript">
    //    Form.focusFirstElement($('articleForm'));
    $(document).ready(function () {
        Dropzone.autoDiscover = false;

        <%--$("div.dropzone").dropzone({url: "${ctx}/backend/json/gallery-article/upload?objectId=${article.id}"});--%>

        $("div.dropzone").dropzone({
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

                    if ($(".mainPictureWrapper .mainImage img").attr("src") == "${ctx$b}/resource/images/document-image-128-02.png"){
                        $(".mainPictureWrapper .mainImage img").attr("src", "${ctx}/" + data.url);
                        $(".mainPictureWrapper input[name='mainPictureUrl']").val(data.url);
                    }
                    else {
                        var dealed = false;
                        $(".picturePanelWrapper").not(".pictureTemplate, .mainPictureWrapper").find(".productImage img").each(function(){
                            if (dealed){
                                return;
                            }
                            if($(this).attr("src") == "${ctx$b}/resource/images/document-image-128-02.png"){
                                $(this).attr("src", "${ctx}/" + data.url);
                                $(this).parents(".picturePanelWrapper").find("input[name='pictureUrl']").val(data.url);
                                dealed = true;
                            }
                        });
                    }

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

        });

        liveProductImageClickAction();

        $(".newImageSlotButton").click(function () {
            var template = $(".pictureTemplate").clone();
            $(template).removeClass("pictureTemplate");
            $(template).removeClass("hidden");

            var newImageindex = $(".productImage").size();

            $(template).find(".productImage").attr("data-image-index", newImageindex + 1);

            $(".pictureTemplate").before($(template));

            liveProductImageClickAction();
        });
    });

    function liveProductImageClickAction() {
        $(".productImage").click(function () {
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
            var prev = $(image).prev();
            if (prev && !$(prev).hasClass("mainPictureWrapper")) {
                $(image).remove();
                $(prev).before($(image));
            }
        }
        else if (order == -1) {
            var next = $(image).next();
            if (next && !$(next).hasClass("pictureTemplate")) {
                $(image).remove();
                $(next).after($(image));
            }
        }
    }
</script>
