<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/a/common/taglibs.jsp"%>

<c:set var="slideHeight" value="390"/>
<c:if test="${not empty height}">
    <c:set var="slideHeight" value="${height}"/>
</c:if>

<div class="owl-carousel owl-padding-3 buttons-autohide controlls-over"
     data-plugin-options='{"singleItem": false, "items": "1", "autoPlay": true, "navigation": true, "pagination": true}'>
    <c:forEach items="${slideGroupInfo.slides}" var="slide" varStatus="status">
        <a class="img-hover" href="#">
            <img class="img-responsive" src="${ctx}/${slide.imagePath}" alt="" />
        </a>
    </c:forEach>
</div>