<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="accountDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='accountDetail.heading'/>"/>
    <link rel="stylesheet" href="/scripts/bootstrap-3.3.2-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/scripts/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css" />
    <style type="text/css">
        #maininfo .panel{
            font-size:14px;
        }

        .formTitle{
            background: #dddddd;
            padding: 5px 0;
            text-align: center;
        }

        .odd .formTitle{
            background: #FFFFFF;
        }

        .formData{
            padding: 8px 0 0 5px;
        }

        .row{
            border-bottom: 1px solid lightgrey;
            /*margin-bottom: 8px;*/
            /*padding: 5px 0;*/
        }
    </style>
</head>
<div class="page_container">
    <div class="page_toolbar">

        <div class="fr" style="margin-right: 30px;">
            <a id="toolbar_reload" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-refresh'">刷新</a>
            <a id="toolbar_close" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-close'">关闭</a>
        </div>
        <div class="clear"></div>
    </div>

    <div style="width: 740px; margin: 15px auto 5px auto;">


        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title panel-primary">基本信息</h3>
            </div>
            <div class="panel-body">
                <div style="padding: 10px; margin: 0 auto; width:600px;">
                    <div class="row">
                        <div class="col-sm-3 formTitle"><label class="desc">账号</label> </div>
                        <div class="col-sm-9 formData">${account.accountName}</div>
                    </div>
                    <div class="row odd">
                        <div class="col-sm-3 formTitle"><label class="desc">姓名</label></div>
                        <div class="col-sm-9 formData">${account.userName}</div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 formTitle"><label class="desc">性别</label></div>
                        <div class="col-sm-9 formData">
                            <c:choose>
                                <c:when test="${account.gender eq 'F'}">
                                    女
                                </c:when>
                                <c:when test="${account.gender eq 'M'}">
                                    男
                                </c:when>
                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="row odd">
                        <div class="col-sm-3 formTitle"><label class="desc">注册日期</label></div>
                        <div class="col-sm-9 formData">
                            <fmt:formatDate value="${account.registerDate}" pattern="yyyy/MM/dd"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 formTitle"><label class="desc">启用</label></div>
                        <div class="col-sm-9 formData">${account.accountEnabled ? "启用" : "停用"}</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">联系方式</h3>
            </div>
            <div class="panel-body">
                <div style="padding: 10px; margin: 0 auto; width:600px;">
                    <div class="row">
                        <div class="col-sm-3 formTitle"><label class="desc">email</label></div>
                        <div class="col-sm-9 formData">${account.email}</div>
                    </div>
                    <div class="row odd">
                        <div class="col-sm-3 formTitle"><label class="desc">手机号码</label></div>
                        <div class="col-sm-9 formData">${account.mobileNumber}</div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 formTitle"><label class="desc">电话号码</label></div>
                        <div class="col-sm-9 formData">${account.phoneNumber}</div>
                    </div>
                    <div class="row odd">
                        <div class="col-sm-3 formTitle"><label class="desc">传真</label></div>
                        <div class="col-sm-9 formData">${account.faxNumber}</div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 formTitle"><label class="desc">其他联系方式</label></div>
                        <div class="col-sm-9 formData">${account.otherContact}</div>
                    </div>
                    <div class="row odd">
                        <div class="col-sm-3 formTitle"><label class="desc">备注</label></div>
                        <div class="col-sm-9 formData">${account.memo}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="margin: 10px auto;text-align: center;">
        <a href="javascript:void(0);" id="form_button_close" class="form_button_close"><fmt:message key="button.close"/></a>
    </div>
</div>


<script type="text/javascript">

    $(document).ready(function () {
        // 工具栏按钮事件绑定
        initToolBarActions();

        // 表格按钮修饰
        initFormButtons();

        $(window).resize(function () {
//            $(".page_toolbar").pin();
            $(".page_toolbar").css("width", "100%");
        });

        $(".page_toolbar").pin({
            containerSelector: ".page_container"
        });
    });

    function initToolBarActions(){
        // 刷新按钮
        $("#toolbar_reload").bind("click", function(){
            action_reload();
        });

        // 关闭按钮
        $("#toolbar_close").bind("click", function(){
            closeFrameworkCurrentTab();
        });
    }

    function initFormButtons(){

        $("#form_button_close").bind("click", function(){
            closeFrameworkCurrentTab();
        });
    }

    function action_reload(){
        location.href='${ctx}/backend/account/accountDetail?id=' + ${account.id};
    }

</script>