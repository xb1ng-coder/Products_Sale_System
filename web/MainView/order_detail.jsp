<%@ page import="service.OrderService" %>
<%@ page import="bean.Order" %>
<%@ page import="bean.OrderItem" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>订单详情</title>
  <style>
    table {
      width: 100%;
      border-collapse: collapse;
    }
    table, th, td {
      border: 1px solid black;
    }
    th, td {
      padding: 8px;
      text-align: left;
    }
    th {
      background-color: #f2f2f2;
    }
    h2 {
      text-align: center;
    }
  </style>
</head>
<body>

<h2>订单详情</h2>
<a href="orders.jsp">返回订单列表</a>

<%
  // 获取订单ID
  String orderIdParam = request.getParameter("orderId");
  if (orderIdParam == null) {
    out.println("<p>无效的订单ID。</p>");
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
    // 将此OrderId传递给OrderItemService以获取订单项列表
    for (OrderItem item : order.getOrderItems()) {
  %>
  <tr>
    <td><%= item.getProductId() %></td>
    <td><%= item.getName() %></td>
    <td><%= item.getQuantity() %></td>
    <td>¥<%= item.getUnitPrice() %></td>
    <td>¥<%= item.getQuantity() * item.getUnitPrice()  %></td>
  </tr>
  <%
    }
  %>
  </tbody>
</table>

<%
      } else {
        out.println("<p>未找到对应的订单。</p>");
      }
    } catch (NumberFormatException e) {
      out.println("<p>订单ID无效。</p>");
    }
  }
%>

</body>
</html>
