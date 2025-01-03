<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>您的订单</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      margin: 0;
      padding: 0;
    }

    h2 {
      text-align: center;
      margin-top: 100px;
      font-size: 36px;
      color: #28a745;
    }

    p {
      text-align: center;
      font-size: 18px;
      color: #333;
      margin-top: 20px;
    }

    .button-container {
      text-align: center;
      margin-top: 40px;
    }

    .button-container a {
      display: inline-block;
      padding: 10px 20px;
      margin: 10px;
      background-color: #007bff;
      color: white;
      text-decoration: none;
      border-radius: 4px;
      font-size: 16px;
      transition: background-color 0.3s;
    }

    .button-container a:hover {
      background-color: #0056b3;
    }

    /* 响应式设计 */
    @media (max-width: 600px) {
      h2 {
        font-size: 28px;
      }

      p {
        font-size: 16px;
      }

      .button-container a {
        font-size: 14px;
        padding: 8px 16px;
      }
    }
  </style>
</head>
<body>

<h2>订单提交成功！</h2>

<p>您的订单已经提交，请查看订单详情。</p>

<div class="button-container">
  <a href="orders.jsp">查看订单</a>
  <a href="index.jsp">回到首页</a>
</div>

</body>
</html>
