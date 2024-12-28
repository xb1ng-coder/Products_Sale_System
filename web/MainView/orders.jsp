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
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
        }

        .links {
            text-align: center;
            margin: 20px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f1f1f1;
            font-weight: bold;
            color: #333;
        }

        td {
            background-color: #fff;
            color: #666;
        }

        .empty-order {
            text-align: center;
            font-size: 18px;
            color: #e74c3c;
        }

        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            display: inline-block;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }

            .btn {
                padding: 8px 16px;
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            th, td {
                padding: 10px;
            }

            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>

<h2>您的订单</h2>
<div class="links">
    <a href="index.jsp" class="btn">返回首页</a> | <a href="cart.jsp" class="btn">查看购物车</a>
</div>

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
        <td><a href="order_detail.jsp?orderId=<%= order.getOrderId() %>" class="btn">查看详情</a></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<%
} else {
%>
<p class="empty-order">您还没有订单。</p>
<%
        }
    }
%>

</body>
</html>
