<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/a/common/taglibs.jsp"%>

<div class="testimonial-bordered panel-body-nopadding">
  <div class="panel-title">
    <div class="pull-left">
      <h3>焦点关注</h3>
    </div>

    <div class="more pull-right">
      <a href="${ctx}/news/cat-31" title="更多">更多 <i class="fa fa-angle-right"></i></a>
    </div>
    <div class="clear clearfix"></div>
  </div>

  <div class="divider"><!-- divider --></div>

  <div style="padding:  0 30px;">

    <c:forEach items="${articles}" var="item" varStatus="status">

      <div class="row margin-top-20">
        <div class="article-item-panel">
          <div class="col-xs-4 col-lg-4" style="padding: 0;">
            <a href="${ctx}/news/item-${item.id}" target="_blank" class="article-image">
              <img class="img-responsive"
                   src="${ctx}/${articleImageInfoMap[item.id].imagePath}"
                   alt=""/>
            </a>
          </div>
          <div class="col-xs-8 col-lg-8">
            <h4 class="article-title">
              <a href="${ctx}/news/item-${item.id}" target="_blank">
                ${item.title}
              </a>
            </h4>

            <div>
              <ul class="list-unstyled list-inline artile-author-items">
                <li>
                  <fmt:formatDate value="${item.lastEditDate}" pattern="yyyy-MM-dd"/>
                </li>
                <li>
                  <c:if test="${not empty item.author}">
                    文/${item.author}
                  </c:if>
                  <c:if test="${not empty item.authorImage}">
                    图/${item.authorImage}
                  </c:if>
                  <c:if test="${not empty item.authorVideo}">
                    摄影/${item.authorVideo}
                  </c:if>
                  <c:if test="${not empty item.authorDecorate}">
                    排版/${item.authorDecorate}
                  </c:if>
                </li>
                <li></li>
              </ul>
            </div>

            <p class="article-abstract hidden-xs">
              ${item.introText}
            </p>

            <ul class="list-inline list-separator article-toolbar-items">
              <li>
                <a href="${ctx}/news/item-${item.id}#comments">
                  <i class="fa fa-comments-o"></i>
                    ${item.commentNum}
                </a>
              </li>
              <li>
                <a class="shareButton" href="blog-single-default.html#comments" data-container="body" data-toggle="popover" data-placement="top" data-content="" data-original-title="">
                  <i class="fa fa-share" data-toggle="popover"></i>
                </a>
                <div class="sharePanel hidden">
                  <div>
                    <wb:share-button appkey="731429745" addition="simple" type="button" title="${item.title}" url="http://www.cumtp.com"></wb:share-button>
                  </div>
                  <div>
                    <a class="qcShareQQDiv sns_share_tx" href="http://connect.qq.com/widget/shareqq/index.html" target="_blank" data-url="http://www.cumtp.com/news/item-${item.id}" data-title="${item.title}" data-summary="${item.introText}" data-pics="" data-flash="">分享到QQ</a>
                  </div>
                  <div>
                    <a class="qzOpenerDiv sns_share_zone" href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey" target="_blank" data-url="http://www.cumtp.com/news/item-${item.id}" data-title="${item.title}" data-summary="${item.introText}" data-pics="" data-flash="">分享到QQ空间</a>
                  </div>
                </div>
              </li>
              <li>
                  <i class="fa fa-thumbs-o-up"></i>
                  ${item.likeNum}
              </li>
            </ul>

          </div><!-- /post -->

        </div>
      </div>

      <c:if test="${not status.last}">
        <hr/>
      </c:if>
      <c:if test="${status.last}">
        <div style="height: 8px;"></div>
      </c:if>
    </c:forEach>

  </div>
</div>

<script type="text/javascript">
  (function(){

    $("[data-toggle=popover]").popover({
      html: true,
      hide:300,
      content: function() {
        var content = $(this).parent().find(".sharePanel").html();
        return content;
      }});

  })();
</script>
