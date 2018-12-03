<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%--图片下载--%>
<head>
    <title>图片下载订单信息</title>
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
<div class="container" style="margin: 15px auto;">
    <div class="col-lg-12 text-center">
        <h4>订单信息</h4>
        <input type="hidden" name="orderNo" value="${goodsOrder.orderNo}"/>
    </div>
    <hr/>
    <div class="row">
        <div class="col-sm-12">
            <div style="max-height: 340px; overflow: hidden; text-align: center">
                <img src="${ctx}/${img}" alt="" class="img-responsive text-center" style="max-height: 180px; overflow: hidden; margin: 0 auto;">
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-sm-2">
            <label>订单编号</label>
        </div>
        <div class="col-sm-10">
            ${goodsOrder.orderNo}
        </div>
    </div>
    <div class="row">
        <div class="col-sm-2">
            <label>订单时间</label>
        </div>
        <div class="col-sm-10">
            <fmt:formatDate value="${goodsOrder.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-2">
            <label>照片提供</label>
        </div>
        <div class="col-sm-10">
            <c:choose>
                <c:when test="${not empty photoFestival}">
                    <a href="${photoFestival.teamUrl}" class="label label-success text-warning"
                       style="font-size:14px; white-space: normal;">${photoFestival.team}</a>
                </c:when>
                <c:when test="${not empty shopInfo}">
                    <a href="${ctx}/shop/${accountInfo.newIndex}" class="label label-success text-warning"
                       style="font-size:14px;white-space: normal;">${shopInfo.name}</a>
                </c:when>
                <c:otherwise>
                    <a href="${ctx}/shop/${accountInfo.newIndex}" class="label label-success text-warning"
                       style="font-size:14px;white-space: normal;">${accountInfo.accountName}</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <div class="row" style="margin-top: 10px;">
        <div class="col-sm-12">
            <table class="table">
                <tr>
                    <%--<th>照片编号</th>--%>
                    <th>类型</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
                <tr>
                    <%--<td>
                        ${goodsOrderProduct.productSku}
                    </td>--%>
                    <td>
                        ${sellOffer.productName}
                    </td>
                    <td>
                        ${goodsOrderProduct.price}元
                    </td>
                    <td>
                        ${goodsOrderProduct.productNum}
                    </td>
                    <td>
                        ${goodsOrder.totalMoney}元
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <c:if test="${empty sellOffer.virtualFlag or sellOffer.virtualFlag eq '0'}">
        <div>
            <h4>收件人信息</h4>
            <hr/>
            <form id="consigneeForm" class="form-horizontal">
            <div  style="padding: 0 20px;">
                <div class="form-group">
                    <div class="col-xs-3">
                        <span>收件人</span>
                    </div>
                    <div class="col-xs-6">
                        <div>
                            <input id="consignee" class="form-control" type="text" name="consignee" maxlength="16" placeholder="收件人"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-3">
                        <span>电话</span>
                    </div>
                    <div class="col-xs-6">
                        <div>
                            <input id="tel" class="form-control" type="text" name="tel" maxlength="32" placeholder="联系电话"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-3">
                        <span>邮编</span>
                    </div>
                    <div class="col-xs-6">
                        <div>
                            <input id="zipcode" class="form-control" type="text" name="zipcode" maxlength="16" placeholder="邮编"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-3">
                        <span>地址</span>
                    </div>
                    <div class="col-xs-9">
                        <div>
                            <input id="deliveryAddress" class="form-control" type="text" name="deliveryAddress" maxlength="150" placeholder="详细地址"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-3">
                        <span>备注</span>
                    </div>
                    <div class="col-xs-9">
                        <div>
                            <input id="orderMemo" class="form-control" type="text" name="orderMemo" maxlength="150" placeholder="备注"/>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </c:if>

    <div class="row">
        <div class="col-sm-2">
            <label>说明</label>
        </div>
        <div class="col-sm-10">
            ${sellOffer.productDetail}
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12" style="margin-top: 10px;">
            <div class="center-block">
                <a href="javascript:void(0);" class="btn btn-success fullwidth" id="paymentButton">
                    微信支付
                </a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="well" style="margin-top: 10px;">
                <jsp:include page="/app/cms/module/namedArticle/download-product-memo"/>
            </div>
        </div>
    </div>
    <c:if test="${not empty shopInfo and not empty shopInfo.sceneryname}">
        <div class="row">
            <div class="col-sm-12">
                <div>
                    <c:choose>
                        <c:when test="${not empty shopInfo.sceneryWebsite}">
                            欢迎光临 <h4><a href="${shopInfo.sceneryWebsite}"><label class="label label-success">${shopInfo.sceneryname}</label></a></h4>
                        </c:when>
                        <c:otherwise>
                            欢迎光临 <h4><label class="label label-success">${shopInfo.sceneryname}</label></h4>
                        </c:otherwise>
                    </c:choose>
                </div>
                <c:if test="${not empty shopInfo.sceneryWebsite}">
                    <div >
                        网址:${shopInfo.sceneryWebsite}
                    </div>
                </c:if>
                <c:if test="${not empty shopInfo.sceneryDesc}">
                    <div >
                        ${shopInfo.sceneryDesc}
                    </div>
                </c:if>
                <c:if test="${not empty shopInfo.sceneryQrimgPath}">
                    <div style="text-align: center;" >
                        <img src="${shopInfo.sceneryQrimgPath}" style="max-height: 150px;"/>
                    </div>
                </c:if>
            </div>
        </div>
    </c:if>

</div>

<script type="text/javascript">

    //根据浏览的方式判断下载图片的方式
    $(document).ready(function () {
        $("#paymentButton").bind("click", function(){

            <c:choose>
                <c:when test="${empty sellOffer.virtualFlag or sellOffer.virtualFlag eq '0'}">
                    var orderNo = $("input[name='orderNo']").val().trim();
                    var consignee = $("input[name='consignee']").val().trim();
                    var tel = $("input[name='tel']").val().trim();
                    var zipcode = $("input[name='zipcode']").val().trim();
                    var deliveryAddress = $("input[name='deliveryAddress']").val().trim();
                    var orderMemo = $("input[name='orderMemo']").val().trim();

                    if (consignee.length == 0){
                        alert("请输入收件人姓名！");
                        return;
                    }

                    if (tel.length == 0){
                        alert("请输入收件人联系电话！");
                        return;
                    }

                    if (zipcode.length == 0){
                        alert("请输入邮政编码！");
                        return;
                    }

                    if (deliveryAddress.length == 0){
                        alert("请输入收件详细地址！");
                        return;
                    }

                    // 更新收货地址
                    $.ajax({
                        url:'${ctx}/order/orderInfo/updateDeliveryInfo',
                        type:'POST',
                        dataType:'json',
                        data:{
                            orderNo: orderNo,
                            consignee: consignee,
                            tel: tel,
                            zipcode: zipcode,
                            deliveryAddress: deliveryAddress,
                            orderMemo: orderMemo
                        },
                        success:function(data){
                            if(data.flag == 1){
                                invokePayment();
                            } else {
                                alert(data.msg);
                            }
                        }
                    });
                </c:when>
                <c:otherwise>
                    invokePayment();
                </c:otherwise>
            </c:choose>
        });

//        if (detectWeixinApi()) {  //若使用微信自带的浏览器就跳转到一个页面，利用浏览器自带行为下载。
            <%--$("#download").attr("href", "${ctx}/download/weixin/${a}/${b}");--%>
            <%--$(".hdDownload").attr("href", "${ctx}/download/weixin/hd/${a}/${b}");--%>
//        }

    });

    function action3D(){

    }

    /**
     检测微信JsAPI  判断是否是使用的微信自带的浏览器浏览的，是就返回true、否者返回false
     @param callback
     */
    function detectWeixinApi() {
        var ua = navigator.userAgent.toLowerCase();
        if (ua.match(/MicroMessenger/i) == "micromessenger") {
            return true;
        } else {
            return false;
        }
    }

    function onBridgeReady() {
        WeixinJSBridge.invoke(
                'getBrandWCPayRequest', {
                    "appId": "wx2421b1c4370ec43b",     //公众号名称，由商户传入
                    "timeStamp": " 1395712654",         //时间戳，自1970年以来的秒数
                    "nonceStr": "e61463f8efa94090b1f366cccfbbb444", //随机串
                    "package": "prepay_id=u802345jgfjsdfgsdg888",
                    "signType": "MD5",         //微信签名方式：
                    "paySign": "70EA570631E4BB79628FBCA90534C63FF7FADD89" //微信签名
                },
                function (res) {
                    if (res.err_msg == "get_brand_wcpay_request：ok") {
                    }     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
                }
        );
    }

    /*if (typeof WeixinJSBridge == "undefined") {
        if (document.addEventListener) {
            document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
        } else if (document.attachEvent) {
            document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
            document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
        }
    } else {
//        onBridgeReady();
    }*/

    function invokePayment(){

        WeixinJSBridge.invoke(
                'getBrandWCPayRequest', {
                    "appId": "${h5PayReqData.appId}",     //公众号名称，由商户传入
                    "timeStamp": "${h5PayReqData.timeStamp}",         //时间戳，自1970年以来的秒数
                    "nonceStr": "${h5PayReqData.nonceStr}", //随机串
                    "package": "${h5PayReqData.$package}",
                    "signType": "MD5",         //微信签名方式：
                    "paySign": "${h5PayReqData.paySign}" //微信签名
                },
                function (res) {
                    // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
                    if (res.err_msg == "get_brand_wcpay_request:ok") {
                        // 支付成功
                        // 1.跳转到下载页面
                       // todo

                    }
                    else if (res.err_msg == "get_brand_wcpay_request:cancel"){
                        // 支付过程中用户取消
                        alert("cancel");
                    }
                    else if (res.err_msg == "get_brand_wcpay_request:fail"){
                        // 支付失败
                        alert("fail");
                        var msg = "";
                        for(var elem in res){
                            msg += res[elem] + "\n";
                        }
                        alert(msg);
                    }
                    else{
                        var msg = "";
                        for(var elem in res){
                            msg += res[elem] + "\n";
                        }
                        alert(msg);
                    }
                }
        );
    }

</script>

<script src="${ctx}/scripts/bootstrapvalidator-0.52/dist/js/bootstrapValidator.min.js"></script>
