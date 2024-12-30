<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>添加商品</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 20px;
    }
    h2 {
      color: #007bff;
      text-align: center;
    }
    form {
      max-width: 400px;
      margin: 0 auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
  </style>
</head>
<body>
<!-- 添加新商品 -->
<h2>添加商品</h2>
<form action="/product?action=add" method="POST">
  <input type="text" name="name" placeholder="商品名称" required>
  <input type="text" name="description" placeholder="描述" required>
  <input type="number" name="price" placeholder="价格" step="0.01" required>
  <input type="number" name="stockQuantity" placeholder="库存数量" required>
  <input type="text" name="category" placeholder="分类" required>
  <input type="text" name="imageUrl" placeholder="图片链接">
  <button type="submit">添加商品</button>
</form>
</body>
</html>
