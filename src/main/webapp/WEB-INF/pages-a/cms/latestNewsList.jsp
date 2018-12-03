<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp"%>
<%--首页--%>
<head>
    <title>首页</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="menu" content="home"/>

</head>

<div class="container headpadding-top">

    <div class="row">
        首页 &gt; 最新资讯
    </div>

    <div class="row" style="margin-top: 10px;">
        <ul>
            <c:forEach items="${dataList}" var="item">
                <li>
                    <a href="${ctx}/cms/article/${item.id}" >${item.title}</a>
                </li>
            </c:forEach>
        </ul>
    </div>

</div>
