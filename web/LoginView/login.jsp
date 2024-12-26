<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>登录 - 商品销售系统</title>
</head>
<body>

<div class="container">
  <h1>登录到 商品销售系统</h1>
  <form action="/user?action=login" method="post">
    <label for="username">用户名：</label>
    <input type="text" id="username" name="username" required placeholder="请输入用户名">

    <label for="password">密码：</label>
    <input type="password" id="password" name="password" required placeholder="请输入密码">

    <input type="submit" value="登录">
  </form>

  <p>没有账号？<a href="register.jsp">注册</a></p>
</div>

</body>
</html>
