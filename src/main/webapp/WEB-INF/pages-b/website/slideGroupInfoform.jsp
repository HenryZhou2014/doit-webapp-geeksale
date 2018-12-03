<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<c:set var="articleTitle" value="新增幻灯片"/>

<c:if test="${not empty slideGroupInfo.id}">
    <c:set var="articleTitle" value="${slideGroupInfo.groupName}"/>
</c:if>

<head>
    <title>${articleTitle}</title>
    <meta name="heading" content="<fmt:message key='slideGroupInfoDetail.heading'/>"/>

    <meta name="module-group" content="content-management"/>
    <meta name="module" content="slides"/>

    <link href="${ctx}/resource/common/styles/plugins/dropzone/dropzone.css" rel="stylesheet">
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
                <a href="${ctx}/backend/cms/slideGroupInfos.html">幻灯片管理</a>
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
                        <a id="toolbar_new" href="${ctx}/backend/cms/slideGroupInfoform.html">
                            <i class="fa fa-plus-circle"></i> 增加
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div>
                        <form:form commandName="slideGroupInfo" method="post" action="slideGroupInfoform"
                                   id="slideGroupInfoForm"
                                   class="form-horizontal">
                            <form:errors path="*" cssClass="error" element="div"/>
                            <form:hidden path="id"/>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">幻灯片名称</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <div class="input-group-addon">*</div>
                                        <form:input path="groupName" id="groupName" cssClass="form-control"
                                                    cssErrorClass="text medium error"
                                                    maxlength="60"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">别名</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <div class="input-group-addon">*</div>
                                        <form:input path="aliasName" id="aliasName" cssClass="form-control"
                                                    cssErrorClass="text medium error"
                                                    maxlength="60"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 col-sm-2 control-label">图片宽</label>
                                <div class="col-lg-10 col-sm-10">
                                    <form:input path="width" id="width" cssClass="form-control"
                                                cssErrorClass="text medium error"
                                                maxlength="60"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 col-sm-2 control-label">图片高</label>
                                <div class="col-lg-10 col-sm-10">
                                    <form:input path="height" id="height" cssClass="form-control"
                                                cssErrorClass="text medium error"
                                                maxlength="60"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-10">
                                    <form:input path="memo" id="memo" cssClass="form-control" cssErrorClass="text medium error" maxlength="60"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-2 text-right">
                                    <label class="control-label">图片</label>
                                </div>
                                <div class="col-sm-10">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="text-right">
                                                <a class="btn btn-default newImageSlotButton">
                                                    <i class="fa fa-picture-o"></i> 增加
                                                </a>

                                                <a id="btn-upload" class="btn btn-default" data-toggle="modal"
                                                   data-target="#myModal-upload">
                                                    <i class="fa fa-upload"></i> 上传图片
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div style="background: #efefef; min-height: 280px;">
                                            <c:forEach items="${slideGroupInfo.slides}" var="imageItem"
                                                       varStatus="status">
                                                <div class="col-lg-3 text-center picturePanelWrapper">
                                                    <div class="picturePanel">
                                                        <div>
                                                            <h4>
                                                                幻灯片
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
                                                                <input type="text" name="pictureTitle"
                                                                       class="form-control" placeholder="添加图片的标题"
                                                                       value="${imageItem.title}"
                                                                       title="${imageItem.title}" maxlength="60"/>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <input type="text" name="pictureMemo"
                                                                       class="form-control" placeholder="添加图片的描述"
                                                                       value="${imageItem.memo}"
                                                                       title="${imageItem.memo}" maxlength="128"/>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <input type="text" name="pictureTargetUrl"
                                                                       class="form-control" placeholder="添加图片的目标URL"
                                                                       value="${imageItem.targetUrl}"
                                                                       title="${imageItem.targetUrl}" maxlength="100"/>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <input type="text" name="pictureDateInfo"
                                                                       class="form-control" placeholder="日期信息"
                                                                       value="${imageItem.dateInfo}"
                                                                       title="${imageItem.dateInfo}" maxlength="100"/>
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
                                                            幻灯片
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
                                                            <input type="text" name="pictureTitle" class="form-control"
                                                                   placeholder="添加图片的标题" maxlength="60"/>
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <input type="text" name="pictureMemo" class="form-control"
                                                                   placeholder="添加图片的描述" maxlength="128"/>
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <input type="text" name="pictureTargetUrl"
                                                                   class="form-control" placeholder="添加图片的目标路径"
                                                                   maxlength="100"/>
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <input type="text" name="pictureDateInfo"
                                                                   class="form-control" placeholder="日期信息"
                                                                   maxlength="100"/>
                                                        </div>
                                                    </div>
                                                    <div class="imageWrapper">
                                                        <a class="productImage" data-toggle="modal"
                                                           data-target="#myModal" data-image-index="0">
                                                            <img class="img-responsive center-block empty-image"
                                                                 src="${ctx$resource$b}/images/document-image-128-02.png"/>
                                                        </a>
                                                        <input type="hidden" name="pictureUrl"/>
                                                        <input type="hidden" name="pictureId"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div style="clear: both;"></div>
                                        </div>
                                    </div>

                                </div>

                            </div>

                            <div class="form-group m-t">
                                <div class="col-sm-12 text-center">
                                    <a class="btn btn-white" href="${ctx}/backend/cms/slideGroupInfos.html">取消</a>
                                    <button class="btn btn-primary" type="submit">保存</button>
                                </div>
                            </div>

                            <input type="hidden" name="deletedPictures" id="deletedPictures"/>

                        </form:form>
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
        </div>
    </div>
</div>

<script id="imageTemplate" type="text/html">
    <div class="col-lg-3 text-center picturePanelWrapper">
        <div class="picturePanel">
            <div>
                <h4>
                    幻灯片
                </h4>
            </div>
            <div>
                <a class="btn btn-sm" href="javascript:void(0);" title="前移"><i class="fa fa-arrow-left"></i></a>
                <a class="btn btn-sm" href="javascript:void(0);" title="删除"><i class="fa fa-trash"></i></a>
                <a class="btn btn-sm" href="javascript:void(0);" title="后移"><i class="fa fa-arrow-right"></i></a>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <input type="text" name="pictureTitle" class="form-control" placeholder="添加图片的标题" maxlength="60"/>
                </div>
                <div class="col-sm-12">
                    <input type="text" name="pictureMemo" class="form-control" placeholder="添加图片的描述" maxlength="128"/>
                </div>
                <div class="col-sm-12">
                    <input type="text" name="pictureTargetUrl" class="form-control" placeholder="添加图片的目标路径" maxlength="100"/>
                </div>
                <div class="col-sm-12">
                    <input type="text" name="pictureDateInfo" class="form-control" placeholder="日期信息" maxlength="100"/>
                </div>
            </div>
            <div class="imageWrapper">
                <a class="productImage" data-toggle="modal" data-target="#myModal" data-image-index="0">
                    <img class="img-responsive center-block empty-image" src="${ctx$resource$b}/images/document-image-128-02.png"/>
                </a>
                <input type="hidden" name="pictureUrl"/>
                <input type="hidden" name="pictureId"/>
            </div>
        </div>
    </div>
</script>

<script type="text/javascript">
    //    Form.focusFirstElement($('accountForm'));
    //    $("#academyName").focus();

    $(document).ready(function () {

        Dropzone.autoDiscover = false;
//        Dropzone.prototype.defaultOptions.acceptedFiles = ".png,.jpg,.gif,.bmp,.jpeg";

        <%--$("div.dropzone").dropzone({url: "${ctx}/backend/json/gallery-slides/upload?objectId=${slideGroupInfo.id}"});--%>

        $("div.dropzone").dropzone({
            url: "${ctx}/backend/json/gallery-slides/upload?objectId=${slideGroupInfo.id}",
            addRemoveLinks: false,
            dictRemoveLinks: "x",
            dictCancelUpload: "x",
            maxFiles: 10,
            maxFilesize: 15,
            acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg",
            init: function () {
                this.on("success", function (file) {

                    var data = JSON.parse(file.xhr.response);

                    if ($(".mainPictureWrapper .mainImage img").attr("src") == "${ctx$b}/resource/images/document-image-128-02.png") {
                        $(".mainPictureWrapper .mainImage img").attr("src", "${ctx}/" + data.url);
                        $(".mainPictureWrapper input[name='mainPictureUrl']").val(data.url);
                    }
                    else {
                        var dealed = false;
                        $(".picturePanelWrapper").not(".pictureTemplate, .mainPictureWrapper").find(".productImage img").each(function () {
                            if (dealed) {
                                return;
                            }
                            if ($(this).attr("src") == "${ctx$b}/resource/images/document-image-128-02.png") {
                                $(this).attr("src", "${ctx}/" + data.url);
                                $(this).parents(".picturePanelWrapper").find("input[name='pictureUrl']").val(data.url);
                                dealed = true;
                            }
                        });
                    }

                });
                this.on("removedfile", function (file) {

                });
            }
        });

        $('#slideGroupInfoForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                groupName: {
                    message: '名称不能为空',
                    validators: {
                        notEmpty: {
                            message: '名称不能为空'
                        }
                    }
                },
                aliasName: {
                    message: '别名不能为空',
                    validators: {
                        notEmpty: {
                            message: '别名不能为空'
                        },
                        remote: {
                            type: 'POST',
                            url: '${ctx}/backend/json/slideGroupInfo/checkCliasName',
                            data: {
                                "id": function () {
                                    return $("#id").val();
                                },
                                "aliasName": function () {
                                    return $("#aliasName").val();
                                }
                            },
                            dataType: 'json',
                            message: '该别名已被使用',
                            delay: 1000
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {
//            e.preventDefault();


        });


        // 工具栏按钮事件绑定
        initToolBarActions();

        $(".newImageSlotButton").click(function () {
            var template = $(".pictureTemplate").clone();
            $(template).removeClass("pictureTemplate");
            $(template).removeClass("hidden");

            var newImageindex = $(".productImage").size();

            $(template).find(".productImage").attr("data-image-index", newImageindex + 1);

            $(".pictureTemplate").before($(template));

            liveProductImageClickAction();
        });

        liveProductImageClickAction();
    });

    function liveProductImageClickAction() {
        $(".productImage").click(function () {
            console.log("llijsd");
            var imageIndex = $(this).attr("data-image-index");
            $(".galleryWrapper").html("");
            $(".galleryWrapper").load("${ctx}/backend/panel/file-management/images",
                    {objectType: "slides", objectId: "${slideGroupInfo.id}", imageIndex: imageIndex},
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


    function initToolBarActions() {
        // 保存按钮
        $("#toolbar_save").bind("click", function () {
            $('#action_save').click();
        });

        // 新增按钮
        $("#toolbar_new").bind("click", function () {
            $('#action_save_and_new').click();
        });

        // 刷新按钮
        $("#toolbar_reload").bind("click", function () {
            action_reload();
        });

        // 关闭按钮
        $("#toolbar_close").bind("click", function () {
            closeFrameworkCurrentTab();
        });
    }

    function action_reload() {
        location.href = '<c:url value="/app/gallerywall/slideGroupInfoform?id=${slideGroupInfo.id}"/>';
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

        if (!image) {
            return;
        }

        if (order == 1) {
            var prev = $(image).prev();
            if (prev && prev.hasClass("picturePanelWrapper")) {
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
