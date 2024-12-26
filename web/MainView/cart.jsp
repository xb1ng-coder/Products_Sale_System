<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.Cart" %>
<%@ page import="bean.CartItem" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>购物车</title>
</head>
<body>

<h2>购物车</h2>
<a href="index.jsp">回到首页</a>

<%
    request.setCharacterEncoding("utf-8");
    // 获取购物车
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart != null) {
%>
<table>
    <tr>
        <th>商品名称</th>
        <th>数量</th>
        <th>价格</th>
        <th>总价</th>
    </tr>
    <%
        request.setCharacterEncoding("utf-8");
        // 获取购物车中的商品
        Map<Integer, CartItem> items = cart.getItems();
        for (CartItem item : items.values()) {
    %>
    <tr>
        <td><%= item.getProduct().getName() %></td>
        <td><%= item.getQuantity() %></td>
        <td>¥<%= item.getProduct().getPrice() %></td>
        <td>¥<%= item.getTotalPrice() %></td>
    </tr>
    <% } %>
</table>
<h3>总价: ¥<%= cart.getTotal() %></h3>
<form action="/cart?action=submitOrder" method="POST">
    <label for="shippingAddress">地址:</label>
    <input type="text" id="shippingAddress" name="shippingAddress" required placeholder="请输入邮寄地址">
    <label for="phoneNumber">电话号码:</label>
    <input type="text" id="phoneNumber" name="phoneNumber" required placeholder="请输入联系电话">
    <button type="submit">提交订单</button>
</form>
<%
} else {
%>
<p>购物车为空</p>
<%
    }
%>

</body>
</html>
