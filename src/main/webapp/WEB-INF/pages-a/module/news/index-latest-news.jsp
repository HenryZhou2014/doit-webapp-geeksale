<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/a/common/taglibs.jsp"%>

<div class="testimonial-bordered panel-body-nopadding">
  <div class="panel-title">
    <div class="pull-left">
      <h3>最新新闻</h3>
    </div>

    <div class="more pull-right">
      <a href="${ctx}/news.html" title="更多">更多 <i class="fa fa-angle-right"></i></a>
    </div>
    <div class="clear clearfix"></div>
  </div>

  <div class="divider"><!-- divider --></div>

  <c:set var="headArticle" value="${latestArticles[0]}"/>

  <div style="padding-right: 15px;">
    <div>
      <div class="row">
        <div class="col-lg-3">
          <div style="padding-left: 20px;max-height: 100px; overflow: hidden;">
            <img class="img-responsive" src="${ctx}/${articleImageInfoMap[headArticle.id].imagePath}">
          </div>
        </div>
        <div class="col-lg-9">
          <div>
            <h4>
              <a href="${ctx}/news/item-${headArticle.id}">${headArticle.title}</a>
              <div class="pull-right" style="font-size: 12px; padding-top: 5px;">
                <fmt:formatDate value="${headArticle.lastEditDate}" pattern="yy-MM-dd"/>
              </div>
            </h4>
          </div>
          <div>
            ${headArticle.introText}
          </div>
        </div>
      </div>
    </div>
    <div style="padding:  20px 10px 0 20px;">
      <ul class="latest-articles list-unstyled">
        <c:forEach items="${latestArticles}" var="item" varStatus="status" begin="1">
          <li>
            <a href="${ctx}/news/item-${headArticle.id}">${item.title}</a>
            <span class="pull-right">
              <fmt:formatDate value="${item.lastEditDate}" pattern="yy-MM-dd"/>
            </span>
          </li>
        </c:forEach>
      </ul>
    </div>
  </div>

</div>