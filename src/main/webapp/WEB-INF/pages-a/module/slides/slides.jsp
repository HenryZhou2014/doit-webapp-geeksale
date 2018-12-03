<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/a/common/taglibs.jsp"%>

<div class="slider fullwidthbanner-container roundedcorners">

  <div class="fullwidthbanner" data-height="390" data-shadow="3" data-navigationStyle="">
    <ul class="hide">

      <c:forEach items="${slideGroupInfo.slides}" var="slide" varStatus="status">

        <c:choose>
          <c:when test="${status.index mod 2 == 0}">
            <li data-transition="fade" data-slotamount="7" data-masterspeed="300"
                data-saveperformance="off">
              <c:choose>
                <c:when test="${not empty slide.targetUrl}">
                  <a href="${slide.targetUrl}" target="_blank">
                    <img src="${ctx}/resource/common/smarty/assets/images/1x1.png"
                         data-lazyload="${ctx}/${slide.imagePath}"
                         alt="" data-bgfit="cover" data-bgposition="center center"
                         data-bgrepeat="no-repeat"/>
                  </a>
                </c:when>
                <c:otherwise>
                  <img src="${ctx}/resource/common/smarty/assets/images/1x1.png"
                       data-lazyload="${ctx}/${slide.imagePath}"
                       alt="" data-bgfit="cover" data-bgposition="center center"
                       data-bgrepeat="no-repeat"/>
                </c:otherwise>
              </c:choose>

              <c:if test="${not empty slide.title or not empty slide.memo}">
                <div class="tp-caption lft start"
                     data-x="0"
                     data-y="0"
                     data-speed="750"
                     data-start="750"
                     data-easing="easeOutExpo"
                     data-elementdelay="0.1"
                     data-endelementdelay="0.1"
                     data-endspeed="300">
                  <img src="${ctx}/resource/common/smarty/assets/images/1x1.png" alt=""
                       data-lazyload="${ctx}/resource/common/smarty/assets/images/caption_bg.png">
                </div>

                <c:if test="${not empty slide.title}">
                  <div class="tp-caption block_black lfl start"
                       data-x="left" data-hoffset="70"
                       data-y="195"
                       data-speed="300"
                       data-start="1500"
                       data-easing="easeOutExpo"
                       data-splitin="none"
                       data-splitout="none"
                       data-elementdelay="0.1"
                       data-endelementdelay="0.1"
                       data-endspeed="300">
                    <c:choose>
                      <c:when test="${not empty slide.targetUrl}">
                        <a href="${slide.targetUrl}" target="_blank">${slide.title}</a>
                      </c:when>
                      <c:otherwise>
                        ${slide.title}
                      </c:otherwise>
                    </c:choose>
                  </div>
                </c:if>

                <c:if test="${not empty slide.memo}">
                  <div class="tp-caption small_light_white lfl start"
                       data-x="left" data-hoffset="70"
                       data-y="250"
                       data-speed="1000"
                       data-start="1800"
                       data-easing="easeOutExpo"
                       data-splitin="none"
                       data-splitout="none"
                       data-elementdelay="0.1"
                       data-endelementdelay="0.1"
                       data-endspeed="300" style="max-width: 300px; white-space: normal; ">
                      ${slide.memo}
                  </div>
                </c:if>
              </c:if>

            </li>
          </c:when>
          <c:otherwise>
            <li data-transition="fade" data-slotamount="7" data-masterspeed="300"
                data-saveperformance="off">
              <c:choose>
                <c:when test="${not empty slide.targetUrl}">
                  <a href="${slide.targetUrl}" target="_blank">
                    <img src="${ctx}/resource/common/smarty/assets/images/1x1.png"
                         data-lazyload="${ctx}/${slide.imagePath}"
                         alt="" data-bgfit="cover" data-bgposition="center center"
                         data-bgrepeat="no-repeat"/>
                  </a>
                </c:when>
                <c:otherwise>
                  <img src="${ctx}/resource/common/smarty/assets/images/1x1.png"
                       data-lazyload="${ctx}/${slide.imagePath}"
                       alt="" data-bgfit="cover" data-bgposition="center center"
                       data-bgrepeat="no-repeat"/>
                </c:otherwise>
              </c:choose>

              <c:if test="${not empty slide.title or not empty slide.memo}">

                <div class="tp-caption lft start"
                     data-x="right"
                     data-y="0"
                     data-speed="750"
                     data-start="750"
                     data-easing="easeOutExpo"
                     data-elementdelay="0.1"
                     data-endelementdelay="0.1"
                     data-endspeed="300">
                  <img src="${ctx}/resource/common/smarty/assets/images/1x1.png" alt=""
                       data-lazyload="${ctx}/resource/common/smarty/assets/images/caption_bg.png">
                </div>

                <c:if test="${not empty slide.title}">
                  <div class="tp-caption block_black lfl start"
                       data-x="right" data-hoffset="-80"
                       data-y="135"
                       data-speed="300"
                       data-start="1000"
                       data-easing="easeOutExpo"
                       data-splitin="none"
                       data-splitout="none"
                       data-elementdelay="0.1"
                       data-endelementdelay="0.1"
                       data-endspeed="300">
                    <c:choose>
                      <c:when test="${not empty slide.targetUrl}">
                        <a href="${slide.targetUrl}" target="_blank">${slide.title}</a>
                      </c:when>
                      <c:otherwise>
                        ${slide.title}
                      </c:otherwise>
                    </c:choose>
                  </div>
                </c:if>

                <c:if test="${not empty slide.memo}">
                  <div class="tp-caption small_light_white lfl start"
                       data-x="right" data-hoffset="-80"
                       data-y="220"
                       data-speed="1000"
                       data-start="1000"
                       data-easing="easeOutExpo"
                       data-splitin="none"
                       data-splitout="none"
                       data-elementdelay="0.1"
                       data-endelementdelay="0.1"
                       data-endspeed="300" style="max-width: 300px; white-space: normal; ">
                      ${slide.memo}
                  </div>
                </c:if>
              </c:if>

            </li>
          </c:otherwise>
        </c:choose>

      </c:forEach>

    </ul>

    <div class="tp-bannertimer"><!-- progress bar --></div>
  </div>
</div>
