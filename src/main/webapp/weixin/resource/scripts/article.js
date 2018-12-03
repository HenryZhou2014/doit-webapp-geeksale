//initiating jQuery
$(document).ready(function () {
    // 文章图片自适应
    $(".article-content img").each(function(index, element){
        $(element).addClass("img-responsive");
    });

    //1.当鼠标进入评论编辑区时，编辑区展开
    $("div[data-node='cedit']").focusin(function () {
        $(this).addClass("focus");
    });

    //2.当输入框不为空的时候使发表按钮可以提交，否则是灰白色
    $(".ctextarea textarea").keyup(function () {

        var comment = $(this).val();
        if (comment.length > 0) {
            $(".csubmit").addClass("active");
        } else {
            $(".csubmit").removeClass("active");
        }
    });

    //3.提交评论
    $("div[ga_event='click_publish_comment']").click(function () {
        var comment = $(".ctextarea textarea").val();
        if (comment.length > 0) {
            submitComment();
        }
    });

    //4.点击添加更多
    $(".cloadmore").bind("click", function () {
        loadMore();
    });

    //动态加载该文章的评论
    loadComment();
});

function comment2comment(element) {
    $(element).parents(".citem").find(".reply").toggleClass("hidden");
}

//提交评论信息
function submitComment() {
    if( !isAuthenticated() ){
        logon();
        return;
    }

    var articleId = $("#clist").attr("data-article-id");
    var commentText = $(".ctextarea textarea").val();

    commentText = $.trim(commentText);
    if(commentText.length == 0){
        return;
    }

    $.ajax({
        url: "/article/comment/save",
        data: {
            articleId: articleId,
            commentText: commentText
        },
        type: "post",
        dataType: "json",
        success: function (data) {
            if (data.flag == "1") {
                //1.清空评论框中数据
                $(".ctextarea textarea").val("");
                //2.发表框失去焦点
                $("div[data-node='cedit']").removeClass("focus");
                //3.更改发表按钮为不可点状态
                $(".csubmit").removeClass("active");
                //4重新加载评论
                reloadComment();
            } else if (data.flag == "0") {
                alert(data.msg);
            }

        }
    })
}
//提交评论的回复信息
function submitReply(thisNode) {
    if( !isAuthenticated() ){
        logon();
        return;
    }

    var parentArticleCommentId = $(thisNode).parent().attr("parent-comment-id");
    var articleId = $("#clist").attr("data-article-id");
    var replyText = $(thisNode).parent().find(".cinput").val();

    replyText = $.trim(replyText);
    if(replyText.length == 0){
        return;
    }

    $.ajax({
        url: "/article/comment/reply",
        data: {
            articleId: articleId,
            parentArticleCommentId: parentArticleCommentId,
            replyText: replyText
        },
        type: "POST",
        dataType: "json",
        success: function (data) {
            if (data.flag == "0") {
                alert(data.msg);
            } else if (data.flag == "1") {
                reloadComment();
            }
        }
    });
}

///加载文章评论
function loadComment() {
    var page = $("#clist").attr("data-page");
    var pageSize = $("#clist").attr("data-page-size");
    var articleId = $("#clist").attr("data-article-id");
    $.ajax({
        url: "/article/comment/items",
        data: {
            page: page,
            pageSize: pageSize,
            articleId: articleId
        },
        type: "POST",
        dataType: "json",
        success: function (data) {

            if (data.flag == "0") {
                alert(data.msg);
            } else if (data.flag == "1") {

                $("#clist").attr("data-page-size", data.pageSize);
                $("#clist").attr("data-total-page", data.totalPage);
                if (data.page < data.totalPage) {
                    $("#clist").attr("data-page", page * 1 + 1);
                    $(".cloadmore").addClass("show");
                } else {
                    $(".cloadmore").removeClass("show");
                }
                $("span.ctotalnum").text(data.ctotalnum);

                if (data.liData != "true") {

                    var html = template("commentItemTemplate", data);
                    $("#clist").append(html);
                }
            }
        }
    });
}
//重新加载文章评论
function reloadComment() {
    //1.清空评论列表
    $("#clist").empty();
    //2.加载文章评论
    loadComment();
}

//点击加载更多
function loadMore() {
    var totalPage = $("#clist").attr("data-total-page");
    var page = $("#clist").attr("data-page");

    if (page < totalPage) {
        page = page * 1 + 1;
        $("#clist").attr("data-page", page);
    }
    loadComment();
}


//给评论点赞
function goodComment(thisNode) {

    var zanFlag = $(thisNode).attr("data-zan");
    if ("true" != zanFlag) {
        var commentId = $(thisNode).attr("data-comment-id");
        $.ajax({
            url: "/article/comment/good",
            data: {
                commentId: commentId
            },
            dataType: "json",
            type: "POST",
            success: function (data) {
                if (data.flag == 1) {
                    $(thisNode).text("赞 " + data.likeNum);
                    $(thisNode).attr("data-zan", "true");
                    $(thisNode).css({"color": "#ff0000"});
                } else if (data.flag == "0") {
                    alert(data.msg);
                }
            }
        })
    }
}


//点击回复按钮
function reply(thisNode) {
    var thisBodyNode = $(thisNode).parent().parent().parent();
    var cname = $(thisBodyNode).find(".cname").text();
    var ctxt = $(thisBodyNode).find(".ctxt").text();
    var newTxt = "//@" + cname + ":" + ctxt + " ";

    $("#pagelet-ncomment textarea").val(newTxt);
    $("#pagelet-ncomment textarea").focus();

}

//给文章点赞
function goodArticle(thisNode) {
    if( !isAuthenticated() ){
        logon();
        return;
    }

    var zanFlag = $(thisNode).attr("data-zan");
    if ("true" != zanFlag) {
        var commentId = $(thisNode).attr("data-comment-id");
        $.ajax({
            url: "/article/good",
            data: {
                commentId: commentId
            },
            dataType: "json",
            type: "POST",
            success: function (data) {
                if (data.flag == 1) {
                    $(thisNode).parent().find("div").text("赞 " + data.likeNum);
                    $(thisNode).attr("data-zan", "true");
                    $(thisNode).parent().find("div").addClass("art-zan-ok");
                } else if (data.flag == "0") {
                    alert(data.msg);
                }

            }
        });
    }
}
