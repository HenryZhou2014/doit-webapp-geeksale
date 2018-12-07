<%@ page language="java" isErrorPage="true" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<head>
    <title>页面在线编辑</title>
    <!-- 加载编辑器的容器 -->
    <script id="container" name="content" type="text/plain">
        这里写你的初始化内容
    </script>
    <script type="text/javascript" src="${ctx}/a/resource/html/base64.js"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="${ctx}/a/resource/html/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${ctx}/a/resource/html/ueditor.all.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/a/resource/html/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/a/resource/html/third-party/jquery-1.10.2.js"></script>

    <script type="text/javascript">
        function clearHtml() {
            UE.getEditor('editor').setContent("",false,"");
        }
        function getAllHtml() {
            return UE.getEditor('editor').getAllHtml();
        }


        function saveHtml() {
            var htmlValue = getAllHtml();
            var result = Base64.encode(HTMLEncode(htmlValue));
            var dataStr ="&htmlValue="+result+"&name="+prompt("请输入你的名字","默认网页名称");
            $.ajax({
                type: "POST",
                url: "/usercenter/uploadHtml",
                data: dataStr,
                dataType: "json",
                success:function(data){
                    clearHtml();
                    alert("保存成功");
                },
                error:function(data){
                    alert("系统错误");
                }

            });
        }
        //HTML转义
        function HTMLEncode(html) {
            var temp = document.createElement("div");
            (temp.textContent != null) ? (temp.textContent = html) : (temp.innerText = html);
            var output = temp.innerHTML;
            temp = null;
            return output;
        }
    </script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>
</head>



<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <div class="callout alert alert-info noborder margin-top-60 margin-bottom-60">

                <div class="text-center">



                    <div>
                        <script id="editor" type="text/plain" style="width:100%;height:400px;"></script>
                        //实例化编辑器
                        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                        var ue = UE.getEditor('editor');
                        </script>
                    </div>
                    <input type="button"  onclick="saveHtml()" name="保存" value="保存" sytle="margin:2px;"/>
            </div>

        </div>
        <!-- LEFT -->
        <div class="col-lg-2 col-md-2 col-sm-3 col-lg-pull-10 col-md-pull-10 col-sm-pull-7">
            <jsp:include page="/app/usercenter/userCenterMenu"/>
        </div>

    </div>
</section>

