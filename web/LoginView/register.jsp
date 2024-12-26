<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册 - 商品销售系统</title>
</head>
<body>

<div class="container">
    <h1>用户注册</h1>

    <%-- 显示错误信息 --%>
    <%
        request.setCharacterEncoding("utf-8");
        if(request.getParameter("error") != null) {
    %>
    <p class="error-message">错误：<%= request.getParameter("error") %></p>
    <%
        }
    %>

    <form action="/user?action=register" method="post">
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required>


        <label for="email">电子邮箱:</label>
        <input type="text" id="email" name="email">

        <label for="phoneNumber">电话号码:</label>
        <input type="text" id="phoneNumber" name="phoneNumber">

        <label for="address">地址:</label>
        <input type="text" id="address" name="address">

        <button type="submit">注册</button>
    </form>
</div>

</body>
</html>
