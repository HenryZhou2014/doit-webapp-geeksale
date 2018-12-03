<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>${namedTextModule.title}</title>

    <meta name="column-name" content="news"/>

    <link href="${ctx}/a/resource/styles/column-articles.css" rel="stylesheet" type="text/css"/>

    <style type="text/css">

        body {
            background: #f6f6f6;
        }

        .suojin p{
            text-indent: 2em;
        }

        .suojin{
            font-family: "Microsoft Yahei", "微软雅黑", "宋体", "新宋体", "黑体", STHeiti;
            letter-spacing: 2px;
            font-size: 16px;
        }

        .fixed-content{
            min-height: 400px;
        }
    </style>
</head>
<section style="margin: 0;padding: 0;">
    <!-- REVOLUTION SLIDER -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-12">
                    <div class="text-right line-height-50">
                        <ul class="list-unstyled list-inline navigator-bar">
                            <li><a href="${ctx}/index.html"><i class="fa fa-home"></i> 首页</a></li>
                            <li class="nopadding"><i class="fa fa-angle-right nomargin-right"></i></li>
                            <li><a>本社概况</a></li>
                            <li class="nopadding"><i class="fa fa-angle-right nomargin-right"></i></li>
                            <li><a>${namedTextModule.title}</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2 col-sm-2 nopadding-right">
                <jsp:include page="/app/website/menu">
                    <jsp:param name="menuFile" value="/menu/column-aboutus"/>
                </jsp:include>
            </div>

            <div class="col-md-10 col-sm-10 margin-bottom-20 nopadding-left">
                <div>
                    <div class="col-lg-12 bg-white">
                        <h3 class="margin-top-30 text-center margin-bottom-20">${namedTextModule.title}</h3>
                        <div style="height: 3px; background: #2C3E50;">

                        </div>
                        <div class="padding-30 fixed-content">
                            <doit:namedTextModuleRichProperty var="${namedTextModule}" property="fullText"/>
                        </div>
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
