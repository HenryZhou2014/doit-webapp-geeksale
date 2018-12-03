<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>账号信息</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="myProfile"/>

    <style type="text/css">
    </style>
</head>

<!-- -->

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <ul class="nav nav-tabs nav-bottom-border">
                <li class="active"><a href="#home-a" data-toggle="tab">系统通知</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade in active" id="home-a">
                    <ul class="latest-news-list">
                        <doit:articleListByCategoryTag categoy="['bulletin']" num="6">
                            <li>
                                <fmt:formatDate value="${articleItem.lastEditDate}" pattern="yyyy-MM-dd"/>
                                <a class="title margin-left-10" href="${ctx}/usercenter/news/item-${articleItem.id}.html" title="${articleItem.title}">
                                    ${articleItem.title}
                                </a>
                            </li>
                        </doit:articleListByCategoryTag>
                    </ul>
                </div>
            </div>

            <ul class="nav nav-tabs nav-bottom-border">
                <li class="active"><a href="#home" data-toggle="tab">微信裂变</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade in active" id="home">
                    <div class="col-lg-12">

                        <div class="row">

                            <div class="col-xs-6 col-sm-6 col-lg-3 margin-bottom-10">

                                <div class="price-clean">
                                    <div>
                                        <span class="size-30">${todaytimes}</span><em> / 次</em>
                                    </div>
                                    <h5> 今日扫码 </h5>
                                </div>

                            </div>

                            <div class="col-xs-6 col-sm-6 col-lg-3 margin-bottom-10">

                                <div class="price-clean">
                                    <div>
                                        <span class="size-30">${todayfriends}</span><em> 个好友</em> <span class="size-30">${today-group}</span><em> 个群 </em>
                                    </div>
                                    <h5> 今日到达 </h5>
                                </div>

                            </div>

                            <div class="col-xs-6 col-sm-6 col-lg-3 margin-bottom-10">

                                <div class="price-clean">
                                    <div>
                                        <span class="size-30">${yestodaytimes}</span><em> / 次</em>
                                    </div>
                                    <h5> 昨日扫码 </h5>
                                </div>

                            </div>

                            <div class="col-xs-6 col-sm-6 col-lg-3 margin-bottom-10">

                                <div class="price-clean">
                                    <div>
                                        <span class="size-30">${yestodayfriends}</span><em> 个好友</em> <span class="size-30">${yestoday-group}</span><em> 个群 </em>
                                    </div>
                                    <h5> 昨日到达 </h5>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>

            <div class="clearfix"></div>

            <ul class="nav nav-tabs nav-bottom-border margin-top-20">
                <li class="active"><a href="#home2" data-toggle="tab">周边客流</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade in active" id="home2">
                    <div class="col-lg-12">

                        <div class="col-md-3 col-sm-3">

                            <div class="price-clean">
                                <div>
                                    <span class="size-30">0</span><em>次</em>
                                </div>
                                <h5> 今日客流 </h5>
                            </div>

                        </div>

                        <div class="col-md-3 col-sm-3">

                            <div class="price-clean price-clean-popular">
                                <div>
                                    <span class="size-30">0</span><em>次</em>
                                </div>
                                <h5> 较昨日增长数 </h5>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-3">

                            <div class="price-clean">
                                <div>
                                    <span class="size-30">0</span><em>次</em>
                                </div>
                                <h5> 昨日客流 </h5>
                            </div>

                        </div>

                        <div class="col-md-3 col-sm-3">

                            <div class="price-clean price-clean-popular">
                                <div>
                                    <span class="size-30">0</span><em>次</em>
                                </div>
                                <h5> 较前日增长数 </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- LEFT -->
        <div class="col-lg-2 col-md-2 col-sm-3 col-lg-pull-10 col-md-pull-10 col-sm-pull-7">
            <jsp:include page="/app/usercenter/userCenterMenu"/>
        </div>

    </div>
</section>

<script type="text/javascript">

    $(document).ready(function (){

    });


</script>
