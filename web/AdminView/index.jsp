<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品销售管理系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
        }
        .sidebar {
            width: 200px;
            background-color: #007bff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            height: 100vh;
            color: #fff;
        }
        .sidebar h1 {
            color: #fff;
            text-align: center;
        }
        .sidebar a {
            display: block;
            margin: 10px 0;
            padding: 10px;
            text-decoration: none;
            color: #fff;
            background-color: #5393ec;
            border-radius: 4px;
        }
        .sidebar a:hover {
            background-color: #1c7fcf;
        }
        .main-content {
            flex-grow: 1;
            padding: 20px;
        }
        iframe {
            width: 100%;
            height: 100%;
            border: none;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h1>管理端</h1>
    <a href="products/index.jsp" target="main_frame">商品管理</a>
    <a href="orders/index.jsp" target="main_frame">订单管理</a>
    <a href="users/index.jsp" target="main_frame">用户管理</a>
</div>
<div class="main-content">
    <iframe name="main_frame" src="products/index.jsp"></iframe>
</div>
</body>
</html>