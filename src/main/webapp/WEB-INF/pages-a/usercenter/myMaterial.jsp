<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>素材管理</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="menu-item-module" content="0210"/>

    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="${ctx}/resource/common/styles/plugins/dropzone/dropzone.css" rel="stylesheet">

    <script src="${ctx}/resource/common/scripts/plugins/dataTables/datatables.min.js"></script>
    <script src="${ctx}/resource/common/scripts/plugins/dropzone/dropzone.js"></script>

    <style type="text/css">
        .form-control-feedback{
            right: 20px;
            color: darkred;
        }
        .bv-form .help-block{
            color: darkred;
        }

        .dropzone .dz-default.dz-message span{
            display: block;
            text-align: center;
            font-size: 20px;
        }

        .dropzone .dz-default.dz-message{
            background: none;
        }
    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#tab1" data-toggle="tab">全部素材</a></li>
            </ul>

            <div class="tab-content margin-top-20">
                <div class="tab-pane fade in active" id="tab1">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-inline">
                                <button type="button" class="btn btn-success btn-add"><i class="fa fa-file-text-o"></i>新建文字素材</button>
                                <button type="button" class="btn btn-success btn-add-image"><i class="fa fa-file-image-o"></i>新建图文素材</button>
                                <button type="button" class="btn btn-success btn-add-html"><i class="fa fa-file-image-o"></i>新建网页素材</button>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover dataTables-example" width="100%">
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- LEFT -->
        <div class="col-lg-2 col-md-2 col-sm-3 col-lg-pull-10 col-md-pull-10 col-sm-pull-7">
            <jsp:include page="/app/usercenter/userCenterMenu"/>
        </div>
    </div>
</section>

<script id="materialTextTemplate" type="text/html">
    <div>
        <form id="materialForm" name="materialForm" class="form">
            <input type="hidden" name="id" value="{{id}}"/>
            <input type="hidden" name="contentType" value="{{contentType}}"/>
            <div class="row">
                <div class="col-lg-2">
                    <label class="desc text-right">标题</label>
                </div>
                <div class="col-lg-10">
                    <input name="title" type="text" class="form-control" placeholder="素材标题" value="{{title}}" maxlength="128"/>
                </div>
            </div>

            <div class="row margin-top-10">
                <div class="col-lg-2">
                    <label class="desc text-right">内容</label>
                </div>
                <div class="col-lg-10">
                    <%--<input name="content" type="text" class="form-control" placeholder="素材内容" value="{{content}}"/>--%>
                    <textarea name="content" class="form-control" placeholder="素材内容" maxlength="1024">{{content}}</textarea>
                </div>
            </div>
        </form>
    </div>
</script>

<script id="materialPictureTextTemplate" type="text/html">
    <div>
        <form id="materialPictureForm" name="materialPictureForm" class="form">
            <input type="hidden" name="id" value="{{id}}"/>
            <input type="hidden" name="contentType" value="{{contentType}}"/>
            <div class="row">
                <div class="col-lg-2">
                    <label class="desc text-right">标题</label>
                </div>
                <div class="col-lg-10">
                    <input name="title" type="text" class="form-control" placeholder="素材标题" value="{{title}}" maxlength="128"/>
                </div>
            </div>

            <div class="row margin-top-10">
                <div class="col-lg-2">
                    <label class="desc text-right">图片</label>
                </div>
                <div class="col-lg-10">
                    <div class="col-lg-6">
                        <div class="thumbnail">
                        {{if imagePath}}
                        <img id="imagePreview" src="${ctx}/{{imagePath}}" class="img-responsive"/>
                        {{else}}
                        <img id="imagePreview" src="${ctx}/images/common/document-image-128.png" style="max-height: 200px;"/>
                        {{/if}}
                        <input name="imagePath" type="hidden" value="{{imagePath}}"/>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div id="dropzone-images" class="dropzone">
                            <div class="dropzone-previews"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row margin-top-10">
                <div class="col-lg-2">
                    <label class="desc text-right">内容</label>
                </div>
                <div class="col-lg-10">
                    <%--<input name="content" type="text" class="form-control" placeholder="素材内容" value="{{content}}"/>--%>
                    <textarea name="content" class="form-control" placeholder="素材内容" maxlength="1024">{{content}}</textarea>
                </div>
            </div>

        </form>
    </div>
</script>

<script id="contentTypeColumnTemplate" type="text/html">
    {{if (contentType == '1')}}
    文字
    {{else if (contentType == '2')}}
    图片
    {{else if (contentType == '3')}}
       图文
    {{else}}
    其他
    {{/if}}
</script>

<script id="contentColumnTemplate" type="text/html">
    <div class="size-14 weight-600">
        {{title}}
    </div>
    {{if imagePath}}
    <p class="margin-top-10" style="background: #99E95B; padding:5px; border-radius: 5px;">
        <img src="/{{imagePath}}" style="max-width: 350px;"/>
    </p>
    {{/if}}
    {{if content}}
    <p class="margin-top-10" style="background: #99E95B; padding:5px; border-radius: 5px;">
        {{content}}
    </p>
    {{/if}}
</script>

<script id="actionsColumnTemplate" type="text/html">
    <a class="btn btn-warning btn-xs btn-material-edit" data-material-id="{{id}}">编辑</a>
    <a class="btn btn-danger btn-xs btn-material-delete" data-material-id="{{id}}">删除</a>
</script>

<script type="text/javascript">
    var myDataTable;

    $(document).ready(function () {

        Dropzone.autoDiscover = false;

        // 素材列表
        myDataTable = $(".dataTables-example").DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": true,
//            "scrollY": "600px",
            "scrollCollapse": true,
            "bFilter": false, //过滤功能 search 功能
            "paging": false,
            "iDisplayLength": 25,
            "aLengthMenu": [25, 50, 100],
            "ordering": false,
            "order": [[1, "desc"]],
            "pagingType": "full_numbers",
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "抱歉， 没有找到",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "sSearch": "搜索",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                },
                "sZeroRecords": "没有检索到数据"
            },
            "columns": [
                {"data": "seqNo","bSortable": false, title:"#"},
                {"data": "contentType","bSortable": false, title:"素材类型", width: 60},
                {"data": "title","bSortable": false, title:"素材内容"},
//                {"data": "content","bSortable": false, title:"内容"},
                {"data": "updateDate",title:"更新时间", width: 80},
                {"data": "id","bSortable": false, title:"操作"}
            ],
            "ajax": {
                url: "${ctx}/usercenter/myMaterial/marketingMaterialList",
                type: "POST",
                dataType: "json",
                data: {

                }
            },
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        var html = template("contentTypeColumnTemplate", {contentType:row.contentType});
                        return html;

                    }, "targets": 1
                },
                {
                    "render": function (data, type, row) {
                        var html = template("contentColumnTemplate", row);
                        return html;

                    }, "targets": 2
                },
                {
                    "render": function (data, type, row) {
                        var html = template("actionsColumnTemplate", row);
                        return html;

                    }, "targets": 4
                }
            ]
        });

        $(".btn-add").click(function () {
            var id = "";
            var type = "1";
            var title = "";
            var content = "";
            updateMarketingMaterial({id: id, contentType: type, title: title, content: content});
        });

        $(".btn-add-image").click(function () {
            var id = "";
            var type = "2";
            var title = "";
            var content = "";
            updatePictureMarketingMaterial({id: id, contentType: type, title: title, content: content});
        });
        $(".btn-add-html").click(function () {
            var id = "";
            var type = "2";
            var title = "";
            var content = "";
            updateHtmlMaterial({id: id, contentType: type, title: title, content: content});
        });
        $(document).on("click", ".btn-material-edit", function () {

            var materialId = $(this).attr("data-material-id");

            $.ajax({
                type: 'POST',
                url: "${ctx}/usercenter/myMaterial/getMarketingMaterial",
                data: { id:materialId},
                dataType: "json",
                success: function (data) {

                    if (data.flag == "0") {
                        toastError("提示", data.msg);
                        return;
                    }
                    if (data.contentType == "2"){
                        updatePictureMarketingMaterial(data);
                    }
                    else{
                        updateMarketingMaterial(data);
                    }
                }
            });


        });

        $(document).on("click", ".btn-material-delete", function () {
            var materialId = $(this).attr("data-material-id");
            var html = "删除确认！";
            BootstrapDialog.show({
                title: "<div class='size-20'>确认</div>",
                draggable: true,
                size: BootstrapDialog.SIZE_SMALL,
                cssClass: 'introduction-dialogue',
                message: $("<div></div>").html(html),
                onhidden: function () {
                    console.log("onhidden..");
                },
                onshow: function () {
//                            $(".desc *").removeAttr("style");
                },
                onshown: function () {
//                            $(".desc *").removeAttr("style");
                },
                buttons: [
                    {
                        label: '确认',
                        cssClass: "btn btn-success dialogue-save",
                        action: function (dialogItself) {

                            $.ajax({
                                type: 'POST',
                                url: "${ctx}/usercenter/myMaterial/deleteMarketingMaterial",
                                data: {id:materialId},
                                dataType: "json",
                                success: function (data) {

                                    if (data.flag == "0") {
                                        toastError("提示", data.msg);
                                        return;
                                    }
                                    else{
                                        myDataTable.ajax.reload();
                                        toastInfo("提示", "选中素材信息已删除！");
                                        $(".dialogue-close").click();
                                    }

                                }
                            });
                        }
                    },
                    {
                        label: '关闭',
                        cssClass: "btn btn-danger dialogue-close",
                        action: function (dialogItself) {
                            dialogItself.close();
                        }
                    }]
            });
        });
    });

    function updateMarketingMaterial(marketingMaterial){

        var html = template("materialTextTemplate", marketingMaterial);
        BootstrapDialog.show({
            title: "<div class='size-20'>素材信息</div>",
            draggable: true,
            size: BootstrapDialog.SIZE_WIDE,
            cssClass: 'introduction-dialogue',
            message: $("<div></div>").html(html),
            onhidden: function () {
                console.log("onhidden..");
            },
            onshow: function () {

            },
            onshown: function () {
                $('#materialForm').bootstrapValidator({
                    message: 'This value is not valid',
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        title: {
                            message: '标题不能为空',
                            validators: {
                                notEmpty: {
                                    message: '标题不能为空'
                                }
                            }
                        },
                        content: {
                            message: '素材内容不能为空',
                            validators: {
                                notEmpty: {
                                    message: '素材内容不能为空'
                                }
                            }
                        }
                    }
                }).on('success.form.bv', function (e) {
                    // 转换、获取附件列表信息

                });

            },
            buttons: [
                {
                    label: '保存',
                    cssClass: "btn btn-success dialogue-save",
                    action: function (dialogItself) {
                        var bootstrapValidator = $("#materialForm").data('bootstrapValidator');
                        //手动触发验证
                        bootstrapValidator.validate();
                        if(! bootstrapValidator.isValid()){
                            return;
                        }

                        var formdata = $("#materialForm").serialize();
                        $.ajax({
                            type: 'POST',
                            url: "${ctx}/usercenter/myMaterial/updateMarketingMaterial",
                            data: formdata,
                            dataType: "json",
                            success: function (data) {

                                if (data.flag == "0") {
                                    toastError("提示", data.msg);
                                    return;
                                }
                                else{
                                    myDataTable.ajax.reload();
                                    toastInfo("提示", "素材信息已保存！");
                                    $(".dialogue-close").click();
                                }
                            }
                        });
                    }
                },
                {
                    label: '关闭',
                    cssClass: "btn btn-danger dialogue-close",
                    action: function (dialogItself) {
                        dialogItself.close();
                    }
                }]
        });
    }

    function updatePictureMarketingMaterial(marketingMaterial){

        var html = template("materialPictureTextTemplate", marketingMaterial);
        BootstrapDialog.show({
            title: "<div class='size-20'>素材信息</div>",
            draggable: true,
            size: BootstrapDialog.SIZE_WIDE,
            cssClass: 'introduction-dialogue',
            message: $("<div></div>").html(html),
            onhidden: function () {
                console.log("onhidden..");
            },
            onshow: function () {

            },
            onshown: function () {
                $('#materialPictureForm').bootstrapValidator({
                    message: 'This value is not valid',
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        title: {
                            message: '标题不能为空',
                            validators: {
                                notEmpty: {
                                    message: '标题不能为空'
                                }
                            }
                        }
                    }
                }).on('success.form.bv', function (e) {
                    // 转换、获取附件列表信息

                });

                $("div#dropzone-images").dropzone({
                    url: "myMaterial/uploadImages",
                    addRemoveLinks: false,
                    dictRemoveLinks: "x",
                    dictCancelUpload: "x",
                    maxFiles: 10,
                    maxFilesize: 15,
                    acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg",
                    init: function() {
                        this.on("success", function(file) {

                            var data = JSON.parse(file.xhr.response);

                            $("#imagePreview").attr("src", "${ctx}/" + data.previewPath);
                            $("#materialPictureForm [name=imagePath]").val(data.previewPath);
                        });
                        this.on("removedfile", function(file) {

                        });
                    }
                })

            },
            buttons: [
                {
                    label: '保存',
                    cssClass: "btn btn-success dialogue-save",
                    action: function (dialogItself) {
                        var bootstrapValidator = $("#materialPictureForm").data('bootstrapValidator');
                        //手动触发验证
                        bootstrapValidator.validate();
                        if(! bootstrapValidator.isValid()){
                            return;
                        }

                        var formdata = $("#materialPictureForm").serialize();
                        $.ajax({
                            type: 'POST',
                            url: "${ctx}/usercenter/myMaterial/updateMarketingMaterial",
                            data: formdata,
                            dataType: "json",
                            success: function (data) {

                                if (data.flag == "0") {
                                    toastError("提示", data.msg);
                                    return;
                                }
                                else{
                                    myDataTable.ajax.reload();
                                    toastInfo("提示", "素材信息已保存！");
                                    $(".dialogue-close").click();
                                }
                            }
                        });
                    }
                },
                {
                    label: '关闭',
                    cssClass: "btn btn-danger dialogue-close",
                    action: function (dialogItself) {
                        dialogItself.close();
                    }
                }]
        });
    }



    function updateHtmlMaterial(marketingMaterial){
        window.open("${ctx}/usercenter/htmlEdit", '_blank', 'width=800,height=600,menubar=no,toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=yes');

    }
</script>
