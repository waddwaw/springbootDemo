<!DOCTYPE html>
<html>
<link lang="en">
    <meta charset="UTF-8" />
    <title>学员管理</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" />
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <!--<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">-->
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<script src="//cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/admin_student.css" />
    <script src="js/baseJs.js"></script>
    <script src="js/admin.js"></script>


</head>
<body>
<div id="student_head">
    <div id="stu_search">
        <input  type="text"  class="form-control"/>
    </div>
    <div  id="stu_submit">
        <input type="button" value="搜索" class="btn btn-warning"/>
    </div>
    <div id="new_excel">
        <input id="upload" type="button" class="btn btn-info" value="Excel批量导入">
    </div>
    <div id="new">
        <input id="create" type="button"  class="btn btn-info" value="新增">
    </div>
</div>
<hr style="height:1px;border:none;border-top:1px dashed #0066CC;" />
<div id="s_information">
    <table style="width: 760px;margin-left: 20px;margin-top: 5px;">
        <tr style="height: 40px ;font-weight: bolder;font-size: 20px;" >
            <td>姓名</td>
            <td>专业</td>
            <td>联系电话</td>
            <td>父母姓名</td>
            <td>父母电话</td>
        </tr>
        <tr>
            <td><a onclick="showpopup()">lijiao</a></td>
            <td>yingyu</td>
            <td>17717676709</td>
            <td>li</td>
            <td>15678907890</td>
        </tr>
    </table>
</div>
<div id="popup">

</div>

<script>
    function showpopup(){
        $("#popup").show();
    }
</script>
</body>
</html>