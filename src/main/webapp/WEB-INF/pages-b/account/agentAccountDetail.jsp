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
        .panel-header, .panel-body {
            border-width: 0px;
        }
        .datagrid,.combo-p{
            border:solid 1px #D4D4D4;
        }
        .datagrid *{
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
        }
        .spanrow{
            margin-top:3px;
        }

        .form_label{
            display:inline-block;margin:0 5px;width:40px
        }
        #changeArea_dialog .panel-body{
            padding:0;
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

<div class="container" id="maininfo">
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
                <a id="frozenAccount" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">冻结账号</a>
            </div>
        </c:if>
    </c:if>
    <c:if test="${account.accountEnabled==false}">
        <div style="text-align: center;padding: 10px 0">
            <span id="frozenAccount_label" data-state="not" style="color:cornflowerblue">该账号已冻结</span>
            <a id="frozenAccount" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">解冻账号</a>
        </div>
    </c:if>
    <div class="panel panel-default" style="clear: left">
        <div class="panel-heading">
            <h3 class="panel-title panel-primary">基本信息</h3>
        </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-2">代理号：${account.photoDistributor.pid}</div>
                    <div class="col-sm-3">代理会员号：${account.newIndex}</div>
                </div>
                <div class="row">
                    <div class="col-sm-2">用户名：</div>
                    <div class="col-sm-3">${account.accountName}</div>
                    <div class="col-sm-3">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="$('#changePasswordPanel').dialog('open')">修改密码</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2">真实姓名：</div>
                    <div class="col-sm-8">${account.userName}</div>
                </div>
                <div class="row">
                    <div class="col-sm-2">性别：</div>
                    <div class="col-sm-8">
                        <c:if test="${account.gender=='M'}">
                            男
                        </c:if>
                        <c:if test="${account.gender=='F'}">
                            女
                        </c:if>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2">所在地区：</div>
                    <div class="col-sm-8"></div>
                </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">联系方式</h3>
        </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-2">电子邮件：</div>
                    <div class="col-sm-4">${account.email}</div>
                    <div class="col-sm-2">手机号码：</div>
                    <div class="col-sm-4">${account.mobileNumber}</div>
                </div>

                <div class="row">
                    <div class="col-sm-2">电话号码：</div>
                    <div class="col-sm-4">${account.phoneNumber}</div>
                    <div class="col-sm-2">传真：</div>
                    <div class="col-sm-4">${account.faxNumber}</div>
                </div>
                <div class="row">
                    <div class="col-sm-2">地址：</div>
                    <div class="col-sm-8">${account.contactAddress}</div>
                </div>
                <div class="row">
                    <div class="col-sm-2">备注：</div>
                    <div class="col-sm-8">${account.memo}</div>
                </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title panel-primary">代理控制</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-12">
                    代理地区：<span id="agentAreaView" style="margin-right: 10px"></span>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="$('#changeArea_dialog').dialog('open')" style="height: 24px;">修改地区</a>
                </div>
                <%--<div class="col-sm-9">--%>
                    <%--<form id="changeArea_form" action="${ctx}/backend/account/agentAccountChangeArea" method="post">--%>
                        <%--修改为：--%>
                        <%--<input type="hidden" name="accountId" value="${account.id}">--%>
                        <%--<input id="province_chmbobox" class="easyui-combobox" name="provinceId" data-options="valueField:'id',textField:'text'">--%>
                        <%--<input id="city_chmbobox" class="easyui-combobox" name="cityId" data-options="valueField:'id',textField:'text'">--%>

                    <%--</form>--%>
                <%--</div>--%>
            </div>
            <div class="row">
                <div class="col-sm-3">开通加盟会员人数：${account.photoDistributor.agentCount}</div>
                <div class="col-sm-3">加盟会员额度：<span id="maxCount_view">${account.photoDistributor.maxAgentCount}</span></div>
                <div class="col-sm-6">
                    修改为：
                        <input id="maxCount" type="text" name="maxCount" class="easyui-numberbox" value="${account.photoDistributor.maxAgentCount}" data-options="min:0,max:1000">
                    <a id="agentMaxCount_btn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="height: 24px;">确认修改</a>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">代理期限：<span id="agentToDate_view"><fmt:formatDate value="${account.accountExpireDate}" type="date" dateStyle="medium"/></span></div>
                <div class="col-sm-6">
                    修改为：
                    <input id="agentToDate" type="text" name="agentToDate" class="easyui-datebox" value="${account.accountExpireDate}">
                    <a id="agentToDate_btn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="height: 24px;">确认修改</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
    <div style="margin: 10px auto;text-align: center;">
        <a href="javascript:void(0);" id="form_button_close" class="form_button_close"><fmt:message key="button.close"/></a>
    </div>
</div>

<div id="changePasswordPanel" class="easyui-dialog">
    <form id="changePasswordForm"  action="${ctx}/backend/changePassword" method="post">
        <input type="hidden" name="id" value="${account.id}">
        <div class="spanrow">
            <label class="form_label" style="width:100px;">密码</label>
            <input id="password" class="easyui-textbox"  name="password" style="width:150px;"
                   data-options="required:true">
        </div>
        <div class="spanrow">
            <label class="form_label" style="width:100px;">确认新密码</label>
            <input id="repassword" class="easyui-textbox"  name="rePassword" style="width:150px;"
                   data-options="required:true">
        </div>
    </form>
    <div style="text-align:right;padding:5px;margin-top:20px;">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="submitForm()">确定</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-no" onclick="$('#changePasswordPanel').dialog('close')">关闭</a>
    </div>
</div>

<div id="changeArea_dialog" class="easyui-dialog" title="修改代理区域" style="width:600px;height:400px;"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
    <div class="easyui-layout" fit="true">
        <div data-options="region:'east'" style="width:260px;">
            <div id="city_datalist" fit="true"></div>
        </div>
        <div data-options="region:'center'" style="background:#eee;">
            <div id="province_datalist" fit="true"></div>
        </div>
        <div data-options="region:'south'" style="height:50px;">
            <div style="text-align: center">
                <a id="agentArea_btn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认修改</a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var checkedProvince = new Array();
    var checkedCity = new Array();
    var currentSelectProvince;

    var currentSelectArea = ${agentArea}

    $(document).ready(function(){
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

        viewAgentArea(${agentArea});
        $("#changePasswordPanel").dialog({
            title: '修改密码',
            width:400,
            height:300,
            closed:true
        });
        //修改代理地区
        $("#agentArea_btn").click(function(){
            $.ajax({
                url:'${ctx}/backend/account/agentAccountChangeArea', //后台处理程序
                type:'post',         //数据发送方式
                dataType:'json',     //接受数据格式
                data:{accountId:${account.id},provinceIds:checkedProvince,cityIds:checkedCity},  //要传递的数据
                success:function(data){
                    viewAgentArea(data.agentArea);
                    $.messager.alert("提示",data.msg);
                    if(data.responseKey=="1"){

                        $("#changeArea_dialog").dialog('close');
                    }

                } //回传函数(这里是函数名)
            });
        });

        //修改代理最大代理数
        $("#agentMaxCount_btn").click(function(){
            var newMaxCount = $("#maxCount").val();
            $.ajax({
                url:'${ctx}/backend/account/agentAccountChangeMaxCount', //后台处理程序
                type:'post',         //数据发送方式
                dataType:'json',     //接受数据格式
                data:{accountId:${account.id},maxCount:newMaxCount},  //要传递的数据
                success:function(data){
                    $("#maxCount_view").html(data.maxCount);
                    $.messager.alert("提示",data.msg);
                } //回传函数(这里是函数名)
            });

        });

        //修改代理到期日期
        $("#agentToDate_btn").click(function(){
            var newAgentToDate = $("#agentToDate").datebox("getText");
            $.ajax({
                url:'${ctx}/backend/account/agentAccountChangeAgentToDate', //后台处理程序
                type:'post',         //数据发送方式
                dataType:'json',     //接受数据格式
                data:{accountId:${account.id},agentToDate:newAgentToDate},  //要传递的数据
                success:function(data){
                    $("#agentToDate_view").html(data.agentToDate);
                    $.messager.alert("提示",data.msg);
                } //回传函数(这里是函数名)
            });

        });

        //代理省区的数据列表
        $('#province_datalist').datalist({
            data: ${province_datalist},
            valueField:'id',
            textField:'text',
            checkbox: true,
            lines: true,
            checkOnSelect:false,
            selectOnCheck:false,
            onCheck:function(index,row){
                if(checkedProvince.indexOf(row.id)==-1){
                    checkedProvince.push(row.id);
                }
            },
            onUncheck:function(index,row){
                $.each(checkedProvince,function(i,v){
                    if(v==row.id){
                        checkedProvince.splice(i,1);
                    }
                });
            },
            onSelect:function(index,row){

                currentSelectProvince = index;
                $('#city_datalist').datalist("reload","${ctx}/backend/common/citiesByProvince?accountId=${account.id}&provinceId="+row.id);
            }
        });

        //代理市区的数据列表
        $('#city_datalist').datalist({
            valueField:'id',
            textField:'text',
            checkbox: true,
            lines: true,
            singleSelect:false,
            onCheck:function(index,row){
                $('#province_datalist').datalist("checkRow",currentSelectProvince);
                if(checkedCity.indexOf(row.id)==-1){
                    checkedCity.push(row.id);
                }
            },
            onUncheck:function(index,row){
                $.each(checkedCity,function(i,v){
                    if(v==row.id){
                        checkedCity.splice(i,1);
                    }
                });
            },
            onLoadSuccess:function(data){
//                var checkedCity = $('#province_datalist').datalist("getChecked");
//                //if(checkedCity.indexOf(currentSelectProvince)==-1){
//                    $('#city_datalist input:checkbox').each(function(index,el){
//                        el.disabled=true;
//                    });
//                //}
                $.each(data.rows,function(i,v){
                    $.each(checkedCity,function(index,value){
                        if(v.id==value){
                            $('#city_datalist').datalist("checkRow",i);
                        }
                    });
                });
            }
        });

        $("#perfectAgent").linkbutton({
            onClick:function(){
                alert('aa');
            }
        });

        //冻结账号
        $("#frozenAccount").linkbutton({
            onClick:function(){
                var f_label = $("#frozenAccount_label");
                var f = $("#frozenAccount");
                if(f_label.attr("data-state")=="is"){
                    $.post("${ctx}/backend/account/frozenAccount",{accountId:${account.id}},function(data,status){
                        var data = eval('(' + data + ')');
                        $.messager.alert("提示",data.msg);
                        if(data.responseKey=="1"){
                            f_label.attr("data-state","not").html("该账号已冻结");
                            $('#frozenAccount span span:first').html('解冻账号');
                        }
                    });
                }else{
                    $.post("${ctx}/backend/account/notFrozenAccount",{accountId:${account.id}},function(data,status){
                        var data = eval('(' + data + ')');
                        $.messager.alert("提示",data.msg);
                        if(data.responseKey=="1"){
                            f_label.attr("data-state","is");
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
    function confirmPerfact(){
        $.messager.confirm('确认激活','一旦激活，代理编号将无法修改，请检查所填代理所属省市是否正确，如无误请确认激活。?',function(r){
            if (r){
                location.href = "${ctx}/backend/account/agentAccountPerfect?accountId=${account.id}";
            }
        });
    }


    function submitForm(){
        $('#changePasswordForm').form('submit',{
            success:function(data){
                var data = eval('(' + data + ')');  // change the JSON string to javascript object
                $('#changePasswordPanel').dialog('close');
                $.messager.alert('提示',data.msg);
            }
        });
    }

    //显示已选代理地区
    function viewAgentArea(agentAreaArray){
        var agentAreaStr = "";

        $.each(agentAreaArray,function(i,v){
            agentAreaStr += v.text;
            agentAreaStr += ":";
            checkedProvince.push(v.id);
            if(v.cities){
                $.each(v.cities,function(c_i,c_v){
                    agentAreaStr += c_v.text;
                    agentAreaStr += ",";
                    checkedCity.push(c_v.id);
                });
                agentAreaStr += ";";
            }
        });
        $("#agentAreaView").html(agentAreaStr);

    }

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
        location.href='${ctx}/backend/account/agentAccountDetail?id=' + ${account.id};
    }

</script>