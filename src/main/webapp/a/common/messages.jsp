<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>

<%@ include file="/a/common/taglibs.jsp" %>

<%-- Error Messages --%>
<c:if test="${not empty errors}">
    <%--<div class="error" id="errorMessages">--%>
        <c:forEach var="error" items="${errors}">
            <%--<img src="<c:url value="/images/iconWarning.gif"/>"
                alt="<fmt:message key="icon.warning"/>" class="icon" />
            <c:out value="${error}"/><br />--%>
            <c:if test="${not empty error}">
                <script type="text/javascript">
                    $(document).ready(function () {
                        _toastr("${error}","top-center","error",false);

                    });
                </script>
            </c:if>

        </c:forEach>
    <%--</div>--%>
    <c:remove var="errors"/>
</c:if>

<%-- Success Messages --%>
<c:if test="${not empty successMessages}">
    <%--<div class="message" id="successMessages">--%>
        <c:forEach var="msg" items="${successMessages}">
            <%--<img src="<c:url value="/images/iconInformation.gif"/>"
                alt="<fmt:message key="icon.information"/>" class="icon" />
            <c:out value="${msg}"/><br />--%>
            <c:if test="${not empty msg}">
            <script type="text/javascript">
                $(document).ready(function () {
                    _toastr("${msg}","top-center","info",false);
                });
            </script>
            </c:if>
        </c:forEach>
    <%--</div>--%>
    <c:remove var="successMessages" scope="session"/>
</c:if>
