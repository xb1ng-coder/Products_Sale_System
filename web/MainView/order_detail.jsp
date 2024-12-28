<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.OrderService" %>
<%@ page import="bean.Order" %>
<%@ page import="bean.OrderItem" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>订单详情</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    table, th, td {
      border: 1px solid #ddd;
    }
    th, td {
      padding: 12px;
      text-align: left;
    }
    th {
      background-color: #f4f4f4;
    }
    tr:hover {
      background-color: #f9f9f9;
    }
    h2 {
      text-align: center;
      color: #333;
    }
    a {
      text-decoration: none;
      color: #007BFF;
      margin-right: 15px;
    }
    a:hover {
      text-decoration: underline;
    }
    .error {
      color: red;
      font-weight: bold;
      text-align: center;
    }
  </style>
</head>
<body>

<h2>订单详情</h2>
<a href="orders.jsp">返回订单列表</a>

<%
  String orderIdParam = request.getParameter("orderId");
  if (orderIdParam == null) {
%>
<p class="error">无效的订单ID。</p>
<%
} else {
  try {
    int orderId = Integer.parseInt(orderIdParam);
    OrderService orderService = new OrderService();
    Order order = orderService.getOrderById(orderId);

    if (order != null) {
%>

<h3>订单信息</h3>
<table>
  <tr>
    <th>订单ID</th>
    <td><%= order.getOrderId() %></td>
  </tr>
  <tr>
    <th>订单日期</th>
    <td><%= order.getOrderDate() %></td>
  </tr>
  <tr>
    <th>总金额</th>
    <td>¥<%= order.getTotalAmount() %></td>
  </tr>
  <tr>
    <th>邮寄地址</th>
    <td><%= order.getShippingAddress() %></td>
  </tr>
  <tr>
    <th>联系电话</th>
    <td><%= order.getPhoneNumber() %></td>
  </tr>
  <tr>
    <th>订单状态</th>
    <td><%= order.getStatus() %></td>
  </tr>
</table>

<h3>商品列表</h3>
<table>
  <thead>
  <tr>
    <th>商品ID</th>
    <th>商品名称</th>
    <th>数量</th>
    <th>单价</th>
    <th>总价</th>
  </tr>
  </thead>
  <tbody>
  <%
    List<OrderItem> orderItems = order.getOrderItems();
    if (orderItems != null) {
      for (OrderItem item : orderItems) {
  %>
  <tr>
    <td><%= item.getProductId() %></td>
    <td><%= item.getName() %></td>
    <td><%= item.getQuantity() %></td>
    <td>¥<%= item.getUnitPrice() %></td>
    <td>¥<%= item.getQuantity() * item.getUnitPrice() %></td>
  </tr>
  <%
    }
  } else {
  %>
  <tr>
    <td colspan="5" class="error">此订单没有商品。</td>
  </tr>
  <%
    }
  %>
  </tbody>
</table>

<%
} else {
%>
<p class="error">未找到对应的订单。</p>
<%
  }
} catch (Exception e) {
%>
<p class="error">加载订单时出错，请稍后重试。</p>
<%
    }
  }
%>

</body>
</html>
