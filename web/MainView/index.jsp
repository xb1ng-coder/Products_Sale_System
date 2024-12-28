<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.ProductService" %>
<%@ page import="bean.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>商品销售系统</title>
  <style>
    /* 通用样式 */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      color: #333;
      line-height: 1.6;
    }

    header {
      background-color: #007bff;
      color: #fff;
      padding: 10px 20px;
      position: fixed;
      top: 0;
      width: 100%;
      height: 60px;
      display: flex;
      align-items: center;
      z-index: 1000;
    }

    .navbar {
      width: 100%;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .nav-links ul {
      list-style: none;
      display: flex;
      gap: 20px;
      padding: 0;
    }

    .nav-links li a,
    .nav-links li span {
      color: #fff;
      text-decoration: none;
      font-size: 16px;
      transition: color 0.3s ease;
    }

    .nav-links li a:hover {
      color: #d9e5ff;
    }

    .main-content {
      margin-top: 80px;
      padding: 20px;
    }

    .product-section {
      max-width: 1200px;
      margin: 0 auto;
    }

    .product-list {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      justify-content: space-between;
    }

    .product-card {
      background: #fff;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      width: calc(33.333% - 20px);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .product-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    }

    .product-image {
      max-width: 100%;
      height: auto;
      border-radius: 8px;
      margin-bottom: 10px;
    }

    .product-name {
      font-size: 20px;
      font-weight: bold;
      margin: 10px 0;
    }

    .product-price,
    .product-stock,
    .product-description {
      margin: 8px 0;
      font-size: 14px;
    }

    .product-description {
      color: #666;
    }

    .btn {
      display: inline-block;
      padding: 10px 15px;
      font-size: 14px;
      text-align: center;
      border-radius: 5px;
      text-decoration: none;
      cursor: pointer;
      transition: background-color 0.3s ease, opacity 0.3s ease;
    }

    .btn-primary {
      background-color: #007bff;
      color: #fff;
      border: none;
    }

    .btn-primary:hover {
      background-color: #0056b3;
    }

    .btn-secondary {
      background-color: #6c757d;
      color: #fff;
      border: none;
    }

    .btn-secondary:hover {
      background-color: #5a6268;
    }

    .btn:disabled {
      background-color: #c0c0c0;
      cursor: not-allowed;
    }

    /* 响应式设计 */
    @media (max-width: 768px) {
      .product-card {
        width: calc(50% - 20px);
      }

      .nav-links ul {
        gap: 10px;
      }

      .nav-links li a,
      .nav-links li span {
        font-size: 14px;
      }
    }

    @media (max-width: 480px) {
      .product-card {
        width: 100%;
      }

      header {
        height: 50px;
      }

      .nav-links ul {
        flex-wrap: wrap;
        justify-content: center;
      }

      .nav-links li a,
      .nav-links li span {
        font-size: 12px;
      }
    }

  </style>
  <script>
    function checkLogin() {
      alert("请先登录后再添加商品至购物车！");
      window.location.href = "/LoginView/login.jsp";
    }
  </script>
</head>
<body>
<!-- 头部 -->
<header class="header">
  <nav class="navbar">
    <div class="logo">
      <p>商品销售系统</p>
    </div>
    <div class="nav-links">
      <ul>
        <%
          String userName = (String) session.getAttribute("userName");
          if (userName == null) {
        %>
        <li><a href="/LoginView/login.jsp">登录</a></li>
        <%
        } else {
        %>
        <li><span>欢迎光临，<%= userName %>！</span></li>
        <li><a href="/MainView/cart.jsp">购物车</a></li>
        <li><a href="orders.jsp">订单</a></li>
        <li><a href="profile.jsp">个人设置</a></li>
        <li><a href="/LoginView/logout.jsp">退出登录</a></li>
        <%
          }
        %>
      </ul>
    </div>
  </nav>
</header>

<!-- 商品展示 -->
<main class="main-content">
  <section class="product-section">
    <h2>商品列表</h2>
    <div class="product-list">
      <%
        ProductService productService = new ProductService();
        List<Product> productList = productService.getAllProducts();
        if (productList != null) {
          for (Product product : productList) {
      %>
      <div class="product-card">
        <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>" class="product-image">
        <h3 class="product-name"><%= product.getName() %></h3>
        <p class="product-price">价格: ¥<%= product.getPrice() %></p>
        <p class="product-stock">库存：<%= product.getStockQuantity() %>(单位：个)</p>
        <p class="product-description"><%= product.getDescription() %></p>
        <%
          if (userName != null) {
        %>
        <form action="/cart?action=add" method="POST" class="add-to-cart-form">
          <input type="hidden" name="productId" value="<%= product.getProductId() %>">
          <input type="hidden" name="productName" value="<%= product.getName() %>">
          <input type="hidden" name="productPrice" value="<%= product.getPrice() %>">
          <input type="number" name="quantity" value="1" max="<%= product.getStockQuantity() %>" class="quantity-input">
          <button type="submit" class="btn btn-primary">加入购物车</button>
        </form>
        <%
        } else {
        %>
        <button onclick="checkLogin()" class="btn btn-secondary">加入购物车</button>
        <%
          }
        %>
      </div>
      <%
          }
        }
      %>
    </div>
  </section>
</main>
</body>
</html>
