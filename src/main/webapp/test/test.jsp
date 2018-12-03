

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">





















<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <!-- HTTP 1.1 -->
  <meta http-equiv="Cache-Control" content="no-store"/>
  <!-- HTTP 1.0 -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <!-- Prevents caching at the Proxy Server -->
  <meta http-equiv="Expires" content="0"/>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="${ctx}/images/favicon.ico"/>
  <title>会员账号 | ZP16888</title>

  <link rel="stylesheet" type="text/css" media="all" href="/styles/custom.css"/>
  <link rel="stylesheet" type="text/css" media="all" href="/styles/override.css"/>
  <link rel="stylesheet" type="text/css" media="all" href="/styles/simplicity/theme.css"/>
  <link rel="stylesheet" type="text/css" media="print" href="/styles/simplicity/print.css"/>

  <link rel="stylesheet" type="text/css" media="all" href="/styles/simplicity/gs960/960_12_col.css"/>

  <link rel="stylesheet" type="text/css" media="all" href="/scripts/jquery-easyui-1.4.2/themes/default/easyui.css"/>
  <link rel="stylesheet" type="text/css" media="all" href="/scripts/jquery-easyui-1.4.2/themes/icon.css"/>

  <script src="/scripts/jquery-1.11.2.min.js"></script>
  <script src="/scripts/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
  <script src="/scripts/jquery-easyui-1.4.2/locale/easyui-lang-zh_CN.js"></script>
  <script src="/scripts/jquery.json-2.4.js"></script>
  <script src="/scripts/jquery.pin/jquery.pin.js"></script>
  <script type="text/javascript" src="/scripts/global.js"></script>
  <script type="text/javascript" src="/scripts/tab.js"></script>
  <meta name="heading" content="会员账号"/>
  <style type="text/css">
    .headinfo{
      /*border-bottom: 1px red solid;*/
      border-radius: 5px;
      background: lightgrey;
      padding: 5px 10px;
      /*margin: 15px 0;*/
    }
    .mt10{
      margin-top: 10px;
    }
  </style>
</head>
<body>
<div class="page_container">
  <div class="page_toolbar">
    <div style="border:1px solid #ddd; background: #eee;">

      <a id="toolbar_save" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存</a>
      <a id="toolbar_new" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">增加</a>

      <div class="fr">
        <a id="toolbar_reload" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-refresh'">刷新</a>
        <a id="toolbar_close" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-close'">关闭</a>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <form id="agentAccountform" action="agentAccountform" method="post" onsubmit="return validateAccount(this)">

    <input id="id" name="id" type="hidden" value="137"/>

    <input id="credentialExpired" name="credentialExpired" type="hidden" value="false"/>
    <input id="deleteFlag" name="deleteFlag" type="hidden" value="0"/>
    <input id="registerDate" name="registerDate" type="hidden" value="2015-08-30"/>

    <input id="createBy" name="createBy" type="hidden" value="admin"/>
    <input id="createDate" name="createDate" type="hidden" value="2015-08-30"/>
    <input id="updateBy" name="updateBy" type="hidden" value="admin"/>
    <input id="updateDate" name="updateDate" type="hidden" value="2015-09-04"/>

    <input id="accountClass" name="accountClass" type="hidden" value=""/>
    <input id="accountEnabled" name="accountEnabled" type="hidden" value="true"/>
    <input id="accountExpired" name="accountExpired" type="hidden" value="false"/>
    <input id="accountLocked" name="accountLocked" type="hidden" value="false"/>
    <input id="agentArea_province" type="hidden" name="provinceIds">
    <input id="agentArea_city" type="hidden" name="cityIds">
    <div style=" padding: 20px; background: #eeeeee; margin: 15px auto; width: 650px; border: 1px solid #d4d4d4; box-shadow: 0 3px 3px #E6E6E6;">
      <div class="headinfo">代理设置</div>
      <div style="margin:5px 0">
        代理编号：<span style="margin-right: 10px"></span>

        <input id="agentPid" name="photoDistributor.pid" class="easyui-numberbox" data-options="min:0,max:99,required:true,width:60" type="text" value="52"/>



      </div>
      <div style="margin:5px 0">
        代理地区：<span id="agentAreaView" style="margin-right: 10px"></span>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="$('#changeArea_dialog').dialog('open')" style="height: 24px;">编辑地区</a>
      </div>
      <div>
        <div class="fl" >
          加盟会员额度：
          <input id="maxCount" name="photoDistributor.maxAgentCount" class="easyui-numberbox" data-options="min:0,max:1000,value:20" type="text" value="20"/>

        </div>
      </div>
      <div style="clear: left">
        代理期限：
        <input id="accountExpireDate" name="accountExpireDate" class="easyui-datebox" data-options="width:300" type="text" value="2016-08-30"/>
      </div>
      <div style="margin-bottom: 10px">
        公司名称：
        <input id="photoDistributor.companyName" name="photoDistributor.companyName" class="easyui-textbox" data-options="width:300" type="text" value=""/>
      </div>

      <div class="headinfo mt10" >基本信息</div>
      <ul>
        <li>
          <div class="fl">
            <label class="desc">用户名</label>

            <input id="accountName" name="accountName" class="easyui-textbox" data-options="required:true" type="text" value="ajoie" maxlength="50"/>
          </div>
          <div class="fl">
            <label class="desc">初始密码</label>

            <input id="passwd" name="passwd" value="123456" class="easyui-validatebox" data-options="required:true" type="text" value="7c4a8d09ca3762af61e59520943dc26494f8941b" maxlength="50"/>
          </div>
          <div class="fl">
            <label class="desc">确认初始密码</label>
            <input id="repasswd" class="easyui-textbox" data-options="required:true,value:'123456'" validType="equalTo['#passwd']" invalidMessage="两次输入密码不匹配">
          </div>
        </li>
        <li style="clear: both">
          <div class="fl">
            <label class="desc">负责人姓名</label>

            <input id="userName" name="userName" class="easyui-textbox" type="text" value="" maxlength="50"/>
          </div>
          <div class="fl">
            <label for="gender" class="desc">性别</label>

            <span><input id="gender1" name="gender" type="radio" value="F"/><label for="gender1">女</label></span><span><input id="gender2" name="gender" type="radio" value="M"/><label for="gender2">男</label></span>
          </div>
        </li>

        <li style="clear:both;marging:5px 0;">
          <div class="fl">
            <label for="province" class="desc">省份</label>

            <select id="province" name="photoCity.photoProvince.id" class="text medium" maxlength="10"><option value="19" selected="selected">安徽[皖]</option><option value="35">青海[青]</option><option value="17">江苏[苏]</option><option value="36">宁夏[宁]</option><option value="18">浙江[浙]</option><option value="33">陕西[陕]</option><option value="15">吉林[吉]</option><option value="34">甘肃[甘]</option><option value="16">黑龙江[黑]</option><option value="39">澳门[澳]</option><option value="13">内蒙古[蒙]</option><option value="14">辽宁[辽]</option><option value="37">新疆[新]</option><option value="11">河北[冀]</option><option value="38">香港[港]</option><option value="12">山西[晋]</option><option value="21">江西[赣]</option><option value="20">福建[闽]</option><option value="41">KOREA</option><option value="40">台湾[台]</option><option value="64">SINGAPORE</option><option value="65">Thailand</option><option value="22">山东[鲁]</option><option value="23">河南[豫]</option><option value="24">湖北[鄂]</option><option value="25">湖南[湘]</option><option value="26">广东[粤]</option><option value="27">广西[桂]</option><option value="28">海南[琼]</option><option value="29">四川[川]</option><option value="10">重庆[渝]</option><option value="30">贵州[贵]</option><option value="6">上海[沪]</option><option value="32">西藏[藏]</option><option value="31">云南[云]</option><option value="9">天津[津]</option><option value="8">北京[京]</option></select>
          </div>
          <div class="fl">
            <label for="cityName" class="desc">城市</label>

            <select id="cityName" name="photoCity.id" class="text medium" maxlength="16"><option value="67">淮北市</option><option value="66">马鞍山市</option><option value="78">亳州市</option><option value="69">安庆市</option><option value="77">池州市</option><option value="68">铜陵市</option><option value="17">蚌埠市</option><option value="18">淮南市</option><option value="15" selected="selected">合肥市</option><option value="16">芜湖市</option><option value="70">黄山市</option><option value="71">阜阳市</option><option value="72">宿州市</option><option value="73">滁州市</option><option value="74">六安市</option><option value="75">宣城市</option><option value="76">巢湖市</option></select>
          </div>
        </li>



      </ul>
      <div style="clear: both;"></div>
      <div>
        <div class="headinfo mt10">联系方式</div>
        <div>
          <ul>

            <li>
              <label for="email" class="desc">电子邮件</label>

              <input id="email" name="email" class="text medium" type="text" value="" maxlength="120"/>
            </li>
            <li class="fl">
              <label for="mobileNumber" class="desc">手机号码</label>

              <input id="mobileNumber" name="mobileNumber" class="text medium" type="text" value="" maxlength="50"/>
            </li>
            <li class="fl">
              <label for="phoneNumber" class="desc">电话号码</label>

              <input id="phoneNumber" name="phoneNumber" class="text medium" type="text" value="" maxlength="50"/>
            </li>
            <li>
              <label for="faxNumber" class="desc">传真号码</label>

              <input id="faxNumber" name="faxNumber" class="text medium" type="text" value="" maxlength="50"/>
            </li>
            <li>
              <label for="contactAddress" class="desc">地址</label>

              <input id="contactAddress" name="contactAddress" class="text large" type="text" value="" maxlength="50"/>
            </li>
          </ul>
        </div>
      </div>
      <div>
        <ul>
          <li>
            <label for="memo" class="desc">备注</label>

            <textarea id="memo" name="memo" class="text large" style="height: 80px;" maxlength="256"></textarea>
          </li>
        </ul>
      </div>
    </div>
    <div style="margin: 10px auto;text-align: center;">
      <a href="javascript:void(0);" id="form_button_save" class="form_button_save">保存</a>
      <a href="javascript:void(0);" id="form_button_new" class="form_button_new">保存&新增</a>
      <a href="javascript:void(0);" id="form_button_close" class="form_button_close">关闭</a>
    </div>
    <div class="hidden">
      <input type="submit" name="action" id="action_save" value="save"/>
      <input type="submit" name="action" id="action_save_and_new" value="new"/>
    </div>
  </form>
</div>
<div id="changeArea_dialog" class="easyui-dialog" title="修改代理区域" style="width:600px;height:400px;"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
  <div class="easyui-layout" fit="true">
    <div data-options="region:'east'" style="width:260px;">
      <div id="city_datalist" fit="true"></div>
    </div>
    <div data-options="region:'center'" style="background:#eee;">
      <div id="province_datalist" fit="true"></div>
    </div>
    <div data-options="region:'south'" style="height:50px;">
      <div style="text-align: center">
        <a id="agentArea_btn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认修改</a>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" language="Javascript1.1">

  <!-- Begin

  var bCancel = false;

  function validateAccount(form) {
    if (bCancel)
      return true;
    else
      return validateRequired(form);
  }

  function required () {
    this.aa = new Array("accountName", "账号 为必填项。", new Function ("varName", " return this[varName];"));
    this.ab = new Array("userName", "姓名 为必填项。", new Function ("varName", " return this[varName];"));
  }


  //End -->
</script>


<script type="text/javascript" src="/scripts/validator.jsp"></script>

<script type="text/javascript">

  var checkedProvince = new Array();
  var checkedCity = new Array();
  var currentSelectProvince;

  var currentSelectArea;

  $(document).ready(function(){

    // 工具栏按钮事件绑定
    initToolBarActions();

    // 表格按钮修饰
    initFormButtons();

    $(window).resize(function () {
//            $(".page_toolbar").pin();
      $(".page_toolbar").css("width", "100%");
    });

    $(".page_toolbar").pin({
      containerSelector: ".page_container"
    });


    viewAgentArea([{"id":6,"text":"上海[沪]","cities":[{"id":29,"text":"闸北区"},{"id":35,"text":"金山区"}]},{"id":8,"text":"北京[京]","cities":[{"id":11,"text":"丰台区\r\n"},{"id":42,"text":"房山区"},{"id":47,"text":"昌平区"}]},{"id":11,"text":"河北[冀]","cities":[{"id":136,"text":"石家庄市"},{"id":137,"text":"唐山市"},{"id":138,"text":"秦皇岛市"}]}]);
    currentSelectArea = [{"id":6,"text":"上海[沪]","cities":[{"id":29,"text":"闸北区"},{"id":35,"text":"金山区"}]},{"id":8,"text":"北京[京]","cities":[{"id":11,"text":"丰台区\r\n"},{"id":42,"text":"房山区"},{"id":47,"text":"昌平区"}]},{"id":11,"text":"河北[冀]","cities":[{"id":136,"text":"石家庄市"},{"id":137,"text":"唐山市"},{"id":138,"text":"秦皇岛市"}]}];





    $("#province").change(function(){
      getCityItemsByProvince($(this).val(),$("#cityName"));
    });



    $("#agentPid").numberbox({
      formatter:function(value){
        if(value.length==1){
          return "0"+value;
        }else{
          return value;
        }
      }
    });

    //代理省区的数据列表
    $('#province_datalist').datalist({
      data: [{"checked":true,"id":6,"text":"上海[沪]"},{"checked":true,"id":8,"text":"北京[京]"},{"id":9,"text":"天津[津]"},{"id":10,"text":"重庆[渝]"},{"checked":true,"id":11,"text":"河北[冀]"},{"id":12,"text":"山西[晋]"},{"id":13,"text":"内蒙古[蒙]"},{"id":14,"text":"辽宁[辽]"},{"id":15,"text":"吉林[吉]"},{"id":16,"text":"黑龙江[黑]"},{"id":17,"text":"江苏[苏]"},{"id":18,"text":"浙江[浙]"},{"id":19,"text":"安徽[皖]"},{"id":20,"text":"福建[闽]"},{"id":21,"text":"江西[赣]"},{"id":22,"text":"山东[鲁]"},{"id":23,"text":"河南[豫]"},{"id":24,"text":"湖北[鄂]"},{"id":25,"text":"湖南[湘]"},{"id":26,"text":"广东[粤]"},{"id":27,"text":"广西[桂]"},{"id":28,"text":"海南[琼]"},{"id":29,"text":"四川[川]"},{"id":30,"text":"贵州[贵]"},{"id":31,"text":"云南[云]"},{"id":32,"text":"西藏[藏]"},{"id":33,"text":"陕西[陕]"},{"id":34,"text":"甘肃[甘]"},{"id":35,"text":"青海[青]"},{"id":36,"text":"宁夏[宁]"},{"id":37,"text":"新疆[新]"},{"id":38,"text":"香港[港]"},{"id":39,"text":"澳门[澳]"},{"id":40,"text":"台湾[台]"},{"id":41,"text":"KOREA"},{"id":64,"text":"SINGAPORE"},{"id":65,"text":"Thailand"}],
      valueField:'id',
      textField:'text',
      checkbox: true,
      lines: true,
      checkOnSelect:false,
      selectOnCheck:false,
      onCheck:function(index,row){
        if(checkedProvince.indexOf(row.id)==-1){
          checkedProvince.push(row.id);
        }
      },
      onUncheck:function(index,row){
        $.each(checkedProvince,function(i,v){
          if(v==row.id){
            checkedProvince.splice(i,1);
          }
        });
      },
      onSelect:function(index,row){
        currentSelectProvince = index;
        $('#city_datalist').datalist("reload","/backend/common/citiesByProvince?accountId=137&provinceId="+row.id);
      }
    });

    //代理市区的数据列表
    $('#city_datalist').datalist({
      valueField:'id',
      textField:'text',
      checkbox: true,
      lines: true,
      singleSelect:false,
      onCheck:function(index,row){
        $('#province_datalist').datalist("checkRow",currentSelectProvince);
        if(checkedCity.indexOf(row.id)==-1){
          checkedCity.push(row.id);
        }
      },
      onUncheck:function(index,row){
        $.each(checkedCity,function(i,v){
          if(v==row.id){
            checkedCity.splice(i,1);
          }
        });
      },
      onLoadSuccess:function(data){
        $.each(data.rows,function(i,v){
          $.each(checkedCity,function(index,value){
            if(v.id==value){
              $('#city_datalist').datalist("checkRow",i);
            }
          });
        });
      }
    });

    //修改代理地区
    $("#agentArea_btn").click(function(){

      console.log(checkedCity);
      $("#agentArea_province").val(checkedProvince);
      $("#agentArea_city").val(checkedCity);
      $("#changeArea_dialog").dialog("close");

    });


    //验证
    $("#agentAccountform").form({
      onSubmit:function(param){
        return $(this).form('validate');
      },
      success:function(data){
        var data = eval('(' + data + ')');
        $.messager.alert("提示",data.message);
      }
    })

  });

  function initToolBarActions(){
    // 保存按钮
    $("#toolbar_save").bind("click", function(){
      $('#action_save').click();
    });

    // 新增按钮
    $("#toolbar_new").bind("click", function(){
      $('#action_save_and_new').click();
    });

    // 刷新按钮
    $("#toolbar_reload").bind("click", function(){
      action_reload();
    });

    // 关闭按钮
    $("#toolbar_close").bind("click", function(){
      closeFrameworkCurrentTab();
    });
  }

  function initFormButtons(){
    $("#form_button_save").bind("click", function(){
      $("#action_save").click();
    });

    $("#form_button_new").bind("click", function(){
      $("#action_save_and_new").click();
    });

    $("#form_button_close").bind("click", function(){
      closeFrameworkCurrentTab();
    });
  }

  function action_reload(){
    location.href="/backend/account/agentAccountform?id=137";
  }

  //通过省份id信息获取省份下的城市信息,并填充到下拉单中
  function getCityItemsByProvince(provinceId,select){
    $.ajax({
      url:'/general/cities?id=' + provinceId,
      dataType:'json',
      success:function(data){
        select.html("");
        $(data).each(function(index,value){
          select.append("<option value='"+value.id+"'>"+value.name+"</option>");
        });
      }
    })
  }

  //显示已选代理地区
  function viewAgentArea(agentAreaArray){
    var agentAreaStr = "";

    $.each(agentAreaArray,function(i,v){
      agentAreaStr += v.text;
      agentAreaStr += ":";
      checkedProvince.push(v.id);
      if(v.cities){
        $.each(v.cities,function(c_i,c_v){
          agentAreaStr += c_v.text;
          agentAreaStr += ",";
          checkedCity.push(c_v.id);
        });
        agentAreaStr += ";";
      }
    });
    $("#agentAreaView").html(agentAreaStr);
    $("#agentArea_province").val(checkedProvince);
    $("#agentArea_city").val(checkedCity);
  }

  $.extend($.fn.validatebox.defaults.rules, {
    equalTo: {
      validator: function (value, param) {
        var passwd = $(param[0]).val();
        var valid =  passwd==value;
        return valid;
      },
      message: '字段不匹配' }
  });



</script>
</body>
</html>










<script type="text/javascript">
  $(document).ready(function () {
    $.messager.alert('信息','账号信息已经更新。','info');
  });
</script>
        
    
    


