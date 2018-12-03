/**
 * Created by ben on 14-10-5.
 */

var index = 0;

function addIframeContentTab(pageTitle, url){
    if ($('#contentTabManager').tabs('exists', pageTitle)){
        $('#contentTabManager').tabs('select', pageTitle);
        return;
    }

    var iframeContent = "<iframe scrolling='yes' frameborder='0'  src='" + url + "' style='width:100%;height:100%;'></iframe>";

    $('#contentTabManager').tabs('add',{
        title: pageTitle,
        content:iframeContent,
        closable:true,
//            href: url,
        tools:[{
//                iconCls:'icon-mini-refresh',
            handler:function(){

            }
        }]
    });

    index++;
}

function addNewIframeContentTab(pageTitle, url){

    var iframeContent = "<iframe scrolling='yes' frameborder='0'  src='" + url + "' style='width:100%;height:100%;'></iframe>";

    $('#contentTabManager').tabs('add',{
        title: pageTitle,
        content:iframeContent,
        closable:true,
//            href: url,
        tools:[{
//                iconCls:'icon-mini-refresh',
            handler:function(){

            }
        }]
    });

    index++;
}

function closeCurrentTab(){
    var tabManager = $('#frameworkTabManager');
    if (!tabManager){
        return;
    }

    $('#frameworkTabManager .tabs-selected .tabs-close').click();
}

function addNewFrameworkContentTab(pageTitle, url){
    $('#frameworkTabManager').tabs('add',{
        title:pageTitle,
//            content:'Tab Body ' + index,
        closable:true,
        href: url
        /*tools:[{
//                iconCls:'icon-mini-refresh',
            handler:function(){
                alert('refresh');
            }
        }]*/
    });

    index++;
}

function addFrameworkContentTab(pageTitle, url){
    if ($('#frameworkTabManager').tabs('exists', pageTitle)){
        $('#frameworkTabManager').tabs('select', pageTitle);
        return;
    }

    var iframeContent = "<iframe scrolling='yes' frameborder='0'  src='" + url + "' style='width:100%;height:100%;'></iframe>";

    $('#frameworkTabManager').tabs('add',{
        title: pageTitle,
        content:iframeContent,
        closable:true
//            href: url,
        /*tools:[{
//                iconCls:'icon-mini-refresh',
            handler:function(){

            }
        }]*/
    });

    index++;
}

function removeFrameworkContentTab(pageTitle, url){
    if ($('#frameworkTabManager').tabs('exists', pageTitle)){
        $('#frameworkTabManager').tabs('close', pageTitle);
        return;
    }
    index--;
}

function addNewFrameworkContentTab(pageTitle, url){

    var iframeContent = "<iframe scrolling='yes' frameborder='0'  src='" + url + "' style='width:100%;height:100%;'></iframe>";

    $('#frameworkTabManager').tabs('add',{
        title: pageTitle,
        content:iframeContent,
        closable:true
//            href: url,
        /*tools:[{
//                iconCls:'icon-mini-refresh',
            handler:function(){

            }
        }]*/
    });

    index++;
}

function closeFrameworkCurrentTab(){
    var tabManager = window.parent.$('#frameworkTabManager');
    if (!tabManager){
        return;
    }

    window.parent.$('#frameworkTabManager .tabs-selected .tabs-close').click();
}

function addContentTab(pageTitle, url){
    var opener_window = window.parent;
    if (opener_window){
        opener_window.addContentTab(pageTitle, url);
    }
}

function openPage(pageTitle, url){
    var opener_window = window.parent;
    if (opener_window){
        opener_window.addFrameworkContentTab(pageTitle, url);
    }
    else{
        location.href = url;
    }
}

function reOpenPage(pageTitle, url){
    var opener_window = window.parent;
    if (opener_window){
        opener_window.removeFrameworkContentTab(pageTitle, url);
        opener_window.addFrameworkContentTab(pageTitle, url);
    }
    else{
        location.href = url;
    }
}

function openNewPage(pageTitle, url){
    var opener_window = window.parent;
    if (opener_window){
        opener_window.addNewFrameworkContentTab(pageTitle, url);
    }
    else{
        location.href = url;
    }
}

function closeCurrentTab(){
    var opener_window = window.parent;

    if (opener_window != undefined && opener_window.addNewFrameworkContentTab != undefined){
        opener_window.closeCurrentTab();
    }
    else{
        window.opener=null;
        window.open('', '_self', '');
        window.close();
    }
}