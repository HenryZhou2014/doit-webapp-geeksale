<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>微信裂变</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="myBooks"/>

    <style type="text/css">
        .uppercase .delete-article,.uppercase .contibute-article{
            position:relative;float:right;
            margin-right: 5px;
        }

        #info .timeline .timeline-item {
            position: relative;
            min-height: 90px;
            display: block;
            margin-bottom: 50px;
        }

        .form-horizontal .checkbox{
            padding-top: 0;
        }

        .form-horizontal .control-label{
            padding-top: 5px;
        }

        .form-group{
            margin-bottom: 10px;
        }

        .checkbox+.checkbox, .radio+.radio{
            margin-top: 0;
        }
    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#info" data-toggle="tab">我的微信</a></li>
            </ul>

            <div class="tab-content margin-top-20">
                <div class="col-lg-12">
                    <div>
                        <a class="btn btn-lg btn-default" id="webwxLogin">登陆二维码</a>
                        <a class="btn btn-lg btn-default" id="webwxSendMsg">发送消息</a>
                        <a class="btn btn-lg btn-default" id="webwxSendImageMsg">发送图片</a>
                        <a class="btn btn-lg btn-default" id="webwxSendLinkMsg">发送链接</a>
                        <a class="btn btn-lg btn-default" id="webwxSendFileMsg">发送文件</a>
                    </div>
                    <div>
                        <img id="qrloginImg" style="max-height: 150px;"/>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div id="wxUserProfile">

                    </div>

                    <div id="wxContacts">

                    </div>
                </div>
                <div class="col-lg-12">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                预览

                                <a class="btn btn-success btn-lg">选择素材</a>
                            </label>
                            <div class="col-sm-10">
                                <div class="col-lg-5">
                                    <div class="price-clean">
                                        <p>
                                            在冰箱里只要放一个小东西，冰箱里永不结冰，关键每个月都超省电 冰箱是如今每个家庭都必须要有的，基本一年到头不间隙工作。由于经常用冰箱时刻长了冰箱里面就会有许多的冰在里面，导致冰箱柜都拉不动，而且还非常耗电，也影响了冰箱制冷的效果。
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <label class="checkbox">
                                    <input type="checkbox" value="1">
                                    <i></i> 发送到微信群
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <label class="checkbox">
                                    <input type="checkbox" value="1">
                                    <i></i> 开头使用昵称
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <label class="checkbox">
                                    <input type="checkbox" value="1">
                                    <i></i> 开启地区限制
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="checkbox">
                                    <input type="checkbox" value="1">
                                    <i></i> 女
                                </label>
                                <label class="checkbox">
                                    <input type="checkbox" value="1">
                                    <i></i> 男
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">消息类型</label>
                            <div class="col-sm-10">
                                <label class="checkbox">
                                    <input type="checkbox" value="1">
                                    <i></i> 全部消息
                                </label>
                                <label class="checkbox">
                                    <input type="checkbox" value="1">
                                    <i></i> 相同消息
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">不打扰时间</label>
                            <div class="col-sm-10">
                                <label class="checkbox">
                                    <input type="checkbox" value="1">
                                    <i></i> 1天
                                </label>
                                <label class="checkbox">
                                    <input type="checkbox" value="1">
                                    <i></i> 3天
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <a class="btn btn-lg btn-default" id="saveSetting">保存设置</a>
                                <a class="btn btn-lg btn-default" id="saveSetting2">发送</a>
                            </div>
                        </div>
                    </form>
                    <div>
                        <div></div>
                    </div>

                    <div>

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

<script id="wxUserProfileTemplate" type="text/html">
    <div>
        <img data-url="{{UserInfo.HeadImgUrl}}" src="${ctx}/images/no_portrait.png" style="max-height: 40px;" />
    </div>
    <div>
        <a data-UserName="{{UserInfo.UserName}}" data-Uin="{{UserInfo.Uin}}">{{UserInfo.NickName}}</a>
    </div>
    <div>
        备注名称 {{UserInfo.RemarkName}}
    </div>
    <div>
        签名:{{UserInfo.Signature}}
    </div>
</script>

<script id="wxContactsTemplate" type="text/html">
    <div style="max-height: 500px; overflow: auto;">
        <table class="table">
            <tr>
                <th></th>
                <th>HeadImgUrl</th>
                <th>NickName</th>
                <th>Uin</th>
                <th>ContactFlag</th>
                <th>RemarkName</th>
                <th>Sex</th>
                <th>Signature</th>
                <th>Province</th>
                <th>City</th>
            </tr>
        {{each MemberList as member i }}
        <tr>
            <td>
                <input type="checkbox" name="checkId" value="{{member.UserName}}"/>
            </td>
            <td>
                <img data-url="{{member.HeadImgUrl}}" src="${ctx}/usercenter/myWebWeixin/profileImage/{{uuid}}/{{member.UserName}}" style="max-height: 40px;" />
                <%--<img data-url="{{member.HeadImgUrl}}" src="${ctx}/images/no_portrait.png" style="max-height: 40px;" />--%>
            </td>
            <td>
                <a data-UserName="{{member.UserName}}" data-Uin="{{member.Uin}}">{{member.NickName}}</a>
            </td>
            <td>{{member.Uin}}</td>
            <td>{{member.ContactFlag}}</td>
            <td>{{member.RemarkName}}</td>
            <td>{{member.Sex}}</td>
            <td>{{member.Signature}}</td>
            <td>{{member.Province}}</td>
            <td>{{member.City}}</td>
        </tr>
        {{/each}}
        </table>

    </div>
</script>


<script type="text/javascript">

    $(document).ready(function () {

        $.fn.checkvalues = function () {
            var val = [];
            $(this).each(function (index, element) {
                val.push($(element).val());
            });

            return val.join(",");
        };

        $("#webwxLogin").click(function(){
            var params = {};
            $.ajax({
                url: "/usercenter/myWebWeixin/qrcodeImage",
                data: params,
                type : "POST",
                dataType: "json",
                success: function (data) {
                    if (data && data.flag == "1"){
                        console.log("qrimageUrl=" + data.qrimageUrl);
                        $("#qrloginImg").attr("src", "${ctx}/" + data.qrimageUrl);

                        $("#webwxLogin").attr("data-uuid", data.window_QRLogin_uuid);

                        setTimeout(checkWeblogin, 1000);
                    }
                    else{
                        toastError("提示", data.msg);
                    }
                }
            });
        });

        $("#webwxSendMsg").click(function(){
            var uuid = $("#webwxLogin").attr("data-uuid");
            var checkIds = $("input[name='checkId']:checked").checkvalues();

            var params = {uuid : uuid, checkIds : checkIds};
            $.ajax({
                url: "/usercenter/myWebWeixin/sendMessage",
                data: params,
                type : "POST",
                dataType: "json",
                success: function (data) {
                    if (data && data.flag == "1"){
                        toastSuccess("提示", "消息已发送");
                    }
                    else{
                        toastError("提示", data.msg);
                    }
                }
            });
        });

        $("#webwxSendLinkMsg").click(function(){
            var uuid = $("#webwxLogin").attr("data-uuid");
            var checkIds = $("input[name='checkId']:checked").checkvalues();

            var params = {uuid : uuid, checkIds : checkIds};
            $.ajax({
                url: "/usercenter/myWebWeixin/sendMessage",
                data: params,
                type : "POST",
                dataType: "json",
                success: function (data) {
                    if (data && data.flag == "1"){
                        toastSuccess("提示", "消息已发送");
                    }
                    else{
                        toastError("提示", data.msg);
                    }
                }
            });
        });

        $("#webwxSendImageMsg").click(function(){
            var uuid = $("#webwxLogin").attr("data-uuid");
            var checkIds = $("input[name='checkId']:checked").checkvalues();

            var params = {uuid : uuid, checkIds : checkIds};
            $.ajax({
                url: "/usercenter/myWebWeixin/sendFileMessage",
                data: params,
                type : "POST",
                dataType: "json",
                success: function (data) {
                    if (data && data.flag == "1"){
                        toastSuccess("提示", "消息已发送");
                    }
                    else{
                        toastError("提示", data.msg);
                    }
                }
            });
        });

        $("#webwxSendFileMsg").click(function(){
            var uuid = $("#webwxLogin").attr("data-uuid");
            var checkIds = $("input[name='checkId']:checked").checkvalues();

            var params = {uuid : uuid, checkIds : checkIds};
            $.ajax({
                url: "/usercenter/myWebWeixin/sendFileMessage",
                data: params,
                type : "POST",
                dataType: "json",
                success: function (data) {
                    if (data && data.flag == "1"){
                        toastSuccess("提示", "消息已发送");
                    }
                    else{
                        toastError("提示", data.msg);
                    }
                }
            });
        });
    });

    function checkWeblogin(){
        var uuid = $("#webwxLogin").attr("data-uuid");
        var params = {uuid : uuid};
        $.ajax({
            url: "/usercenter/myWebWeixin/checkWeblogin",
            data: params,
            type : "POST",
            dataType: "json",
            success: function (data) {
                if (data && (data.flag == "0" || data.flag == "-3")){
                    toastError("提示", data.msg);
                }
                else if(data && data.flag == "1"){

                    $("#webwxLogin").attr("data-skey", data.skey);
                    $("#webwxLogin").attr("data-sid", data.sid);
                    $("#webwxLogin").attr("data-uin", data.uin);

                    getUserProfileAndContacts();
                }
                else if(data && (data.flag == "-1" || data.flag == "-2")){
                    setTimeout(checkWeblogin, 1000);
                }
                else {
                    toastError("错误的状态提示！");
                }
            }
        });
    }

    function getUserProfileAndContacts(){
        var uuid = $("#webwxLogin").attr("data-uuid");
        var params = {uuid : uuid};
        $.ajax({
            url: "/usercenter/myWebWeixin/initWx",
            data: params,
            type : "POST",
            dataType: "json",
            success: function (data) {
                if (data && data.flag == "1"){

                    $("#webwxLogin").attr("data-synckey", data.synckey);
                    $("#webwxLogin").attr("data-deviceid", data.deviceid);

                    // 用户信息
                    var html = template("wxUserProfileTemplate", data);
                    $("#wxUserProfile").html(html);

                    // 联系人列表
                    html = template("wxContactsTemplate", data);
                    $("#wxContacts").html(html);

                    setInterval(synccheck, 10000);
                }
                else{
                    toastError("提示", data.msg);
                }
            }
        });
    }

    function synccheck(){

        var uuid = $("#webwxLogin").attr("data-uuid");

        var params = {
            uuid: uuid
        };
        $.ajax({
            url: "/usercenter/myWebWeixin/synccheck",
            data: params,
            type : "GET",
            dataType: "json",
            crossDomain: true,
            success: function (data) {
                console.log("synccheck result = " + data);
                if (data && data.flag == "1"){
                    if(data.status.retcode == 0){
                        var selector = data.status.selector;
                        if (selector == "0"){
                            console.log("状态已同步！");
                        }
                        else if(selector == "2"){
                            console.log("有新的消息！");
                        }
                        else if(selector == "4"){
                            console.log("4通过时发现,删除好友！");
                        }
                        else if(selector == "6"){
                            console.log("6删除时发现和对方通过好友验证！");
                        }
                        else if(selector == "7"){
                            console.log("7进入/离开聊天界面(可能没有了)！");
                        }
                        else{
                            console.log("状态消息！selector=" + selector);
                        }
                    }
                    else {
                        console.log("同步状态 retcode=" + data.status.retcode);
                        toastError("提示", "登出微信网页版已登出！");
                    }
                }
                else{
                    toastError("提示", data.msg);
                }
            }
        });
    }
</script>
