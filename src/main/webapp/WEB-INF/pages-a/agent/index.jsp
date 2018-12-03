<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>微信裂变</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="myBooks"/>

    <style type="text/css">
        .uppercase .delete-article,.uppercase .contibute-article{
            position:relative;float:right;
            margin-right: 5px;
        }

        #info .timeline .timeline-item {
            position: relative;
            min-height: 90px;
            display: block;
            margin-bottom: 50px;
        }

        .form-horizontal .checkbox{
            padding-top: 0;
        }

        .form-horizontal .control-label{
            padding-top: 5px;
        }

        .form-group{
            margin-bottom: 10px;
        }

        .checkbox+.checkbox, .radio+.radio{
            margin-top: 0;
        }

        .half-word{
            width:.5em;
            white-space: pre;
            font-family: '宋体';
        }
        .one-word{
            width:1em;
            font-family: '宋体';
        }
        .two-word{
            width:2em;
            white-space: pre;
            font-family: '宋体';
        }

        #preview{
            position: absolute;
            top: 0;
            right: 0;
        }

        div.price-table{
            margin: 0;
        }
    </style>
</head>

<div>
    <div class="container">

        <div>
            <div class="col-lg-1">
                <div class="thumbnail">
                    <img src="${ctx}/images/no_portrait.png" class="img-responsive"/>
                </div>
            </div>
            <div class="col-lg-11">
                <h4>
                    张弘毅
                </h4>
                <div>
                    金山河有限公司
                </div>
            </div>
        </div>

        <!-- RIGHT -->
        <div class="col-lg-12 margin-bottom-80">

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#home" data-toggle="tab">
                    微信裂变
                </a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade in active" id="home">
                    <div class="text-center">
                        <img src="${ctx}/images/wx_qr_code.jpg" style="max-width: 200px;"/>
                    </div>
                    <div class="text-center">
                        <a class="btn btn-success btn-lg">生成群发二维码</a>
                    </div>
                    <div>
                        <blockquote>
                            <h4>提示</h4>
                            <p>群发二维码的有效时间为2分钟，使用微信扫描后提示用户登录网页版微信，点击登录后，系统将管理员配置的信息群发至联系人清单。</p>
                        </blockquote>
                    </div>

                </div>
            </div>

            <ul class="nav nav-tabs nav-bottom-border">
                <li class="active"><a href="#home2" data-toggle="tab">
                    今日统计
                </a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade in active" id="home2">
                    <div class="row">

                        <div class="col-md-3 col-sm-3">

                            <div class="price-clean">
                                <h4>
                                    15<em>/次</em>
                                </h4>
                                <h5> 今日扫码 </h5>
                            </div>

                        </div>

                        <div class="col-md-3 col-sm-3">

                            <div class="price-clean">
                                <h4>
                                    9825<em>/人</em>
                                </h4>
                                <h5> 今日到达 </h5>
                            </div>

                        </div>

                        <div class="col-md-3 col-sm-3">

                            <div class="price-clean">
                                <h4>
                                    35<em>/次</em>
                                </h4>
                                <h5> 昨日扫码 </h5>
                            </div>

                        </div>

                        <div class="col-md-3 col-sm-3">

                            <div class="price-clean">
                                <h4>
                                    8720<em>/人</em>
                                </h4>
                                <h5> 昨日到达 </h5>
                            </div>

                        </div>

                    </div>

                </div>
            </div>

            <ul class="nav nav-tabs nav-bottom-border">
                <li class="active"><a href="#home1" data-toggle="tab">
                    增值服务
                </a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade in active" id="home1">

                    <div class="row pricetable-container">

                        <div class="col-md-4 col-sm-4 price-table">
                            <h3>START</h3>
                            <p>
                                $5.9
                                <span>Per month</span>
                            </p>

                            <ul>
                                <li>22GB Bandwidth</li>
                                <li>3Tb Storage</li>
                                <li>Unlimited Domains</li>
                                <li>Free Setup</li>
                            </ul>
                            <a href="#" class="btn btn-primary">详细</a>
                        </div>

                        <div class="col-md-4 col-sm-4 price-table popular">
                            <h3>PREMIUM</h3>
                            <p>
                                $9.9
                                <span>Per month</span>
                            </p>
                            <ul>
                                <li>22GB Bandwidth</li>
                                <li>3Tb Storage</li>
                                <li>Unlimited Domains</li>
                                <li>Free Setup</li>
                            </ul>
                            <a href="#" class="btn btn-default">详细</a>
                        </div>

                        <div class="col-md-4 col-sm-4 price-table">
                            <h3>PROFESSIONAL</h3>
                            <p>
                                $14.9
                                <span>Per month</span>
                            </p>
                            <ul class="pricetable-items">
                                <li>22GB Bandwidth</li>
                                <li>3Tb Storage</li>
                                <li>Unlimited Domains</li>
                                <li>Free Setup</li>
                            </ul>
                            <a href="#" class="btn btn-primary">详细</a>
                        </div>

                    </div>

                </div>
            </div>

            <ul class="nav nav-tabs nav-bottom-border">
                <li class="active"><a href="#home1" data-toggle="tab">
                    商户库
                </a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="home1">

                    <div class="callout alert alert-border">

                        <div class="row">

                            <div class="col-md-8 col-sm-8"><!-- left text -->
                                <h4>Call now at <strong>+800-565-2390</strong> and get 15% discount!</h4>
                                <p class="font-lato size-17">
                                    We truly care about our users and our product.
                                </p>
                            </div><!-- /left text -->


                            <div class="col-md-4 col-sm-4 text-right"><!-- right btn -->
                                <a href="#purchase" rel="nofollow" target="_blank" class="btn btn-success btn-lg">客户开户</a>
                            </div><!-- /right btn -->

                        </div>

                    </div>

                </div>
            </div>

            <ul class="nav nav-tabs nav-bottom-border">
                <li class="active"><a href="#home1" data-toggle="tab">
                    客户开户
                </a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade in active" id="home1">

                    <div class="callout alert alert-border">

                        <div class="row">

                            <div class="col-md-8 col-sm-8"><!-- left text -->
                                <h4>Call now at <strong>+800-565-2390</strong> and get 15% discount!</h4>
                                <p class="font-lato size-17">
                                    We truly care about our users and our product.
                                </p>
                            </div><!-- /left text -->


                            <div class="col-md-4 col-sm-4 text-right"><!-- right btn -->
                                <a href="#purchase" rel="nofollow" target="_blank" class="btn btn-success btn-lg">客户开户</a>
                            </div><!-- /right btn -->

                        </div>

                    </div>

                </div>
            </div>


        </div>
    </div>
</div>


<script type="text/javascript">

</script>
