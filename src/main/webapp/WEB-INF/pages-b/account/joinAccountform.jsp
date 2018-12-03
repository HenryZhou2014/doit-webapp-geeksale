<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="accountDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='accountDetail.heading'/>"/>
    <style type="text/css">
        .headinfo{
            /*border-bottom: 1px red solid;*/
            border-radius: 5px;
            background: lightgrey;
            padding: 5px 10px;
            /*margin: 15px 0;*/
        }
        .mt10{
            margin-top: 10px;
        }
    </style>
</head>
<div class="page_container">
    <div class="page_toolbar">
        <div style="border:1px solid #ddd; background: #eee;">

            <a id="toolbar_save" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存</a>
            <a id="toolbar_new" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">增加</a>

            <div class="fr">
                <a id="toolbar_reload" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-refresh'">刷新</a>
                <a id="toolbar_close" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-close'">关闭</a>
            </div>
            <div class="clear"></div>
        </div>
    </div>
<form:form commandName="joinAccount" method="post" action="joinAccountform" id="joinAccountform"
           onsubmit="return validateAccount(this)">
    <form:errors path="*" cssClass="error" element="div"/>
    <form:hidden path="account.id"/>
    <form:hidden path="account.createBy"/>
    <form:hidden path="account.createDate"/>
    <form:hidden path="account.credentialExpired"/>
    <form:hidden path="account.deleteFlag"/>
    <form:hidden path="account.registerDate"/>
    <form:hidden path="account.updateBy"/>
    <form:hidden path="account.updateDate"/>
    <form:hidden path="account.accountClass"/>
    <form:hidden path="account.accountEnabled"/>
    <form:hidden path="account.accountExpired"/>
    <form:hidden path="account.accountLocked"/>
    <input type="hidden" name="action" value="${action}">

    <div style=" padding: 20px; background: #eeeeee; margin: 15px auto; width: 650px; border: 1px solid #d4d4d4; box-shadow: 0 3px 3px #E6E6E6;">
        <div class="headinfo">基本信息</div>
        <ul>
            <li>
                <label class="desc fl">会员编号:</label>
                <span class="fl" style="margin-left: 10px">${joinAccount.account.newIndex}</span>
            </li>
            <li style="clear: left">
                <c:if test="${empty joinAccount.account.id}">
                    <appfuse:label styleClass="desc" key="account.accountName"/>
                    <form:errors path="account.accountName" cssClass="fieldError"/>
                    <form:input path="account.accountName" id="accountName" cssClass="text medium" cssErrorClass="text medium error"
                                maxlength="50"/>
                </c:if>
                <c:if test="${not empty joinAccount.account.id}">
                    <label class="desc"><fmt:message key="account.accountName"/></label>
                    <form:input path="account.accountName" id="accountName" cssClass="text medium" cssErrorClass="text medium error"
                                maxlength="50" readonly="true" cssStyle="background: #ddd;"/>
                </c:if>
            </li>
            <li class="fl">
                <appfuse:label styleClass="desc" key="account.userName"/>
                <form:errors path="account.userName" cssClass="fieldError"/>
                <form:input path="account.userName" id="userName" cssClass="text medium" cssErrorClass="text medium error"
                            maxlength="50"/>
            </li>
            <li>
                <appfuse:label styleClass="desc" key="account.gender"/>
                <form:errors path="account.gender" cssClass="fieldError"/>
                <form:radiobuttons path="account.gender" items="${genderList}" itemLabel="label" itemValue="value"/>
            </li>
        </ul>
        <div>
            <div class="headinfo mt10">联系方式</div>
            <div>
                <ul>

                    <li>
                        <appfuse:label styleClass="desc" key="account.email"/>
                        <form:errors path="account.email" cssClass="fieldError"/>
                        <form:input path="account.email" id="email" cssClass="text medium" cssErrorClass="text medium error"
                                    maxlength="120"/>
                    </li>
                    <li class="fl">
                        <appfuse:label styleClass="desc" key="account.mobileNumber"/>
                        <form:errors path="account.mobileNumber" cssClass="fieldError"/>
                        <form:input path="account.mobileNumber" id="mobileNumber" cssClass="text medium"
                                    cssErrorClass="text medium error" maxlength="50"/>
                    </li>
                    <li class="fl">
                        <appfuse:label styleClass="desc" key="account.phoneNumber"/>
                        <form:errors path="account.phoneNumber" cssClass="fieldError"/>
                        <form:input path="account.phoneNumber" id="phoneNumber" cssClass="text medium"
                                    cssErrorClass="text medium error" maxlength="50"/>
                    </li>
                    <li>
                        <appfuse:label styleClass="desc" key="account.faxNumber"/>
                        <form:errors path="account.faxNumber" cssClass="fieldError"/>
                        <form:input path="account.faxNumber" id="faxNumber" cssClass="text medium"
                                    cssErrorClass="text medium error" maxlength="50"/>
                    </li>
                    <li>
                        <appfuse:label styleClass="desc" key="account.otherContact"/>
                        <form:errors path="account.otherContact" cssClass="fieldError"/>
                        <form:input path="account.otherContact" id="otherContact" cssClass="text large"
                                    cssErrorClass="text medium error" maxlength="50"/>
                    </li>
                </ul>
            </div>
        </div>
        <div>
            <ul>
                <li>
                    <appfuse:label styleClass="desc" key="account.memo"/>
                    <form:errors path="account.memo" cssClass="fieldError"/>
                    <form:textarea path="account.memo" id="memo" cssClass="text large" cssStyle="height: 80px;" cssErrorClass="text medium error"
                                maxlength="256"/>
                </li>
            </ul>
        </div>
        <div>
            <div class="headinfo mt10">店铺信息</div>
            <ul>
                <li>
                    <appfuse:label styleClass="desc" key="photoShop.name"/>
                    <form:errors path="photoShopList[0].name" cssClass="fieldError"/>
                    <form:input path="photoShopList[0].name"  cssClass="text large"  cssErrorClass="text medium error"
                                   maxlength="256"/>
                </li>
                <li>
                    <appfuse:label styleClass="desc" key="photoShop.telephone"/>
                    <form:errors path="photoShopList[0].telephone" cssClass="fieldError"/>
                    <form:input path="photoShopList[0].telephone"  cssClass="text large" cssErrorClass="text medium error"
                                   maxlength="256"/>
                </li>
                <li class="fl">
                    <appfuse:label styleClass="desc" key="photoShop.province"/>
                    <form:errors path="photoShopList[0].photoCity.photoProvince.id" cssClass="fieldError"/>
                    <form:select id="provinceId" path="photoShopList[0].photoCity.photoProvince.id" cssClass="text medium" cssErrorClass="text medium error"
                                maxlength="50">
                        <form:options items="${provinceList}"/>
                    </form:select>
                </li>
                <li>
                    <appfuse:label styleClass="desc" key="photoShop.city"/>
                    <form:errors path="photoShopList[0].photoCity.id" cssClass="fieldError"/>
                    <form:select id="city" path="photoShopList[0].photoCity.id" cssClass="text medium" cssErrorClass="text medium error"
                                maxlength="50">
                        <form:options items="${cityList}"/>
                    </form:select>
                </li>
                <li>
                    <appfuse:label styleClass="desc" key="photoShop.addressdetail"/>
                    <form:errors path="photoShopList[0].addressdetail" cssClass="fieldError"/>
                    <form:input path="photoShopList[0].addressdetail"  cssClass="text large" cssErrorClass="text medium error"
                                   maxlength="256"/>
                </li>
                <li>
                    <appfuse:label styleClass="desc" key="photoShop.photoshopType"/>
                    <form:errors path="photoShopList[0].photoshopType" cssClass="fieldError"/>
                    <form:select path="photoShopList[0].photoshopType" cssClass="text large" cssErrorClass="text medium error"
                                   maxlength="256">
                        <form:options items="${shopTypes}"/>
                    </form:select>
                </li>
                <li>
                    <appfuse:label styleClass="desc" key="photoShop.sceneryname"/>
                    <form:errors path="photoShopList[0].sceneryname" cssClass="fieldError"/>
                    <form:input path="photoShopList[0].sceneryname" cssClass="text large" cssErrorClass="text medium error"
                                   maxlength="256"/>
                </li>
                <li>
                    <appfuse:label styleClass="desc" key="photoShop.scenerygrade"/>
                    <form:errors path="photoShopList[0].scenerygrade" cssClass="fieldError"/>
                    <form:select path="photoShopList[0].scenerygrade" cssClass="text large" cssErrorClass="text medium error"
                                   maxlength="256">
                        <form:options items="${sceneryGrades}"/>
                    </form:select>
                </li>

                <li>
                    <appfuse:label styleClass="desc" key="photoShop.sceneryfeature"/>
                    <form:errors path="photoShopList[0].sceneryfeature" cssClass="fieldError"/>
                    <c:forEach var="item" items="${photoSceneryFeatures}">
                        <label class="checkbox-inline">
                            <input type="checkbox" name="photoShopList[0].sceneryfeature" value="${item.name}" ${item.isChecked}> ${item.name}
                        </label>
                    </c:forEach>
                </li>
                <li>
                    <appfuse:label styleClass="desc" key="photoShop.serviceType"/>
                    <form:errors path="photoShopList[0].serviceType" cssClass="fieldError"/>
                    <c:forEach var="item" items="${shopServiceTypes}">
                        <label class="checkbox-inline">
                            <input type="checkbox" name="photoShopList[0].serviceType" value="${item.name}" ${item.isChecked}> ${item.name}
                        </label>
                    </c:forEach>
                </li>
                <li>
                    <appfuse:label styleClass="desc" key="photoShop.print"/>
                    <c:forEach var="item" items="${printers}" varStatus="status">
                        <div>
                            <input type="checkbox" name="printer_${status.index}"  value="${item.name}" ${item.isChecked}>${item.name}
                            <input type="text" name="printerModel_${status.index}" value="${item.printDetail}"  placeholder="请输入所用该打印机型号" class="text large">
                        </div>

                    </c:forEach>
                </li>

            </ul>
        </div>

    </div>
    <div style="margin: 10px auto;text-align: center;">
        <a href="javascript:void(0);" id="form_button_save" class="form_button_save"><fmt:message key="button.save"/></a>
        <a href="javascript:void(0);" id="form_button_new" class="form_button_new"><fmt:message key="button.saveAndNew"/></a>
        <a href="javascript:void(0);" id="form_button_close" class="form_button_close"><fmt:message key="button.close"/></a>
    </div>
    <div class="hidden">
        <input type="submit" class="button" name="action" value="NEW" id="newButton"/>
        <input type="submit" class="button" name="action_save" id="action_save" value="<fmt:message key="button.save"/>"/>
        <input type="submit" class="button" name="action_save_and_new" id="action_save_and_new" value="<fmt:message key="button.saveAndNew"/>"/>
    </div>
</form:form>
</div>
<v:javascript formName="account" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>

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

        <c:if test="${cityList==null}">
        getCityItemsByProvince($("#provinceId").val(),$("#city"));
        </c:if>
        $("#provinceId").change(function(){
            getCityItemsByProvince($(this).val(),$("#city"));
        });
    });

    function initToolBarActions(){
        // 保存按钮
        $("#toolbar_save").bind("click", function(){
            $('#action_save').click();
        });

        // 新增按钮
        $("#toolbar_new").bind("click", function(){
            $('#action_save_and_new').click();
        });

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
        $("#form_button_save").bind("click", function(){
            $("#action_save").click();
        });

        $("#form_button_new").bind("click", function(){
            $("#action_save_and_new").click();
        });

        $("#form_button_close").bind("click", function(){
            closeFrameworkCurrentTab();
        });
    }

    function action_reload(){
        location.href="${ctx}/backend/account/joinAccountform?id=${joinAccount.account.id}";
    }


    //通过省份id信息获取省份下的城市信息,并填充到下拉单中
    function getCityItemsByProvince(provinceId,select){
        $.ajax({
            url:'/general/cities?id=' + provinceId,
            dataType:'json',
            success:function(data){
                select.html("");
                $(data).each(function(index,value){
                    select.append("<option value='"+value.id+"'>"+value.name+"</option>");
                });
            }
        })
    }

</script>
