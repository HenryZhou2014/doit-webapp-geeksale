<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>建设中</title>
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

            <div class="callout alert alert-info noborder margin-top-60 margin-bottom-60">

                <div class="text-center">

                    <h3>紧急开发中，敬请期待！</h3>
                    <p class="font-lato size-20">
                        您可以在首页中查看我们的功能上线计划！
                    </p>

                    <a href="${ctx}/usercenter/dashboard" rel="nofollow" class="btn btn-info btn-lg margin-top-30">查看系统功能</a>

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
