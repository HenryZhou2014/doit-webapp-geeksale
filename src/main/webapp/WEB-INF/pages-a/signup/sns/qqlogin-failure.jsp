<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp"%>
<%--会员登录页--%>
<head>
    <title>注册成功</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>

    <style type="text/css">
        .register-success-bg{
            <%--background: url(${ctx}/a/resource/images/cmxgc/26.jpg) no-repeat;--%>
            /*height: 100%;*/
        }
    </style>
</head>

<div class="register-success-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 margin-top-100">
                <div class="alert alert-success margin-top-50"><!-- WARNING -->
                    <strong>注册完成!</strong> <a href="${ctx}/login">点击此处登陆</a>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

    $(document).ready(function(){

        $(".footer").addClass("navbar-fixed-bottom");
        $(".register-success-bg").height($(".footer").offset().top-$(".register-success-bg").offset().top);
        $(window).resize(function(){
            $(".register-success-bg").height($(".footer").offset().top-$(".register-success-bg").offset().top);
        });
    });

</script>
