<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ include file="/a/common/taglibs.jsp"%>

<c:choose>
  <c:when test="${namedMenu eq 'about'}">
    <c:set var="contextMenu" value="productAndService"/>
  </c:when>
  <c:when test="${namedMenu eq 'actPhoto' or namedMenu eq 'cityPhoto' or namedMenu eq 'scenicSpot'}">
    <c:set var="contextMenu" value="cityPhoto"/>
  </c:when>
</c:choose>
<head>
  <title>${namedTextModule.title}</title>
  <meta name="menu" content="${contextMenu}"/>
</head>

<div class="container headpadding-top">
  <div class="row">
    <jsp:include page="/app/website/module/slides"/>
  </div>
  <div class="row marginRow">
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="row">
          <div class="col-sm-3">
            <%
              try{
                %>
                <jsp:include page="/app/website/menu/${namedMenu}"/>
            <%
              }
              catch (Exception ex){
                ex.printStackTrace();
              }
            %>
          </div>
          <div class="col-sm-9">
            <div class="panel panel-default">
              <div id="panelHeader" class="panel-heading">
                <h3 class="panel-title">
                    ${namedTextModule.title}
                </h3>
              </div>
              <div class="panel-body" style="min-height: 400px;">
                  <%
                    out.print(request.getAttribute("content"));
                  %>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

