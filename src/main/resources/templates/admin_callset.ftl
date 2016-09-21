<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8" />
    <title>拨号设置</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" />
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <!--<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">-->
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.js"></script>
    <script src="//cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/admin_callset.css" />
    <script src="js/baseJs.js"></script>
    <script src="js/admin.js"></script>
</head>
<body>
    <input id="new_call" type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" value="新增号码"/>

    <input id="new_call"  type="button" class="btn btn-info save_Tel"  value="保存默认号码"/>
    <br/>
    <div id="call_list">
        <hr/>
        <div id="call_context">
        </div>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        请添加手机号码
                    </h4>
                </div>
                <div class="modal-body">
                    <input class="form-control" id="call_me_tel" type="text"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="save_tel" class="btn btn-primary" data-dismiss="modal">
                        保存
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

<script>
    $(document).ready(function(){
        initTel();
    });

    $("#save_tel").click(function() {

        var me_tel = $("#call_me_tel").val();

        if(me_tel==null){
            alert("手机号码不正确！");
            return ;
        }

        if (!me_tel.match(/^(((1[3-8]{1}[0-9]{1}))+\d{8})$/)) {
            alert("手机号码不正确！");
            return ;
        }

        callTel.push(me_tel);

        var obj = JSON.stringify(callTel);

        $.cookie('callTel',obj);

//        $("#call_context").append("<input id='select_call' style='font-size: 30px;margin-top: 15px;' name='Tel' type='radio' value='"+ me_tel+"' />&nbsp;&nbsp;"+me_tel+"<br />");

        initTel();

        alert(me_tel + "添加成功");
    })

    $(".save_Tel").click(function() {

        var obj = $("input[name='Tel']:checked").val();
        $.cookie('default_tel',obj);
        alert(obj + "为默认主叫号码");

    })

    function initTel() {

        $("#call_context").empty();
        //初始化callTel信息
        for(var i = 0 ;i < callTel.length;i++){

            var default_tel = $.cookie('default_tel');

            var che ="";

            if(default_tel!=null){
                if(callTel[i]==default_tel){
                    che = "checked='checked'";
                }
            }

            $("#call_context").append("<input id='select_call' style='font-size: 30px;margin-top: 15px;' name='Tel' type='radio' "+che+" value='"+ callTel[i]+"' />&nbsp;&nbsp;"+callTel[i]+"<br />");
        }
    }
</script>
</body>
</html>