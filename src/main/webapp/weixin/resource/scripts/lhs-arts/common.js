/**
 * Created by mushan on 2016-01-23.
 */

/**
 * 返回内容面板在窗口中填满的高度
 * @returns {number}
 */
function getPanelContentFillHeight(){
    var offsetTopFooter = $(".inner-footer").offset().top;
    var offsetTopImagePanel = $("#panel-content").offset().top;

    return offsetTopFooter - offsetTopImagePanel;
}

function getPanelContentFillWidth(){
    return $("#panel-content").width();
}

function getFooterTop(){
    var offsetTopFooter = $(".inner-footer").offset().top;

    return offsetTopFooter;
}