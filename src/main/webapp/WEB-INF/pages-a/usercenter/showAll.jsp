<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>查看编辑的网页</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="myHtmls"/>

    <style type="text/css">
    </style>

    <script type="text/javascript">
        function previewHtml(uui){
//            alert(uui);
            window.open("/htmlDir/"+uui+'.html', '_blank', 'width=800,height=700,menubar=no,toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=yes');
        }
    </script>
</head>

<!-- -->

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <div class="callout alert alert-info noborder margin-top-60 margin-bottom-60">

                <div class="text-center">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <td>名称</td>
                            <td>创建时间</td>
                            <td>预览</td>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${html}" var="u">
                                 <tr>
                                      <td>${u.name}</td>
                                      <td>${u.creTime}</td>
                                      <td><input type="button" onclick="previewHtml('${u.indexId}')" value="预览网页"/> </td>
                                 </tr>
                                e
                            </c:forEach>
                        </tbody>
                  </table>
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
