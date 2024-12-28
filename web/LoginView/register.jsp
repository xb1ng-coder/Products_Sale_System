<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册 - 商品销售系统</title>
    <style>
        /* 通用样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 400px;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #007bff;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            text-align: left;
            font-size: 14px;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="password"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            width: 100%;
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            opacity: 0.9;
        }

        .error-message {
            color: #e74c3c;
            margin-bottom: 15px;
        }

        p {
            margin-top: 15px;
            font-size: 14px;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>用户注册</h1>

    <%-- 显示错误信息 --%>
    <%
        if(request.getParameter("error") != null) {
    %>
    <p class="error-message">错误：<%= request.getParameter("error") %></p>
    <%
        }
    %>

    <form action="/user?action=register" method="post">
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" required placeholder="请输入用户名">

        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required placeholder="请输入密码">

        <label for="email">电子邮箱:</label>
        <input type="text" id="email" name="email" placeholder="请输入电子邮箱">

        <label for="phoneNumber">电话号码:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" placeholder="请输入电话号码">

        <label for="address">地址:</label>
        <input type="text" id="address" name="address" placeholder="请输入地址">

        <button type="submit">注册</button>
    </form>
</div>

</body>
</html>
