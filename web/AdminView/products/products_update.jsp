<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.Product" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改商品</title>
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
        }
        form {
            max-width: 500px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        form label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }
        form button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        form button:hover {
            background-color: #0056b3;
        }
        p {
            text-align: center;
            color: #ff0000;
            font-size: 16px;
        }
    </style>
</head>
<body>
<h1>修改商品</h1>

<%
    Product product = (Product) request.getAttribute("product");
    if (product == null) {
%>
<p>未找到商品信息！</p>
<%
} else {
%>
<form action="/product?action=update" method="POST">
    <input type="hidden" name="productId" value="<%= product.getProductId() %>">

    <label for="name">商品名称：</label>
    <input type="text" id="name" name="name" value="<%= product.getName() %>" required>

    <label for="description">描述：</label>
    <input type="text" id="description" name="description" value="<%= product.getDescription() %>" required>

    <label for="price">价格：</label>
    <input type="number" id="price" name="price" value="<%= product.getPrice() %>" step="0.01" required>

    <label for="stockQuantity">库存数量：</label>
    <input type="number" id="stockQuantity" name="stockQuantity" value="<%= product.getStockQuantity() %>" required>

    <label for="category">分类：</label>
    <input type="text" id="category" name="category" value="<%= product.getCategory() %>" required>

    <label for="imageUrl">图片链接：</label>
    <input type="text" id="imageUrl" name="imageUrl" value="<%= product.getImageUrl() %>">

    <button type="submit">保存修改</button>
</form>
<%
    }
%>
</body>
</html>
