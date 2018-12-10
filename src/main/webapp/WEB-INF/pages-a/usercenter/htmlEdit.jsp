<%@ page language="java" isErrorPage="true" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
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

        var ue = UE.getEditor('editor');

    </script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>
</head>



<body>

    <div>
        <script id="editor" type="text/plain" style="width:100%;height:400px;"></script>
        </script>
    </div>
    <br>
    <center>
    <input type="button" class="btn btn-success dialogue-save" onclick="saveHtml()" name="保存" value="保存" sytle="margin:2px;"/>
    </center>

</body>
</html>

