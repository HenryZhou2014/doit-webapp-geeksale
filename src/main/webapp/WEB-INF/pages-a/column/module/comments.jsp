<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>

<div id="pagelet-ncomment">
    <div class="cheader clearfix">
        <a name="comments"></a>
        <div class="dtag"><a name="comments">评论</a></div>
        <div class="ctotal pull-right"><span class="ctotalnum" data-node="ctotalnum">0</span><i class="fa fa-commenting-o fa-2x"></i></div>
    </div>

    <div class="ceditzone clearfix">
        <div class="cavatar" data-node="cavatar"></div>
        <div class="cbody cedit" data-node="cedit">
            <div class="ctextarea" ga_event="click_input_comment">
                <textarea class="cinput" data-node="cinput" placeholder="写下你的评论..."></textarea>
            </div>
            <div class="caction">
                <div class="csubmit" data-node="csubmit" ga_event="click_publish_comment">发表</div>
            </div>
        </div>
    </div>

    <ul id="clist" class="clist" data-node="listBox"
        data-article-id="${itemId}"
        data-page=""
        data-page-size=""
        data-total-page="">

    </ul>
    <a class="cloadmore show" data-node="cloadmore" href="javascript:;" ga_event="click_loadmore_comment">点击加载更多</a>
</div>

<div id="testTemplate">

</div>

<script id="commentItemTemplate" type="text/html">

    {{each liData as dataItem i}}

    <li class="citem">
        <div class="row">
            <div class="col-lg-1">
                <div class="cavatar">
                    <a>
                        <img src='{{dataItem.profileImage}}' class="img-responsive" style="max-width: 80px;"/>
                    </a>
                </div>
            </div>
            <div class="col-lg-11">
                <div class="cuser">
                    <div class="cname">
                        <a href="#">{{dataItem.userName}}</a>
                    </div>
                </div>
                <div class="cbody">
                    {{dataItem.commentText}}
                </div>
                <div class="cinfo margin-top-10">
                    <div class="ctime">
                        {{dataItem.commentDate}}
                    </div>
                    <div class="c-actions">
                        <a class="cdigg" href="javascript:void(0);" onclick="goodComment(this);" data-comment-id="{{dataItem.commentId}}" data-zan="false">赞 {{dataItem.likeNum}}</a>
                        <a class="creply" href="javascript:void(0);" onclick="comment2comment(this);">回复 </a>
                    </div>
                </div>
                <div class="clearfix"></div>
                {{if dataItem.parentFlag == '1'}}
                <div>
                    <div class="parent margin-top-10" parent-comment-id="{{dataItem.commentId}}">
                        <div class="content">
                            <div>
                                <span class="comment-user">
                                    {{dataItem.parentUserName}}
                                </span>
                                <span class="comment-date">
                                    {{dataItem.parentCommentDate}}
                                </span>
                            </div>
                            <div class='text'>
                                {{dataItem.parentCommentText}}
                            </div>
                        </div>
                    </div>
                </div>
                {{/if}}
                <div class="reply hidden" parent-comment-id={{dataItem.commentId}}>
                    <textarea class="cinput" data-node="cinput" placeholder="写下你的评论..."></textarea>
                    <a class="btn btn-xs btn-success submit-reply" href="javascript:void(0);"
                       onclick="submitReply(this);">回复</a>
                </div>
            </div>
        </div>
    </li>

    {{/each}}
</script>


