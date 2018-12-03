<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/a/common/taglibs.jsp"%>
<style type="text/css">
    .latestNews-list ul{
        padding: 0;
    }
    .latestNews-list ul li{
        list-style: square;
        margin-left: 10px;
    }

    .latestNews-list ul li a{
        color: #444;
    }

    .latestNews-list ul li a:hover{
        color: #444;
    }
</style>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">最新资讯</h3>
    </div>
    <div class="panel-body">
        <div class="latestNews-list">
            <ul>
            <c:forEach items="${latestArticles}" var="item">
                <li>
                    <a href="${ctx}/cms/article/${item.id}">${item.title}</a>
                </li>
            </c:forEach>
            </ul>
        </div>
    </div>
</div>
