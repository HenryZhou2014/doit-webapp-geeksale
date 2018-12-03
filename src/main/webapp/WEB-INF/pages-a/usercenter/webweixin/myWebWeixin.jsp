<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>微信裂变</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="menu-item-group" content="01"/>
    <meta name="menu-item-module" content="0110"/>
    <meta http-equiv="Cache-Control" content="no-cache">
    <%--<script src="${ctx}/resource/common/scripts/vide/debuggap.js"></script>--%>

    <style type="text/css">
        .uppercase .delete-article, .uppercase .contibute-article {
            position: relative;
            float: right;
            margin-right: 5px;
        }

        #info .timeline .timeline-item {
            position: relative;
            min-height: 90px;
            display: block;
            margin-bottom: 50px;
        }

        .form-horizontal .checkbox {
            padding-top: 0;
        }

        .form-horizontal .control-label {
            padding-top: 5px;
        }

        .form-group {
            margin-bottom: 10px;
        }

        .checkbox + .checkbox, .radio + .radio {
            margin-top: 0;
        }

        .half-word {
            width: .5em;
            white-space: pre;
            font-family: '宋体';
        }

        .one-word {
            width: 1em;
            font-family: '宋体';
        }

        .two-word {
            width: 2em;
            white-space: pre;
            font-family: '宋体';
        }

        #preview {
            position: absolute;
            top: 0;
            right: 0;
        }

        .modal-content{
            border-top: none;
        }

        #previewMessage{
            position: absolute;
            top:80px;
            color: #222;
            background: #99E95B;
            margin: 0 35px 0 25px;
            padding: 8px;
            font-size: 12px;
            border-radius: 3px;
            min-height: 100px;
            word-break:break-all;
        }
    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#info" data-toggle="tab">微信裂变配置</a></li>
            </ul>

            <div class="tab-content margin-top-20">

                <div class="col-lg-12" style="position: relative;">
                    <div id="preview">
                        <div class="previewWrapper">
                            <div class="weight-800 size-20">预览</div>
                            <div class="width-250" style="position: relative;">
                                <img src="${ctx}/images/weixin-dialogue-bg.png" class="img-responsive"/>
                                <div id="previewMessage"></div>
                            </div>
                        </div>
                    </div>
                    <form id="weixinSetting" name="weixinSetting" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">子公司/加盟店</label>
                            <div class="col-sm-10">
                                <div class="form-inline">
                                    <select name="companyId" class="form-control" id="companyId">
                                        <c:forEach items="${companyInfoList}" var="company">
                                            <option value="${company.id}">${company.companyName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">简称或品牌名称</label>
                            <div class="col-sm-10">
                                <div id="companySlogan" class="weight-600"></div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                发送内容
                            </label>
                            <div class="col-sm-10">
                                <div class="form-inline">
                                    <select id="conf_material_id" name="conf_material_id" class="form-control" style="max-width: 450px;">
                                        <c:forEach items="${marketingMaterials}" var="material">
                                            <c:set var="type" value="文"/>
                                            <c:if test="${material.contentType == '2'}">
                                                <c:set var="type" value="图"/>
                                            </c:if>
                                            <option value="${material.id}" data-text="${material.content}" data-type="${material.contentType}" data-image-url="${material.imagePath}">[${type}]${material.title}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div id="weixinconfigPanel">
                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="form-inline">
                                        <label class="checkbox">
                                            <input type="checkbox" name="conf_show_link_person" value="yes">
                                            <i></i>联<span class="half-word"> </span>系<span class="half-word"> </span>人
                                        </label>
                                        <input type="text" name="conf_link_person" class="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="form-inline">
                                        <label class="checkbox">
                                            <input type="checkbox" name="conf_show_contact" value="yes">
                                            <i></i>联系方式
                                        </label>
                                        <input type="text" name="conf_contact" class="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="form-inline">
                                        <label class="checkbox">
                                            <input type="checkbox" name="conf_show_website_name" value="yes">
                                            <i></i>网址名称
                                        </label>
                                        <input type="text" name="conf_website_name" class="form-control width-350"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="form-inline">
                                        <label class="checkbox">
                                            <input type="checkbox" name="conf_show_website_url" value="yes">
                                            <i></i>网<span class="two-word">    </span>址
                                        </label>
                                        <input type="text" name="conf_website_url" class="form-control width-350"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="form-inline">
                                        <label class="checkbox">
                                            <input type="checkbox" name="conf_show_message_suffix" value="yes">
                                            <i></i>信息后缀
                                        </label>
                                        <input type="text" name="conf_message_suffix" class="form-control width-350"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否发送到群</label>
                                <div class="col-sm-10">
                                    <label class="radio">
                                        <input type="radio" name="conf_limit_group" value="friend">
                                        <i></i> 仅发送到好友
                                    </label>
                                    <label class="radio">
                                        <input type="radio" name="conf_limit_group" value="group">
                                        <i></i> 仅发送到群
                                    </label>
                                    <label class="radio">
                                        <input type="radio" name="conf_limit_group" value="both">
                                        <i></i> 发送到好友和群
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-10">
                                    <label class="radio">
                                        <input type="radio" name="conf_limit_genda" value="both">
                                        <i></i> 不限
                                    </label>
                                    <label class="radio">
                                        <input type="radio" name="conf_limit_genda" value="m">
                                        <i></i> 男
                                    </label>
                                    <label class="radio">
                                        <input type="radio" name="conf_limit_genda" value="f">
                                        <i></i> 女
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <label class="checkbox">
                                        <input type="checkbox" value="yes" name="conf_use_nick_name">
                                        <i></i> 开头使用昵称
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <label class="checkbox">
                                        <input type="checkbox" value="yes" name="conf_limit_city">
                                        <i></i> 开启地区限制
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <label class="checkbox">
                                        <input type="checkbox" value="yes" name="conf_do_not_disturb">
                                        <i></i> 开启免打扰功能
                                    </label>
                                    <div>
                                        (如果开启免打扰，则根据免打扰的规则，好友将不会收到重复的消息，或仅在生日或节假日才能收到信息。)
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <label class="checkbox">
                                        <input type="checkbox" value="yes" name="conf_follow_weixin">
                                        <i></i> 自动关注公众号
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="form-inline">
                                        <label class="checkbox">
                                            <input type="checkbox" name="conf_mode_test" value="yes">
                                            <i></i>测试模式
                                        </label>
                                        <input type="text" name="conf_test_users" class="form-control width-350"/>
                                    </div>
                                    <div>测试模式下，消息仅广播至指定微信账号(输入昵称)</div>
                                </div>
                            </div>
                        </div>

                        <hr/>

                        <div class="form-group margin-top-20">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <a class="btn btn-lg btn-success btn-save-setting">保存设置</a>
                                <a class="btn btn-lg btn-default btn-create-qrcode">生成群发二维码</a>
                            </div>
                        </div>
                    </form>
                    <div>
                        <div></div>
                    </div>

                </div>
            </div>
        </div>

        <!-- LEFT -->
        <div class="col-lg-2 col-md-2 col-sm-3 col-lg-pull-10 col-md-pull-10 col-sm-pull-7">
            <jsp:include page="/app/usercenter/userCenterMenu"/>
        </div>

    </div>
</section>

<script id="weixinconfigTemplate" type="text/html">
    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <div class="form-inline">
                <label class="checkbox">
                    {{if 'yes' == conf_show_link_person}}
                    <input type="checkbox" name="conf_show_link_person" value="yes" checked="checked">
                    {{else}}
                    <input type="checkbox" name="conf_show_link_person" value="yes">
                    {{/if}}
                    <i></i>联<span class="half-word"> </span>系<span class="half-word"> </span>人
                </label>
                <input type="text" name="conf_link_person" class="form-control" value="{{conf_link_person}}"/>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <div class="form-inline">
                <label class="checkbox">
                    {{if 'yes' == conf_show_contact}}
                    <input type="checkbox" name="conf_show_contact" value="yes" checked="checked">
                    {{else}}
                    <input type="checkbox" name="conf_show_contact" value="yes">
                    {{/if}}
                    <i></i>联系方式
                </label>
                <input type="text" name="conf_contact" class="form-control" value="{{conf_contact}}"/>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <div class="form-inline">
                <label class="checkbox">
                    {{if 'yes' == conf_show_website_name}}
                    <input type="checkbox" name="conf_show_website_name" value="yes" checked="checked">
                    {{else}}
                    <input type="checkbox" name="conf_show_website_name" value="yes">
                    {{/if}}
                    <i></i>网址名称
                </label>
                <input type="text" name="conf_website_name" class="form-control width-350" value="{{conf_website_name}}"/>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <div class="form-inline">
                <label class="checkbox">
                    {{if 'yes' == conf_show_website_url}}
                    <input type="checkbox" name="conf_show_website_url" value="yes" checked="checked">
                    {{else}}
                    <input type="checkbox" name="conf_show_website_url" value="yes">
                    {{/if}}
                    <i></i>网<span class="two-word">    </span>址
                </label>
                <input type="text" name="conf_website_url" class="form-control width-350" value="{{conf_website_url}}"/>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <div class="form-inline">
                <label class="checkbox">
                    {{if 'yes' == conf_show_message_suffix}}
                    <input type="checkbox" name="conf_show_message_suffix" value="yes" checked="checked">
                    {{else}}
                    <input type="checkbox" name="conf_show_message_suffix" value="yes">
                    {{/if}}
                    <i></i>信息后缀
                </label>
                <input type="text" name="conf_message_suffix" class="form-control width-350" value="{{conf_message_suffix}}"/>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">是否发送到群</label>
        <div class="col-sm-10">
            <label class="radio">
                {{if 'friend' == conf_limit_group}}
                <input type="radio" name="conf_limit_group" value="friend" checked="checked">
                {{else}}
                <input type="radio" name="conf_limit_group" value="friend">
                {{/if}}
                <i></i> 仅发送到好友
            </label>
            <label class="radio">
                {{if 'group' == conf_limit_group}}
                <input type="radio" name="conf_limit_group" value="group" checked="checked">
                {{else}}
                <input type="radio" name="conf_limit_group" value="group">
                {{/if}}
                <i></i> 仅发送到群
            </label>
            <label class="radio">
                {{if 'both' == conf_limit_group}}
                <input type="radio" name="conf_limit_group" value="both" checked="checked">
                {{else}}
                <input type="radio" name="conf_limit_group" value="both">
                {{/if}}
                <i></i> 发送到好友和群
            </label>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">性别</label>
        <div class="col-sm-10">
            <label class="radio">
                {{if 'both' == conf_limit_genda}}
                <input type="radio" name="conf_limit_genda" value="both" checked="checked">
                {{else}}
                <input type="radio" name="conf_limit_genda" value="both">
                {{/if}}
                <i></i> 不限
            </label>
            <label class="radio">
                {{if 'm' == conf_limit_genda}}
                <input type="radio" name="conf_limit_genda" value="m" checked="checked">
                {{else}}
                <input type="radio" name="conf_limit_genda" value="m">
                {{/if}}
                <i></i> 男
            </label>
            <label class="radio">
                {{if 'f' == conf_limit_genda}}
                <input type="radio" name="conf_limit_genda" value="f" checked="checked">
                {{else}}
                <input type="radio" name="conf_limit_genda" value="f">
                {{/if}}
                <i></i> 女
            </label>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <label class="checkbox">
                {{if 'yes' == conf_use_nick_name}}
                <input type="checkbox" name="conf_use_nick_name" value="yes" checked="checked">
                {{else}}
                <input type="checkbox" name="conf_use_nick_name" value="yes">
                {{/if}}
                <i></i> 开头使用昵称
            </label>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <label class="checkbox">
                {{if 'yes' == conf_limit_city}}
                <input type="checkbox" name="conf_limit_city" value="yes" checked="checked">
                {{else}}
                <input type="checkbox" name="conf_limit_city" value="yes">
                {{/if}}
                <i></i> 开启地区限制
            </label>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <label class="checkbox">
                {{if 'yes' == conf_do_not_disturb}}
                <input type="checkbox" name="conf_do_not_disturb" value="yes" checked="checked">
                {{else}}
                <input type="checkbox" name="conf_do_not_disturb" value="yes">
                {{/if}}
                <i></i> 开启免打扰功能
            </label>
            <div>
                (如果开启免打扰，则根据免打扰的规则，好友将不会收到重复的消息，或仅在生日或节假日才能收到信息。)
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <label class="checkbox">
                {{if 'yes' == conf_follow_weixin}}
                <input type="checkbox" name="conf_follow_weixin" value="yes" checked="checked">
                {{else}}
                <input type="checkbox" name="conf_follow_weixin" value="yes">
                {{/if}}
                <i></i> 自动关注公众号
            </label>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <div class="form-inline">
                <label class="checkbox">
                    {{if 'yes' == conf_mode_test}}
                    <input type="checkbox" name="conf_mode_test" value="yes" checked="checked">
                    {{else}}
                    <input type="checkbox" name="conf_mode_test" value="yes">
                    {{/if}}
                    <i></i>测试模式
                </label>
                <input type="text" name="conf_test_users" class="form-control width-350" value="{{conf_test_users}}"/>
            </div>
            <div>测试模式下，消息仅广播至指定微信账号(输入昵称)</div>
        </div>
    </div>
</script>

<script id="qrcodeTemplate" type="text/html">
    <div class="row">
        <div class="col-xs-6 col-xs-offset-3">
            <div class="row">
                <div>
                    请用微信扫描二维码，并同意登陆网页版微信
                </div>
                <div class="margin-top-10">
                    <img id="qrcodeImage" src="${ctx}/{{qrimageUrl}}" class="img-responsive" data-uuid="{{window_QRLogin_uuid}}"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div id = "WxMessageResult" class="text-center margin-top-10">

            </div>
        </div>
    </div>
</script>

<script type="text/javascript">

    // 返回二维码图片时的时间，用于计算等待用户操作的时间
    var qrcodeImageTimerStart;

    var statusCheckTimer;

    $(document).ready(function () {

        $(".btn-save-setting").click(function () {
            var formdata = $("#weixinSetting").serialize();

            $.ajax({
                url: "/usercenter/myWebWeixin/updateWeixinConfig",
                data: formdata,
                type: "POST",
                dataType: "json",
                success: function (data) {
                    if (data && data.flag == "1") {
                        toastSuccess("设置已保存！");
                        messagePreview();
                    }
                    else {
                        toastError("提示", data.msg);
                    }
                }
            });

        });

        $(document).on("change", "#companyId", function () {
            var companyId = $("#companyId").val();
            loadConfiguration(companyId);
        });

        loadConfiguration($("#companyId").val());


        $(".btn-create-qrcode").click(function(){

            var params = {companyId : $("#companyId").val() , agentId : "<security:authentication property="principal.username"/>"};
            $.ajax({
                url: "/api/webWeixin/webWxInitSession",
                data: params,
                type: "POST",
                dataType: "json",
                timeout : 5000,
                complete : function(XMLHttpRequest,status){ //请求完成后最终执行参数
                    if(status=='timeout'){//超时,status还有success,error等值的情况
                        $(".btn-create-qrcode").click();
                    }
                },
                success: function (data) {
                    if (data && data.flag == "1") {

                        var html = template("qrcodeTemplate", data);
                        BootstrapDialog.show({
                            title: "<div class='size-20'>扫码</div>",
                            draggable: true,
                            size: BootstrapDialog.SIZE_NORMAL,
                            cssClass: 'introduction-dialogue',
                            message: $("<div></div>").html(html),
                            onshown: function(){

                                var now = new Date();
                                var html = "<div>" + now.toLocaleTimeString() + " 请扫描二维码并登录</div>"
                                $("#WxMessageResult").html(html);

                                setTimeout(checkWeblogin, 1000);
                            },
                            buttons: [
                                {
                                    label: '重发',
                                    cssClass: "btn btn-info",
                                    action: function (dialogItself) {
                                        broadcastMessage();
                                    }
                                },
                                {
                                    label: '关闭',
                                    cssClass: "btn btn-danger dialogue-close",
                                    action: function (dialogItself) {
                                        dialogItself.close();
                                    }
                                }]
                        });

                    }
                    else {
                        toastError("提示", data.msg);
                    }
                }
            });
        });

        // 预览功能
    });

    function checkWeblogin() {
        var uuid = $("#qrcodeImage").attr("data-uuid");
        var params = {uuid: uuid};
        $.ajax({
            url: "/api/webWeixin/checkWeblogin",
            data: params,
            type: "POST",
            dataType: "json",
            timeout : 10000,
            complete : function(XMLHttpRequest,status){ //请求完成后最终执行参数
                if(status=='timeout'){//超时,status还有success,error等值的情况
                    console.log("连接超时，重新连接！");
                    setTimeout(checkWeblogin, 1000);
                }
            },
            success: function (data) {
                console.log("状态监测： flag=" + data.flag);

                var now = new Date();
                if (data && (data.flag == "0" || data.flag == "-3")) {
//                    toastError("提示", data.msg);
                    var html = "<div class='alert alert-mini alert-danger'>" + now.toLocaleTimeString() + data.msg + "</div>"
                    $("#WxMessageResult").append(html);
                }
                else if (data && data.flag == "1") {

                    $("#qrcodeImage").attr("data-skey", data.skey);
                    $("#qrcodeImage").attr("data-sid", data.sid);
                    $("#qrcodeImage").attr("data-uin", data.uin);


                    var html = "<div>" + now.toLocaleTimeString() + " 登录成功，准备初始化...</div>"
                    $("#WxMessageResult").append(html);

                    broadcastMessage();
                }
                else if (data && (data.flag == "-1" || data.flag == "-2")) {
                    var html = "<div>" + now.toLocaleTimeString() + " 请扫描二维码并登录</div>"
                    $("#WxMessageResult").html(html);
                    setTimeout(checkWeblogin, 1000);
                }
                else {
//                    toastError("错误的状态提示！");
                    var html = "<div class='alert alert-mini alert-danger'>" + now.toLocaleTimeString() + data.msg + "</div>"
                    $("#WxMessageResult").append(html);
                }
            }
        });
    }

    function broadcastMessage() {
        var uuid = $("#qrcodeImage").attr("data-uuid");
        var params = {uuid: uuid};
        $.ajax({
            url: "/api/webWeixin/broadcastMessage",
            data: params,
            type: "POST",
            dataType: "json",
            timeout : 90000000,
            complete : function(XMLHttpRequest,status){ //请求完成后最终执行参数
                if(status=='timeout'){//超时,status还有success,error等值的情况
                    console.log("连接超时，重新连接！");
                }
            },
            success: function (data) {
                var now = new Date();
                if (data && data.flag == "1") {

                    var html = "<div>" + now.toLocaleTimeString() +" 消息广播结束，发送到 " + data.groupCount + " 个群， " + data.userCount + " 个好友。 " + "</div>";
                    $("#WxMessageResult").append(html);
                }
                else {
//                    toastError("提示", data.msg);
                    var html = "<div class='alert alert-mini alert-danger'>" + now.toLocaleTimeString() + data.msg + "</div>"
                    $("#WxMessageResult").append(html);
                }
            }
        });
    }

    function loadConfiguration(companyId) {
        $.ajax({
            url: "/usercenter/myWebWeixin/getWeixinConfig",
            data: {companyId: companyId},
            type: "GET",
            dataType: "json",
            success: function (data) {
                if (data && data.flag == "1") {

                    // slogan
                    $("#companySlogan").html(data.companySlogan);
                    // 发送内容
                    $("#conf_material_id").val(data.conf_material_id);

                    var html = template("weixinconfigTemplate", data);
                    $("#weixinconfigPanel").html(html);

                    messagePreview();
                }
                else {
                    toastError("提示", data.msg);
                }
            }
        });
    }

    function qrcodeImageElapseTimer(){
        var now = new Date();
        var elapse = "";

        $("#qrcodeImageTimer").html(elapse);
    }

    function messagePreview(){
        var html = "";
        if($("input[name='conf_use_nick_name']").is(':checked')){
            html += "{好友昵称}，";
        }

        var contentType = $("#conf_material_id option:selected").attr("data-type");
        var content = $("#conf_material_id option:selected").attr("data-text");
        var imagePath = $("#conf_material_id option:selected").attr("data-image-url");
        if (contentType == "2"){

            var html = "<img src='${ctx}/" + imagePath + "' class='img-responsive'/>";

            var img = $("#previewMessage").clone();
            img.empty();
            img.append($(html));

            $("#previewMessage").append(img);

            if (content && content.length > 100){
                content = content.substr(0, 100) + "...[其他正文省略]";
            }
        }
        else{
            if (content && content.length > 100){
                content = content.substr(0, 100) + "...[其他正文省略]";
            }
        }

        html += content;

        html += "<br/>"

        html += $("#companySlogan").html();

        html += "<br/>"

        if($("input[name='conf_show_link_person']").is(':checked')){
            html += " " + $("input[name='conf_link_person']").val() ;
        }
        if($("input[name='conf_show_contact']").is(':checked')){
            html += " " + $("input[name='conf_contact']").val();
        }
        if($("input[name='conf_show_website_name']").is(':checked')){
            html += " " + $("input[name='conf_website_name']").val();
        }
        if($("input[name='conf_show_website_url']").is(':checked')){
            html += " " + $("input[name='conf_website_url']").val();
        }
        if($("input[name='conf_show_message_suffix']").is(':checked')){
            html += " " + $("input[name='conf_message_suffix']").val();
        }

        $("#previewMessage").html(html);
    }
</script>
