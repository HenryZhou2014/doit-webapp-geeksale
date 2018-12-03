<%@ page import="com.doit.cms.model.Article" %>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>撰稿</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="newArticle"/>
    <script src="<c:url value='/resource/common/scripts/ueditor1.4/ueditor.config.js'/>"></script>
    <script src="<c:url value='/resource/common/scripts/ueditor1.4/ueditor.all.min.js'/>"></script>
    <style type="text/css">

    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-9 col-md-9 col-sm-8 col-lg-push-3 col-md-push-3 col-sm-push-4 margin-bottom-80">

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#info" data-toggle="tab">撰写新稿</a></li>
            </ul>

            <div class="tab-content margin-top-20">

                <!-- PERSONAL INFO TAB -->
                <div class="tab-pane fade in active" id="info">
                    <form:form commandName="article" role="form" action="${ctx}/usercenter/saveArticle.html"
                               method="post" id="articleForm">
                        <form:hidden path="id"/>
                        <input type="hidden" name="status">

                        <div class="form-group">
                            <label class="control-label">标题</label>
                            <form:input path="title" placeholder="标题" cssClass="form-control"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label">投稿栏目</label>
                            <form:select path="categoryId" cssClass="form-control"
                                         itemValue="${article.categoryId}" itemLabel="${artilce.tilte}">
                                <c:forEach items="${articleCategoryList}" var="item" varStatus="status">
                                    <c:if test="${status.index eq 0}">
                                        <form:option value="${item.id}">请选择</form:option>
                                    </c:if>
                                    <c:if test="${status.index > 0}">
                                        <form:option value="${item.id}">${item.title}</form:option>
                                    </c:if>
                                </c:forEach>
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label class="control-label">内容</label>
                            <%
                                Article article = (Article) request.getAttribute("article");
                            %>
                            <SCRIPT id="fullText" type="text/plain" name="fullText"><%
                                if (article != null && article.getFullText() != null) {
                                    out.print(article.getFullText());
                                }
                            %></SCRIPT>
                        </div>
                        <div class="margiv-top10 text-center">
                            <c:if test="${article.status != '1'}">
                                <a href="javascript:void(0);" class="btn btn-primary" id="saveArticle"><i class="fa fa-save"></i> 保存 </a>
                                <a href="javascript:void(0);" class="btn btn-info" id="contributeArticle"><i class="fa fa-check"></i> 投稿 </a>
                            </c:if>
                            <a href="${ctx}/usercenter/newArticle.html" class="btn btn-default">新增 </a>
                        </div>
                    </form:form>
                </div>
                <!-- /PERSONAL INFO TAB -->
            </div>

        </div>


        <!-- LEFT -->
        <div class="col-lg-3 col-md-3 col-sm-4 col-lg-pull-9 col-md-pull-9 col-sm-pull-8">
            <jsp:include page="/app/usercenter/userCenterMenu"/>
        </div>

    </div>
</section>


<script type="text/javascript">

    $(document).ready(function () {
        var options = {
            minFrameHeight: 500,
            initialFrameHeight: 300,
            autoClearinitialContent: false,
            initialContent: ''
        };

        var editor = new UE.ui.Editor(options);
        editor.render("fullText");

        $("#saveArticle").bind("click", function () {
            $("input[name='status']").val("0");
            $("#articleForm").submit();
        });
        $("#contributeArticle").bind("click", function () {
            $("input[name='status']").val("1");
            $("#articleForm").submit();
        });

    });

</script>
