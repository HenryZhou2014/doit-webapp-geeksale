<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>新闻</title>
    <meta name="heading" content="新闻栏目"/>
    <meta name="column-name" content="news"/>

    <style type="text/css">
        a {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
            text-decoration: none;
            color: #337ab7;
        }

        ul {
            display: block;
            list-style-type: disc;
            -webkit-margin-before: 1em;
            -webkit-margin-after: 1em;
            -webkit-margin-start: 0px;
            -webkit-margin-end: 0px;
            -webkit-padding-start: 40px;
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
            list-style: none;
        }

        li {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
            text-align: -webkit-match-parent;
        }

        div {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
            display: block;
        }

        .tp-caption, .tp-caption.small_light_white {
            font-family: "Microsoft Yahei", "微软雅黑", "宋体", "新宋体", "黑体", STHeiti;
        }

        .menu-stickup {
            margin-top: 40px;
            position: relative;
            z-index: 15;
            width: 165px;
        }

        .article-item-panel {

        }

        .article-image {

        }

        .article-image img {

        }

        .artile-author-items {
            font-size: 12px;
        }

        .article-toolbar-items {
            font-size: 12px;
            margin-bottom: 10px;
            margin-top: 10px;
        }

        .article-toolbar-items a {
            color: darkgrey;
        }

        .article-toolbar-items a:hover {
            color: #666;
        }

        .article-title {

        }

        .article-title h2 {
            margin: 0;
            font-size: 24px;
            font-weight: 800;
        }

        .article-abstract {

        }

        .article-content {
            font-size: 16px;
            padding: 30px 50px;
        }

        .article-content p {
            font-size: 16px;
        }

        div.divider {
            margin: 0;
        }

        ul.navigator-bar {
            margin-bottom: 0;
        }

        ul.article-info {
            margin-bottom: 0;
        }

        #pagelet-relatednews {
            margin-bottom: 30px;
        }

        #pagelet-relatednews .dtag {
            margin-bottom: 4px;
        }

        /*,/////////////////////////////////////////////////////////*/
        .dtag {
            position: relative;
            font-size: 18px;
            line-height: 1;
            font-weight: 700;
            color: #222;
            padding-left: 14px;
            margin-bottom: 20px;
        }

        .dtag:before {
            content: '';
            position: absolute;
            width: 4px;
            height: 18px;
            left: 0;
            top: 50%;
            margin-top: -9px;
            background: #ed4040;
            border-radius: 5px;
        }

        /*//////////////////////////////////////////////////////////////////////////*/
        .news div {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
        }

        .news {
            list-style: none;
            margin: 0;
            padding: 0;
            border: 0;
        }

        .news li {
            margin: 0;
            padding: 0;
            border: 0;
            list-style-type: none;
        }

        .news a {
            margin-top: 16px;
            font-size: 14px;
            overflow: hidden;
            color: #444;
            line-height: 1.5em;
            display: block;
            cursor: pointer;
        }

        .news a {
            color: #4f5157;
            text-decoration: none;
        }

        .news .news-no {
            display: inline-block;
            font-size: 16px;
            font-weight: 700;
            color: #222;
            margin-right: 6px;
            float: left;
        }

        .news .news-title {
            max-height: 60px;
            margin-left: 20px;
            font-size: 14px;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 3;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        #pagelet-ncomment {
            margin-bottom: 40px;
            position: relative;
        }

        #pagelet-ncomment .cheader {
            margin-bottom: 30px;
        }

        .clearfix {
            display: block;
        }

        #pagelet-ncomment .cheader .dtag {
            float: left;
            margin-bottom: 0;
        }

        .dtag {
            position: relative;
            font-size: 18px;
            line-height: 1;
            font-weight: 700;
            color: #222;
            padding-left: 14px;
            margin-bottom: 20px;
        }

        .dtag:before {
            content: '';
            position: absolute;
            width: 4px;
            height: 18px;
            left: 0;
            top: 50%;
            margin-top: -9px;
            background: #ed4040;
            border-radius: 5px;
        }

        #pagelet-ncomment .cheader .ctotal {
            float: right;
            color: #222;
            font-size: 16px;
            height: 18px;
            line-height: 1;
        }

        #pagelet-ncomment .cheader .ctotal .ctotalnum {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;

            position: relative;
            display: inline-block;
            font-size: 22px;
            padding-left: 26px;
        }

        #pagelet-ncomment .cheader .ctotal .ctotalnum:before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            width: 16px;
            height: 16px;
            margin-top: -8px;
            background: url(//s3a.pstatp.com/toutiao/resource/toutiao_web/static/style/image/newindex/comments1_article_211b36e.png?__sprite) no-repeat center;
        }

        .clearfix:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }

        #pagelet-ncomment .ceditzone {
            margin-bottom: 30px;
        }

        #pagelet-ncomment .ceditzone .cavatar {
            margin-top: 3px;
        }

        #pagelet-ncomment .cavatar {
            position: relative;
            float: left;
            width: 38px;
            height: 38px;
            border: 1px solid #E8E8E8;
            border-radius: 50%;
            overflow: hidden;
            background: url(//s3.pstatp.com/toutiao/resource/toutiao_web/static/style/image/newindex/default40_c78f50e.png?__sprite) no-repeat center;
        }

        #pagelet-ncomment .ceditzone .cedit {
            position: relative;
            font-size: 16px;
            color: #bababa;
            border: 1px solid #ddd;
        }

        #pagelet-ncomment .cbody {
            margin-left: 54px;
            font-size: 14px;
        }

        #pagelet-ncomment .ceditzone .cedit .ctextarea {
            padding: 12px 16px 0;
        }

        #pagelet-ncomment .ceditzone .cedit.focus .ctextarea .cinput {
            height: 150px;
        }

        #pagelet-ncomment .ceditzone .cedit .ctextarea .cinput {
            display: block;
            font-size: 16px;
            width: 100%;
            height: 32px;
            resize: none;
            border: 0;
            outline: 0;
            padding: 0;
            -webikt-transition: .1s height linear;
            -webkit-transition: .1s height linear;
            transition: .1s height linear;
        }

        input, textarea, keygen, select, button, meter, progress {
            -webkit-writing-mode: horizontal-tb;
        }

        input, textarea, keygen, select, button {
            text-rendering: auto;
            color: initial;
            letter-spacing: normal;
            word-spacing: normal;
            text-transform: none;
            text-indent: 0px;
            text-shadow: none;
            display: inline-block;
            text-align: start;
            margin: 0em 0em 0em 0em;
            font: 13.3333px Arial;
        }

        textarea {
            -webkit-appearance: textarea;
            background-color: white;
            border-image-source: initial;
            border-image-slice: initial;
            border-image-width: initial;
            border-image-outset: initial;
            border-image-repeat: initial;
            -webkit-rtl-ordering: logical;
            -webkit-user-select: text;
            flex-direction: column;
            /*resize: auto;*/
            cursor: auto;
            white-space: pre-wrap;
            word-wrap: break-word;
            border-width: 1px;
            border-style: solid;
            border-color: initial;
            padding: 2px;
        }

        textarea {
            font-family: monospace;
            border-color: rgb(169, 169, 169);
        }

        #pagelet-ncomment .ceditzone .cedit .ctextarea .cinput {
            display: block;
            font-size: 16px;
            width: 100%;
            height: 32px;
            resize: none;
            border: 0;
            outline: 0;
            padding: 0;
            -webikt-transition: .1s height linear;
            -webkit-transition: .1s height linear;
            transition: .1s height linear;
        }

        #pagelet-ncomment .ceditzone .cedit.focus .ctextarea .cinput {
            height: 150px;
        }

        #pagelet-ncomment .ceditzone .cedit .caction {
            position: absolute;
            top: 0;
            right: 0;
            padding: 0;
            border: 0;
            height: 44px;
        }

        #pagelet-ncomment .ceditzone .cedit.focus .caction {
            position: relative;
            height: 48px;
            background-color: #f4f5f6;
            border-top: 1px solid #efefef;
            padding-left: 16px;
        }

        #pagelet-ncomment .ceditzone .cedit .caction .cshare {
            display: none;
            height: 100%;
        }

        #pagelet-ncomment .ceditzone .cedit.focus .caction .cshare {
            display: inline-block;
        }

        .snsbox {
            height: 30px;
            font-size: 0;
            text-align: right;
        }

        #pagelet-ncomment .ceditzone .cedit .caction .cshare .snsbox {
            height: 100%;
            color: #9e9e9e;
        }

        .snsbox:before {
            content: '';
            width: 0;
            height: 100%;
            vertical-align: middle;
            display: inline-block;
        }

        .snsbox .snsbox-inner {
            display: inline-block;
            vertical-align: middle;
            font-size: 16px;
            line-height: 30px;
        }

        span {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
        }

        .snsbox .snsbox-inner .snszone {
            float: right;
        }

        .snsbox .snsbox-inner .snszone .sns-btn.sns-weibo.gray {
            background: url(//s3.pstatp.com/toutiao/resource/toutiao_web/static/style/image/newindex/weibo_allshare_unselected_920287a.png?__sprite) no-repeat center;
        }

        .snsbox .snsbox-inner .snszone .sns-btn {
            float: left;
            display: inline-block;
            height: 30px;
            width: 30px;
            margin-left: 10px;
            cursor: pointer;
        }

        .snsbox .snsbox-inner .snszone .sns-btn:first-child {
            margin-left: 5px;
        }

        .snsbox .snsbox-inner .snszone .sns-btn.sns-tqq.gray {
            background: url(//s3a.pstatp.com/toutiao/resource/toutiao_web/static/style/image/newindex/tencent_allshare_unselected_16050b3.png?__sprite) no-repeat center;
        }

        .snsbox .snsbox-inner .snszone .sns-btn {
            float: left;
            display: inline-block;
            height: 30px;
            width: 30px;
            margin-left: 10px;
            cursor: pointer;
        }

        #pagelet-ncomment .ceditzone .cedit .caction .csubmit {
            line-height: 44px;
            background-color: #e8e8e8;
            float: right;
            width: 110px;
            height: 100%;
            color: #fff;
            text-align: center;
            cursor: pointer;
        }

        #pagelet-ncomment .ceditzone .cedit.focus .caction .csubmit {
            line-height: 48px;
        }

        #pagelet-ncomment .ceditzone .cedit.focus .caction .csubmit.active {
            background-color: #7091ce;
            box-shadow: inset 0 1px 0 0 rgba(239, 239, 238, .004);
        }

        .clearfix:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }

        #pagelet-ncomment .cloadmore.show {
            display: block;
        }

        #pagelet-ncomment .cloadmore {
            display: none;
            width: 190px;
            height: 30px;
            line-height: 30px;
            margin: 30px auto;
            font-size: 14px;
            text-align: center;
            color: #fff;
            background: #d8d8d8;
            border-radius: 4px;
        }

        #pagelet-ncomment .clist .citem {
            margin-bottom: 30px;
        }

        #pagelet-ncomment .cavatar {
            position: relative;
            float: left;
            width: 38px;
            height: 38px;
            border: 1px solid #E8E8E8;
            border-radius: 50%;
            overflow: hidden;
            background: url(//s3.pstatp.com/toutiao/resource/toutiao_web/static/style/image/newindex/default40_c78f50e.png?__sprite) no-repeat center;
        }

        .detail-wrapper a {
            color: #406599;
        }

        #pagelet-ncomment .cavatar img {
            border-radius: 100%;
            opacity: 0;
            width: 100%;
            height: 100%;
            -webkit-transition: .3s opacity ease-in-out;
            transition: .3s opacity ease-in-out;
        }

        #pagelet-ncomment .cbody {
            margin-left: 54px;
            font-size: 14px;
        }

        #pagelet-ncomment .clist .citem .cuser {
            margin-bottom: 8px;
        }

        #pagelet-ncomment .clist .citem .ctxt {
            font-size: 16px;
            line-height: 22px;
            color: #444;
            margin-bottom: 16px;
        }

        #pagelet-ncomment .clist .citem .cinfo {
            color: #999;
            line-height: 1;
        }

        #pagelet-ncomment .clist .citem .cinfo .ctime {
            float: left;
        }

        #pagelet-ncomment .clist .citem .cinfo .c-actions {
            float: right;
        }

        #pagelet-ncomment .clist .citem .cinfo .c-actions .cdigg {
            position: relative;
            top: -1px;
            color: #999;
        }

        #pagelet-ncomment .clist .citem .cinfo .c-actions .cbtn {
            display: inline-block;
            width: 14px;
            height: 14px;
        }

        #pagelet-ncomment .clist .citem .cinfo .c-actions .cdigg .cbtn {
            margin-left: 5px;
            background: url(//s3b.pstatp.com/toutiao/resource/toutiao_web/static/style/image/newindex/digg_article_normal_027a629.png?__sprite) no-repeat center;
        }

        #pagelet-ncomment .clist .citem .cinfo .c-actions .cdigg .zan-ok {
            background: url(//s3.pstatp.com/toutiao/resource/toutiao_web/static/style/image/newindex/digg_article_pressed_bc7a7e2.png?__sprite) no-repeat center;
        }

        #pagelet-ncomment .clist .citem .cinfo .c-actions .creply {
            margin: 0 26px;
        }

        #pagelet-ncomment .clist .citem .cinfo .c-actions .creply .cbtn {
            background: url(//s3a.pstatp.com/toutiao/resource/toutiao_web/static/style/image/newindex/comments2_article_normal_8125285.png?__sprite) no-repeat center;
        }

        #pagelet-ncomment .clist .citem .cinfo .c-actions .creport .cbtn {
            background: url(//s3b.pstatp.com/toutiao/resource/toutiao_web/static/style/image/newindex/article_ic_report_normal_3073fd1.png?__sprite) no-repeat center;
        }


    </style>
</head>

<!-- REVOLUTION SLIDER -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="margin-top-30">
                <ul class="list-unstyled list-inline navigator-bar">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="#">首页</a>
                    </li>
                    <li>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li>
                        <a href="#">新闻</a>
                    </li>
                    <li>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li>
                        <a href="#">校园</a>
                    </li>
                </ul>

                <div class="divider"><!-- divider --></div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <img class="img-responsive" src="${ctx}/a/resource/images/demo/96f9dac30edd4393821b7f538080f219.jpg"/>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="article-title margin-top-20">
                <h2>${article.title}</h2>
            </div>
            <div class="margin-top-20">
                <ul class="list-unstyled list-inline article-info">
                    <li>
                        <fmt:formatDate value="${article.lastEditDate}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
                    </li>
                    <li>
                        <a href="javascript:void(0);">
                            <img src="${ctx}/a/resource/images/sns/share/weibo.png"/>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);">
                            <img src="${ctx}/a/resource/images/sns/share/weixin.png"/>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);">
                            <img src="${ctx}/a/resource/images/sns/share/qq.png"/>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="divider double-line"><!-- divider --></div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="article-content">
                <jsp:include page="/app/cms/article/${article.id}"/>
            </div>
            <div id="pagelet-ncomment">
                <div class="cheader clearfix">
                    <div class="dtag">文章评论</div>
                    <div class="ctotal">
                        <span class="ctotalnum" data-node="ctotalnum">
                          3992
                        </span>条
                    </div>
                </div>
                <div class="ceditzone clearfix">
                    <div class="cavatar" data-node="cavatar"></div>
                    <div class="cbody cedit" data-node="cedit">
                        <div class="ctextarea" ga_event="click_input_comment">
                            <textarea class="cinput" data-node="cinput" placeholder="写下你的评论..."></textarea>
                        </div>
                        <div class="caction">
                            <div class="cshare">
                                <div class="snsbox">
                                    <div class="snsbox-inner"><span>分享到：</span>
                                        <div class="snszone" data-node="snszone">
                                            <i class="sns-btn sns-weibo gray" ga_event="click_share_comment"
                                               ga_label="" data-node="sina_weibo" title="分享到新浪微博"></i>
                                            <i class="sns-btn sns-tqq gray" ga_event="click_share_comment" ga_label=""
                                               data-node="qq_weibo" title="分享到腾讯微博"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="csubmit" data-node="csubmit" ga_event="click_publish_comment">发表</div>
                        </div>
                    </div>
                </div>

                <ul id="clist" class="clist" data-node="listBox">
                    <li class="citem clearfix">
                        <div class="cavatar">
                            <a href="/user/6078770608/" target="_blank" rel="nofollow">
                                <img src="http://q.qlogo.cn/qqapp/100290348/B00D1AFD52126ECF6BBAD9BEE95FFE35/40"
                                     onload="this.style.opacity=1;" style="opacity: 1;"></a></div>
                        <div class="cbody">
                            <div class="cuser">
                                <a class="cname" href="/user/6078770608/" target="_blank" rel="nofollow">用户78244059</a>
                            </div>
                            <div class="ctxt">流氓警察也确实存在</div>
                            <div class="cinfo clearfix">
                                <span class="ctime">06-22 07:39</span>
                                <div class="c-actions">
                                    <a class="cdigg " href="javascript:;" data-node="cdigg" data-comment-id="6776721400"
                                       ga_event="click_good_comment">
                                        <span class="digg-num">10063</span>
                                        <i class="cbtn" data-zan="true"></i>
                                    </a>
                                    <a class="creply" href="javascript:;" data-node="creply"
                                       ga_event="click_reply_comment">
                                        <i class="cbtn"></i>
                                    </a>
                                    <%--<a class="creport" href="javascript:;" data-node="creport" data-userid="6078770608"--%>
                                       <%--data-commentid="6776721400" ga_event="click_report_comment">--%>
                                        <%--<i class="cbtn"></i>--%>
                                    <%--</a>--%>
                                </div>
                            </div>
                        </div>
                    </li>


                    <li class="citem clearfix">
                        <div class="cavatar"><a href="/user/5377424867/" target="_blank" rel="nofollow"><img
                                src="http://p1.pstatp.com/thumb/6cb0029e5f1406db6aa" onload="this.style.opacity=1;"
                                style="opacity: 1;"></a></div>
                        <div class="cbody">
                            <div class="cuser"><a class="cname" href="/user/5377424867/" target="_blank" rel="nofollow">北向26度</a>
                            </div>
                            <div class="ctxt">老包金超群 少包周杰 至今没有第三个人适合。。。</div>
                            <div class="cinfo clearfix"><span class="ctime">06-22 02:20</span>
                                <div class="c-actions"><a class="cdigg " href="javascript:;" data-node="cdigg"
                                                          data-commentid="6775471876"
                                                          ga_event="click_good_comment"><span
                                        class="digg-num">1324</span><i class="cbtn"></i></a><a class="creply"
                                                                                               href="javascript:;"
                                                                                               data-node="creply"
                                                                                               ga_event="click_reply_comment"><i
                                        class="cbtn"></i></a><a class="creport" href="javascript:;" data-node="creport"
                                                                data-userid="5377424867" data-commentid="6775471876"
                                                                ga_event="click_report_comment"><i class="cbtn"></i></a>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="citem clearfix">
                        <div class="cavatar"><a href="/user/5983890073/" target="_blank" rel="nofollow"><img
                                src="http://p1.pstatp.com/thumb/411001a17b967fba3dd" onload="this.style.opacity=1;"
                                style="opacity: 1;"></a></div>
                        <div class="cbody">
                            <div class="cuser"><a class="cname" href="/user/5983890073/" target="_blank" rel="nofollow">二院副院长</a>
                            </div>
                            <div class="ctxt">心目中的话，周杰的包拯第一，因为演出了少年那种感觉！！不喜轻喷</div>
                            <div class="cinfo clearfix"><span class="ctime">06-22 02:16</span>
                                <div class="c-actions"><a class="cdigg " href="javascript:;" data-node="cdigg"
                                                          data-commentid="6775477046"
                                                          ga_event="click_good_comment"><span
                                        class="digg-num">1102</span><i class="cbtn"></i></a><a class="creply"
                                                                                               href="javascript:;"
                                                                                               data-node="creply"
                                                                                               ga_event="click_reply_comment"><i
                                        class="cbtn"></i></a><a class="creport" href="javascript:;" data-node="creport"
                                                                data-userid="5983890073" data-commentid="6775477046"
                                                                ga_event="click_report_comment"><i class="cbtn"></i></a>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="citem clearfix">
                        <div class="cavatar"><a href="/user/3083561364/" target="_blank" rel="nofollow"><img
                                src="http://p3.pstatp.com/thumb/9609/8136168649" onload="this.style.opacity=1;"
                                style="opacity: 1;"></a></div>
                        <div class="cbody">
                            <div class="cuser"><a class="cname" href="/user/3083561364/" target="_blank" rel="nofollow">qzuser5660111</a>
                            </div>
                            <div class="ctxt">最爱周杰版的包拯，就是背景音乐瘆得慌。</div>
                            <div class="cinfo clearfix"><span class="ctime">06-22 02:24</span>
                                <div class="c-actions"><a class="cdigg " href="javascript:;" data-node="cdigg"
                                                          data-commentid="6775473027"
                                                          ga_event="click_good_comment"><span
                                        class="digg-num">770</span><i class="cbtn"></i></a><a class="creply"
                                                                                              href="javascript:;"
                                                                                              data-node="creply"
                                                                                              ga_event="click_reply_comment"><i
                                        class="cbtn"></i></a><a class="creport" href="javascript:;" data-node="creport"
                                                                data-userid="3083561364" data-commentid="6775473027"
                                                                ga_event="click_report_comment"><i class="cbtn"></i></a>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="citem clearfix">
                        <div class="cavatar"><a href="/user/3390219593/" target="_blank" rel="nofollow"><img
                                src="http://p3.pstatp.com/thumb/12091/3590535746" onload="this.style.opacity=1;"
                                style="opacity: 1;"></a></div>
                        <div class="cbody">
                            <div class="cuser"><a class="cname" href="/user/3390219593/" target="_blank" rel="nofollow">人在做天在看13825382</a>
                            </div>
                            <div class="ctxt">除了周杰和金超群演的可以（还有陆毅也行）其余的我看是只要化下装就演去了</div>
                            <div class="cinfo clearfix"><span class="ctime">06-22 05:03</span>
                                <div class="c-actions"><a class="cdigg " href="javascript:;" data-node="cdigg"
                                                          data-commentid="6775795065"
                                                          ga_event="click_good_comment"><span
                                        class="digg-num">728</span><i class="cbtn"></i></a><a class="creply"
                                                                                              href="javascript:;"
                                                                                              data-node="creply"
                                                                                              ga_event="click_reply_comment"><i
                                        class="cbtn"></i></a><a class="creport" href="javascript:;" data-node="creport"
                                                                data-userid="3390219593" data-commentid="6775795065"
                                                                ga_event="click_report_comment"><i class="cbtn"></i></a>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="citem clearfix">
                        <div class="cavatar"><a href="/user/6116947184/" target="_blank" rel="nofollow"><img
                                src="http://q.qlogo.cn/qqapp/100290348/E66CCF3E997AB21C9148175274140010/40"
                                onload="this.style.opacity=1;" style="opacity: 1;"></a></div>
                        <div class="cbody">
                            <div class="cuser"><a class="cname" href="/user/6116947184/" target="_blank" rel="nofollow">巴依老爷铁磊</a>
                            </div>
                            <div class="ctxt">不是谁把脸涂黑额头上顶个月亮就可以装包拯的，这一点不得不夸一下包尔康</div>
                            <div class="cinfo clearfix"><span class="ctime">06-22 02:15</span>
                                <div class="c-actions"><a class="cdigg " href="javascript:;" data-node="cdigg"
                                                          data-commentid="6775466726"
                                                          ga_event="click_good_comment"><span
                                        class="digg-num">642</span><i class="cbtn"></i></a><a class="creply"
                                                                                              href="javascript:;"
                                                                                              data-node="creply"
                                                                                              ga_event="click_reply_comment"><i
                                        class="cbtn"></i></a><a class="creport" href="javascript:;" data-node="creport"
                                                                data-userid="6116947184" data-commentid="6775466726"
                                                                ga_event="click_report_comment"><i class="cbtn"></i></a>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="citem clearfix">
                        <div class="cavatar"><a href="/user/3733527189/" target="_blank" rel="nofollow"><img
                                src="http://wx.qlogo.cn/mmopen/icKzKKPjXkmnhPFicWrL4fYMrTZMdXH2IPFOOckicmvXg1ZXP0cv4TazWDajAIrTNDgNPNx3U8N4pDnwCMGHdGPJg6UEbucPicz8/46"
                                onload="this.style.opacity=1;" style="opacity: 1;"></a></div>
                        <div class="cbody">
                            <div class="cuser"><a class="cname" href="/user/3733527189/" target="_blank" rel="nofollow">竹林24902676</a>
                            </div>
                            <div class="ctxt">周杰任泉李冰冰加上释小龙再演我肯定还捧场</div>
                            <div class="cinfo clearfix"><span class="ctime">06-22 02:49</span>
                                <div class="c-actions"><a class="cdigg " href="javascript:;" data-node="cdigg"
                                                          data-commentid="6775515682"
                                                          ga_event="click_good_comment"><span
                                        class="digg-num">478</span><i class="cbtn"></i></a><a class="creply"
                                                                                              href="javascript:;"
                                                                                              data-node="creply"
                                                                                              ga_event="click_reply_comment"><i
                                        class="cbtn"></i></a><a class="creport" href="javascript:;" data-node="creport"
                                                                data-userid="3733527189" data-commentid="6775515682"
                                                                ga_event="click_report_comment"><i class="cbtn"></i></a>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="citem clearfix">
                        <div class="cavatar"><a href="/user/6648285211/" target="_blank" rel="nofollow"><img
                                src="http://wx.qlogo.cn/mmopen/1gvL9ficRs1FU3LiaddfAwLuib6nPUIyW9qibfNicrN2F9pKrPq4hpTmT15K44QtQlzPZHlTsEIloYB11sib9XliaOtVg/46"
                                onload="this.style.opacity=1;" style="opacity: 1;"></a></div>
                        <div class="cbody">
                            <div class="cuser"><a class="cname" href="/user/6648285211/" target="_blank" rel="nofollow">李涛101975766</a>
                            </div>
                            <div class="ctxt">有了周杰那个经典的少年包青天，后人再拍估计也难以超越！就像西游记一样，再怎么翻拍也不会像经典那样深入人心了</div>
                            <div class="cinfo clearfix"><span class="ctime">06-22 03:06</span>
                                <div class="c-actions"><a class="cdigg " href="javascript:;" data-node="cdigg"
                                                          data-commentid="6775530054"
                                                          ga_event="click_good_comment"><span
                                        class="digg-num">362</span><i class="cbtn"></i></a><a class="creply"
                                                                                              href="javascript:;"
                                                                                              data-node="creply"
                                                                                              ga_event="click_reply_comment"><i
                                        class="cbtn"></i></a><a class="creport" href="javascript:;" data-node="creport"
                                                                data-userid="6648285211" data-commentid="6775530054"
                                                                ga_event="click_report_comment"><i class="cbtn"></i></a>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="citem clearfix">
                        <div class="cavatar"><a href="/user/5547693170/" target="_blank" rel="nofollow"><img
                                src="http://p1.pstatp.com/thumb/411001a9ee545fd126e" onload="this.style.opacity=1;"
                                style="opacity: 1;"></a></div>
                        <div class="cbody">
                            <div class="cuser"><a class="cname" href="/user/5547693170/" target="_blank" rel="nofollow">拉布拉卡59456042</a>
                            </div>
                            <div class="ctxt">除却人品不说，周杰不光表情包厉害，演技是一流的</div>
                            <div class="cinfo clearfix"><span class="ctime">06-22 06:44</span>
                                <div class="c-actions"><a class="cdigg " href="javascript:;" data-node="cdigg"
                                                          data-commentid="6775824781"
                                                          ga_event="click_good_comment"><span
                                        class="digg-num">327</span><i class="cbtn"></i></a><a class="creply"
                                                                                              href="javascript:;"
                                                                                              data-node="creply"
                                                                                              ga_event="click_reply_comment"><i
                                        class="cbtn"></i></a><a class="creport" href="javascript:;" data-node="creport"
                                                                data-userid="5547693170" data-commentid="6775824781"
                                                                ga_event="click_report_comment"><i class="cbtn"></i></a>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="citem clearfix">
                        <div class="cavatar"><a href="/user/6022952810/" target="_blank" rel="nofollow"><img
                                src="http://q.qlogo.cn/qqapp/100290348/19B5F68486B68EB66425C8EF65AF76F8/40"
                                onload="this.style.opacity=1;" style="opacity: 1;"></a></div>
                        <div class="cbody">
                            <div class="cuser"><a class="cname" href="/user/6022952810/" target="_blank" rel="nofollow">微凉76285933</a>
                            </div>
                            <div class="ctxt">尔康演的包黑炭，剧情完全就是恐怖片，小时候看能吓死</div>
                            <div class="cinfo clearfix"><span class="ctime">06-22 03:46</span>
                                <div class="c-actions"><a class="cdigg " href="javascript:;" data-node="cdigg"
                                                          data-commentid="6775674215"
                                                          ga_event="click_good_comment"><span
                                        class="digg-num">275</span><i class="cbtn"></i></a><a class="creply"
                                                                                              href="javascript:;"
                                                                                              data-node="creply"
                                                                                              ga_event="click_reply_comment"><i
                                        class="cbtn"></i></a><a class="creport" href="javascript:;" data-node="creport"
                                                                data-userid="6022952810" data-commentid="6775674215"
                                                                ga_event="click_report_comment"><i class="cbtn"></i></a>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="citem clearfix">
                        <div class="cavatar"><a href="/user/3227255414/" target="_blank" rel="nofollow"><img
                                src="http://p3.pstatp.com/thumb/720/139935326" onload="this.style.opacity=1;"
                                style="opacity: 1;"></a></div>
                        <div class="cbody">
                            <div class="cuser"><a class="cname" href="/user/3227255414/" target="_blank" rel="nofollow">真想安静的离开</a>
                            </div>
                            <div class="ctxt">我给大家个建议 翻拍应该找古天乐 非古天乐莫属 不然天理不容，，，</div>
                            <div class="cinfo clearfix"><span class="ctime">06-22 03:03</span>
                                <div class="c-actions"><a class="cdigg " href="javascript:;" data-node="cdigg"
                                                          data-commentid="6775528169"
                                                          ga_event="click_good_comment"><span
                                        class="digg-num">258</span><i class="cbtn"></i></a><a class="creply"
                                                                                              href="javascript:;"
                                                                                              data-node="creply"
                                                                                              ga_event="click_reply_comment"><i
                                        class="cbtn"></i></a><a class="creport" href="javascript:;" data-node="creport"
                                                                data-userid="3227255414" data-commentid="6775528169"
                                                                ga_event="click_report_comment"><i class="cbtn"></i></a>
                                </div>
                            </div>
                        </div>
                    </li>


                    <li class="citem clearfix">
                        <div class="cavatar">
                            <a href="/user/6143898162/" target="_blank" rel="nofollow">
                                <img src="http://p0.pstatp.com/origin/3792/5112637127" onload="this.style.opacity=1;"
                                     style="opacity: 1;">
                            </a>
                        </div>
                        <div class="cbody">
                            <div class="cuser">
                                <a class="cname" href="/user/6143898162/" target="_blank" rel="nofollow">守望左右</a>
                            </div>
                            <div class="ctxt">周杰周杰，绝对的周杰……虽然形象被黑的很惨，但是演技真的没话说，表情丰富还不显得浮夸，很有少年的风采……中年以后当然是金超群了</div>
                            <div class="cinfo clearfix">
                                <span class="ctime">06-22 07:55</span>
                                <div class="c-actions">
                                    <a class="cdigg " href="javascript:;" data-node="cdigg" data-commentid="6776728494">
                                        <span class="digg-num">236</span><i class="cbtn"></i>
                                    </a>
                                    <a class="creply" href="javascript:;" data-node="creply"><i class="cbtn"></i></a>
                                    <a class="creport" href="javascript:;" data-node="creport" data-userid="6143898162"
                                       data-commentid="6776728494">
                                        <i class="cbtn"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="citem clearfix">
                        <div class="cavatar">
                            <a href="/user/5493752780/" target="_blank" rel="nofollow">
                                <img src="http://p1.pstatp.com/thumb/412000551d9f8435399" onload="this.style.opacity=1;"
                                     style="opacity: 1;">
                            </a>
                        </div>
                        <div class="cbody">
                            <div class="cuser">
                                <a class="cname" href="/user/5493752780/" target="_blank" rel="nofollow">尚未凝固的透明</a>
                            </div>
                            <div class="ctxt">周杰的包拯，任泉的公孙策</div>
                            <div class="cinfo clearfix">
                                <span class="ctime">06-22 06:48</span>
                                <div class="c-actions">
                                    <a class="cdigg " href="javascript:;" data-node="cdigg" data-commentid="6776234606">
                                        <span class="digg-num">180</span><i class="cbtn"></i>
                                    </a>
                                    <a class="creply" href="javascript:;" data-node="creply"><i class="cbtn"></i></a>
                                    <a class="creport" href="javascript:;" data-node="creport" data-userid="5493752780"
                                       data-commentid="6776234606">
                                        <i class="cbtn"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>

                <a class="cloadmore show" data-node="cloadmore" href="javascript:;" ga_event="click_loadmore_comment">点击加载更多</a>
            </div>

        </div>
        <div class="col-lg-4">
            <div>
                <div>
                    <h4 class="margin-bottom-10">记者</h4>
                    <div>${article.author}</div>
                </div>
                <div class="margin-top-30">
                    <h4 class="margin-bottom-10">摄影</h4>
                    <div>${article.author}</div>
                </div>
                <div class="margin-top-30">
                    <h4 class="margin-bottom-10">文字编辑</h4>
                    <div>${article.author}</div>
                </div>
                <div class="margin-top-30">
                    <h4 class="margin-bottom-10">排版编辑</h4>
                    <div>${article.author}</div>
                </div>
            </div>
            <hr/>


            <div id="pagelet-relatednews">
                <div class="dtag">相关阅读</div>
                <div class="content">
                    <ul data-node="news" class="news">
                        <c:forEach items="${articleList}" var="item" varStatus="status">
                            <li>
                                <a href="${ctx}/news/item-${item.id}.html" target="_blank" ga_event="click_hot_news">

                                    <i class="news-no news-no-2">${status.index + 1}</i>
                                    <div class="news-title">${item.title}</div>

                                </a>
                            </li>
                        </c:forEach>

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- /REVOLUTION SLIDER -->
</div>

<script type="text/javascript">

    //initiating jQuery
    jQuery(function ($) {
        $(document).ready(function () {

            //动态加载该文章的评论
            loadComment();
            //给评论绑定鼠标事件
            initTool();

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



        });
    });

    function initTool(){
        //4.给评论点赞
        $(".cdigg").bind("click",function () {
            goodComment(this);
        });

        //5.点击回复按钮
        $(".creply").bind("click",function () {
            reply(this);
        });
    }

    //提交评论信息
    function submitComment() {
        var articleId;
        var commentAccountId;
        var commentText;

        $.ajax({
            url: "${ctx}/article/comment/save",
            data: {
                articleId: articleId,
                commentAccountId: commentAccountId,
                commentText: commentText
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    reloadComment();
                } else if (data.flag == "0") {
                    alert(data.msg);
                }

            }
        })
    }

    ///加载文章评论
    function loadComment() {
        var articleId = "123";
        $.ajax({
            url:"${ctx}/article/comment/items",
            data:{
                articleId:articleId
            },
            type:"POST",
            dataType:"json",
            success:function(data){

                if(data.flag == "0"){
                    alert(data.msg);
                }else if(data.flag == "1"){
                    $("span.ctotalnum").text(data.ctotalnum);
                    liDataToLiNode(data.liData);
                }
            }
        });
    }

    function liDataToLiNode(liData){

        for(var i = 0;i<liData.length;i++){
            var data = liData[i];
            var $liNode = objectToLiNode(data);

            $("#clist").append($liNode);
        }
    }
    //重新加载文章评论
    function reloadComment() {


    }
    /**
     <li class="citem clearfix">
        <div class="cavatar">
            <a href="/user/5493752780/" target="_blank" rel="nofollow">
                <img src="http://p1.pstatp.com/thumb/412000551d9f8435399" onload="this.style.opacity=1;"style="opacity: 1;">
            </a>
        </div>
        <div class="cbody" data-comment-id="22">
            <div class="cuser">
                <a class="cname" href="/user/5493752780/" target="_blank" rel="nofollow">尚未凝固的透明</a>
            </div>
            <div class="ctxt">周杰的包拯，任泉的公孙策</div>
            <div class="cinfo clearfix">
                <span class="ctime">06-22 06:48</span>
                <div class="c-actions">
                    <a class="cdigg " href="javascript:;" data-node="cdigg" data-commentid="6776234606">
                        <span class="digg-num">180</span>
                        <i class="cbtn" data-zan="true></i>
                    </a>
                    <a class="creply" href="javascript:;" data-node="creply">
                        <i class="cbtn"></i>
                    </a>
                    <a class="creport" href="javascript:;" data-node="creport" data-userid="5493752780"data-commentid="6776234606">
                        <i class="cbtn"></i>
                    </a>
                </div>
            </div>
        </div>
     </li>
     */
    //将评论对象转换成 li 节点
    function objectToLiNode(lidata) {

        var liNodeHtml = "<li class='citem clearfix'>"+
                                "<div class='cavatar'>" +
                                    "<a href='/user/5493752780/' target='_blank' rel='nofollow'>" +
                                        "<img src='" + lidata['userImage'] + "' onload='this.style.opacity=1;'style='opacity: 1;'>" +
                                    "</a>" +
                                "</div>" +
                                "<div class='cbody'>" +
                                    "<div class='cuser'>" +
                                        "<a class='cname' href='/user/5493752780/' target='_blank' rel='nofollow'>" + lidata['userName'] + "</a>" +
                                    "</div>" +
                                    "<div class='ctxt'>" + lidata['commentTxt'] + "</div>" +
                                    "<div class='cinfo clearfix'>" +
                                        "<span class='ctime'>" + lidata['commentDate'] + "</span>" +
                                        "<div class='c-actions'>" +
                                            "<a class='cdigg' href='javascript:;' data-node='cdigg' data-comment-id='" + lidata['commentId'] + "'>" +
                                                "<span class='digg-num'>" + lidata['hits'] +"</span>" +
                                                "<i class='cbtn' data-zan='false'></i>" +
                                            "</a>" +
                                            "<a class='creply' href='javascript:;' data-node='creply'>" +
                                                "<i class='cbtn'></i>" +
                                            "</a>" +
                                        "</div>" +
                                    "</div>" +
                                "</div>" +
                            "</li>";

        return $(liNodeHtml);
    }
    //给评论点赞
    function goodComment(thisNode) {

        var zanFlag = $(thisNode).find(".cbtn").attr("data-zan");
        if ("true" != zanFlag) {

            alert($(thisNode).attr("data-node"));

            var commentId = $(thisNode).attr("data-comment-id");
            $.ajax({
                url: "${ctx}/article/comment/good",
                data: {
                    commentId: commentId
                },
                dataType: "json",
                type: "POST",
                success: function (data) {
                    if (data.flag == 1) {
                        $(thisNode).find("span.digg-num").text(data.hits);
                        $(thisNode).find(".cbtn").attr("data-zan", "zan-ok");
                        $(thisNode).find(".cbtn").addClass("zan-ok");
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
</script>
