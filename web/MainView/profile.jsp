<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.UserService" %>
<%@ page import="bean.User" %>
<%@ page import="java.sql.SQLException" %>
<%
    int userId = (int) session.getAttribute("userId");

    UserService userService = new UserService();
    User user = userService.getUserById(userId); // 获取当前登录用户的详细信息
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人设置</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #007bff;
            color: white;
            padding: 15px 0;
            text-align: center;
        }

        main {
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin: 10px 0 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"] {
            padding: 10px;
            font-size: 16px;
            border-radius: 4px;
            border: 1px solid #ddd;
            margin-bottom: 15px;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* 响应式设计 */
        @media (max-width: 600px) {
            main {
                padding: 15px;
            }

            label,
            input,
            button {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
<header>
    <h1>个人信息</h1>
</header>
<main>
    <form action="/user?action=updateV2" method="POST">
        <label for="userId">用户名：</label>
        <input type="text" id="userId" name="userId" value="<%= user.getUserId() %>" readonly><br>

        <label for="userName">用户名：</label>
        <input type="text" id="userName" name="userName" value="<%= user.getUsername() %>"><br>

        <label for="password">密码：</label>
        <input type="text" id="password" name="password" value="<%= user.getPassword() %>"><br>

        <label for="email">邮箱：</label>
        <input type="email" id="email" name="email" value="<%= user.getEmail() %>"><br>

        <label for="phone">手机号：</label>
        <input type="text" id="phone" name="phone" value="<%= user.getPhoneNumber() %>"><br>

        <label for="address">地址：</label>
        <input type="text" id="address" name="address" value="<%= user.getAddress() %>"><br>

        <button type="submit">更新信息</button>
    </form>
</main>
</body>
</html>
