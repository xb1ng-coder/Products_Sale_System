<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }
        h2 {
            color: #333;
            margin-top: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        table th, table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        table thead {
            background-color: #007bff;
            color: white;
        }
        table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        table tbody tr:hover {
            background-color: #f1f1f1;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
            text-align: center;
        }
        a:hover {
            background-color: #0056b3;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <h1>订单详情</h1>

    <%
        String userName = (String) request.getAttribute("userName");
        Order order = (Order) request.getAttribute("order");
        List<OrderItem> orderItems = (List<OrderItem>) request.getAttribute("orderItems");
    %>

    <h2>订单信息</h2>
    <table>
        <tr>
            <th>订单ID</th>
            <td><%= order.getOrderId() %></td>
        </tr>
        <tr>
            <th>用户ID</th>
            <td><%= order.getUserId() %></td>
        </tr>
        <tr>
            <th>用户名</th>
            <td><%= userName %></td>
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
            <th>状态</th>
            <td><%= order.getStatus() %></td>
        </tr>
        <tr>
            <th>邮寄地址</th>
            <td><%= order.getShippingAddress() %></td>
        </tr>
    </table>

    <h2>订单项</h2>
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
            if (orderItems != null && !orderItems.isEmpty()) {
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
            <td colspan="5">暂无订单项</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <a href="/AdminView/orders/orders_list.jsp">返回订单列表</a>
</div>
</body>
</html>
