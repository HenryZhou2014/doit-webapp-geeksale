<%@ page import="com.doit.cms.model.NamedTextModule" %>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="namedTextModuleDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='namedTextModuleDetail.heading'/>"/>
    <meta name="module-group" content="website-basic-info"/>
    <meta name="module" content="website-basic-info"/>
</head>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <%--<h2>Basic Form</h2>--%>
        <ol class="breadcrumb">
            <li>
                <a href="${ctx}/backend/index.html">首页</a>
            </li>
            <li class="active">
                <strong>网站基本信息</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>网站基本信息</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form:form commandName="websiteSettingVO" method="post" action="websiteSettingform"
                               class="form-horizontal">
                        <div class="form-group"><label class="col-sm-2 control-label">网站名称</label>

                            <div class="col-sm-10"><form:input path="websiteName" class="form-control"/></div>
                        </div>
                        <%--<div class="hr-line-dashed"></div>--%>
                        <div class="form-group" style="background: whitesmoke;"><label class="col-sm-2 control-label">域名</label>
                            <div class="col-sm-10"><form:input path="websiteUrl" class="form-control"/></div>
                        </div>
                        <div class="form-group" style="background: whitesmoke;"><label class="col-sm-2 control-label">版权信息</label>
                            <div class="col-sm-10"><form:input path="copyRight" class="form-control"/></div>
                        </div>
                        <div class="form-group" style="background: whitesmoke;"><label class="col-sm-2 control-label">备案信息</label>
                            <div class="col-sm-10"><form:input path="websiteFiling" class="form-control"/></div>
                        </div>
                        <%--<div class="hr-line-dashed"></div>--%>
                        <div class="form-group" ><label class="col-sm-2 control-label">meta keywords</label>

                            <div class="col-sm-10"><form:input path="websiteMetaKeywords" placeholder="" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group" style="background: whitesmoke;"><label class="col-sm-2 control-label">meta description</label>

                            <div class="col-sm-10"><form:input path="websiteMetaDescription" class="form-control" /></div>
                        </div>
                        <%--<div class="hr-line-dashed"></div>--%>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group"><label class="col-sm-2 control-label">联系人</label>

                            <div class="col-sm-10"><form:input path="contactPerson" class="form-control" /></div>
                        </div>
                        <div class="form-group" style="background: whitesmoke;"><label class="col-sm-2 control-label">联系电话</label>

                            <div class="col-sm-10"><form:input path="contactTel" class="form-control"/></div>
                        </div>
                        <div class="form-group" ><label class="col-sm-2 control-label">电子邮件</label>

                            <div class="col-sm-10"><form:input path="contactEmail" class="form-control"/></div>
                        </div>
                        <div class="form-group" style="background: whitesmoke;"><label class="col-sm-2 control-label">地址</label>

                            <div class="col-sm-10"><form:input path="contactAddress" class="form-control"/></div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-white" type="submit">取消</button>
                                <button class="btn btn-primary" type="submit">保存</button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<v:javascript formName="namedTextModule" cdata="false" dynamicJavascript="true" staticJavascript="false"/>--%>
<%--<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>--%>

<script type="text/javascript">

    $(document).ready(function () {


    });

</script>
