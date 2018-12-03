<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>订单详细</title>
    <meta name="heading" content="<fmt:message key='goodsOrderDetail.heading'/>"/>
    <meta name="module-group" content="ecommerce-order-management"/>
    <meta name="module-subgroup" content="ecommerce-orders"/>
    <meta name="module" content="ecommerce-orders-list"/>
    <style type="text/css">
        table.myTable {

        }

        table.myTable > tbody > tr > th {
            vertical-align: middle;
            text-align: center;
        }

        .form-group {
            /*margin-bottom: 5px;*/
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
                <a>订单管理</a>
            </li>
            <li class="active">
                <strong>订单详细</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>订单详细</h5>
                    <div class="ibox-tools">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${ctx}/backend/ecommerce/product/sellOffers.html">刷新</a>
                            </li>
                            <li>
                                <a id="toolbar_publish" href="javascript:void(0);">关闭</a>
                            </li>
                            <li>
                                <a id="toolbar_unpublish" href="javascript:void(0);">打印</a>
                            </li>
                            <li>
                                <a id="toolbar_delete" href="javascript:void(0);">删除</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">
                    <form:form commandName="goodsOrder" method="post" action="sellOfferform" id="sellOfferForm"
                               class="form-horizontal"
                               enctype="multipart/form-data">
                        <form:hidden path="id"/>
                        <div class="row">
                            <div class="col-sm-12 col-md-7 col-lg-8">
                                <div class="tabs-container">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a data-toggle="tab" href="#tab-1">订单信息</a></li>
                                    </ul>
                                    <div class="tab-content">
                                            <%--基本信息 --%>
                                        <div id="tab-1" class="tab-pane active">
                                            <div class="form-group margin-top-20">
                                                <label class="col-sm-2 control-label nopadding">订单编号</label>
                                                <div class="col-sm-10">
                                                    <span>${goodsOrder.orderNo}</span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label nopadding">下单时间</label>
                                                <div class="col-sm-10">
                                                    <span>
                                                        <fmt:formatDate value="${goodsOrder.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label nopadding">金额</label>
                                                <div class="col-sm-10">
                                                    <span>
                                                        <fmt:formatNumber value="${goodsOrder.totalMoney}" minFractionDigits="2"/>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label nopadding">发票</label>
                                                <div class="col-sm-10">
                                                    <span>无</span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label nopadding">订单备注</label>
                                                <div class="col-sm-10">
                                                    <span>
                                                        ${goodsOrder.orderMemo}
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label nopadding">订单状态</label>
                                                <div class="col-sm-10">
                                                    <span>创建</span>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div class="tabs-container">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a data-toggle="tab" href="#tab-1">商品清单</a></li>
                                    </ul>
                                    <div class="tab-content">
                                            <%--基本信息 --%>
                                        <div id="tab-1" class="tab-pane active">
                                            <div class="form-group margin-top-20">
                                                <div class="col-sm-12">
                                                    <ul class="list-unstyled list-inline">
                                                        <c:forEach items="${goodsOrder.goodsOrderProducts}" var="item">
                                                            <li class="width-150">
                                                                <div>
                                                                    <div>
                                                                        <img src="${ctx}/images/cumtp.com/demo/mall/dangdang/23685329-1_l_12.jpg" class="img-responsive"/>
                                                                    </div>
                                                                    <div>
                                                                        ${item.name}
                                                                    </div>
                                                                    <div>
                                                                        <a>${item.productSku}</a>
                                                                    </div>
                                                                    <div>
                                                                        数量 ${item.productNum} x 单价 ${item.price} 元
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-5 col-lg-4">
                                <div class="ibox float-e-margins m-t-lg">
                                    <div class="ibox-title">
                                        <h5>顾客信息</h5>
                                    </div>
                                    <div class="ibox-content">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label nopadding">客户账号</label>
                                            <div class="col-sm-10">
                                                <span><a>${goodsOrder.clientAccount.accountName}</a></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label nopadding">姓名</label>
                                            <div class="col-sm-10">
                                                <span>${goodsOrder.clientAccount.userName}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label nopadding">联系方式</label>
                                            <div class="col-sm-10">
                                                <span>${goodsOrder.clientAccount.mobileNumber}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label nopadding">email</label>
                                            <div class="col-sm-10">
                                                <span>${goodsOrder.clientAccount.email}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>订单审核</h5>
                                    </div>
                                    <div class="ibox-content">

                                    </div>
                                </div>

                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>支付信息</h5>
                                    </div>
                                    <div class="ibox-content">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label nopadding">支付方式</label>
                                            <div class="col-sm-10">
                                                <span>
                                                    <c:choose>
                                                        <c:when test="${goodsOrder.paymentType eq '0'}">
                                                            <img src="${ctx}/images/icon/payment/weixin.png" style="max-height: 30px"/>
                                                        </c:when>
                                                        <c:when test="${goodsOrder.paymentType eq '1'}">
                                                            <img src="${ctx}/images/icon/payment/alipay.gif" style="max-height: 30px"/>
                                                        </c:when>
                                                        <c:when test="${goodsOrder.paymentType eq '5'}">
                                                            货到付款
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${goodsOrder.paymentType}
                                                        </c:otherwise>
                                                    </c:choose>

                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label nopadding">支付状态</label>
                                            <div class="col-sm-10">
                                                <span>
                                                    <c:choose>
                                                        <c:when test="${goodsOrder.paymentStatus eq '0'}">
                                                            <i class="fa fa-square-o"></i> 待付款
                                                        </c:when>
                                                        <c:when test="${goodsOrder.paymentStatus eq '1'}">
                                                            <div class="text-navy"><i class="fa fa-check-square-o"></i> 已付款</div>
                                                        </c:when>
                                                        <c:when test="${goodsOrder.paymentStatus eq '2'}">
                                                            <div class="text-navy"><i class="fa fa-check-square-o"></i> 已付款</div>
                                                        </c:when>
                                                        <c:when test="${goodsOrder.paymentStatus eq '3'}">
                                                            <div class="text-navy"><i class="fa fa-check-square-o"></i> 已付款</div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            goodsOrder.paymentStatus
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>收货信息</h5>
                                    </div>
                                    <div class="ibox-content">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label nopadding">收货人</label>
                                            <div class="col-sm-10">
                                                <span>${goodsOrder.deliveryAddress.name}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label nopadding">收货地址</label>
                                            <div class="col-sm-10">
                                                <span>${goodsOrder.deliveryAddress.address}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label nopadding">电话</label>
                                            <div class="col-sm-10">
                                                <span>${goodsOrder.deliveryAddress.phoneNum}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label nopadding">邮编</label>
                                            <div class="col-sm-10">
                                                <span>${goodsOrder.deliveryAddress.postcode}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>发货信息</h5>
                                    </div>
                                    <div class="ibox-content">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label nopadding">物流公司</label>
                                            <div class="col-sm-10">
                                                <span>
                                                    ${goodsOrder.deliveryInfo.companyName}
                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label nopadding">物流单号</label>
                                            <div class="col-sm-10">
                                                <span>
                                                    ${goodsOrder.deliveryInfo.expressNumber}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>客户确认信息</h5>
                                    </div>
                                    <div class="ibox-content">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    //    Form.focusFirstElement($('accountForm'));
    //    $("#academyName").focus();

    $(document).ready(function () {

        // 工具栏按钮事件绑定
        initToolBarActions();

        $(".numInput").keydown(function (e) {
            var keyCode = e.keyCode;
            if (keyCode == 8 || (keyCode > 47 && keyCode < 58) || keyCode == 190) {
                return true;
            } else {
                return false;
            }
        });
    });

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
        window.location.href = "${ctx}/backend/order/goodsOrderForm?id=" + ${goodsOrder.id};
    }
</script>
