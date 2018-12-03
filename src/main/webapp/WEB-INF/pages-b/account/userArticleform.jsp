<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>

<%@ page import="com.doit.cms.model.Article" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="articleDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='articleDetail.heading'/>"/>
    <meta name="module-group" content="account-management"/>
    <meta name="module" content="user-drafts"/>


    <link href="${ctx}/resource/common/styles/plugins/dropzone/dropzone.css" rel="stylesheet">

    <script src="<c:url value='/resource/common/scripts/ueditor1.4/ueditor.config.js'/>"></script>
    <script src="<c:url value='/resource/common/scripts/ueditor1.4/ueditor.all.min.js'/>"></script>

    <script src="${ctx}/resource/common/scripts/plugins/dropzone/dropzone.js"></script>

    <link href="${ctx}/resource/common/scripts/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css"
          rel="stylesheet">
    <script type="text/javascript"
            src="${ctx}/resource/common/scripts/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"
            charset="UTF-8"></script>
    <script type="text/javascript"
            src="${ctx}/resource/common/scripts/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
            charset="UTF-8"></script>


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

<c:set var="articleTitle" value="会员投稿"/>

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
                <a>会员管理</a>
            </li>
            <li>
                <strong>投稿管理</strong>
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
                        <%--<a id="toolbar_new" href="${ctx}/backend/cms/articleform.html">
                            <i class="fa fa-plus-circle"></i> 增加
                        </a>--%>
                    </div>
                </div>
                <div class="ibox-content">

                    <form:form commandName="article" method="post" action="articleform" id="articleForm"
                               class="form-horizontal"
                               enctype="multipart/form-data">
                        <form:errors path="*" cssClass="error" element="div"/>
                        <form:hidden path="id"/>

                        <div class="tabs-container">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#tab-1">基本信息</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane active">
                                    <div class="panel-body">

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">稿件分类</label>
                                                <div class="col-sm-10">
                                                    <div class="input-group">
                                                        <div class="input-group-addon">*</div>
                                                        <form:input path="articleCategory.title" id="category" cssClass="form-control"
                                                                    cssErrorClass="text large error" disabled="true" readonly="true"/>
                                                    </div>
                                                </div>
                                            </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">标题</label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <div class="input-group-addon">*</div>
                                                    <form:input path="title" id="title" cssClass="form-control"
                                                                cssErrorClass="text large error" disabled="true" readonly="true"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">作者</label>
                                            <div class="col-sm-10">
                                                <form:input path="author" id="author" cssClass="form-control"
                                                            cssErrorClass="text medium error" disabled="true" readonly="true"/>
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
                            </div>
                        </div>
                        <div class="form-group m-t">
                            <div class="col-sm-12 text-center">
                                <a class="btn btn-white" href="${ctx}/backend/cms/userArticles.html">返回</a>
                                <c:if test="${article.id != null}">
                                    <a class="btn btn-primary" href="${ctx}/backend/cms/publishArticle?id=${article.id}">发布</a>
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
                        <button type="button" class="btn btn-primary" id="btn-confirm-upload">确认</button>
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

        $("div.dropzone").dropzone({url: "${ctx}/backend/json/gallery-article/upload?objectId=${article.id}"});

        var options = {
            minFrameHeight: 500,
            initialFrameHeight: 300,
            autoClearinitialContent: false,
            initialContent: ''
        };

        var editor = new UE.ui.Editor(options);
        editor.render("fullText");

        $('.datebox').datepicker({
            todayHighlight: true,
            todayBtn: "linked",
            keyboardNavigation: false,
            autoclose: true,
            format: "yyyy/mm/dd"

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
                }, author: {
                    message: '作者不能为空',
                    validators: {
                        notEmpty: {
                            message: '作者不能为空'
                        }
                    }
                }, introText: {
                    message: '摘要不能为空',
                    validators: {
                        notEmpty: {
                            message: '摘要不能为空'
                        }
                    }
                }, lastEditDate: {
                    message: '编辑时间不能为空',
                    validators: {
                        notEmpty: {
                            message: '编辑时间不能为空'
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

//        $('.datebox').datetimepicker('hide');

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
