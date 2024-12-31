<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.User" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改用户信息</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        input, select, button {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
            width: 100%;
        }
        input:focus, select:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 4px rgba(0, 123, 255, 0.5);
        }
        button {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
            border: none;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>修改用户信息</h1>
    <%
        User user = (User) request.getAttribute("user");
    %>
    <form action="/user?action=update" method="POST">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="userId" value="<%= user.getUserId() %>">

        <label for="username">用户名</label>
        <input type="text" id="username" name="username" value="<%= user.getUsername() %>" required>

        <label for="password">密码</label>
        <input type="text" id="password" name="password" value="<%= user.getPassword() %>" required>

        <label for="email">电子邮箱</label>
        <input type="text" id="email" name="email" value="<%= user.getEmail() %>" required>

        <label for="phoneNumber">联系电话</label>
        <input type="text" id="phoneNumber" name="phoneNumber" value="<%= user.getPhoneNumber() %>" required>

        <label for="address">地址</label>
        <input type="text" id="address" name="address" value="<%= user.getAddress() %>" required>

        <label for="role">角色</label>
        <select id="role" name="role">
            <option value="user" <%= "user".equals(user.getRole()) ? "selected" : "" %>>普通用户</option>
            <option value="admin" <%= "admin".equals(user.getRole()) ? "selected" : "" %>>管理员</option>
        </select>

        <button type="submit">提交修改</button>
    </form>
</div>
</body>
</html>
