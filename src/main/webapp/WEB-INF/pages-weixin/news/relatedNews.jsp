<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>

<div class="panel-news-related">
    <div class="row title">
        相关阅读
    </div>
    <div class="margin-top-20">
        <ul class="list-unstyled list-dotted">
            <c:forEach items="${articleList}" var="item" varStatus="status">
                <li>
                    <span>
                        <fmt:formatDate value="${item.lastEditDate}" pattern="yyyy-MM-dd"/>
                    </span>
                    <a href="${ctx}/wx/news/${item.id}" >
                        ${item.title}
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>