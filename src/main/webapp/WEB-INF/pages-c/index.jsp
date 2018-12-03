<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>微信裂变</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="myBooks"/>
    <%--<script src="http://192.168.0.102:8080/target/target-script-min.js#anonymous"></script>--%>

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

        div.price-table {
            margin: 0;
        }
    </style>
</head>

<div>
    <div class="container">
        <div class="row">
            <div class="">
                <div class="alert alert-info margin-top-10"><!-- SUCCESS -->

                    <span class="size-16 weight-800">操作提示</span>

                    <span class="margin-top-20">
                        群发二维码的有效时间为2分钟，使用微信扫描后提示用户登录网页版微信，点击登录后，系统将管理员配置的信息群发至联系人清单。
                    </span>
                </div>

                <div>
                    <div class="text-center">
                        <img id="qrcodeImage" src="${ctx}/images/qrcodescan-256.png" style="max-width: 200px;"/>
                    </div>
                    <div class="text-center margin-top-20">
                        <a class="btn btn-success btn-lg btn-create-qrcode" data-company-id="${companyId}">生成群发二维码</a>
                    </div>
                    <div id="WxMessageResult" class="text-center">

                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- RIGHT -->
            <div class=" margin-bottom-80 margin-top-10">

                <ul class="nav nav-tabs nav-top-border">
                    <li class="active"><a href="#home1" data-toggle="tab">
                        今日统计
                    </a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade in active" id="home1">
                        <div class="row">

                            <div class="col-xs-6 col-sm-6 col-lg-3 margin-bottom-10">

                                <div class="price-clean">
                                    <div>
                                        <span class="size-30">${todaytimes}</span><em> / 次</em>
                                    </div>
                                    <h5> 今日扫码 </h5>
                                </div>

                            </div>

                            <div class="col-xs-6 col-sm-6 col-lg-3 margin-bottom-10">

                                <div class="price-clean">
                                    <div>
                                        <span class="size-30">${todayfriends}</span><em> 个好友</em> <span class="size-30">${today-group}</span><em> 个群 </em>
                                    </div>
                                    <h5> 今日到达 </h5>
                                </div>

                            </div>

                            <div class="col-xs-6 col-sm-6 col-lg-3 margin-bottom-10">

                                <div class="price-clean">
                                    <div>
                                        <span class="size-30">${yestodaytimes}</span><em> / 次</em>
                                    </div>
                                    <h5> 昨日扫码 </h5>
                                </div>

                            </div>

                            <div class="col-xs-6 col-sm-6 col-lg-3 margin-bottom-10">

                                <div class="price-clean">
                                    <div>
                                        <span class="size-30">${yestodayfriends}</span><em> 个好友</em> <span class="size-30">${yestoday-group}</span><em> 个群 </em>
                                    </div>
                                    <h5> 昨日到达 </h5>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>

                <ul class="nav nav-tabs nav-top-border">
                    <li class="active"><a href="#home2" data-toggle="tab">
                        增值服务
                    </a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade in active" id="home2">
                        <div class="col-lg-12">
                            <ul class="row list-unstyled list-inline">
                                <doit:articleListByCategoryTag categoy="['extaddinservices']" num="8">
                                    <li class="col-xs-6 col-lg-3 margin-bottom-10">
                                        <div>
                                            <img src="${ctx}/images/service.jpg" class="img-responsive"/>
                                        </div>
                                        <h4 class="text-center">${articleItem.title}</h4>
                                        <p>
                                            ${articleItem.introText}
                                        </p>
                                        <a href="${ctx}/agent/news/item-${articleItem.id}.html" class="btn btn-danger btn-lg">服务详情</a>
                                    </li>
                                </doit:articleListByCategoryTag>
                            </ul>
                        </div>
                    </div>
                </div>

                <ul class="nav nav-tabs nav-top-border margin-top-20">
                    <li class="active"><a href="#home3" data-toggle="tab">
                        商户库
                    </a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="home3">

                        <div class="callout alert alert-border">

                            <div class="row">

                                <div class="col-md-8 col-sm-8"><!-- left text -->
                                    <h4>超过 <strong>600万</strong> 条商户信息记录!</h4>
                                    <p class="font-lato size-17">

                                    </p>
                                </div><!-- /left text -->


                                <div class="col-md-4 col-sm-4 text-right"><!-- right btn -->
                                    <a href="${ctx}/agent/yellowpages" rel="nofollow" target="_blank" class="btn btn-success btn-lg width-150">商户查询</a>
                                </div><!-- /right btn -->

                            </div>

                        </div>

                    </div>
                </div>

                <ul class="nav nav-tabs nav-top-border">
                    <li class="active"><a href="#home4" data-toggle="tab">
                        客户开户
                    </a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade in active" id="home4">

                        <div class="callout alert alert-border">

                            <div class="row">

                                <div class="col-md-8 col-sm-8"><!-- left text -->
                                    <h4>帮助客户开通账号！</h4>

                                </div><!-- /left text -->


                                <div class="col-md-4 col-sm-4 text-right"><!-- right btn -->
                                    <a href="${ctx}/agent/${agentId}/memberApply" rel="nofollow" target="_blank" class="btn btn-success btn-lg width-150">客户开户</a>
                                </div><!-- /right btn -->

                            </div>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function(){

        $(".btn-create-qrcode").click(function(){
            var companyId = $(this).attr("data-company-id");
            var params = {companyId : companyId, agentId : "${account.weixinOpenId}"};
            console.log("btn-create-qrcode click, companyId = " + companyId);
            $.ajax({
                url: "${ctx}/api/webWeixin/webWxInitSession",
                data: params,
                type: "POST",
                async: false,
                dataType: "json",
                timeout : 5000,
                complete : function(XMLHttpRequest,status){ //请求完成后最终执行参数
                    if(status=='timeout'){//超时,status还有success,error等值的情况
                        $(".btn-create-qrcode").click();
                    }
                },
                success: function (data) {
                    console.log("btn-create-qrcode click, success = ");

                    var now = new Date();
                    if (data && data.flag == "1") {

                        $("#qrcodeImage").attr("src", "${ctx}/" + data.qrimageUrl);
                        $("#qrcodeImage").attr("data-uuid", data.window_QRLogin_uuid);

                        var html = "<div>" + now.toLocaleTimeString() + " 请扫描二维码并登录</div>";
                        $("#WxMessageResult").html(html);

                        setTimeout(checkWeblogin, 1000);
                    }
                    else {
                        toastError("提示", data.msg);
                    }
                }
            });
        });

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
                    var html = "<div class='alert alert-mini alert-danger'>" + now.toLocaleTimeString() + data.msg + "</div>"
                    $("#WxMessageResult").append(html);
                }
                else if (data && data.flag == "1") {

                    $("#qrcodeImage").attr("data-skey", data.skey);
                    $("#qrcodeImage").attr("data-sid", data.sid);
                    $("#qrcodeImage").attr("data-uin", data.uin);


                    var html = "<div>" + now.toLocaleTimeString() + " 登录成功，消息广播中...</div>";
                    $("#WxMessageResult").append(html);

                    broadcastMessage();
                }
                else if (data && (data.flag == "-1" || data.flag == "-2")) {
                    var html = "<div>" + now.toLocaleTimeString() + " 请扫描二维码并登录</div>";
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
            timeout : 300000,
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
//                    toastError("提示", "请检查群发参数是否已经正确配置！");
                    var html = "<div class='alert alert-mini alert-danger'>" + now.toLocaleTimeString() + "请检查群发参数是否已经正确配置！</div>"
                    $("#WxMessageResult").append(html);
                }
            }
        });
    }

</script>
