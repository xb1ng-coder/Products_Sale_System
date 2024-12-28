<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.Product" %>
<%@ page import="service.ProductService" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>商品销售系统</title>
  <script>
    function checkLogin() {
      alert("请先登录后再添加商品至购物车！");
      window.location.href = "/LoginView/login.jsp";
    }
  </script>
</head>
<body>
<!-- 头部 -->
<header>
  <nav>
    <ul>
      <%
        // 获取当前会话中的用户信息
        String userName = (String) session.getAttribute("userName");

        // 用户未登录时
        if (userName == null) {
      %>
      <li id="login-link"><a href="/LoginView/login.jsp">登录</a></li>
      <%
      } else {
      %>
      <li><span>欢迎光临！<%= userName %></span></li>
      <li id="cart-link"><a href="/MainView/cart.jsp">购物车</a></li>
      <li id="order-link"><a href="orders.jsp">订单</a></li>
      <li id="profile-link"><a href="profile.jsp">个人设置</a></li>
      <li id="logout-link"><a href="/LoginView/logout.jsp">退出登录</a></li>
      <%
        }
      %>
    </ul>
  </nav>
</header>

<!-- 商品展示 -->
<div class="product-list">
  <h2>商品列表</h2>
  <div id="products-container">
    <%
      // 获取商品列表
      ProductService productService = new ProductService();
      List<Product> productList = productService.getAllProducts();
      if (productList != null) {
        for (Product product : productList) {
    %>
    <div class="product-item">
      <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
      <h3><%= product.getName() %></h3>
      <p>价格: ¥<%= product.getPrice() %></p>
      <p>库存：<%= product.getStockQuantity() %>(单位：个)</p>
      <p>描述：<%= product.getDescription() %></p>
      <%
        // 检查用户是否已登录
        if (userName != null) {
      %>
      <form action="/cart?action=add" method="POST">
        <input type="hidden" name="productId" value="<%= product.getProductId() %>">
        <input type="hidden" name="productName" value="<%= product.getName() %>">
        <input type="hidden" name="productPrice" value="<%= product.getPrice() %>">
        <input type="number" name="quantity" value="1" max="<%= product.getStockQuantity() %>">
        <button type="submit">加入购物车</button>
      </form>
      <%
      } else {
      %>
      <button onclick="checkLogin()">加入购物车</button>
      <%
        }
      %>
    </div>
    <%
        }
      }
    %>
  </div>
</div>

</body>
</html>
