<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户管理</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .header {
            background-color: #007bff;
            color: #fff;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .header h1 {
            font-size: 24px;
            margin: 0;
        }
        .nav-links {
            display: flex;
            gap: 15px;
        }
        .nav-links a {
            text-decoration: none;
            color: #fff;
            padding: 10px 15px;
            background-color: #5393ec;
            border-radius: 4px;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        .nav-links a:hover {
            background-color: #1c7fcf;
        }
        .main-content {
            padding: 15px;
            height: calc(100vh - 80px); /* Adjust to leave space for header */
            box-sizing: border-box;
        }
        iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>用户管理</h1>
    <div class="nav-links">
        <a href="users_list.jsp" target="users_frame">用户信息列表</a>
        <a href="users_add.jsp" target="users_frame">增加用户信息</a>
    </div>
</div>

<div class="main-content">
    <iframe name="users_frame" src="users_list.jsp"></iframe>
</div>

</body>
</html>
