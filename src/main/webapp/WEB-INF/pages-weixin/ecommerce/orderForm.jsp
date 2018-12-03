<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--图片下载--%>
<head>
    <title>填写订单</title>
    <meta name="menu" content="imgDownload"/>
    <link href="${ctx}/scripts/bootstrapvalidator-0.52/dist/css/bootstrapValidator.min.css" rel="stylesheet">
    <%--<script href="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"/>--%>
    <style type="text/css">
        .form-horizontal .form-group{
            /*margin-bottom: 5px;*/
        }

        .table{
            margin-bottom: 5px;
        }
    </style>
</head>



<section class="noborder margin-0 padding-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="callout alert alert-default margin-top-10 margin-bottom-10">
                    <div class="row">
                        <div class="col-md-12 col-sm-12"><!-- left text -->
                            <div class="pull-right">
                                <a href="javascript:void(0)" class="btn btn-default btn-xs" onclick="addAddress()">新增收货地址</a>
                            </div>
                            <span>收货地址</span>
                        </div><!-- /left text -->
                    </div>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">

                <ul class="list-unstyled" id="address_view">
                    <c:forEach items="${myAddress}" var="address" varStatus="status">
                        <c:choose>
                            <c:when test="${status.index == 0}">
                                <li id="address_${address.id}" class="flexbox flex_row flex1">
                            </c:when>
                            <c:otherwise>
                                <li id="address_${address.id}" style="display: none" class="flexbox flex_row flex1">
                            </c:otherwise>
                        </c:choose>
                        <label class="radio flex1">
                            <input type="radio" name="selected_address" value="${address.id}"
                                   <c:if test="${not empty address.defaultFlag && address.defaultFlag eq '1'}">checked="checked"</c:if> />
                            <i></i> <span>${address.name}(${address.phoneNum}) ${address.provinceName}(${address.cityName}) ${address.address}</span>
                            <c:if test="${not empty address.defaultFlag && address.defaultFlag eq '1'}">
                                <span class="default_address">默认地址</span>
                            </c:if>
                        </label>
                        <div class="pull-right" style="display: none">
                            <a href="javascript:void(0)" onclick="setDefaultAddress(${address.id})" class="btn btn-default btn-xs">设为默认地址</a>
                            <a href="javascript:void(0)" onclick="updateAddress(${address.id})" class="btn btn-default btn-xs">编辑</a>
                            <a href="javascript:void(0)" onclick="removeAddress(${address.id})" class="btn btn-default btn-xs">删除</a>
                        </div>
                        </li>
                    </c:forEach>
                </ul>
                <span id="address_toggle_btn" style="cursor: pointer;">更多地址 <i class="fa fa-angle-double-down"></i></span>
            </div>

        </div>

    </div>
</section>



<script src="${ctx}/scripts/bootstrapvalidator-0.52/dist/js/bootstrapValidator.min.js"></script>
