<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>资源下载</title>
    <meta name="heading" content="资源下载"/>
    <meta name="column-name" content="news"/>

    <style type="text/css">
        body {
            background: #f6f6f6;
        }

        #readerdownload {

        }

        .resource-item-list{
            padding: 0 0 0 20px;
        }

        .resource-item-list li{
            list-style: square;
            border-bottom: 1px dotted #999;
            margin-bottom: 10px;
            padding-bottom: 10px;
        }

        .resource-item-list li:last-child{
            border-bottom: none;
        }

        .resource-item-list .date{
            margin-right: 20px;
        }

        .resource-item-list a.title{
            color: #444;
            font-size: 16px;
        }

        .label-books{
            background: #ddd;
            font-size: 10px;
            padding: 2px 4px;
        }

        section h2{
            font-size: 18px;
            line-height: 20px;
            margin: 0;
            background: none;
        }

        div.heading-title h2{
            background: none;
        }
    </style>
</head>
<section id="portfolio" class="nopadding noborder margin-top-20">
    <div class="container">
        <div class="col-lg-12 bg-white">
            <div class="row margin-top-10 margin-bottom-10">

                <div class="col-md-8 col-sm-8">

                    <!-- Subtitle -->
                    <div class="heading-title heading-border">
                        <h2> <span>电子图书阅读器</span></h2>

                        <ul class="list-inline categories nomargin">
                            <li><a href="#">专注阅读</a></li>
                        </ul>

                    </div>
                    <!-- /Subtitle -->

                    <p>
                        在本出版社购买电子图书后，需要下载电子图书阅读程序以打开电子图书。
                    </p>

                    <div class="margin-top-60">
                        <div>
                            <a class="btn btn-primary btn-lg letter-spacing-1">下载PC阅读客户端</a>
                        </div>
                        <div>
                            (软件开发中，暂不提供下载)
                        </div>
                    </div>

                </div>

                <div class="col-md-4 col-sm-4">
                    <img class="img-responsive" src="${ctx}/images/cumtp.com/demo/education/th.jpg" alt=""/>
                </div>

            </div>
        </div>

    </div>


</section>

<section class="nopadding margin-top-20">
    <div class="container">
            <div class="col-lg-12 bg-white margin-bottom-20">

            <!-- RELATED -->
            <!-- Subtitle -->
            <div class="heading-title heading-border margin-top-10">
                <h2> <span>资源下载</span></h2>
            </div>
            <!-- /Subtitle -->

            <div class="">
                <div class="margin-bottom-20 padding-left-20">
                    <ul class="nav nav-pills mix-filter news-tabs">
                        <li data-cat="download" data-filter="all" class="filter"><a href="${ctx}/download">全部</a></li>
                        <li data-cat="resource-inventory" data-filter="all" class="filter"><a href="${ctx}/download?cat=resource-inventory">图书目录</a></li>
                        <li data-cat="resource-materials" data-filter="development" class="filter"><a href="${ctx}/download?cat=resource-materials">电子课件</a></li>
                        <li data-cat="resource-video" data-filter="development" class="filter"><a href="${ctx}/download?cat=resource-video">视频资料</a></li>
                        <li data-cat="resource-others" data-filter="design" class="filter"><a href="${ctx}/download?cat=resource-others">其他资料</a></li>
                    </ul>
                </div>

                <ul class="resource-item-list row nomargin">
                    <c:forEach items="${articleList}" var="item">
                        <c:set var="properties" value="${item.propertyMap}"/>
                        <!-- ITEM -->
                        <li>
                            <div>
                                <c:set var="scope" value="${properties['scope'].propertyValue}"/>
                                <div class="pull-right">
                                    <div>
                                        <fmt:formatDate value="${item.lastEditDate}" pattern="yyyy-MM-dd"/>
                                    </div>
                                    <div>
                                        <c:forEach items="${item.fileInfos}" var="file">
                                            <c:choose>
                                                <c:when test="${'p' eq scope}">
                                                    <a class="btn btn-default btn-xs" onclick="downloadFile('p',${file.id})" href="javascript:void(0)" target="_self"><i class="fa fa-download"></i>${file.fileName}</a>
                                                </c:when>
                                                <c:when test="${'m' eq scope}">
                                                    <a class="btn btn-default btn-xs" onclick="downloadFile('m',${file.id})" href="javascript:void(0)" target="_self"><i class="fa fa-download"></i>${file.fileName}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a class="btn btn-default btn-xs" onclick="downloadFile('0',${file.id})" href="javascript:void(0)" target="_self"><i class="fa fa-download"></i>${file.fileName}</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div>
                                    <span class="label-books">${item.articleCategory.title}</span>
                                    <a class="title" href="${ctx}/download/item-${item.id}.html" target="_blank">
                                        ${item.title}
                                    </a>

                                    <div>
                                        ${item.introText}
                                    </div>
                                    <div>
                                        下载提示:
                                        <c:choose>
                                            <c:when test="${'p' eq scope}">
                                                凭下载密码下载，请按下列方法索取密码。
                                            </c:when>
                                            <c:when test="${'m' eq scope}">
                                                会员下载
                                            </c:when>
                                            <c:otherwise>
                                                开放下载
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>


                <c:if test="${resultList.totalPage > 1}">
                    <div class="row margin-top-20 text-center">
                        <!-- Pagination Default -->
                        <ul class="pagination pagination-simple">
                            <li>
                                <a href="${ctx}/download.html?cat=${category}&page=1&sort=${sort}&dir=${dir}">&laquo;</a>
                            </li>
                            <c:set var="minPage" value="${resultList.pageNum-3}"/>
                            <c:set var="maxPage" value="${resultList.pageNum+3}"/>
                            <c:if test="${minPage < 1}">
                                <c:set var="minPage" value="1"/>
                            </c:if>
                            <c:if test="${maxPage > resultList.totalPage}">
                                <c:set var="maxPage" value="${resultList.totalPage}"/>
                            </c:if>
                            <c:forEach begin="${minPage}" end="${maxPage}" var="item">
                                <c:set var="activeClass" value=""/>
                                <c:if test="${item == resultList.pageNum}">
                                    <c:set var="activeClass" value="active"/>
                                </c:if>
                                <li class="${activeClass}">
                                    <a href="${ctx}/download.html?cat=${category}&page=${item}&sort=${sort}&dir=${dir}">${item}</a>
                                </li>
                            </c:forEach>
                            <li>
                                <a href="${ctx}/download.html?cat=${category}&page=${resultList.totalPage}&sort=${sort}&dir=${dir}">&raquo;</a>
                            </li>
                        </ul>

                    </div>
                </c:if>
                <!-- /Pagination Default -->
            </div>
    </div>
</div>
</section>

<!-- Modal -->
<div class="modal fade" id="modal_password" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">请输入资源下载密码</h4>
            </div>
            <div class="modal-body">
                <form method="get" class="form-horizontal">
                    <div class="form-group"><label class="col-sm-3 control-label">资源下载密码</label>
                        <div class="col-sm-9"><input id="filePassword" type="password" class="form-control"></div>
                    </div>
                </form>
                <p class="bg-danger" id="passwordDownloadErrorInfo" style="font-size: 20px;">
                </p>
                <p class="bg-info" id="checkFilePathInfo" style="font-size: 20px;">
                    <doit:namedTextModuleRichProperty var="downloadPsdInfo" property="fullText"/>
                </p>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="downloadByPassword()">确定</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

    var resourceId;
    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class
        $(".news-tabs li").each(function(){
            if($(this).attr("data-cat") == "${category}"){
                $(this).addClass("active");
            }
        });
    });
    
    function downloadFile(type,id) {

        if(type === 'p'){
            resourceId = id;
            $("#passwordDownloadErrorInfo").html("");
            $('#modal_password').modal('show');
        }else if(type === 'm'){
            $(".button-login").attr("data-url","${ctx}/download/resource-" + id);
            logon();
        }else{
            location.href = "${ctx}/download/resource-" + id;
        }
    }

    function downloadByPassword() {
        var password = $("#filePassword").val();
        var params = {};
        if(password){
            params = {code:password};
        }
        $.ajax({
            url:"${ctx}/checkFilePassword/resource-" + resourceId,
            dataType:'json',
            data:params,
            success:function (data) {
                if(data.code === "1"){
                    $("#passwordDownloadErrorInfo").html(data.msg);
                }else if(data.code === "0"){
                    $('#modal_password').modal('hide');
                    location.href = "${ctx}/download/resource-" + resourceId + "?code=" + password;
                }
            },
            error:function (e) {
            }
        });
    }

</script>
