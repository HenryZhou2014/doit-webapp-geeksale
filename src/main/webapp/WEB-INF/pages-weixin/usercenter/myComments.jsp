<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>我的评论</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="myComments"/>

    <style type="text/css">
        .answer-items li.comment.comment-reply {
            margin-left: 60px;
            background-color: #FDFDFE;
            padding: 6px;
            margin-bottom: 6px;
        }
    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#info" data-toggle="tab">我的评论</a></li>
            </ul>

            <div class="tab-content margin-top-20">
                <div class="tab-pane fade in active" id="info">
                    <div class="box-light"><!-- .box-light OR .box-dark -->
                        <div class="box-inner">
                            <ul class="comment list-unstyled" id="comment-items"></ul>

                            <div class="comment hide" id="load-more-comment">
                                <a href="javascript:void(0);" data-page="1" data-page-size="5" data-load-more="Y">
                                    <div style="height: 20px;width:200px;text-align:center;font-size:13px;color: #fff;background-color: rgba(51, 102, 255, 0.29);border-radius: 3px;margin: 10px auto;">
                                        加载更多
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-2 col-md-2 col-sm-3 col-lg-pull-10 col-md-pull-10 col-sm-pull-7">
            <jsp:include page="/app/usercenter/userCenterMenu"/>
        </div>
    </div>
</section>
<script id="commentFlag" type="text/html">
    {{if noItem == 'true'}}
    <li class="comment comment-reply" style="margin-left:0;">
        <div class="comment-body" style="padding-left:0;">
            <div style="width:100%;padding:5px 0; line-height: 20px;font-size:13px;text-align: center;border-radius: 5px;">
                暂无评论
            </div>
        </div>
    </li>
    {{/if}}
</script>
<script id="commentItemsTemplate" type="text/html">
    {{each itemList as dataItem i }}
    <li class="comment" data-index="{{dataItem.id}}">
        <img class="avatar" style="border-radius:25px;"
             src="{{dataItem.imageUrl}}"
             width="50" height="50" alt=""/>
        <div class="comment-body">
            <a href="javascript:void(0);" class="comment-author">
                {{if dataItem.deleteFlag != '1'}}
                <small class="text-muted pull-right deleteItem">
                    <a href="javascript:void(0);" onclick="deleteCommentItem(this);" class="text-danger"
                       data-index="{{dataItem.id}}">删除</a>
                </small>
                {{/if}}
                <small class="text-muted pull-right" style="margin-right:20px;"> {{dataItem.createDate}}</small>
                <small class="text-muted pull-right" style="margin-right:20px;">
                    <a href="javascript:void(0);" class="text-success"><i class="fa fa-thumbs-up"></i>
                        {{dataItem.hearts}} </a>
                </small>
                <span>{{dataItem.userName}}</span>
            </a>
            {{if dataItem.deleteFlag != '1'}}
            <p data-index="{{dataItem.id}}">
                {{dataItem.commentText}}
            </p>
            {{/if}}
            {{if dataItem.deleteFlag == '1'}}
            <p style="text-decoration: line-through;">
                {{dataItem.commentText}}
            </p>
            {{/if}}
        </div>
        <ul class="list-inline size-11 margin-top-10" style="padding-left:60px;">
            <li>
                <a href="{{dataItem.url}}" class="text-info"><i
                        class="fa fa-reply"></i> {{dataItem.title}} </a>
            </li>
        </ul>
    </li>
    {{ if dataItem.rId }}
    <li class="comment comment-reply">
        <img class="avatar" style="border-radius: 25px;"
             src="{{dataItem.rImageUrl}}"
             width="50" height="50" alt=""/>
        <div class="comment-body">
            <a href="javascript:void(0);" class="comment-author">
                {{if dataItem.rDeleteFlag != '1'}}
                <small class="text-muted pull-right deleteItem">
                    <a href="javascript:void(0);" onclick="deleteReplyItem(this);" class="text-danger"
                       data-index="{{dataItem.rId}}">删除</a>
                </small>
                {{/if}}
                <small class="text-muted pull-right" style="margin-right:20px;"> {{dataItem.rCreateDate}}</small>
                <small class="text-muted pull-right" style="margin-right:20px;">
                    <a href="javascript:void(0);" class="text-success"><i class="fa fa-thumbs-up"></i>
                        {{dataItem.rHearts}} </a>
                </small>
                <span>{{dataItem.rUserName}}</span>
            </a>
            {{if dataItem.rDeleteFlag != '1'}}
            <div data-index="{{dataItem.rId}}"
                 style="width:100%;line-height: 18px;font-size:13px;padding:5px 0;color:#3366FF;">
                {{dataItem.rCommentText}}
            </div>
            {{/if}}
            {{if dataItem.rDeleteFlag == '1'}}
            <div style="width:100%;line-height: 18px;font-size:13px;padding:5px 0;color:#3366FF;text-decoration: line-through;">
                {{dataItem.rCommentText}}
            </div>
            {{/if}}

        </div>
    </li>
    {{/if}}

    <!-- 取消暂无评论的提示 -->
    <%--{{ if dataItem.noReplay == 'true' }}--%>
    <%--<li class="comment comment-reply">--%>
        <%--<!-- comment body -->--%>
        <%--<div class="comment-body" style="padding-left:0;">--%>
            <%--<div style="width:100%;padding:5px 0; line-height: 20px;font-size:13px;text-align: center;border-radius: 5px;">--%>
                <%--暂无回复--%>
            <%--</div>--%>
        <%--</div><!-- /comment body -->--%>
    <%--</li>--%>
    <%--{{/if}}--%>
    <ul class="comment list-unstyled answer-items" id="reply-items-{{dataItem.id}}"></ul>
    {{if dataItem.replyNum != '0'}}
    <div class="comment load-more-reply">
        <a href="javascript:void(0);"
           data-index="{{dataItem.id}}"
           data-page="1"
           data-page-size="10"
           data-q-id="{{dataItem.id}}"
           data-a-id="{{dataItem.rId}}"
           data-total-num="{{dataItem.replyNum}}"
           data-load-more="Y">
            <div style="height: 20px;width:200px;text-align:center;font-size:13px;color: #3366FF;border-radius: 3px;margin: 10px auto;">
                查看此问题的另外 {{dataItem.replyNum}} 个回答
            </div>
        </a>
    </div>
    {{/if}}
    {{/each}}
</script>
<script id="replyItemsTemplate" type="text/html">
    {{each itemList as dataItem i }}
    <li class="comment comment-reply" data-index="{{dataItem.id}}">
        <!-- avatar -->
        <img class="avatar" style="border-radius: 25px;"
             src="{{dataItem.imageUrl}}"
             width="50" height="50" alt=""/>

        <div class="comment-body">
            <a href="javascript:void(0);" class="comment-author">
                {{if dataItem.deleteFlag != '1'}}
                <small class="text-muted pull-right deleteItem">
                    <a href="javascript:void(0);" onclick="deleteReplyItem(this);" class="text-danger"
                       data-index="{{dataItem.id}}">删除</a>
                </small>
                {{/if}}
                <small class="text-muted pull-right" style="margin-right:20px;">
                    {{dataItem.createDate}}
                </small>
                <small class="text-muted pull-right" style="margin-right:20px;">
                    <a href="javascript:void(0);" class="text-success"><i class="fa fa-thumbs-up"></i>
                        {{dataItem.hearts}} </a>
                </small>
                <span>{{dataItem.userName}}</span>
            </a>
            {{if dataItem.deleteFlag != '1'}}
            <div data-index="{{dataItem.id}}"
                 style="width:100%;line-height: 18px;font-size:13px;padding:5px 0;color:#3366FF;">
                {{dataItem.commentText}}
            </div>
            {{/if}}
            {{if dataItem.deleteFlag == '1'}}
            <div style="width:100%;line-height: 18px;font-size:13px;padding:5px 0;color:#3366FF;text-decoration: line-through;">
                {{dataItem.commentText}}
            </div>
            {{/if}}
        </div>
    </li>
    {{/each}}
</script>

<script type="text/javascript">

    $(document).ready(function () {

        //加载评论区域
        loadMyCommentItems();
        $("#load-more-comment a").bind("click", function () {
            loadMyCommentItems();
        });

    });

    //初始化回复按钮的 click 事件
    function initReplyClick() {
        $(".answer").unbind("click");
        $(".answer").bind("click", function () {
            answerItem(this);
        });
    }

    //初始化加载更多回复按钮的 click 事件
    function initLoadMoreClick() {
        $(".load-more-reply a").unbind("click");
        $(".load-more-reply a").bind("click", function () {
            loadReplyItems(this);
        });
    }

    //加载评论区域区域
    function loadMyCommentItems() {
        var page = $("#load-more-comment").find("a").attr("data-page");
        var pageSize = $("#load-more-comment").find("a").attr("data-page-Size");
        var loadFlag = $("#load-more-comment").find("a").attr("data-load-more");

        if (loadFlag == "N") {
            return;
        }
        $.ajax({
            url: "${ctx}/usercenter/loadMyComments",
            dataType: "JSON",
            type: "POST",
            data: {
                page: page,
                pageSize: pageSize
            },
            success: function (data) {
                // /1.查询出现异常
                if (data.flag == "0") {
                    alert(data.msg);
                    return;
                }

                //2.当前用户没有提出过评论
                if (data.noItem == "true") {

                    //1.提示暂无评论
                    var html = template("commentFlag", data);
                    $("#comment-items").append(html);

                    return;

                }

                //3.当前用户提出过评论
                if (data.itemList) {
                    var html = template("commentItemsTemplate", data);
                    $("#comment-items").append(html);
                }

                //4.更改加载按钮状态
                updateLoadMoreCommentBtn(data);

                //5.重新绑定加载按钮事件
                initLoadMoreClick();

                //6.绑定回复按钮事件
                initAnswerClick();

            }
        });
    }

    //加载回复区域
    function loadReplyItems(thisNode) {

        var commentId = $(thisNode).attr("data-q-id");
        var firstReplyId = $(thisNode).attr("data-a-id");
        var page = $(thisNode).attr("data-page");
        var pageSize = $(thisNode).attr("data-page-Size");
        var loadFlag = $(thisNode).attr("data-load-more");

        if (loadFlag == "N") {
            resetBtnStatus(thisNode);
            return;
        }
        $.ajax({
            url: "${ctx}/usercenter/loadMoreReplyOfMyComments",
            dataType: "JSON",
            type: "POST",
            data: {
                commentId: commentId,
                firstReplyId: firstReplyId,
                page: page,
                pageSize: pageSize
            },
            success: function (data) {
                // /1.查询出现异常
                if (data.flag == "0") {
                    alert(data.msg);
                    return;
                }

                //当前提问无回复
                if (data.noItem == "true") {
                    $(thisNode).parent(".load-more-reply").addClass("hide");
                    return;
                }

                //3.当前提问有回复
                if (data.itemList) {
                    var html = template("replyItemsTemplate", data);
                    $("#reply-items-" + commentId).append(html);
                }

                //4.更改加载按钮状态
                updateLoadMoreReplyBtn(thisNode, data);

                //5.绑定回复按钮事件
                initAnswerClick();
            }
        });
    }

    //更改加载按钮状态
    function updateLoadMoreCommentBtn(data) {

        //更新加载按钮
        $("#load-more-comment").find("a").attr("data-page", data.pageNum);
        $("#load-more-comment").find("a").attr("data-page-size", data.pageNumSize);
        $("#load-more-comment").find("a").attr("data-load-more", data.dataLoadMore);
        var loadFlag = data.dataLoadMore;
        if (loadFlag == "N") {
            $("#load-more-comment").addClass("hide");
        }else if(loadFlag == "Y"){
            $("#load-more-comment").removeClass("hide");
        }

    }

    //更改回复加载按钮的状态
    function updateLoadMoreReplyBtn(thisNode, data) {

        //更新加载按钮
        $(thisNode).attr("data-page", data.pageNum);
        $(thisNode).attr("data-page-size", data.pageNumSize);
        $(thisNode).attr("data-load-more", data.dataLoadMore);
        var loadFlag = data.dataLoadMore;
        if (loadFlag == "N") {
            $(thisNode).find("div").text("收起全部回答");
        } else {
            $(thisNode).find("div").text("查看此问题的另外 " + data.surplus + " 个回答");
        }
    }

    //重新设置加载按钮状态
    function resetBtnStatus(thisNode) {
        //1.清空回复列表
        var id = $(thisNode).attr("data-q-id");
        $("#reply-items-" + id).empty();

        //2.更新加载按钮
        $(thisNode).attr("data-page", "1");
        $(thisNode).attr("data-page-size", "10");
        $(thisNode).attr("data-load-more", "Y");

        var totalNum = $(thisNode).attr("data-total-num");
        $(thisNode).find("div").text("查看此问题的另外 " + totalNum + " 个回答");

    }

    //删除评论
    function deleteCommentItem(thisNode) {
        deleteItem("comment", thisNode);
    }
    //删除回复
    function deleteReplyItem(thisNode) {
        deleteItem("reply", thisNode);
    }
    //删除元素
    function deleteItem(type, thisNode) {
        var itemId = $(thisNode).attr("data-index");

        $.ajax({
            url: "${ctx}/usercenter/deleteCommentItem",
            dataType: "JSON",
            type: "POST",
            data: {
                commentId: itemId
            },
            success: function (data) {
                if (data.flag == "0") {
                    alert(data.msg);
                    return;
                }

                if (type == "comment") {
                    $("p[data-index='" + itemId + "']").css({"text-decoration": "line-through"});
                } else if (type == "reply") {
                    $("div[data-index='" + itemId + "']").css({"text-decoration": "line-through"});
                }

                //删除当前结点
                $(thisNode).parents(".deleteItem").empty();
            }
        });
    }
</script>
