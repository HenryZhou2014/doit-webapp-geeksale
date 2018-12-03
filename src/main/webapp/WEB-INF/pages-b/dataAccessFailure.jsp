<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<title>Data Access Error</title>
<head>
    <meta name="heading" content="Data Access Failure"/>
    <meta name="menu" content="AdminMenu"/>
</head>

<p style="margin: 45px;">
    <c:out value="${requestScope.exception.message}"/>
</p>
<pre>
<%
    Exception exception = (Exception) request.getAttribute("exception");
    exception.printStackTrace(new java.io.PrintWriter(out));
    exception.printStackTrace();
%>
</pre>
<a href="javascript:void(0);" onclick="history.back();return false">&#171; 返回</a>
