<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>注册成功</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>

    <style type="text/css">
        body {
            background: #f6f6f6;
        }
    </style>
</head>

<div class="container margin-top-20 margin-bottom-20">
    <div class="row">
        <div class="col-lg-12 padding-top-100 padding-bottom-100 bg-white text-center">

            <div class="alert alert-mini alert-success"><!-- DANGER -->
                <strong>成功注册!</strong> <a href="${ctx}/login">点击此处登陆</a>
            </div>

        </div>
    </div>
</div>



