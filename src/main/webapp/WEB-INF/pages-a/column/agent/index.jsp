<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>经销商服务</title>
    <meta name="heading" content="资源下载"/>
    <meta name="column-name" content="news"/>

    <style type="text/css">
        body {
            background: #f6f6f6;
        }

        #readerdownload {

        }

        .resource-item-list {
            padding: 0 0 0 20px;
        }

        .resource-item-list li {
            list-style: square;
            border-bottom: 1px dotted #999;
            margin-bottom: 10px;
            padding-bottom: 10px;
        }

        .resource-item-list li:last-child {
            border-bottom: none;
        }

        .resource-item-list .date {
            margin-right: 20px;
        }

        .resource-item-list a.title {
            color: #444;
            font-size: 16px;
        }

        .label-books {
            background: #ddd;
            font-size: 10px;
            padding: 2px 4px;
        }

        section h2 {
            font-size: 18px;
            line-height: 20px;
            margin: 0;
            background: none;
        }

        div.heading-title h2 {
            background: none;
        }
    </style>
</head>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-12">
                <div class="text-right line-height-50">
                    <ul class="list-unstyled list-inline navigator-bar">
                        <li><a href="${ctx}/index.html"><i class="fa fa-home"></i> 首页</a></li>
                        <li class="nopadding"><i class="fa fa-angle-right nomargin-right"></i></li>
                        <li><a>经销商服务</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<section id="portfolio" class="nopadding noborder margin-bottom-20">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="bg-white ">

                    <div class="text-center padding-top-30 padding-bottom-10">
                        <h2 style="color:#444;">经销商服务</h2>
                    </div>

                    <div class="heading-title heading-border nomargin-bottom margin-top-20" style="margin-left:20px;">
                        <div><span class="size-16 weight-600">中国矿业大学出版社战略合作伙伴</span></div>
                        <ul class="list-inline categories nomargin">
                            <li><a href="#">首席代理商 / 最佳合作伙伴 / 优秀经销商</a></li>
                        </ul>
                    </div>

                    <div style="height: 1px; background: #a0a0a0;">

                    </div>

                    <div style="padding: 30px 50px;" class="margin-bottom-20">
                        <doit:namedTextModuleRichProperty var="agent-parternership" property="fullText"/>
                    </div>

                    <div class="clearfix"></div>

                    <div class="heading-title heading-border nomargin-bottom margin-top-30" style="margin-left: 20px;">
                        <div><span class="size-16 weight-600">业务联系方式</span></div>

                        <ul class="list-inline categories nomargin">
                            <li><a href="#">营销部实行小组业务分片负责制，如有具体业务请与区域经理联系。</a></li>
                        </ul>

                    </div>
                    <div style="height: 1px; background: #a0a0a0;">

                    </div>

                    <div style="padding: 30px;">
                        <doit:namedTextModuleRichProperty var="agent-depart-contacts" property="fullText"/>
                    </div>


                </div>
            </div>

            <div class="col-lg-4">
                <div class="bg-white">
                    <div class="alert alert-danger" style="padding: 5px 10px;"><!-- SUCCESS -->
                        <div class="nopadding nomargin"><strong>负责人联系方式</strong></div>
                    </div>
                    <div style="padding: 0 20px;">
                        <doit:namedTextModuleRichProperty var="agent-company-contacts" property="fullText"/>
                    </div>

                    <div class="alert alert-info margin-top-30" style="padding: 5px 10px;"><!-- SUCCESS -->
                        <div class="nopadding nomargin"><strong>矿大出版社帐户信息</strong></div>
                    </div>

                    <div style="padding: 0 20px;">
                        <doit:namedTextModuleRichProperty var="agent-account-info" property="fullText"/>
                    </div>

                    <div class="alert alert-success margin-top-30" style="padding: 5px 10px;"><!-- SUCCESS -->
                        <div class="nopadding nomargin"><strong>发货、退货查询</strong></div>
                    </div>

                    <div style="padding: 0 20px 30px 20px;">
                        <doit:namedTextModuleRichProperty var="agent-return-contacts" property="fullText"/>
                    </div>

                </div>

            </div>
        </div>
    </div>
</section>


<script type="text/javascript">

    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class


    });


</script>
