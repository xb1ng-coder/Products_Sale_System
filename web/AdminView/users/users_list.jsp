<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="service.UserService" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户管理</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        table th, table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        table thead {
            background-color: #007bff;
            color: white;
        }
        table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        table tbody tr:hover {
            background-color: #f1f1f1;
        }
        button {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .form-inline {
            display: inline;
        }
        .form-inline button {
            margin-left: 5px;
        }
        .no-data {
            text-align: center;
            padding: 20px;
            color: #666;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>用户管理</h1>
    <table>
        <thead>
        <tr>
            <th>用户ID</th>
            <th>用户名</th>
            <th>密码</th>
            <th>电子邮箱</th>
            <th>联系电话</th>
            <th>地址</th>
            <th>角色</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            UserService userService = new UserService();
            List<User> userList = userService.getAllUsers();
            if (userList != null && !userList.isEmpty()) {
                for (User user : userList) {
        %>
        <tr>
            <td><%= user.getUserId() %></td>
            <td><%= user.getUsername() %></td>
            <td><%= user.getPassword() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getPhoneNumber() %></td>
            <td><%= user.getAddress() %></td>
            <td><%= user.getRole() %></td>
            <td>
                <!-- 修改用户 -->
                <form class="form-inline" action="/user?action=edit" method="POST">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="userId" value="<%= user.getUserId() %>">
                    <button type="submit" style="background-color: #6bd16b">修改</button>
                </form>
                <!-- 删除用户 -->
                <form class="form-inline" action="/user?action=delete" method="POST">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="userId" value="<%= user.getUserId() %>">
                    <button type="submit" onclick="return confirm('确定要删除该用户吗？')" style="background-color:#ea7070 ">删除</button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="8" class="no-data">暂无用户</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
