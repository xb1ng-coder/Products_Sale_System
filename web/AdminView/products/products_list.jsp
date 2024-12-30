<%@ page import="service.ProductService" %>
<%@ page import="bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>商品列表</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }
    h2 {
      text-align: center;
      margin-top: 20px;
      color: #007bff;
    }
    table {
      width: 90%;
      margin: 20px auto;
      border-collapse: collapse;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      background-color: #fff;
    }
    table, th, td {
      border: 1px solid #ddd;
    }
    th, td {
      padding: 10px;
      text-align: center;
    }
    th {
      background-color: #007bff;
      color: #fff;
    }
    tr:nth-child(even) {
      background-color: #f9f9f9;
    }
    tr:hover {
      background-color: #f1f1f1;
    }
    button {
      padding: 8px 12px;
      border: none;
      border-radius: 4px;
      background-color: #007bff;
      color: #fff;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    button:hover {
      background-color: #0056b3;
    }
    img {
      width: 100px;
      height: auto;
      border-radius: 5px;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
    }
    form {
      display: inline;
    }
    .no-products {
      text-align: center;
      color: #888;
      font-size: 18px;
      margin: 20px 0;
    }
  </style>
</head>
<body>
<div>
  <h2>商品列表</h2>
  <table>
    <thead>
    <tr>
      <th>商品ID</th>
      <th>名称</th>
      <th>描述</th>
      <th>价格</th>
      <th>库存</th>
      <th>分类</th>
      <th>展示图片</th>
      <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <%
      // 获取商品列表
      ProductService productService = new ProductService();
      List<Product> productList = productService.getAllProducts();

      if (productList != null && !productList.isEmpty()) {
        for (Product product : productList) {
    %>
    <tr>
      <td><%= product.getProductId() %></td>
      <td><%= product.getName() %></td>
      <td><%= product.getDescription() %></td>
      <td>¥<%= product.getPrice() %></td>
      <td><%= product.getStockQuantity() %></td>
      <td><%= product.getCategory() %></td>
      <td><img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>"></td>
      <td>
        <!-- 修改商品 -->
        <form action="/product?action=edit" method="POST">
          <input type="hidden" name="productId" value="<%= product.getProductId() %>">
          <button type="submit" style="background-color: #6bd16b">修改</button>
        </form>
        <!-- 删除商品 -->
        <form action="/product?action=delete" method="POST">
          <input type="hidden" name="productId" value="<%= product.getProductId() %>">
          <button type="submit" style="background-color: #ea7070">删除</button>
        </form>
      </td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="8" class="no-products">暂无商品</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
</div>
</body>
</html>
