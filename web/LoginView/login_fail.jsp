<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录失败</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            text-align: center;
            margin-top: 100px;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
        }

        h1 {
            color: #dc3545;
            font-size: 36px;
        }

        p {
            font-size: 18px;
            color: #333;
        }

        .button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #0056b3;
        }

        /* 响应式设计 */
        @media (max-width: 600px) {
            .container {
                margin-top: 50px;
                width: 80%;
            }

            h1 {
                font-size: 28px;
            }

            p {
                font-size: 16px;
            }

            .button {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>登录失败</h1>
    <p>用户名或密码错误，请重新登录。</p>
    <a href="/LoginView/login.jsp" class="button">返回登录页面</a>
</div>

</body>
</html>
