<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>图书信息</title>
    <meta name="heading" content="新闻栏目"/>

    <link href="${ctx}/a/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>

    <style type="text/css">
        .param_name{
            width:80px;
        }
        .param_name_padding{
            padding:5px;
        }

        .info_head{
            border-bottom: 1px solid #D9EDF7;
            padding:5px;
        }
        section div.row>div{
            margin-bottom: 0px;
        }

    </style>
</head>

<div class="flexbox flex_column flex1">
    <div class="flexbox flex1 nopadding nomargin">
        <div class="container scroll-y">
            <div class="col-lg-12 margin-bottom-20">
                <div class="bg-white">
                    <div>
                        <!-- IMAGE -->
                        <div class="col-lg-4 col-sm-4">
                            <div class="margin-top-20">
                                <c:if test="${empty imgUrl}">
                                    <c:set var="imgUrl" value="${ctx}/images/cumtp.com/TRLOGO.jpg"/>;
                                </c:if>

                                <div class="thumbnail relative margin-bottom-3">
                                    <img src="${ctx}/${imgUrl}"  alt="This is the product title" style="max-height: 300px;"/>
                                </div>

                            </div>
                        </div>
                        <!-- /IMAGE -->
                        <!-- ITEM DESC -->
                        <div class="col-lg-8 col-sm-8">



                            <div class="margin-top-20">
                                <div>
                                    <h3 class="weight-800 nomargin-bottom">${selloffer.title}</h3>
                                </div>

                                <div class="margin-top-10">
                                    作者: ${selloffer.author}
                                </div>

                                <!-- price -->
                                <div class="shop-item-price margin-top-10" style="width: 200px; background: #f6f6f6;padding-left: 30px;">
                                    <a href="#" class="line-height-50" style="height: 50px;">
                                        <span class="size-30 line-height-50" style="color: #E52222;">${selloffer.price}</span>
                                        <span style="color:#666;">&yen;</span>
                                    </a>
                                </div>
                                <!-- /price -->

                                <div class="flexbox param_name_padding">
                                    <div class="param_name">ISBN</div>
                                    <div class="flex1">${selloffer.isbn}</div>
                                </div>
                                <div class="flexbox param_name_padding">
                                    <div class="param_name">出版社</div>
                                    <div class="flex1">${selloffer.pressName}</div>
                                </div>
                                <div class="flexbox param_name_padding">
                                    <div class="param_name">页数</div>
                                    <div class="flex1">${selloffer.categoryPropertyMap['pageTotal']}</div>
                                </div>
                                <div class="flexbox param_name_padding">
                                    <div class="param_name">出版日期</div>
                                    <div class="flex1">${selloffer.categoryPropertyMap['publicationDate']}</div>
                                </div>
                            </div>

                            <div>
                                <c:if test="${taobao_url_flag == '1'}">
                                    <div class="text-center" style="margin-top:10px;">
                                        <div>
                                            <img src="${ctx}/files/sellOffer/sellOffer-${selloffer.id}/qrcode/taobao_${selloffer.id}.png" class="img-responsive"/>
                                        </div>
                                        <div class="text-center">
                                            <p>
                                                扫描二维码，到我社天猫书城购买
                                            </p>
                                        </div>
                                    </div>
                                </c:if>
                            </div>

                            <!-- short description -->
                            <p>
                                <doit:sellOfferRichProperty var="${selloffer}" property="introduction" defaultText=""/>
                            </p>
                            <!-- /short description -->

                            <c:if test="${selloffer.buyable == '1'}">
                                <%--</form>--%>
                                <div class="row margin-top-20">
                                    <div class="col-sm-3 col-md-2"><span class="weight-600 line-height-40">数量</span></div>
                                    <div class="col-sm-9 col-md-10">
                                        <div style="width: 100px;">
                                            <input id="sku_num" type="text" value="1" min="1" max="10" class="form-control stepper" >
                                        </div>
                                    </div>
                                </div>
                                <!-- /FORM -->
                            </c:if>

                        </div>
                        <!-- /ITEM DESC -->
                    </div>

                    <div class="row">
                        <!-- RIGHT -->
                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <div class="col-lg-12">
                                <ul id="myTab" class="nav nav-tabs nav-top-border margin-top-30" role="tablist">
                                    <li role="presentation" class="active"><a href="#description" role="tab" data-toggle="tab">简介</a>
                                    </li>
                                </ul>

                                <div class="tab-content padding-top-20">
                                    <!-- DESCRIPTION -->
                                    <div role="tabpanel" class="tab-pane fade in active" id="description">
                                        <div class="row margin-bottom-20 size-12">
                                            <div class="col-lg-12">
                                                <div class="col-lg-4">
                                                    ISBN：${selloffer.isbn}
                                                </div>
                                                <div class="col-lg-4">
                                                    版次：${selloffer.categoryPropertyMap['revision']}
                                                </div>
                                                <div class="col-lg-4">
                                                    页数：${selloffer.categoryPropertyMap['pageTotal']}
                                                </div>
                                                <div class="col-lg-4">
                                                    字数：${selloffer.categoryPropertyMap['wordNm']}
                                                </div>
                                                <div class="col-lg-4">
                                                    印刷时间：${selloffer.categoryPropertyMap['printingDate']}
                                                </div>
                                                <div class="col-lg-4">
                                                    开本：${selloffer.categoryPropertyMap['bookSize']}
                                                </div>
                                                <div class="col-lg-4">
                                                    纸张：${selloffer.categoryPropertyMap['paperType']}
                                                </div>
                                                <div class="col-lg-4">
                                                    印次：${selloffer.categoryPropertyMap['impression']}
                                                </div>
                                                <div class="col-lg-4">
                                                    包装：${selloffer.categoryPropertyMap['binding']}
                                                </div>
                                                <div class="col-lg-4">
                                                    分类：${selloffer.productCategory.title}
                                                </div>
                                            </div>
                                        </div>

                                        <div class="info_head margin-top-10 margin-bottom-10">
                                            <span class="size-14">编辑推荐</span>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12" style="padding-left: 30px;">
                                                <doit:sellOfferRichProperty var="${selloffer}" property="editorRecommend" defaultText="暂无内容"/>
                                            </div>
                                        </div>

                                        <div class="info_head margin-top-10 margin-bottom-10">
                                            <span class="size-14">作者简介</span>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12" style="padding-left: 30px;">
                                                <doit:sellOfferRichProperty var="${selloffer}" property="authorInfo" defaultText="暂无内容"/>
                                            </div>
                                        </div>

                                        <div class="info_head margin-top-10 margin-bottom-10">
                                            <span class="size-14">目录</span>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12" style="padding-left: 30px;">
                                                <doit:sellOfferRichProperty var="${selloffer}" property="catalogue" defaultText="暂无内容"/>
                                            </div>
                                        </div>

                                        <div class="info_head margin-top-10 margin-bottom-10">
                                            <span class="size-14">前言</span>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12 padding-left-10" style="padding-left: 30px;">
                                                <doit:sellOfferRichProperty var="${selloffer}" property="preface" defaultText="暂无内容"/>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                                <h2 class="owl-featured">相关图书</h2>
                                <div class="owl-carousel featured nomargin owl-padding-10"
                                     data-plugin-options='{"singleItem": false, "items": "6", "stopOnHover":false, "autoPlay":4500, "autoHeight": false, "pagination": false}'>

                                    <c:forEach items="${rSellOffer}" var="sellOffer">
                                        <!-- item -->
                                        <div class="shop-item nomargin">

                                            <div class="thumbnail">
                                                <!-- product image(s) -->
                                                <a class="shop-item-image" href="${ctx}/mall/item-${sellOffer.id}.html">
                                                    <img class="img-responsive"
                                                         src="${sellOffer.imageUrl}"
                                                         alt="shop first image"/>
                                                </a>
                                                <!-- /product image(s) -->

                                            </div>

                                            <div class="shop-item-summary text-center">
                                                <h2>${sellOffer.title}</h2>

                                                <!-- price -->
                                                <div class="shop-item-price">
                                                        ${sellOffer.price}元
                                                </div>
                                                <!-- /price -->
                                            </div>

                                        </div>
                                        <!-- /item -->
                                    </c:forEach>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="flexbox flex_row front-color" style="height:50px;border-top:2px solid #F6F6F6">
        <div id="shopCart" style="width: 50px" class="flexbox flex_column justify_center align_center">
            <i class="fa fa-cart-arrow-down" style="font-size: 24px;"></i>
            <span style="font-size: 10px">购物车</span>
        </div>
        <div id="shopping_cart_btn" class="flex1 flexbox justify_center align_center" style="background-color: #FDBE13;color:white">
            <span>加入购物车</span>
        </div>
        <div class="flex1 flexbox justify_center align_center" style="background-color: #F12F2F;color:white">
            <span>立即购买</span>
        </div>
    </div>
</div>



<script type="text/javascript">

    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class
        $("#shopping_cart_btn").click(function(){
            $.ajax({
                url:'${ctx}/mycart/add',
                data:{skuId:${sku_id}},
                dataType:'json',
                success:function(data){
                    if(data.flag=="1"){
                        weui.toast('添加成功', 3000);
                    }else{
                        alert("操作失败");
                    }
                }
            })
        });

        $("#shopCart").click(function(){
            location.href = "${ctx}/wx/usercenter/myShoppingCart";
        });
    });
</script>
