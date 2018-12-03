<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>支付宝支付</title>
</head>
<%
    String alipayHtml = (String)request.getAttribute("htmlText");
    out.print(alipayHtml);
%>
