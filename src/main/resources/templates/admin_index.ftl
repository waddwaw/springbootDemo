<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8" />
    <title>后台管理系统</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" />
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <!--<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">-->
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/admin_index.css" />
    <script src="js/baseJs.js"></script>
    <script src="js/admin.js"></script>
</head>
<body>
<div class="a_set">
    <span>欢迎 admin</span><br/>
    <br/>
    <span>&nbsp;&nbsp;&nbsp;&nbsp;退出</span>
</div>
<div id="top_bar">
    <h1>21世纪美术教育</h1>
</div>
<div id="main">
    <div id="menu">
        <a href="admin_student.ftl" target="admin_context">学员管理</a><br/>
        <br/>
        <a href="admin_callset.ftl" target="admin_context">拨号设置</a>
    </div>
    <div id="content">
        <iframe name="admin_context" width="800px" height="670px" scrolling="no"  marginwidth="0" marginheight="0" frameborder="0">
        </iframe>
    </div>
</div>

<script src="js/admin.js"></script>
</body>
</html>