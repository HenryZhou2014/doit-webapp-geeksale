<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/a/common/taglibs.jsp"%>

<div class="testimonial-bordered panel-body-nopadding">
  <div>
    <div>
      <div class="col-lg-5">
        <img src="${ctx}/images/common/wechat-logo.jpg" class="img-responsive"/>
      </div>
      <div class="col-lg-7">
        <div style="line-height: 120px;">微信号：shu_news</div>
      </div>
    </div>
    <div>
      <div class="col-lg-5">
        <img src="${ctx}/a/resource/images/sns/weibo.png" class="img-responsive"/>
      </div>
      <div class="col-lg-7">
        <div style="margin-top: 40px;">
          <wb:follow-button uid="1361639212" type="red_3" width="200" height="24" ></wb:follow-button>
        </div>
      </div>
    </div>

    <%--<iframe width="100%" height="550" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?language=&width=0&height=550&fansRow=2&ptype=1&speed=0&skin=1&isTitle=1&noborder=1&isWeibo=1&isFans=1&uid=1697507087&verifier=b7fab935&dpc=1"></iframe>--%>
    <iframe id="sina_widget_1361639212" style="width:100%; height:500px;" frameborder="0" scrolling="no" src="http://v.t.sina.com.cn/widget/widget_blog.php?uid=1361639212&height=500&skin=wd_02&showpic=1"></iframe>
  </div>
</div>