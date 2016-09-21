<!DOCTYPE html>
<html>
<link lang="en">
<meta charset="UTF-8"/>
<title>学员管理</title>
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css"/>
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<!--<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">-->
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<script src="//cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<link rel="stylesheet" href="css/base.css"/>
<link rel="stylesheet" href="css/admin_student.css"/>
<script src="js/baseJs.js"></script>
<script src="js/admin.js"></script>


</head>
<body>
<div id="student_head">
    <div id="stu_search">
        <input type="text" id="search_name" class="form-control"/>
    </div>
    <div id="stu_submit">
        <input type="button" value="搜索" id="search_but" class="btn btn-warning"/>
    </div>
    <div id="new_excel">
        <input id="upload" type="button" class="btn btn-info" value="Excel批量导入">
    </div>
    <div id="new">
        <input id="create" type="button" class="btn btn-info" value="新增">
    </div>
</div>
<hr style="height:1px;border:none;border-top:1px dashed #0066CC;"/>
<div id="s_information">
    <table id="mTab_student" style="width: 760px;margin-left: 20px;margin-top: 5px;">
        <tr style="height: 40px ;font-weight: bolder;font-size: 20px;">
            <td >姓名</td>
            <td>专业</td>
            <td>联系电话</td>
            <td>父母姓名</td>
            <td>父母电话</td>
        </tr>
    </table>
</div>
<div id="popup">

</div>

<script>

    var data;

    $("#search_but").click(function () {
        var userName = $("#search_name").val();
        $.ajax({
            type: "GET",
            url: getRootPath() + "/getStudents?name=" + userName,
            contentType: "application/x-www-form-urlencoded",
            success: function (success) {

                $("#mTab_student tr").eq(0).nextAll().remove();

                data = success;
                for (var i = 0; i < data.length; i++) {
                    var stuname = data[i].name;
                    var professional = data[i].professional;
                    var tel = data[i].nameTel;
                    var parents = data[i].parentsName;
                    var parentsTel = data[i].parentsNameTel;

                    $("#mTab_student").append("<tr style='height: 30px ;font-size: 15px;'><td><a onclick='showpopup(" + i + ")'>" + stuname + "</a></td> <td>" + professional + "</td> <td>" + tel + "</td> <td>" + parents + "</td> <td>" + parentsTel + "</td></tr>");

                }

            },
            error: function (error) {
                alert(error);
            }
        });
    });

    function callbackTel(toTel) {

        if(default_tel==null){
            alert("请设置主叫号码");
            return;
        }

//        var fromTel = $("#fromTel").val();
//        var toTel = $("#toTel").val();
        $.ajax({
            type: "GET",
            url: getRootPath() + "/callback?from=" + default_tel + "&to=" + toTel,
            contentType: "application/x-www-form-urlencoded",
            success: function (success) {
                alert("呼叫成功请注意来电");
            },
            error: function (error) {
                alert(error);
            }
        });
    }

    function showpopup(i) {

        $("#popup").show();

        var html ="<span> 姓名:"+data[i].name+"</span> <br/> <span> 性别："+data[i].sex+"</span> <br/> <span> 专业："+data[i].professional+"</span> <br/> " +
                "<span> 电话："+data[i].nameTel+"</span> <a onclick='callbackTel("+data[i].nameTel+")'>呼叫</a><br/> <span> 家长姓名："+data[i].parentsName+"</span> <br/> <span> 家长电话："+data[i].parentsNameTel+"</span> <a onclick=callbackTel('"+data[i].parentsNameTel+")'>呼叫</a><br/>" +
                " <span> 微信："+data[i].wechat+"</span> <br/> <span> qq："+data[i].qq+"</span> <br/> <span> 地址："+data[i].address+"</span> <br/>";
        $("#popup").empty();
        $("#popup").append(html);
    }

</script>
</body>
</html>