<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>

<%@ page import="com.doit.ecommerce.model.SellOffer" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="sellOfferDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='sellOfferDetail.heading'/>"/>
    <meta name="module-group" content="ecommerce-management"/>
    <meta name="module-subgroup" content="ecommerce-product"/>
    <meta name="module" content="ecommerce-product-info"/>


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

        .form-group{
            margin-bottom: 10px;
        }

        .control-label{
            font-weight: normal;
        }
    </style>
</head>

<c:set var="sellOfferTitle" value="新增商品"/>

<c:if test="${not empty sellOffer.id}">
    <c:set var="sellOfferTitle" value="${sellOffer.title}"/>
</c:if>

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
                <strong>图书基本信息管理</strong>
            </li>
            <li class="active">
                <strong>${sellOfferTitle}</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>${sellOfferTitle}</h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="${ctx}/backend/ecommerce/product/sellOfferform.html">
                            <i class="fa fa-plus-circle"></i> 增加
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <c:if test="${sellOffer.publishFlag eq '1'}">
                        <div style="text-align: center;">
                            <div class="label label-warning text-center">
                                该内容已经发布，不能修改
                            </div>
                        </div>
                    </c:if>
                    <form:form commandName="sellOffer" method="post" action="sellOfferform" id="sellOfferForm"
                               class="form-horizontal"
                               enctype="multipart/form-data">
                        <form:errors path="*" cssClass="error" element="div"/>
                        <form:hidden path="id"/>
                        <div class="tabs-container">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#tab-1">基本信息</a></li>
                                <li><a data-toggle="tab" href="#tab-2">销售信息</a></li>
                                <li><a data-toggle="tab" href="#tab-3">图文详情</a></li>
                                <li><a data-toggle="tab" href="#tab-4">扩展属性</a></li>
                                <li><a data-toggle="tab" href="#tab-5">图片管理</a></li>
                                    <%--<li class=""><a data-toggle="tab" href="#tab-3">SEO设置</a></li>--%>
                            </ul>
                            <div class="tab-content">
                                <%--基本信息 --%>
                                <div id="tab-1" class="tab-pane active">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">图书分类</label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <form:select path="productCategoryId" class="form-control">
                                                        <option>请选择</option>
                                                        <c:forEach items="${productCategoryList}" var="item">
                                                            <form:option value="${item.id}">${item.title}</form:option>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">商品编码</label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <div class="input-group-addon">*</div>
                                                    <form:input path="spu" id="attr_SPU" class="form-control"  />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">书名</label>
                                            <div class="col-sm-10">
                                                <form:input path="productName" id="attr_productName" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">语种</label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <select path="categoryPropertyMap['language']" class="form-control">
                                                        <option value="">中文</option>
                                                        <option value="">英文</option>
                                                        <option value="">其他</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">ISBN</label>
                                            <div class="col-sm-10">
                                                <form:input path="categoryPropertyMap['ISBN']" id="attr_ISBN" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">作者</label>
                                            <div class="col-sm-10">
                                                <form:input path="categoryPropertyMap['author']" id="attr_author" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">译者</label>
                                            <div class="col-sm-10">
                                                <form:input path="categoryPropertyMap['translator']" id="attr_translator" class="form-control"
                                                            />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">出版社</label>
                                            <div class="col-sm-10">
                                                <form:input path="categoryPropertyMap['publishing']" id="attr_publishing" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">图书品牌</label>
                                            <div class="col-sm-10">
                                                <form:input path="categoryPropertyMap['brand']" id="attr_brand" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">媒介类型</label>
                                            <div class="col-sm-10">
                                                <label class="radio-inline">
                                                    <form:radiobutton  path="categoryPropertyMap['mediaType']" id="mediaType_pBook" value="option1" checked="true" /> 纸质书
                                                </label>
                                                <label class="radio-inline">
                                                    <form:radiobutton  path="categoryPropertyMap['mediaType']" id="mediaType_eBook" value="option2" /> 电子书
                                                </label>
                                                <label class="radio-inline">
                                                    <form:radiobutton  path="categoryPropertyMap['mediaType']" id="mediaType_pBookWithEBook" value="option3" /> 纸质书带电子版
                                                </label>
                                            </div>
                                        </div>
                                        <!--纸质书籍属性 -->
                                        <div id="mediaType_pBook_attrs">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">编辑</label>
                                                <div class="col-sm-10">
                                                    <form:input path="categoryPropertyMap['editor']" id="attr_editor" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">库存</label>
                                                <div class="col-sm-10">
                                                    <form:input path="categoryPropertyMap['stock']" id="attr_stock" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">装帧</label>
                                                <div class="col-sm-10">
                                                    <form:input path="categoryPropertyMap['binding']" id="attr_Binding" class="form-control"  />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">开本</label>
                                                <div class="col-sm-10">
                                                    <form:input path="categoryPropertyMap['bookSize']" id="attr_bookSize" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">页数</label>
                                                <div class="col-sm-10">
                                                    <form:input path="categoryPropertyMap['pageTotal']" id="attr_pageTotal" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">字数</label>
                                                <div class="col-sm-10">
                                                    <form:input path="categoryPropertyMap['wordNm']" id="attr_wordNm" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">版次</label>
                                                <div class="col-sm-10">
                                                    <form:input path="categoryPropertyMap['revision']" id="attr_revision" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">印次</label>
                                                <div class="col-sm-10">
                                                    <form:input path="categoryPropertyMap['impression']" id="attr_impression" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">出版日期</label>
                                                <div class="col-sm-6">
                                                    <div class="pull-left" style="width: 160px;">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                            <form:input
                                                                   path="categoryPropertyMap['publicationDate']"
                                                                   class="form-control datebox"
                                                                   value=""
                                                                   style="width:110px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">印刷日期</label>
                                                <div class="col-sm-10">
                                                    <div class="pull-left" style="width: 160px;">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                            <form:input
                                                                   path="categoryPropertyMap['printingDate']"
                                                                   class="form-control datebox"
                                                                   value=""
                                                                   style="width:110px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">纸张</label>
                                                <div class="col-sm-10">
                                                    <div class="input-group">
                                                        <select path="categoryPropertyMap['paperType']" class="form-control">
                                                            <option>请选择</option>
                                                            <option>A4</option>
                                                            <option>A8</option>
                                                            <option>A3</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--电子书 -->
                                        <div id="mediaType_eBook_attrs" style="display:none">
                                            <div class="form-group">
                                                <label  class="col-sm-2 control-label">电子书类型</label>
                                                <div class="col-sm-10">
                                                    <label class="radio-inline">
                                                        <form:radiobutton path="categoryPropertyMap['eBookType']"  value="1" checked="true" /> PDF
                                                    </label>
                                                    <label class="radio-inline">
                                                        <form:radiobutton path="categoryPropertyMap['eBookType']"  value="0" /> EBOOK
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label  class="col-sm-2 control-label"></label>
                                                <div class="col-sm-10">
                                                    <div class="checkbox-inline">
                                                        <label>
                                                            <form:checkbox path="categoryPropertyMap['onlineReadingAble']" id="attr_onlineReadingAble" value="1" /> 支持在线阅读
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">试读</label>
                                                <div class="col-sm-10">
                                                    <form:input path="categoryPropertyMap['probation']" id="attr_probation" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">章节预览</label>
                                                <div class="col-sm-10">
                                                    <form:input path="categoryPropertyMap['chapterPreview']" id="attr_chapterPreview" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">电子书</label>
                                                <div class="col-sm-10">
                                                    <form:input path="categoryPropertyMap['eBook']" id="attr_eBook" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">文件大小</label>
                                                <div class="col-sm-10">
                                                    <form:input path="categoryPropertyMap['fileSize']" id="attr_fileSize" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--销售信息 --%>
                                <div id="tab-2" class="tab-pane">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">标题</label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <form:input path="title" id="attr_title" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">副标题</label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <form:input path="subTitle" id="attr_subTitle" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"></label>
                                            <div class="col-sm-10">
                                                <label class="checkbox-inline">
                                                    <form:checkbox path="buyable" id="buyable" value="1" /> 启用平台销售
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">价格</label>
                                            <div class="col-sm-10">
                                                    <form:input path="price" id="attr_price" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">市场价</label>
                                            <div class="col-sm-10">
                                                    <form:input path="priceMartket" id="attr_marketPrice" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">会员价</label>
                                            <div class="col-sm-10">
                                                    <form:input path="priceMembership" id="attr_memberPrice" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 checkbox-inline control-label">
                                                <form:checkbox path="offerPropertyMap['flag_taobao']" id="flag_taobao" value="1" /> 淘宝
                                            </label>
                                            <div class="col-sm-10">
                                                <form:input path="offerPropertyMap['taobao']" id="attr_taobao" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 checkbox-inline control-label">
                                                <form:checkbox path="offerPropertyMap['flag_tmall']" id="flag_tmall" value="1" /> 天猫
                                            </label>
                                            <div class="col-sm-10">
                                                <form:input path="offerPropertyMap['tmall']" id="attr_tmall" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 checkbox-inline control-label">
                                                <form:checkbox path="offerPropertyMap['flag_dangdang']" id="flag_dangdang" value="1" /> 当当
                                            </label>
                                            <div class="col-sm-10">
                                                <form:input path="offerPropertyMap['dangdang']" id="attr_dangdang" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 checkbox-inline control-label">
                                                <form:checkbox path="offerPropertyMap['jd_flag']" id="jd_flag" value="1" /> 京东
                                            </label>
                                            <div class="col-sm-10">
                                                <form:input path="offerPropertyMap['jd']" id="attr_jd" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--图文详情--%>
                                <div id="tab-3" class="tab-pane">
                                    <div class="panel-body">
                                        <div class="form-group center-block" style="max-width: 750px;">
                                            <div class="center-block">
                                                <SCRIPT id="fullText" type="text/plain" name="fullText">
                                                    <% out.println(request.getAttribute("fullText")); %>
                                                </SCRIPT>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--扩展属性 --%>
                                <div id="tab-4" class="tab-pane">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">版权信息</label>
                                            <div class="col-sm-10">
                                                <form:input path="categoryPropertyMap['copyRightInfo']" id="attr_copyRightInfo" class="summernote form-control" data-height="200" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">简介</label>
                                            <div class="col-sm-10">
                                                <form:input path="categoryPropertyMap['introduction']" id="attr_introduction" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">编辑推荐</label>
                                            <div class="col-sm-10">
                                                <form:input path="categoryPropertyMap['editorRecommend']" id="attr_editorRecommend" class="form-control"  />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">目录</label>
                                            <div class="col-sm-10">
                                                <form:input path="categoryPropertyMap['catalogue']" id="attr_catalogue" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">作者简介</label>
                                            <div class="col-sm-10">
                                                <form:input path="categoryPropertyMap['editorInfo']" id="aattr_editorInfo" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">前言、序言</label>
                                            <div class="col-sm-10">
                                                <form:input path="categoryPropertyMap['preface']" id="attr_preface" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">书摘</label>
                                            <div class="col-sm-10">
                                                <form:input path="categoryPropertyMap['digest']" id="attr_digest" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">产品特色</label>
                                            <div class="col-sm-10">
                                                <form:input path="categoryPropertyMap['productFeatures']" id="attr_productFeatures" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--图片管理 --%>
                                <div id="tab-5" class="tab-pane">
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
                            </div>
                        </div>
                        <div class="form-group m-t">
                            <div class="col-sm-12 text-center">
                                <a class="btn btn-white" href="${ctx}/backend/ecommerce/product/sellOffers.html">取消</a>
                                    <%--<c:if test="${sellOffer.publishFlag eq '0'}">--%>
                                <button class="btn btn-primary" type="submit">保存</button>
                                    <%--</c:if>--%>
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


<%--<v:javascript formName="sellOffer" cdata="false" dynamicJavascript="true" staticJavascript="false"/>--%>
<%--<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>--%>

<script type="text/javascript">
    //    Form.focusFirstElement($('sellOfferForm'));
    $(document).ready(function () {
        Dropzone.autoDiscover = false;

        $("#mediaType_pBook").click(function(){
            $("#mediaType_pBook_attrs").show();
            $("#mediaType_eBook_attrs").hide();
        });
        $("#mediaType_eBook").click(function(){
            $("#mediaType_pBook_attrs").hide();
            $("#mediaType_eBook_attrs").show();
        });

        $("#mediaType_pBookWithEBook").click(function(){
            $("#mediaType_pBook_attrs").show();
            $("#mediaType_eBook_attrs").show();
        });

        <%--$("div.dropzone").dropzone({url: "${ctx}/backend/json/gallery-sellOffer/upload?objectId=${sellOffer.id}"});--%>

        $("div.dropzone").dropzone({
            url: "${ctx}/backend/json/gallery2-sellOffer/upload?objectId=${sellOffer.id}",
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

        $('.datebox').datepicker({
            todayHighlight: true,
            todayBtn: "linked",
            keyboardNavigation: false,
            autoclose: true,
            format: "yyyy/mm/dd"

        });

        $('#sellOfferForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                productName: {
                    message: '图书名称不能为空',
                    validators: {
                        notEmpty: {
                            message: '图书名称不能为空'
                        }
                    }
                }, price: {
                    message: '价格格式错误',
                    validators: {
                        regexp: {
                            regexp: /^[1-9][0-9]*$/,
                            message: '价格必须为数字格式'
                        },
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
                    {objectType: "sellOffer", objectId: "${sellOffer.id}", imageIndex: imageIndex},
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
