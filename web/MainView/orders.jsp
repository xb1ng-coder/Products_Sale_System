<%@ page import="service.OrderService" %>
<%@ page import="bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Order" %>
<%@ page import="bean.OrderItem" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>您的订单</title>
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

<h2>您的订单</h2>
<a href="index.jsp">返回首页</a> | <a href="cart.jsp">查看购物车</a>

<%
    // 获取用户ID
    Integer userId = (Integer) session.getAttribute("userId");

    // 如果用户未登录，跳转到登录页面
    if (userId == null) {
        response.sendRedirect("login.jsp");
    } else {
        // 获取订单列表
        OrderService orderService = new OrderService();
        List<Order> orderList = orderService.getOrdersByUserId(userId);

        if (orderList != null && !orderList.isEmpty()) {
%>

<table>
    <thead>
    <tr>
        <th>订单ID</th>
        <th>订单日期</th>
        <th>商品数量</th>
        <th>总金额</th>
        <th>邮寄地址</th>
        <th>联系电话</th>
        <th>订单状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Order order : orderList) {
            List<OrderItem> orderItems = order.getOrderItems();
    %>
    <tr>
        <td><%= order.getOrderId() %></td>
        <td><%= order.getOrderDate() %></td>
        <td><%= orderItems.size() %></td>
        <td>¥<%= order.getTotalAmount() %></td>
        <td><%= order.getShippingAddress() %></td>
        <td><%= order.getPhoneNumber() %></td>
        <td><%= order.getStatus() %></td>
        <td><a href="order_detail.jsp?orderId=<%= order.getOrderId() %>">查看详情</a></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<%
} else {
%>
<p>您还没有订单。</p>
<%
        }
    }
%>

</body>
</html>
