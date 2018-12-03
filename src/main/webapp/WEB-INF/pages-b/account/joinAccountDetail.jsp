<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="accountDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='accountDetail.heading'/>"/>
    <link rel="stylesheet" href="/scripts/bootstrap-3.3.2-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/scripts/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css"/>
    <style type="text/css">
        #maininfo .panel {
            font-size: 14px;
        }

        .panel-header, .panel-body {
            border-width: 0px;
        }

        .datagrid, .combo-p {
            border: solid 1px #D4D4D4;
        }

        .datagrid * {
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
        }

        .spanrow {
            margin-top: 3px;
        }

        .form_label {
            display: inline-block;
            margin: 0 5px;
            width: 40px
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
            <a id="toolbar_reload" href="javascript:void(0);" class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-refresh'">刷新</a>
            <a id="toolbar_close" href="javascript:void(0);" class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-close'">关闭</a>
        </div>
        <div class="clear"></div>
    </div>
    <div class="container" id="maininfo" style="width: 800px; margin: 0 auto;">
        <c:if test="${account.accountEnabled==true}">
            <c:if test="${account.accountState!='3'}">
                <div style="text-align: center;padding: 10px 0">
                    <span>该账号暂未激活</span>

                    <a onclick="confirmPerfact()" href="javascript:void(0)" data-options="iconCls:'icon-ok'">立即激活</a>
                </div>
            </c:if>
            <c:if test="${account.accountState=='3'}">
                <div style="text-align: center;padding: 10px 0">
                    <span id="frozenAccount_label" data-state="is" style="color:cornflowerblue">该账号已激活</span>
                    <a id="frozenAccount" href="javascript:void(0)" class="easyui-linkbutton"
                       data-options="iconCls:'icon-ok'">冻结账号</a>
                </div>
            </c:if>
        </c:if>
        <c:if test="${account.accountEnabled==false}">
            <div style="text-align: center;padding: 10px 0">
                <span id="frozenAccount_label" data-state="not" style="color:cornflowerblue">该账号已冻结</span>
                <a id="frozenAccount" href="javascript:void(0)" class="easyui-linkbutton"
                   data-options="iconCls:'icon-ok'">解冻账号</a>
            </div>
        </c:if>
        <div class="panel panel-default" style="clear: left;">
            <div class="panel-heading">
                <h3 class="panel-title panel-primary">基本信息</h3>
            </div>
            <div class="panel-body">
                <div style="width: 600px; margin: 0 auto;">
                    <div class="row">
                        <div class="col-sm-3 formTitle"><label class="desc">流水号</label></div>
                        <div class="col-sm-6 formData" id="pid_view">${account.pid}</div>

                        <c:if test="${account.accountState!='3'}">
                            <div class="col-sm-3" id="pid_input" style="display: none"><input id="pid"
                                                                                              value="${account.pid}"></div>
                            <div class="col-sm-3">
                                <a href="javascript:void(0)" onclick="changePidBtn(this)" class="easyui-linkbutton"
                                   data-options="iconCls:'icon-edit'">修改流水号</a>
                                <a href="javascript:void(0)" onclick="confirmChangePidBtn(this)" class="easyui-linkbutton"
                                   data-options="iconCls:'icon-ok'" style="display: none">确定</a>
                            </div>
                        </c:if>
                    </div>

                    <div class="row odd">
                        <div class="col-sm-3 formTitle"><label class="desc">所属代理商</label></div>
                        <div class="col-sm-9 formData">${account.parentAccount.accountName}</div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 formTitle"><label class="desc">用户名</label></div>
                        <div class="col-sm-6 formData">${account.accountName}</div>
                        <div class="col-sm-3">
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
                               onclick="$('#changePasswordPanel').dialog('open')">修改密码</a>
                        </div>
                    </div>
                    <div class="row odd">
                        <div class="col-sm-3 formTitle"><label class="desc">姓名</label></div>
                        <div class="col-sm-9 formData ">${account.userName}</div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 formTitle"><label class="desc">注册日期</label></div>
                        <div class="col-sm-9 formData">
                            <fmt:formatDate value="${account.registerDate}" pattern="yyyy/MM/dd"/>
                        </div>
                    </div>
                    <div class="row odd">
                        <div class="col-sm-3 formTitle"><label class="desc">启用</label></div>
                        <div class="col-sm-9 formData">${account.accountEnabled ? "启用" : "停用"}</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><label class="desc">联系方式</label></h3>
            </div>
            <div class="panel-body">
                <div style="width: 600px; margin: 0 auto;">
                    <div class="row">
                        <div class="col-sm-3 formTitle"><label class="desc">email</label></div>
                        <div class="col-sm-9 formData ">${account.email}</div>
                    </div>
                    <div class="row odd">
                        <div class="col-sm-3 formTitle"><label class="desc">手机号码</label></div>
                        <div class="col-sm-9 formData ">${account.mobileNumber}</div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 formTitle"><label class="desc">电话号码</label></div>
                        <div class="col-sm-9 formData ">${account.phoneNumber}</div>
                    </div>
                    <div class="row odd">
                        <div class="col-sm-3 formTitle"><label class="desc">传真</label></div>
                        <div class="col-sm-9 formData ">${account.faxNumber}</div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 formTitle"><label class="desc">其他联系方式</label></div>
                        <div class="col-sm-9 formData ">${account.otherContact}</div>
                    </div>
                    <div class="row odd">
                        <div class="col-sm-3 formTitle"><label class="desc">备注</label></div>
                        <div class="col-sm-9 formData ">${account.memo}</div>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <div style="margin: 0 auto;text-align: center;">
        <a href="javascript:void(0);" id="form_button_close" class="form_button_close"><fmt:message key="button.close"/></a>
    </div>

    <div id="changePasswordPanel" class="easyui-dialog">
        <form id="changePasswordForm" action="${ctx}/backend/changePassword" method="post">
            <input type="hidden" name="id" value="${account.id}">

            <div class="spanrow">
                <label class="form_label" style="width:100px;">密码</label>
                <input id="password" class="easyui-textbox" name="password" style="width:150px;"
                       data-options="required:true">
            </div>
            <div class="spanrow">
                <label class="form_label" style="width:100px;">确认新密码</label>
                <input id="repassword" class="easyui-textbox" name="rePassword" style="width:150px;"
                       data-options="required:true">
            </div>
        </form>
        <div style="text-align:right;padding:5px;margin-top:20px;">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="submitForm()">确定</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-no"
               onclick="$('#changePasswordPanel').dialog('close')">关闭</a>
        </div>
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

        $("#changePasswordPanel").dialog({
            title: '修改密码',
            width: 400,
            height: 300,
            closed: true
        });

        //冻结账号
        $("#frozenAccount").linkbutton({
            onClick: function () {
                var f_label = $("#frozenAccount_label");
                var f = $("#frozenAccount");
                if (f_label.attr("data-state") == "is") {
                    $.post("${ctx}/backend/account/frozenAccount", {accountId:${account.id}}, function (data, status) {
                        var data = eval('(' + data + ')');
                        $.messager.alert("提示", data.msg);
                        if (data.responseKey == "1") {
                            f_label.attr("data-state", "not").html("该账号已冻结");
                            $('#frozenAccount span span:first').html('解冻账号');
                        }
                    });
                } else {
                    $.post("${ctx}/backend/account/notFrozenAccount", {accountId:${account.id}}, function (data, status) {
                        var data = eval('(' + data + ')');
                        $.messager.alert("提示", data.msg);
                        if (data.responseKey == "1") {
                            f_label.attr("data-state", "is");
                            f_label.html("该账号已激活");
                            $('#frozenAccount span span:first').html('冻结账号');
                        }
                    });
                }

            }
        })
        //解冻账号

    });

    //确认激活事件
    function confirmPerfact() {
        $.messager.confirm('确认激活', '一旦激活，代理编号将无法修改，请检查所填代理所属省市是否正确，如无误请确认激活。?', function (r) {
            if (r) {
                location.href = "${ctx}/backend/account/joinAccountPerfect?accountId=${account.id}&pid=" + $("#pid").val();
            }
        });
    }


    function submitForm() {
        $('#changePasswordForm').form('submit', {
            success: function (data) {
                var data = eval('(' + data + ')');  // change the JSON string to javascript object
                $('#changePasswordPanel').dialog('close');
                $.messager.alert('提示', data.msg);
            }
        });
    }

    //修改流水号按钮事件
    function changePidBtn(btn) {
        $('#pid_view').hide();
        $('#pid_input').show();
        $(btn).hide();
        $(btn).next().show();
    }
    //确定修改流水号按钮事件
    function confirmChangePidBtn(btn) {
        var pid = $("#pid").val();
        $('#pid_view').html(pid);
        $('#pid_input').hide();
        $('#pid_view').show();
        $(btn).hide();
        $(btn).prev().show();
    }

    function initToolBarActions() {
        // 刷新按钮
        $("#toolbar_reload").bind("click", function () {
            action_reload();
        });

        // 关闭按钮
        $("#toolbar_close").bind("click", function () {
            closeFrameworkCurrentTab();
        });
    }

    function initFormButtons() {

        $("#form_button_close").bind("click", function () {
            closeFrameworkCurrentTab();
        });
    }

    function action_reload() {
        location.href = '${ctx}/backend/account/joinAccountDetail?id=' + ${account.id};
    }
</script>