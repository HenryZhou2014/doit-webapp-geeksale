$(document).ready(function () {
    $(".sns_share_tx").each(function (index, element) {
        var p = {
            url: $(element).attr("data-url"), /*获取URL，可加上来自分享到QQ标识，方便统计*/
            desc: '来看看我推荐的文章', /*分享理由(风格应模拟用户对话),支持多分享语随机展现（使用|分隔）*/
            title: $(element).attr("data-title"), /*分享标题(可选)*/
            summary: $(element).attr("data-summary"), /*分享摘要(可选)*/
            pics: $(element).attr("data-pics"), /*分享图片(可选)*/
            flash: $(element).attr("data-flash"), /*视频地址(可选)*/
            site: '<a href="http://www.cmxgc.com">传媒新观察</a>', /*分享来源(可选) 如：QQ分享*/
            style: '102',
            width: 63,
            height: 24
        };

        var s = [];
        for (var i in p) {
            s.push(i + '=' + encodeURIComponent(p[i] || ''));
        }
        var url = ['http://connect.qq.com/widget/shareqq/index.html?', s.join('&')].join('');
        $(element).attr("href", url);
    });

    // QQ空间分享
    $(".sns_share_zone").each(function (index, element) {
        var p = {
            url: $(element).attr("data-url"), /*获取URL，可加上来自分享到QQ标识，方便统计*/
            showcount: '1', /*是否显示分享总数,显示：'1'，不显示：'0' */
            desc: '来看看我推荐的文章', /*分享理由(风格应模拟用户对话),支持多分享语随机展现（使用|分隔）*/
            title: $(element).attr("data-title"), /*分享标题(可选)*/
            summary: $(element).attr("data-summary"), /*分享摘要(可选)*/
            pics: $(element).attr("data-pics"), /*分享图片(可选)*/
            flash: $(element).attr("data-flash"), /*视频地址(可选)*/
            site: '<a href="http://www.cmxgc.com">传媒新观察</a>', /*分享来源(可选) 如：QQ分享*/
            style: '102',
            width: 63,
            height: 24
        };

        var s = [];
        for (var i in p) {
            s.push(i + '=' + encodeURIComponent(p[i] || ''));
        }
        var url = ['http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?', s.join('&')].join('');
        $(element).attr("href", url);
    });

});