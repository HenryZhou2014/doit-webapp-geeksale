<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/a/common/taglibs.jsp"%>

<div class="testimonial-bordered panel-body-nopadding">
  <div class="panel-title">
    <div class="pull-left">
      <h3>阅读排行</h3>
    </div>

    <div class="clearfix"></div>
  </div>

  <div class="divider"><!-- divider --></div>
  <div style="padding: 10px 20px 20px 10px;">
    <ul class="top-articles list-unstyled">
      <c:forEach items="${latestArticles}" var="item" varStatus="status">
        <li>
          <a class="pull-left" href="${ctx}/news/item-${item.id}" target="_blank"><span>${status.index + 1}</span> ${item.title}</a>
          <span class="pull-right">
            <fmt:formatDate value="${item.lastEditDate}" pattern="yy-MM-dd"/>
          </span>
          <div class="clearfix"></div>
        </li>
      </c:forEach>
    </ul>
    <div class="clearfix"></div>
  </div>
</div>