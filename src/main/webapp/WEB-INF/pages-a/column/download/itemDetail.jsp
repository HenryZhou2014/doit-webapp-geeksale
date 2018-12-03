<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>${article.title}</title>
    <meta name="heading" content="新闻栏目"/>
    <meta name="column-name" content="news"/>
    <style type="text/css">
        body {
            background: #f6f6f6;
        }

        .article-content {
            overflow: hidden;
            min-height: 450px;
        }

        .article-content p {
            /*margin-bottom: 10px;*/
            text-indent: 32px;
        }

        p, pre, ul, ol, dl, dd, blockquote, address, table, fieldset, form {
            margin-bottom: 10px;
        }

        div.divider.double-line:before {
            border-top: 1px solid #2C3E50;
        }

        div.divider.double-line:after {
            border-top: 2px solid #2C3E50;
        }
    </style>
</head>

<!-- REVOLUTION SLIDER -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div>
                <ul class="list-unstyled list-inline navigator-bar line-height-50">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="${ctx}/index">首页</a>
                    </li>
                    <li class="nopadding"><i class="fa fa-angle-right nomargin-right"></i></li>
                    <li>
                        <a href="${ctx}/index">资源下载</a>
                    </li>
                    <c:if test="${not empty articleCategory}">
                        <li class="nopadding"><i class="fa fa-angle-right nomargin-right"></i></li>
                        <li>
                            <a>${articleCategory.title}</a>
                        </li>
                    </c:if>
                    <li class="nopadding"><i class="fa fa-angle-right nomargin-right"></i></li>
                    <li>
                        <a href="#">${article.title}</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-9">
            <div class="col-lg-12 bg-white">
                <div class="news_title">
                    <h2 class="weight-800 nomargin"
                        style="font-size: 24px;">${article.title}</h2>
                </div>

                <div>
                    <ul class="list-unstyled list-inline article-info">
                        <li>
                            <div class="article-time">
                                <i class="fa fa-calendar-o"></i> <fmt:formatDate value="${article.lastEditDate}"
                                                                                 pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
                            </div>
                        </li>
                        <li>
                            <div class="article-source">
                                <i class="fa fa-pencil"></i>
                                <c:choose>
                                    <c:when test="${not empty article.author}">
                                        ${article.author}
                                    </c:when>
                                    <c:otherwise>
                                        中国矿业大学出版社
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="divider double-line nomargin" style="border-color: #2C3E50;"><!-- divider --></div>

                <div class="article-content padding-30">
                    <doit:articleRichProperty var="${article}" property="fullText"/>
                    <div class="margin-top-30">
                        <h2 class="panel-title">下载列表</h2>
                        <hr style="background: black;margin-top:5px;" />
                            <c:set var="scope" value="${propertyMap['scope'].propertyValue}"/>
                            <c:forEach items="${article.fileInfos}" var="file">
                                <c:choose>
                                    <c:when test="${'p' eq scope}">
                                        <a style="display: block;margin-top:5px;" onclick="downloadFile('p',${file.id})" href="javascript:void(0)" target="_self"><i class="fa fa-download"></i> ${file.fileName}</a>
                                    </c:when>
                                    <c:when test="${'m' eq scope}">
                                        <a style="display: block;margin-top:5px;" onclick="downloadFile('m',${file.id})" href="javascript:void(0)" target="_self"><i class="fa fa-download"></i> ${file.fileName}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a style="display: block;margin-top:5px;" onclick="downloadFile('0',${file.id})" href="javascript:void(0)" target="_self"><i class="fa fa-download"></i> ${file.fileName}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-lg-3">
            <div class="col-lg-12 bg-white">
                <jsp:include page="/app/cms/module/relatedArticles">
                    <jsp:param name="articleId" value="${article.id}"/>
                </jsp:include>
            </div>

        </div>

    </div>


    <!-- /REVOLUTION SLIDER -->
</div>

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
    $(document).ready(function () {
//        $(".article-content img").addClass("img-responsive");
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