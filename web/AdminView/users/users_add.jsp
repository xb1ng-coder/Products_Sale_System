<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加用户</title>
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
        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            display: inline-block;
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
    <h2>添加用户</h2>
    <form action="/user?action=add" method="POST">
        <label for="username">用户名</label>
        <input type="text" id="username" name="username" placeholder="请输入用户名" required>

        <label for="password">密码</label>
        <input type="password" id="password" name="password" placeholder="请输入密码" required>

        <label for="email">电子邮箱</label>
        <input type="email" id="email" name="email" placeholder="请输入电子邮箱" required>

        <label for="phoneNumber">联系电话</label>
        <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="请输入联系电话" required>

        <label for="address">地址</label>
        <input type="text" id="address" name="address" placeholder="请输入地址" required>

        <label for="role">角色</label>
        <select id="role" name="role" required>
            <option value="user">普通用户</option>
            <option value="admin">管理员</option>
        </select>

        <button type="submit">添加用户</button>
    </form>
</div>
</body>
</html>
