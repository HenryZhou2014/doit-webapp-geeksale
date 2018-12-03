/**
 * Created by mushan on 2016-01-22.
 */
/**
 * Created by ben on 2015-03-21.
 */

function fitImage(imageObj, fitWidth, fitHeight){

    var theImage = new Image();
    theImage.src = $(imageObj).attr("src");
    var actualWidth = theImage.width;
    var actualHeight = theImage.height;

    //var actualWidth = $(imageObj).width();
    //var actualHeight = $(imageObj).height();

    //console.log("image object=" + imageObj);
    //console.log("fit[" + fitWidth + "," + fitHeight + "],  actual[" + actualWidth + "," + actualHeight + "]");

    // 按宽度等比例缩小
    var newHeight = parseInt((fitWidth * actualHeight) / actualWidth);

    if (newHeight >= fitHeight){
        $(imageObj).css("width", fitWidth + "px"); // 设定实际显示宽度
        $(imageObj).css("height", newHeight + "px");  // 设定等比例缩放后的高度

        //console.log("fitTo[" + fitWidth + "," + newHeight + "]");
    }
    else {
        // 按高度等比例缩小
        var newWidth = parseInt((actualWidth * fitHeight) / actualHeight);
        $(imageObj).css("width", newWidth + "px"); // 设定实际显示宽度
        $(imageObj).css("height", fitHeight + "px");  // 设定等比例缩放后的高度

        //console.log("fitTo[" + newWidth + "," + fitHeight + "]");
    }

    var shiftX = parseInt(($(imageObj).width() - fitWidth) / 2);
    var shiftY = parseInt(($(imageObj).height() - fitHeight) / 2);

    $(imageObj).css("left",0); // 设定实际显示宽度
    $(imageObj).css("top",0); // 设定实际显示宽度

    if (shiftX > 0){
        $(imageObj).css("left",-shiftX + "px"); // 设定实际显示宽度
        console.log("shiftX[" + -shiftX + "px");
    }

    /*if (shiftY > 0){
     $(imageObj).css("top", -shiftY); // 设定实际显示宽度
     }*/
}

function fitImages(imagesSelector, fitWidth, fitHeight){
    $(imagesSelector).each(function(index){
        var imageObj = $(this);
        var actualWidth;//真实的宽度
        var actualHeight;//真实的高度
        //这里做下说明，$("<img/>")这里是创建一个临时的img标签，类似js创建一个new Image()对象！
        $("<img/>").attr("src", $(imageObj).attr("src")).one("load", function() {
            /*
             如果要获取图片的真实的宽度和高度有三点必须注意
             、需要创建一个image对象：如这里的$("<img/>")
             、指定图片的src路径
             、一定要在图片加载完成后执行如.load()函数里执行
             */
            actualWidth = this.width;
            actualHeight = this.height;

            //console.log("fit[" + fitWidth + "," + fitHeight + "],  actual[" + actualWidth + "," + actualHeight + "]");

            // 按宽度等比例缩小
            var newHeight = parseInt((fitWidth * actualHeight) / actualWidth);

            if (newHeight >= fitHeight){
                $(imageObj).css("width", fitWidth + "px"); // 设定实际显示宽度
                $(imageObj).css("height", newHeight + "px");  // 设定等比例缩放后的高度

                //console.log("fitTo[" + fitWidth + "," + newHeight + "]");
            }
            else {
                // 按高度等比例缩小
                var newWidth = parseInt((actualWidth * fitHeight) / actualHeight);
                $(imageObj).css("width", newWidth + "px"); // 设定实际显示宽度
                $(imageObj).css("height", fitHeight + "px");  // 设定等比例缩放后的高度

                //console.log("fitTo[" + newWidth + "," + fitHeight + "]");
            }

            var shiftX = parseInt(($(imageObj).width() - fitWidth) / 2);
            var shiftY = parseInt(($(imageObj).height() - fitHeight) / 2);

            $(imageObj).css("left",0); // 设定实际显示宽度
            $(imageObj).css("top",0); // 设定实际显示宽度
            $(imageObj).css("position","absolute"); // 设定实际显示宽度

            if (shiftX > 0){
                $(imageObj).css("left",-shiftX + "px"); // 设定实际显示宽度
                console.log("shiftX[" + -shiftX + "px");
            }

            /*if (shiftY > 0){
             $(imageObj).css("top", -shiftY); // 设定实际显示宽度
             }*/
        }).each(function() {
            if(this.complete) $(this).load();
        });
    });
}

function fitImages4show(imagesSelector, fitWidth, fitHeight){
    $(imagesSelector).each(function(index){
        var imageObj = $(this);
        var actualWidth;//真实的宽度
        var actualHeight;//真实的高度
        //这里做下说明，$("<img/>")这里是创建一个临时的img标签，类似js创建一个new Image()对象！
        $("<img/>").attr("src", $(imageObj).attr("src")).one("load", function() {
            /*
             如果要获取图片的真实的宽度和高度有三点必须注意
             、需要创建一个image对象：如这里的$("<img/>")
             、指定图片的src路径
             、一定要在图片加载完成后执行如.load()函数里执行
             */
            actualWidth = this.width;
            actualHeight = this.height;

            //console.log("fit[" + fitWidth + "," + fitHeight + "],  actual[" + actualWidth + "," + actualHeight + "]");

            // 按宽度等比例缩小
            var newHeight = parseInt((fitWidth * actualHeight) / actualWidth);

            if (newHeight >= fitHeight){
                $(imageObj).css("width", fitWidth + "px"); // 设定实际显示宽度
                $(imageObj).css("height", newHeight + "px");  // 设定等比例缩放后的高度

                //console.log("fitTo[" + fitWidth + "," + newHeight + "]");
            }
            else {
                // 按高度等比例缩小
                var newWidth = parseInt((actualWidth * fitHeight) / actualHeight);
                $(imageObj).css("width", newWidth + "px"); // 设定实际显示宽度
                $(imageObj).css("height", fitHeight + "px");  // 设定等比例缩放后的高度

                //console.log("fitTo[" + newWidth + "," + fitHeight + "]");
            }

            var shiftX = parseInt(($(imageObj).width() - fitWidth) / 2);
            var shiftY = parseInt(($(imageObj).height() - fitHeight) / 2);

            $(imageObj).css("left",0); // 设定实际显示宽度
            $(imageObj).css("top",0); // 设定实际显示宽度
            $(imageObj).css("position","absolute"); // 设定实际显示宽度

            if (shiftX > 0){
                $(imageObj).css("left",-shiftX + "px"); // 设定实际显示宽度
                //console.log("shiftX[" + -shiftX + "px");
            }

            /*if (shiftY > 0){
             $(imageObj).css("top", -shiftY); // 设定实际显示宽度
             }*/
        }).each(function() {
            if(this.complete) $(this).load();
        });
    });
}

function fitImagesFlexible(imagesSelector, fitWidth, fitHeight){
    $(imagesSelector).each(function(index){
        var imageObj = $(this);
        var actualWidth;//真实的宽度
        var actualHeight;//真实的高度
        //这里做下说明，$("<img/>")这里是创建一个临时的img标签，类似js创建一个new Image()对象！
        $("<img/>").attr("src", $(imageObj).attr("src")).one("load", function() {
            /*
             如果要获取图片的真实的宽度和高度有三点必须注意
             、需要创建一个image对象：如这里的$("<img/>")
             、指定图片的src路径
             、一定要在图片加载完成后执行如.load()函数里执行
             */
            actualWidth = this.width;
            actualHeight = this.height;

            if (actualWidth / actualHeight < fitWidth / fitHeight ){
                $(imageObj).css("max-height", fitHeight + "px"); // 设定实际显示宽度
                return;
            }

            //console.log("fit[" + fitWidth + "," + fitHeight + "],  actual[" + actualWidth + "," + actualHeight + "]");

            // 按宽度等比例缩小
            var newHeight = parseInt((fitWidth * actualHeight) / actualWidth);

            if (newHeight >= fitHeight){
                $(imageObj).css("width", fitWidth + "px"); // 设定实际显示宽度
                $(imageObj).css("height", newHeight + "px");  // 设定等比例缩放后的高度

                //console.log("fitTo[" + fitWidth + "," + newHeight + "]");
            }
            else {
                // 按高度等比例缩小
                var newWidth = parseInt((actualWidth * fitHeight) / actualHeight);
                $(imageObj).css("width", newWidth + "px"); // 设定实际显示宽度
                $(imageObj).css("height", fitHeight + "px");  // 设定等比例缩放后的高度

                //console.log("fitTo[" + newWidth + "," + fitHeight + "]");
            }

            var shiftX = parseInt(($(imageObj).width() - fitWidth) / 2);
            var shiftY = parseInt(($(imageObj).height() - fitHeight) / 2);

            $(imageObj).css("left",0); // 设定实际显示宽度
            $(imageObj).css("top",0); // 设定实际显示宽度
            $(imageObj).css("position","absolute"); // 设定实际显示宽度

            if (shiftX > 0){
                $(imageObj).css("left",-shiftX + "px"); // 设定实际显示宽度
                console.log("shiftX[" + -shiftX + "px");
            }

            /*if (shiftY > 0){
             $(imageObj).css("top", -shiftY); // 设定实际显示宽度
             }*/
        }).each(function() {
            if(this.complete) $(this).load();
        });
    });
}

function fitImagesCenter(imagesSelector, fitWidth, fitHeight){
    $(imagesSelector).each(function(index){
        var imageObj = $(this);
        var actualWidth;//真实的宽度
        var actualHeight;//真实的高度
        //这里做下说明，$("<img/>")这里是创建一个临时的img标签，类似js创建一个new Image()对象！
        $("<img/>").attr("src", $(imageObj).attr("src")).one("load", function() {
            /*
             如果要获取图片的真实的宽度和高度有三点必须注意
             、需要创建一个image对象：如这里的$("<img/>")
             、指定图片的src路径
             、一定要在图片加载完成后执行如.load()函数里执行
             */
            actualWidth = this.width;
            actualHeight = this.height;

            //console.log("fit[" + fitWidth + "," + fitHeight + "],  actual[" + actualWidth + "," + actualHeight + "]");

            // 按宽度等比例缩小
            var newHeight = parseInt((fitWidth * actualHeight) / actualWidth);

            if (newHeight >= fitHeight){
                $(imageObj).css("width", fitWidth + "px"); // 设定实际显示宽度
                $(imageObj).css("height", newHeight + "px");  // 设定等比例缩放后的高度

                //console.log("fitTo[" + fitWidth + "," + newHeight + "]");
            }
            else {
                // 按高度等比例缩小
                var newWidth = parseInt((actualWidth * fitHeight) / actualHeight);
                $(imageObj).css("width", newWidth + "px"); // 设定实际显示宽度
                $(imageObj).css("height", fitHeight + "px");  // 设定等比例缩放后的高度

                //console.log("fitTo[" + newWidth + "," + fitHeight + "]");
            }

            var shiftX = parseInt(($(imageObj).width() - fitWidth) / 2);
            var shiftY = parseInt(($(imageObj).height() - fitHeight) / 2);

            $(imageObj).css("left",0); // 设定实际显示宽度
            $(imageObj).css("top",0); // 设定实际显示宽度
            $(imageObj).css("position","absolute"); // 设定实际显示宽度

            if (shiftX > 0){
                $(imageObj).css("left",-shiftX + "px"); // 设定实际显示宽度
                console.log("shiftX[" + -shiftX + "px");
            }

            if (shiftY > 0){
                $(imageObj).css("top", -shiftY); // 设定实际显示宽度
            }
        }).each(function() {
            if(this.complete) $(this).load();
        });
    });
}

function fitImagesAllIn(imagesSelector, fitWidth, fitHeight){
    $(imagesSelector).each(function(index){
        var imageObj = $(this);
        var actualWidth;//真实的宽度
        var actualHeight;//真实的高度
        //这里做下说明，$("<img/>")这里是创建一个临时的img标签，类似js创建一个new Image()对象！
        $("<img/>").attr("src", $(imageObj).attr("src")).one("load", function() {
            /*
             如果要获取图片的真实的宽度和高度有三点必须注意
             、需要创建一个image对象：如这里的$("<img/>")
             、指定图片的src路径
             、一定要在图片加载完成后执行如.load()函数里执行
             */
            actualWidth = this.width;
            actualHeight = this.height;

            //console.log("fit[" + fitWidth + "," + fitHeight + "],  actual[" + actualWidth + "," + actualHeight + "]");

            // 按宽度等比例缩小
            var newHeight = parseInt((fitWidth * actualHeight) / actualWidth);

            if (newHeight >= fitHeight){
                $(imageObj).css("width", fitWidth + "px"); // 设定实际显示宽度
                $(imageObj).css("height", newHeight + "px");  // 设定等比例缩放后的高度

                //console.log("fitTo[" + fitWidth + "," + newHeight + "]");
            }
            else {
                // 按高度等比例缩小
                var newWidth = parseInt((actualWidth * fitHeight) / actualHeight);
                $(imageObj).css("width", newWidth + "px"); // 设定实际显示宽度
                $(imageObj).css("height", fitHeight + "px");  // 设定等比例缩放后的高度

                //console.log("fitTo[" + newWidth + "," + fitHeight + "]");
            }

            var shiftX = parseInt(($(imageObj).width() - fitWidth) / 2);
            var shiftY = parseInt(($(imageObj).height() - fitHeight) / 2);

            $(imageObj).css("left",0); // 设定实际显示宽度
            $(imageObj).css("top",0); // 设定实际显示宽度
            $(imageObj).css("position","absolute"); // 设定实际显示宽度

            if (shiftX > 0){
                $(imageObj).css("left",-shiftX + "px"); // 设定实际显示宽度
                console.log("shiftX[" + -shiftX + "px");
            }

            if (shiftY > 0){
                $(imageObj).css("top", -shiftY); // 设定实际显示宽度
            }
        }).each(function() {
            if(this.complete) $(this).load();
        });
    });
}

/*
 * JS 检查函数是否定义
 * @author 吴先成 qQ229256237 www.51-n.com
 * @param string   fname 要检查的函数的函数名,不要加()
 * @param object   object 可选参数,fname的对象，不指定此参数或者此参数不是对象，则默认为window对象
 * @return boolean 如果指定的函数存在则返回true,否则返回false
 */
function function_exist(func_name){
    try{
        if (typeof(eval(func_name)) == "function"){
            return true;
        }
    }
    catch(e){
        console.log("不存在名为 " + func_name + " 的函数！ ");
    }
    return false;
}

function func_callback(funcName)
{
    //参数数组
    var args = arguments;

    var jsStr=funcName+"(";

    var paramStr="";

    if (args.length > 1){
        for(var i=1;i<args.length;i++){
            paramStr += args[i] + (i==args.length-1 ? "" : ",");
        }
    }

    jsStr += paramStr+");";
    console.log("eval=" + jsStr);
    jQuery.globalEval(jsStr);
}

function fitImagesInRatio(imagesSelector, fitWidth, fitHeight){
    $(imagesSelector).each(function(index){
        var imageObj = $(this);
        var actualWidth;//真实的宽度
        var actualHeight;//真实的高度
        //这里做下说明，$("<img/>")这里是创建一个临时的img标签，类似js创建一个new Image()对象！
        $("<img/>").attr("src", $(imageObj).attr("src")).one("load", function() {
            /*
             如果要获取图片的真实的宽度和高度有三点必须注意
             、需要创建一个image对象：如这里的$("<img/>")
             、指定图片的src路径
             、一定要在图片加载完成后执行如.load()函数里执行
             */
            actualWidth = this.width;
            actualHeight = this.height;

            //console.log("fit[" + fitWidth + "," + fitHeight + "],  actual[" + actualWidth + "," + actualHeight + "]");

            // 按宽度等比例缩小
            var newHeight = parseInt((fitWidth * actualHeight) / actualWidth);

            if (newHeight <= fitHeight){
                $(imageObj).css("width", fitWidth + "px"); // 设定实际显示宽度
                $(imageObj).css("height", newHeight + "px");  // 设定等比例缩放后的高度

                console.log("fitTo[" + fitWidth + "," + newHeight + "]");
            }
            else {
                // 按高度等比例缩小
                var newWidth = parseInt((actualWidth * fitHeight) / actualHeight);
                $(imageObj).css("width", newWidth + "px"); // 设定实际显示宽度
                $(imageObj).css("height", fitHeight + "px");  // 设定等比例缩放后的高度
                newHeight = fitHeight;

                console.log("fitTo[" + newWidth + "," + fitHeight + "]");
            }

            var shiftX = parseInt((fitWidth - $(imageObj).width()) / 2);
            var shiftY = parseInt((fitHeight - $(imageObj).height()) / 2);

            if (shiftX < 0){
                $(imageObj).css("margin-left", shiftX); // 设定实际显示宽度
            }

            if (shiftY > 0){
                $(imageObj).css("margin-top",shiftY); // 设定实际显示宽度
            }
            else{
                $(imageObj).css("margin-top", 30 + "px"); // 设定实际显示宽度
            }
            //$(imageObj).css("position","absolute"); // 设定实际显示宽度

            //if (shiftX > 0){
            //    $(imageObj).css("left",-shiftX + "px"); // 设定实际显示宽度
            //    console.log("shiftX[" + -shiftX + "px");
            //}

            /*if (shiftY > 0){
             $(imageObj).css("top", -shiftY); // 设定实际显示宽度
             }*/
        }).each(function() {
            if(this.complete) $(this).load();
        });
    });
}

function fitImagesInExpand(imagesSelector, fitWidth, fitHeight){
    $(imagesSelector).each(function(index){
        var imageObj = $(this);
        var actualWidth;//真实的宽度
        var actualHeight;//真实的高度
        //这里做下说明，$("<img/>")这里是创建一个临时的img标签，类似js创建一个new Image()对象！
        $("<img/>").attr("src", $(imageObj).attr("src")).one("load", function() {
            /*
             如果要获取图片的真实的宽度和高度有三点必须注意
             、需要创建一个image对象：如这里的$("<img/>")
             、指定图片的src路径
             、一定要在图片加载完成后执行如.load()函数里执行
             */
            actualWidth = this.width;
            actualHeight = this.height;

            console.log("fit[" + fitWidth + "," + fitHeight + "],  actual[" + actualWidth + "," + actualHeight + "]");

            // 按宽度等比例缩小
            var newHeight = parseInt((fitWidth * actualHeight) / actualWidth);
            var newWidth = 0;

            if (newHeight >= fitHeight){
                newWidth = fitWidth;
            }
            else {
                // 按高度等比例缩小
                newWidth = parseInt((actualWidth * fitHeight) / actualHeight);

                //console.log("fitTo[" + newWidth + "," + fitHeight + "]");
                if (newWidth >= fitWidth){
                    newHeight = fitHeight;
                }
                else{
                    newWidth = fitWidth;
                    newHeight = fitHeight;
                }
            }

            $(imageObj).css("width", newWidth + "px"); // 设定实际显示宽度
            $(imageObj).css("height", newHeight + "px");  // 设定等比例缩放后的高度

            var shiftX = parseInt((newWidth - fitWidth) / 2);
            var shiftY = parseInt((newHeight - fitHeight) / 2);

            //$(imageObj).css("left",0); // 设定实际显示宽度
            //$(imageObj).css("top",0); // 设定实际显示宽度
            //$(imageObj).css("position","absolute"); // 设定实际显示宽度

            if (shiftX > 0){
                $(imageObj).css("left",-shiftX + "px"); // 设定实际显示宽度
                console.log("shiftX[" + -shiftX + "px");
            }

            /*if (shiftY > 0){
             $(imageObj).css("top", -shiftY); // 设定实际显示宽度
             }*/
        }).each(function() {
            if(this.complete) $(this).load();
        });
    });
}