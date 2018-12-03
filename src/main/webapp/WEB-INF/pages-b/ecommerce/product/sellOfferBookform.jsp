<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>

<%@ page import="com.doit.common.model.UniversalRichProperty" %>
<%@ page import="com.doit.ecommerce.model.SellOffer" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.apache.commons.collections.map.ListOrderedMap" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>${sellOffer.title}</title>
    <meta name="heading" content="<fmt:message key='sellOfferDetail.heading'/>"/>
    <meta name="module-group" content="ecommerce-management"/>
    <meta name="module-subgroup" content="ecommerce-product"/>
    <meta name="module" content="ecommerce-product-info"/>

    <link rel="stylesheet" href="${ctx}/resource/common/scripts/plugins/jqselectable/style/selectable/style.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/zTreeStyle.css" type="text/css">

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

    <script src="${ctx}/resource/common/scripts/zTree-v3.5.02/js/jquery.ztree.all-3.5.js"></script>
    <script src="${ctx}/resource/common/scripts/plugins/jqselectable/jqselectable.js"></script>

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

        .bottom {
            left: 15px;
            right: 15px;
            bottom: 0;
        }

        .top {
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

        .form-group {
            margin-bottom: 5px;
        }

        .control-label {
            font-weight: normal;
        }

        .ibox {
            margin-bottom: 5px;
        }

        .ibox-content {
            padding: 10px;
        }

        .ibox-title {
            padding: 5px 15px;
            min-height: 20px;
        }

        .float-e-margins .btn {
            margin-bottom: 0;
        }

        .panel-images {
            max-height: 400px;
            overflow-y: auto;
        }

        .ibox {
            margin-bottom: 0;
        }

        .ibox-tools .dropdown-menu {
            left: -60px;
        }

        .ibox-tools .dropdown-menu > li > a {
            padding: 3px 5px;
            line-height: 20px;
        }

        .btn-group, .btn-group-vertical {
            top: -2px;
        }
    </style>
</head>
<%
    SellOffer sellOffer = (SellOffer) request.getAttribute("sellOffer");

    Map<String, UniversalRichProperty> richPropertyMap = (Map<String, UniversalRichProperty>) request.getAttribute("richPropertyMap");
    if (richPropertyMap == null) {
        richPropertyMap = new ListOrderedMap();
    }
%>
<c:set var="sellOfferTitle" value="新增"/>

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
                            <i class="fa fa-file-o"></i> 增加
                        </a>
                        <div class="btn-group">
                            <a id="toolbar_save"><i class="fa fa-save"></i> 保存</a>
                            <a class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-caret-down"></i>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a id="toolbar_save_new"><i class="fa fa-save"></i> <i class="fa fa-file-o"></i>
                                    保存&新增</a></li>
                                <li><a id="toolbar_save_return"><i class="fa fa-save"></i> <i
                                        class="fa fa-mail-reply"></i> 保存&返回</a></li>
                                <c:if test="${not empty sellOffer.id}">
                                    <li class="divider"></li>
                                    <li><a id="toolbar_publish"><i class="fa fa-hand-o-up"></i> 发布</a></li>
                                    <li><a id="toolbar_unpublish"><i class="fa fa-hand-o-down"></i> 下架</a></li>
                                </c:if>
                            </ul>
                        </div>
                        <a href="${ctx}/backend/ecommerce/product/sellOffers.html"><i class="fa fa-mail-reply"></i> 返回</a>
                    </div>
                </div>
                <div class="ibox-content">
                    <c:if test="${sellOffer.publishFlag eq '1'}">
                        <div style="text-align: center;">
                            <div class="label label-warning text-center">
                                该商品信息已经发布
                            </div>
                        </div>
                    </c:if>

                    <form:form commandName="sellOffer" method="post" action="sellOfferform" id="sellOfferForm"
                               class="form-horizontal"
                               enctype="multipart/form-data">
                        <form:errors path="*" cssClass="error" element="div"/>
                        <form:hidden path="id"/>

                        <div class="row">
                            <div class="col-sm-12 col-md-7 col-lg-8">
                                <div class="tabs-container">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a data-toggle="tab" href="#tab-1">基本信息</a></li>
                                        <li><a data-toggle="tab" href="#tab-3">图文详情</a></li>
                                        <li><a data-toggle="tab" href="#tab-4">扩展属性</a></li>
                                            <%--<li class=""><a data-toggle="tab" href="#tab-3">SEO设置</a></li>--%>
                                    </ul>
                                    <div class="tab-content">
                                            <%--基本信息 --%>
                                        <div id="tab-1" class="tab-pane active">
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">中图分类</label>
                                                    <div class="col-sm-10">
                                                        <div style="position: relative;">
                                                            <div>
                                                                <form:hidden path="productCategoryId"/>
                                                                <input id="citySel" name="citySel" type="text" class="form-control pull-left" readonly value="${sellOffer.productCategory.title}" style="width:180px;" onclick="showMenu();"/>
                                                                <a id="menuBtn" class="btn btn-default btn-md margin-left-10 pull-left" href="#" onclick="showMenu(); return false;">选择</a>
                                                            </div>

                                                            <div id="menuContent" class="menuContent" style="display:none; position: absolute;z-index: 99999; border: 1px solid lightgrey; background: #fff;">
                                                                <ul id="treeDemo2" class="ztree" style="margin-top:0; width:360px; height: 280px; background: #fff;overflow-y: auto;"></ul>
                                                            </div>
                                                        </div>
                                                        <%--<div class="input-group">
                                                            <form:select path="productCategoryId" class="form-control">
                                                                <option value="">请选择</option>
                                                                <c:forEach items="${productCategoryList}" var="item">
                                                                    <form:option
                                                                            value="${item.id}">${item.title}</form:option>
                                                                </c:forEach>
                                                            </form:select>
                                                        </div>--%>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">商品编码</label>
                                                    <div class="col-sm-10">
                                                        <div class="input-group">
                                                            <div class="input-group-addon">*</div>
                                                            <form:input path="spu" id="attr_SPU" class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">书名</label>
                                                    <div class="col-sm-10">
                                                        <div class="input-group">
                                                            <div class="input-group-addon">*</div>
                                                            <form:input path="productName" id="attr_productName"
                                                                        class="form-control"/>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">ISBN</label>
                                                    <div class="col-sm-10">
                                                        <form:input path="isbn" id="attr_ISBN"
                                                                    class="form-control"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">作者</label>
                                                    <div class="col-sm-10">
                                                        <form:input path="author"
                                                                    id="attr_author" class="form-control"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">出版社</label>
                                                    <div class="col-sm-10">
                                                        <form:input path="pressName"
                                                                    id="attr_pressName" class="form-control"/>
                                                        <form:hidden path="pressId"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">图书品牌</label>
                                                    <div class="col-sm-10">
                                                        <form:input path="offerPropertyMap['brand']" id="attr_brand"
                                                                    class="form-control"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">丛书名</label>
                                                    <div class="col-sm-10">
                                                        <form:input path="offerPropertyMap['seriesName']" id="attr_seriesName"
                                                                    class="form-control"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">语种</label>
                                                    <div class="col-sm-10">
                                                        <div class="input-group">
                                                            <select path="offerPropertyMap['language']"
                                                                    class="form-control">
                                                                <option value="中文">中文</option>
                                                                <option value="英文">英文</option>
                                                                <option value="其他">其他</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">类型</label>
                                                    <div class="col-sm-10">
                                                        <div class="input-group">
                                                            <select path="offerPropertyMap['language']"
                                                                    class="form-control">
                                                                <option value="原著">原著</option>
                                                                <option value="译注">译注</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">译者</label>
                                                    <div class="col-sm-10">
                                                        <form:input path="offerPropertyMap['translator']"
                                                                    id="attr_translator" class="form-control"
                                                        />
                                                    </div>
                                                </div>


                                                <hr/>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">图书类型</label>
                                                    <div class="col-sm-10">
                                                        <label class="radio-inline">
                                                            <form:radiobutton path="mediaType"
                                                                              id="mediaType_pBook" value="PAPER"
                                                                              /> 纸质书
                                                        </label>
                                                        <label class="radio-inline">
                                                            <form:radiobutton path="mediaType"
                                                                              id="mediaType_eBook" value="EBOOK"/> 电子书
                                                        </label>
                                                    </div>
                                                </div>
                                                <!--纸质书籍属性 -->
                                                <div id="mediaType_pBook_attrs">
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">责任编辑</label>
                                                        <div class="col-sm-10">
                                                            <form:input path="editor"
                                                                        id="attr_editor" class="form-control"/>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">主编</label>
                                                        <div class="col-sm-10">
                                                            <form:input path="executiveEditor"
                                                                        id="attr_executiveEditor" class="form-control"/>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">装帧</label>
                                                        <div class="col-sm-10">
                                                            <form:input path="offerPropertyMap['binding']"
                                                                        id="attr_Binding" class="form-control"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">开本</label>
                                                        <div class="col-sm-10">
                                                            <form:input path="offerPropertyMap['bookSize']"
                                                                        id="attr_bookSize" class="form-control"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">页数</label>
                                                        <div class="col-sm-10">
                                                            <form:input path="offerPropertyMap['pageTotal']"
                                                                        id="attr_pageTotal" class="form-control"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">字数</label>
                                                        <div class="col-sm-10">
                                                            <form:input path="offerPropertyMap['wordNm']"
                                                                        id="attr_wordNm" class="form-control"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">版次</label>
                                                        <div class="col-sm-10">
                                                            <form:input path="offerPropertyMap['revision']"
                                                                        id="attr_revision" class="form-control"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">印次</label>
                                                        <div class="col-sm-10">
                                                            <form:input path="offerPropertyMap['impression']"
                                                                        id="attr_impression" class="form-control"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">纸张</label>
                                                        <div class="col-sm-10">
                                                            <form:input path="offerPropertyMap['paperType']"
                                                                        id="attr_paperType" class="form-control"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">出版日期</label>
                                                        <div class="col-sm-6">
                                                            <div class="pull-left" style="width: 160px;">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon"><i
                                                                            class="fa fa-calendar"></i></span>
                                                                    <form:input
                                                                            path="publicationDate"
                                                                            class="form-control datebox"
                                                                            value=""
                                                                            style="width:110px;"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">印刷日期</label>
                                                        <div class="col-sm-10">
                                                            <div class="pull-left" style="width: 160px;">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon"><i
                                                                            class="fa fa-calendar"></i></span>
                                                                    <form:input
                                                                            path="offerPropertyMap['printingDate']"
                                                                            class="form-control datebox"
                                                                            value=""
                                                                            style="width:110px;"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <!--电子书 -->

                                            </div>
                                        </div>

                                            <%--图文详情--%>
                                        <div id="tab-3" class="tab-pane">
                                            <div class="panel-body">
                                                <div class="form-group center-block">
                                                    <div class="center-block">
                                                        <SCRIPT id="fullText" type="text/plain" name="fullText"><%

                                                           Object fullTextObj = (String)request.getAttribute("fullText");
                                                            if(fullTextObj != null){
                                                                out.println((String)fullTextObj);
                                                            }
                                                        %></SCRIPT>
                                                        <input type="hidden" id="attr_fullText" name="richProperty['fullText']"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                            <%--扩展属性 --%>
                                        <div id="tab-4" class="tab-pane">

                                            <div class="panel-body">

                                                <div class="tabs-container">

                                                    <div class="tabs-left">
                                                        <ul class="nav nav-tabs">
                                                            <li class="active"><a data-toggle="tab" href="#tab-31"> 版权信息</a></li>
                                                            <li class=""><a data-toggle="tab" href="#tab-32">简介</a></li>
                                                            <li class=""><a data-toggle="tab" href="#tab-33">编辑推荐</a></li>
                                                            <li class=""><a data-toggle="tab" href="#tab-34">目录</a></li>
                                                            <li class=""><a data-toggle="tab" href="#tab-35">作者简介</a></li>
                                                            <li class=""><a data-toggle="tab" href="#tab-36">前言</a></li>
                                                            <li class=""><a data-toggle="tab" href="#tab-37">书摘</a></li>
                                                            <li class=""><a data-toggle="tab" href="#tab-38">产品特色</a></li>
                                                        </ul>
                                                        <div class="tab-content ">
                                                            <div id="tab-31" class="tab-pane active">
                                                                <div class="panel-body">
                                                                    <SCRIPT id="copyRightInfo" type="text/plain" name="copyRightInfo"><%
                                                                        if (richPropertyMap.containsKey("copyRightInfo")) {
                                                                            out.println(richPropertyMap.get("copyRightInfo").getPropertyValue());
                                                                        }
                                                                    %></SCRIPT>
                                                                    <input type="hidden" id="attr_copyRightInfo" name="richProperty['copyRightInfo']"/>
                                                                </div>
                                                            </div>
                                                            <div id="tab-32" class="tab-pane">
                                                                <div class="panel-body">
                                                                    <SCRIPT id="introduction" type="text/plain" name="introduction"><%
                                                                        if (richPropertyMap.containsKey("introduction")) {
                                                                            out.println(richPropertyMap.get("introduction").getPropertyValue());
                                                                        }
                                                                    %></SCRIPT>
                                                                    <input type="hidden" id="attr_introduction" name="richProperty['introduction']"/>
                                                                </div>
                                                            </div>
                                                            <div id="tab-33" class="tab-pane">
                                                                <div class="panel-body">
                                                                    <SCRIPT id="editorRecommend" type="text/plain" name="editorRecommend"><%
                                                                        if (richPropertyMap.containsKey("editorRecommend")) {
                                                                            out.println(richPropertyMap.get("editorRecommend").getPropertyValue());
                                                                        }
                                                                    %></SCRIPT>
                                                                    <input type="hidden" id="attr_editorRecommend" name="richProperty['editorRecommend']"/>
                                                                </div>
                                                            </div>
                                                            <div id="tab-34" class="tab-pane">
                                                                <div class="panel-body">
                                                                    <SCRIPT id="catalogue" type="text/plain" name="catalogue"><%
                                                                        if (richPropertyMap.containsKey("catalogue")) {
                                                                            out.println(richPropertyMap.get("catalogue").getPropertyValue());
                                                                        }
                                                                    %></SCRIPT>
                                                                    <input type="hidden" id="attr_catalogue" name="richProperty['catalogue']"/>
                                                                </div>
                                                            </div>
                                                            <div id="tab-35" class="tab-pane">
                                                                <div class="panel-body">
                                                                    <SCRIPT id="authorInfo" type="text/plain" name="authorInfo"><%
                                                                        if (richPropertyMap.containsKey("authorInfo")) {
                                                                            out.println(richPropertyMap.get("authorInfo").getPropertyValue());
                                                                        }
                                                                    %></SCRIPT>
                                                                    <input type="hidden" id="attr_authorInfo" name="richProperty['authorInfo']"/>
                                                                </div>
                                                            </div>
                                                            <div id="tab-36" class="tab-pane">
                                                                <div class="panel-body">
                                                                    <SCRIPT id="preface" type="text/plain" name="preface"><%
                                                                        if (richPropertyMap.containsKey("preface")) {
                                                                            out.println(richPropertyMap.get("preface").getPropertyValue());
                                                                        }
                                                                    %></SCRIPT>
                                                                    <input type="hidden" id="attr_preface" name="richProperty['preface']"/>
                                                                </div>
                                                            </div>
                                                            <div id="tab-37" class="tab-pane">
                                                                <div class="panel-body">
                                                                    <SCRIPT id="digest" type="text/plain" name="digest"><%
                                                                        if (richPropertyMap.containsKey("digest")) {
                                                                            out.println(richPropertyMap.get("digest").getPropertyValue());
                                                                        }
                                                                    %></SCRIPT>
                                                                    <input type="hidden" id="attr_digest" name="richProperty['digest']"/>
                                                                </div>
                                                            </div>
                                                            <div id="tab-38" class="tab-pane">
                                                                <div class="panel-body">
                                                                    <SCRIPT id="productFeatures" type="text/plain" name="productFeatures"><%
                                                                        if (richPropertyMap.containsKey("productFeatures")) {
                                                                            out.println(richPropertyMap.get("productFeatures").getPropertyValue());
                                                                        }
                                                                    %></SCRIPT>
                                                                    <input type="hidden" id="attr_productFeatures" name="richProperty['productFeatures']"/>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-5 col-lg-4">
                                <div class="ibox float-e-margins m-t-lg">
                                    <div class="ibox-title">
                                        <h5>展示图设置</h5>
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

                                            <c:forEach items="${sellOffer.imageInfos}" var="imageItem" varStatus="status">
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
                                        <h5>销售设置</h5>
                                        <div class="ibox-tools">
                                            <a class="collapse-link">
                                                <i class="fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="ibox-content">

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">标题</label>
                                            <div class="col-sm-9">
                                                <form:input path="title" id="attr_title" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">副标题</label>
                                            <div class="col-sm-9">
                                                <form:input path="subTitle" id="attr_subTitle" class="form-control"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">售价</label>
                                            <div class="col-sm-9">
                                                <form:input path="price" id="attr_price" class="touchspin3"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">书价</label>
                                            <div class="col-sm-9">
                                                <form:input path="priceMartket" id="attr_marketPrice"
                                                            class="form-control touchspin3"/>
                                            </div>
                                        </div>
                                        <%--<div class="form-group">
                                            <label class="col-sm-3 control-label">会员价</label>
                                            <div class="col-sm-9">
                                                <form:input path="priceMembership" id="attr_memberPrice"
                                                            class="form-control touchspin3"/>
                                            </div>
                                        </div>--%>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">在线销售</label>
                                            <div class="col-sm-9">
                                                <label class="radio-inline"><form:radiobutton path="buyable" value="1"/> 是</label>
                                                <label class="radio-inline"><form:radiobutton path="buyable" value="0"/> 否</label>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>阅读设置</h5>
                                        <div class="ibox-tools">
                                            <a class="collapse-link">
                                                <i class="fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="ibox-content">
                                        <div id="mediaType_eBook_attrs">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label"></label>
                                                <div class="col-sm-9">
                                                    <div class="checkbox-inline">
                                                        <label>
                                                            <form:checkbox
                                                                    path="offerPropertyMap['onlinePreviewable']"
                                                                    id="attr_onlinePreviewable" value="1"/>
                                                            在线试读
                                                        </label>
                                                        <label class="margin-left-30">
                                                            <form:checkbox
                                                                    path="offerPropertyMap['onlineReadingAble']"
                                                                    id="attr_onlineReadingAble" value="1"/>
                                                            免费阅读
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label"></label>
                                                <div class="col-sm-9">
                                                    <label>
                                                        <form:checkbox
                                                                path="offerPropertyMap['eBookTypePdf']"
                                                                value="1"/> PDF
                                                    </label>
                                                    <label class="margin-left-30">
                                                        <form:checkbox
                                                                path="offerPropertyMap['eBookTypeEpub']"
                                                                value="1"/> EPUB
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">试读</label>
                                                <div id="previewPdfInfo" class="col-sm-9">
                                                    <div class="row">
                                                        <div class="col-lg-12 form-inline">
                                                            试读 <form:input path="offerPropertyMap['previewLimit']" cssClass="form-control" cssStyle="width: 80px;"/>
                                                            <form:select path="offerPropertyMap['previewLimitType']" cssClass="form-control" cssStyle="width: 80px;">
                                                                <form:option value="page">页</form:option>
                                                                <form:option value="section">章</form:option>
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-4">
                                                            <label class="radio-inline"><form:radiobutton path="offerPropertyMap['eBookPreviewType']" value="ebookPDF"/> 试读PDF</label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-4">
                                                            <label class="radio-inline"><form:radiobutton path="offerPropertyMap['eBookPreviewType']" value="ebookEPUB"/> 试读EPUB</label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <label class="radio-inline"><form:radiobutton path="offerPropertyMap['eBookPreviewType']" value="ebookPDFPreview"/> 试读文档</label>
                                                        </div>
                                                    </div>

                                                    <div class="row margin-top-10">
                                                        <div class="col-xs-3">
                                                            文件名
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <a target="_blank" href="${ctx}/backend/ebookpreview/pdf/item-${sellOffer.id}?file=/backend/ebookpreview/pdfdata-${fileInfoPDFPreview.id}" class="fileName">${fileInfoPDFPreview.fileName}</a>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <a id="ebookUploadPreviewPdf" data-toggle="modal"
                                                               data-target="#myModal-uploadEbookPreview">上传</a>
                                                            <a>删除</a>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-3">
                                                            大小
                                                        </div>
                                                        <div class="col-xs-9">
                                                            <span class="fileSize">${fileInfoPDFPreview.fileSize}</span>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-3">
                                                            页数
                                                        </div>
                                                        <div class="col-xs-9">
                                                            <span class="pageSize">${fileInfoPDFPreview.totalPage}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">PDF</label>
                                                <div id="pdfInfo" class="col-sm-9 padding-top-10">
                                                    <div class="row">
                                                        <div class="col-xs-3">
                                                            文件名
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <a target="_blank" href="${ctx}/backend/ebookpreview/pdf/item-${sellOffer.id}?file=/backend/ebookpreview/pdfdata-${fileInfoPDF.id}" class="fileName">${fileInfoPDF.fileName}</a>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <a id="ebookUploadPdf" data-toggle="modal"
                                                               data-target="#myModal-uploadEbookPDF">上传</a>
                                                            <a>删除</a>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-3">
                                                            大小
                                                        </div>
                                                        <div class="col-xs-9">
                                                            <span class="fileSize">${fileInfoPDF.fileSize}</span>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-3">
                                                            页数
                                                        </div>
                                                        <div class="col-xs-9">
                                                            <span class="pageSize">${fileInfoPDF.totalPage}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">EPUB</label>
                                                <div id="epubInfo" class="col-sm-9 padding-top-10">
                                                    <div class="row">
                                                        <div class="col-xs-3">
                                                            文件名
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <a target="_blank" href="${ctx}/backend/ebookpreview/epub/item-${sellOffer.id}" class="fileName">${fileInfoEPUB.fileName}</a>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <a id="ebookUploadEpub" data-toggle="modal"
                                                               data-target="#myModal-uploadEbookEPUB">上传</a>
                                                            <a>删除</a>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-3">
                                                            大小
                                                        </div>
                                                        <div class="col-xs-9">
                                                            <span class="fileSize">${fileInfoEPUB.fileSize}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>库存信息</h5>
                                        <div class="ibox-tools">
                                            <a class="collapse-link">
                                                <i class="fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="ibox-content">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">库存</label>
                                            <div class="col-sm-9">
                                                <form:input path="stockNum" id="attr_stock"
                                                            class="form-control touchspin2"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>购买链接</h5>
                                        <div class="ibox-tools">
                                            <a class="collapse-link">
                                                <i class="fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="ibox-content">
                                        <div class="form-group">
                                            <label class="col-sm-3 checkbox-inline control-label">
                                                <form:checkbox path="offerPropertyMap['flag_taobao']" id="flag_taobao"
                                                               value="1"/> 淘宝
                                            </label>
                                            <div class="col-sm-9">
                                                <form:input path="offerPropertyMap['taobao']" id="attr_taobao"
                                                            class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <img id="qrcode" style="width:100px;height:100px;" src="${ctx}/files/sellOffer/sellOffer-${sellOffer.id}/qrcode/taobao_${sellOffer.id}.png" />
                                            <button onclick="createQrcode(${sellOffer.id},'taobao')">
                                                <c:choose>
                                                    <c:when test="${taobao_url_flag == '1'}">
                                                        刷新二维码
                                                    </c:when>
                                                    <c:otherwise>
                                                        生成二维码
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </div>
                                        <%--<div class="form-group">--%>
                                            <%--<label class="col-sm-3 checkbox-inline control-label">--%>
                                                <%--<form:checkbox path="offerPropertyMap['flag_tmall']" id="flag_tmall"--%>
                                                               <%--value="1"/> 天猫--%>
                                            <%--</label>--%>
                                            <%--<div class="col-sm-9">--%>
                                                <%--<form:input path="offerPropertyMap['tmall']" id="attr_tmall"--%>
                                                            <%--class="form-control"/>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                        <%--<div class="form-group">--%>
                                            <%--<label class="col-sm-3 checkbox-inline control-label">--%>
                                                <%--<form:checkbox path="offerPropertyMap['flag_dangdang']"--%>
                                                               <%--id="flag_dangdang" value="1"/> 当当--%>
                                            <%--</label>--%>
                                            <%--<div class="col-sm-9">--%>
                                                <%--<form:input path="offerPropertyMap['dangdang']" id="attr_dangdang"--%>
                                                            <%--class="form-control"/>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                        <%--<div class="form-group">--%>
                                            <%--<label class="col-sm-3 checkbox-inline control-label">--%>
                                                <%--<form:checkbox path="offerPropertyMap['jd_flag']" id="jd_flag"--%>
                                                               <%--value="1"/> 京东--%>
                                            <%--</label>--%>
                                            <%--<div class="col-sm-9">--%>
                                                <%--<form:input path="offerPropertyMap['jd']" id="attr_jd"--%>
                                                            <%--class="form-control"/>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
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
                                                    <c:when test="${sellOffer.publishFlag eq '1'}">
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
                                            <div class="col-sm-3">发布时间</div>
                                            <div class="col-sm-9">
                                                <fmt:formatDate value="${sellOffer.publishDate}"
                                                                pattern="yyyy-MM-dd HH:mm:ss"/>
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
                                                    ${sellOffer.createBy}
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-3">创建时间</div>
                                            <div class="col-sm-9">
                                                <fmt:formatDate value="${sellOffer.createDate}"
                                                                pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-3">更新人</div>
                                            <div class="col-sm-9">
                                                    ${sellOffer.updateBy}
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-3">更新时间</div>
                                            <div class="col-sm-9">
                                                <fmt:formatDate value="${sellOffer.updateDate}"
                                                                pattern="yyyy-MM-dd HH:mm:ss"/>
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

        <%--上传封面--%>
        <div class="modal inmodal" id="myModal-upload" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated fadeIn">
                    <div class="modal-header">
                        <h4 class="modal-title">上传文件</h4>
                    </div>
                    <div class="modal-body">
                        <div id="dropzone" class="dropzone">
                            <div class="dropzone-previews"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>

        <%--上传电子书文件/预览文件--%>
        <div class="modal inmodal" id="myModal-uploadEbookPreview" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated fadeIn">
                    <div class="modal-header">
                        <h4 class="modal-title">上传试读PDF电子书</h4>
                    </div>
                    <div class="modal-body">
                        <div id="dropzoneEbookPreviewPDF" class="dropzone">
                            <div class="dropzone-previews"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>

        <%--上传电子书文件/预览文件--%>
        <div class="modal inmodal" id="myModal-uploadEbookPDF" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated fadeIn">
                    <div class="modal-header">
                        <h4 class="modal-title">上传PDF电子书</h4>
                    </div>
                    <div class="modal-body">
                        <div id="dropzoneEbookPDF" class="dropzone">
                            <div class="dropzone-previews"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>

        <%--上传电子书文件/预览文件--%>
        <div class="modal inmodal" id="myModal-uploadEbookEPUB" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated fadeIn">
                    <div class="modal-header">
                        <h4 class="modal-title">上传EPUB电子书</h4>
                    </div>
                    <div class="modal-body">
                        <div id="dropzoneEbookEpub" class="dropzone">
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

<%--<v:javascript formName="sellOffer" cdata="false" dynamicJavascript="true" staticJavascript="false"/>--%>
<%--<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>--%>

<script type="text/javascript">

    var simpleRichProperties = ["copyRightInfo", "introduction", "editorRecommend", "catalogue", "authorInfo", "preface", "digest", "productFeatures"];
    var dropzone1, dropzone2;
    $(document).ready(function () {
        Dropzone.autoDiscover = false;

        <%--$("div.dropzone").dropzone({url: "${ctx}/backend/json/gallery-sellOffer/upload?objectId=${sellOffer.id}"});--%>

        dropzone1 = $("#dropzone").dropzone({
            url: "${ctx}/backend/json/gallery2-sellOffer/upload?objectId=${sellOffer.id}",
            addRemoveLinks: false,
            dictRemoveLinks: "x",
            dictCancelUpload: "x",
            maxFiles: 10,
            maxFilesize: 15,
            acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg",
            init: function () {
                this.on("success", function (file) {

                    var data = JSON.parse(file.xhr.response);

                    var dealed = false;
                    $(".panel-images").find(".productImage img").each(function () {
                        if (dealed) {
                            return;
                        }
                        if ($(this).attr("src") == "${ctx}/b/resource/images/document-image-128.png") {
                            $(this).attr("src", "${ctx}/" + data.url);
                            $(this).parents(".picturePanelWrapper").find("input[name='pictureUrl']").val(data.url);
                            dealed = true;
                        }
                    });

                });
                this.on("removedfile", function (file) {

                });
            }
        });

        // 上传试读PDF电子书文件
        $("#dropzoneEbookPreviewPDF").dropzone({
            url: "${ctx}/backend/ecommerce/product/sellOfferform/ebook-previewpdf/upload.json?objectId=${sellOffer.id}",
            addRemoveLinks: false,
            dictRemoveLinks: "x",
            dictCancelUpload: "x",
            maxFiles: 10,
            maxFilesize: 500,
            acceptedFiles: ".pdf",
            init: function () {
                this.on("success", function (file) {

                    var data = JSON.parse(file.xhr.response);
                    if(data.flag == "1"){
                        $("#previewPdfInfo .fileName").text(data.fileName);
                        $("#previewPdfInfo .fileSize").text(data.fileSize);
                        $("#previewPdfInfo .pageSize").text(data.page);
                    }
                    else{
                        toastError(data.msg);
                    }

                });
                this.on("removedfile", function (file) {

                });
            }
        });

        // 上传电子书文件
        $("#dropzoneEbookPDF").dropzone({
            url: "${ctx}/backend/ecommerce/product/sellOfferform/ebook-pdf/upload.json?objectId=${sellOffer.id}",
            addRemoveLinks: false,
            dictRemoveLinks: "x",
            dictCancelUpload: "x",
            maxFiles: 10,
            maxFilesize: 500,
            acceptedFiles: ".pdf",
            init: function () {
                this.on("success", function (file) {

                    var data = JSON.parse(file.xhr.response);
                    if(data.flag == "1"){
                        $("#pdfInfo .fileName").text(data.fileName);
                        $("#pdfInfo .fileSize").text(data.fileSize);
                        $("#pdfInfo .pageSize").text(data.page);
                    }
                    else{
                        toastError(data.msg);
                    }

                });
                this.on("removedfile", function (file) {

                });
            }
        });

        // 上传EPUB电子书文件
        $("#dropzoneEbookEpub").dropzone({
            url: "${ctx}/backend/ecommerce/product/sellOfferform/ebook-epub/upload.json?objectId=${sellOffer.id}",
            addRemoveLinks: false,
            dictRemoveLinks: "x",
            dictCancelUpload: "x",
            maxFiles: 10,
            maxFilesize: 500,
            acceptedFiles: ".epub",
            init: function () {
                this.on("success", function (file) {

                    var data = JSON.parse(file.xhr.response);
                    if(data.flag == "1"){
                        $("#epubInfo .fileName").text(data.fileName);
                        $("#epubInfo .fileSize").text(data.fileSize);
                    }
                    else{
                        toastError(data.msg);
                    }

                });
                this.on("removedfile", function (file) {

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

        var simpleMenuOptions = {
            maxFrameHeight: 800,
            initialFrameHeight: 400,
            autoClearinitialContent: false,
            initialContent: '',
            autoHeightEnabled: true,
            toolbars: [[
                'source', '|',
                'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                'lineheight', 'fontfamily', 'fontsize', 'indent', '|',
                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify'
            ]]
        };

        for (var i = 0; i < simpleRichProperties.length; i++) {
            var propertyName = simpleRichProperties[i];
            editor = new UE.ui.Editor(simpleMenuOptions);
            editor.render(propertyName);
        }

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
                spu:{
                    message: '商品编码不能为空',
                    validators: {
                        notEmpty: {
                            message: '商品编码不能为空'
                        },
                        remote: {
                            type: 'GET',
                            url: '${ctx}/backend/ecommerce/product/sellOfferform/checkSPU',
                            data: {
                                offerId: function () {
                                    return $("#id").val();
                                },
                                spu: function () {
                                    return $("#attr_SPU").val();
                                }
                            },
                            dataType: "json",
                            message: '商品编码已存在！',
                            delay: 1000
                        }
                    }
                },
                productName: {
                    message: '图书名称不能为空',
                    validators: {
                        notEmpty: {
                            message: '图书名称不能为空'
                        }
                    }
                },
                price: {
                    message: '价格格式错误',
                    validators: {
                        number: {
                            message: '价格必须为数字格式'
                        },
                    }
                }
            }
        }).on('success.form.bv', function (e) {

            var editor;
            // 图文详情
            var propertyName = "fullText";
            editor = UE.getEditor(propertyName);
            $("#attr_" + propertyName).val(editor.body.innerHTML);

            // 其他富文本属性
            for (var i = 0; i < simpleRichProperties.length; i++) {
                propertyName = simpleRichProperties[i];

                var editor = UE.getEditor(propertyName);
                $("#attr_" + propertyName).val(editor.body.innerHTML);
            }

        });

        $(".newImageSlotButton").click(function () {
            var newImageindex = $(".productImage").size();

            var data = {imageIndex: newImageindex};
            var html = template("imagePanelTemplate", data);

            $(".panel-images").append(html);
        });

//        $('.datebox').datetimepicker('hide');

        $(".touchspin2").TouchSpin({
            min: 0,
            max: 100000,
            step: 1,
            decimals: 0,
            boostat: 5,
            maxboostedstep: 10,
            buttondown_class: 'btn btn-white',
            buttonup_class: 'btn btn-white'
        });

        $(".touchspin3").TouchSpin({
            min: 0,
            max: 10000,
            step: 0.1,
            decimals: 2,
            boostat: 5,
            maxboostedstep: 10,
            buttondown_class: 'btn btn-white',
            buttonup_class: 'btn btn-white'
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
                    {objectType: "sellOffer", objectId: "${sellOffer.id}", imageIndex: imageIndex},
                    function () {
                        $(".tagFile").on("click", function () {
                            processImage(this);
                        });
                    });
        });

        initToolBarActions();

        if ($(".productImage").size() == 0) {
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
                url: "${ctx}/backend/json/productCategories/ztree",
                otherParam: {
                    include : false,
                    depth : 0,
                    open : 0
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
        var cityObj = $("#citySel");
        cityObj.attr("value", v);
        $("input[name='productCategoryId']").val(groupId);
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

    function createQrcode(sellOfferId,type) {
        var urlText = $("#attr_" + type).val();
        if(!urlText){
            toastError("错误", "要生成二维码的连接地址不能为空！");
            return;
        }
        $.ajax({
            url: "${ctx}/backend/json/ecommerce/product/sellOffer/createQrcode",
            data: {
                sellOfferId:sellOfferId,
                type:type,
                urlText:urlText
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#qrcode").attr("src","${ctx}/"+data.url);
                } else {
                    toastError("操作提示", "生成二维码出错，请重新生成！");
                }

            }
        });
    }
</script>
