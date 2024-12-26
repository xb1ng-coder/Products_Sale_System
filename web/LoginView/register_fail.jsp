<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册失败</title>
</head>
<body>

<div class="container">
    <h1>注册失败</h1>
    <p>抱歉，您的注册请求未能成功处理。请确保您的输入信息无误并重试。</p>

    <p>错误原因：</p>
    <ul>
        <li><%= request.getParameter("error") != null ? request.getParameter("error") : "未知错误" %></li>
    </ul>

    <a href="/register.jsp" class="button">返回注册页面</a>
</div>

</body>
</html>
