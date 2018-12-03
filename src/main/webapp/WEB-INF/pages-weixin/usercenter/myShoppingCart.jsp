<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>我的购物车</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="myOrders"/>

    <style type="text/css">
        .uppercase .delete-article, .uppercase .contibute-article {
            position: relative;
            float: right;
            margin-right: 5px;
        }

        #info .timeline .timeline-item {
            position: relative;
            min-height: 90px;
            display: block;
            margin-bottom: 50px;
        }

        .item{
            height:100px;
            padding:5px;
            margin: 10px 0;
        }

        .num_input{
            -web-kit-appearance:none;
            -moz-appearance: none;
            margin: 0;padding: 0;
            width:40px;
            height:30px;
            border:1px solid #A9A9A9;
            border-radius:0;
        }
    </style>
</head>

<div class="flexbox flex_column" style="height:100%">

    <div class="flex1 scroll">
        <c:forEach items="${cartData.items}" var="cartItem">
            <div class="flexbox flex_row item front-color" id="sku_${cartItem.skuId}">
                <div class="flexbox justify_center align_center" style="width:30px">
                    <input type="checkbox" id="checkbox_${cartItem.skuId}" data-id="${cartItem.skuId}" <c:if test="${not empty cartItem.selectFlag && cartItem.selectFlag == '1'}">checked="checked"</c:if> />
                </div>
                <div class="flexbox justify_center align_center" style="width:100px;">
                    <img src="${cartItem.img}"/>
                </div>
                <div class="flexbox flex_column flex1">
                    <div class="flex1">
                        <div>${cartItem.name}</div>
                        <div style="font-size: 12px;">
                            <span>作者: ${cartItem.author}</span>
                            <span style="margin-left:10px;">ISBN: ${cartItem.ISBN}</span>
                        </div>
                    </div>
                    <div style="height:30px;padding:0;margin:0" class="flexbox flex_row">
                        <div class="flex1" style="color:red">
                            <span>¥${cartItem.price}</span>
                        </div>
                        <div class="flexbox flex_row">
                            <div class="flexbox justify_center align_center delNum" style="width:30px;border-top: 1px solid #A9A9A9;border-bottom: 1px solid #A9A9A9;border-left:1px solid #A9A9A9" >－</div>
                            <input style="text-align: center" class="num_input" type="number" pattern="[0-9]*" value="${cartItem.num}" data-id = "${cartItem.skuId}"  name="qty" maxlength="3" max="999" min="1" />
                            <div class="flexbox justify_center align_center addNum" style="width:30px;border-top: 1px solid #A9A9A9;border-bottom: 1px solid #A9A9A9;border-right:1px solid #A9A9A9" >＋</div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="flexbox flex_row front-color" style="height:50px;border-top:2px solid #F6F6F6">
        <div id="shopCart" style="width: 160px" class="flexbox flex_column justify_center align_center">
            <span style="font-size: 16px">总计:¥<span id="payTotalPrc">${cartData.payTotalPrc}</span></span>
        </div>

        <div id="order" class="flex1 flexbox justify_center align_center" style="background-color: #F12F2F;color:white">
            <span style="font-size: 16px">去结算</span>
        </div>
    </div>
</div>


<script type="text/javascript">

    var originalInputValue = 1;

    $(document).ready(function () {

        $(".num_input").on("blur",function () {
            const _this = $(this);
            const currentNum = _this.val();


            if(!currentNum || currentNum.length<=0 || currentNum == 0){
                _this.val(originalInputValue);
                return;
            }

            if(originalInputValue == currentNum){
                return;
            }

            var skuId = _this.data("id");
            //将当前商品设置为选中状态
            var aaa = $("#sku_"+skuId).find(":checkbox");
            $(aaa).prop("checked",true);

            changeNum(skuId,currentNum,this);

        });

        $(".num_input").on("focus",function () {
            originalInputValue = $(this).val();
        });
        
        $(".delNum").click(function () {
            const numInput = $(this).next();
            var currentNum  = numInput.val();
            if(!currentNum){
                currentNum = 1;
            }

            currentNum = parseInt(currentNum);

            if(currentNum <= 1){
                return;
            }

            currentNum -= 1;
            numInput.val(currentNum);

            var skuId = numInput.data("id");

            //将当前商品设置为选中状态
            var aaa = $("#sku_"+skuId).find(":checkbox");
            $(aaa).prop("checked",true);
            changeNum(skuId,currentNum,numInput);
        });

        $(".addNum").click(function () {
            const numInput = $(this).prev();
            var currentNum  = numInput.val();
            if(!currentNum){
                currentNum = 1;
            }

            currentNum = parseInt(currentNum);

            if(currentNum >= 999){
                return;
            }

            currentNum += 1;
            numInput.val(currentNum);

            var skuId = numInput.data("id");
            //将当前商品设置为选中状态
            var aaa = $("#sku_"+skuId).find(":checkbox");
            $(aaa).prop("checked",true);
            changeNum(skuId,currentNum,numInput);
        })

        $("#order").on("click",function () {
            location.href="${ctx}/wx/order/orderForm";
        })
    });
    
    function changeNum(skuId,currentNum,currentInput) {
        $.ajax({
            url:'${ctx}/wx/usercenter/myShoppingCart/changeNum',
            data:{'skuId':skuId,'num':currentNum},
            dataType:'json',
            success:function(data){
                if(data.flag=="1"){
                    if(currentInput){
                        if(data.num != currentNum){
                            $(currentInput).val(data.num);
                        }
                    }

                    $("#totalPrc").html(data.data.totalPrc);
                    $("#payTotalPrc").html(data.data.payTotalPrc);
                }else{
                    if(currentInput){
                        $(currentInput).val(originalInputValue);
                    }
                }
            }
        })
    }

</script>
