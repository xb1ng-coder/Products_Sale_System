<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.Order" %>
<%@ page import="service.OrderService" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单管理</title>
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
        }
        .order-list {
            width: 90%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table thead {
            background-color: #007bff;
            color: #fff;
        }
        table th, table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        table tbody tr:hover {
            background-color: #f1f1f1;
        }
        button {
            padding: 5px 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
        select {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        form {
            display: inline-block;
        }
        td[colspan="7"] {
            text-align: center;
            color: #999;
        }
    </style>
</head>
<body>
<h1>订单信息列表</h1>

<div class="order-list">
    <table>
        <thead>
        <tr>
            <th>订单ID</th>
            <th>用户ID</th>
            <th>订单日期</th>
            <th>总金额</th>
            <th>邮寄地址</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            // 从 OrderService 获取所有订单
            OrderService orderService = new OrderService();
            List<Order> orderList = orderService.getAllOrders();

            if (orderList != null && !orderList.isEmpty()) {
                for (Order order : orderList) {
        %>
        <tr>
            <td><%= order.getOrderId() %></td>
            <td><%= order.getUserId() %></td>
            <td><%= order.getOrderDate() %></td>
            <td>¥<%= order.getTotalAmount() %></td>
            <td><%= order.getShippingAddress() %></td>
            <td>
                <select name="status" form="updateForm<%= order.getOrderId() %>">
                    <option value="pending" <%= "pending".equals(order.getStatus()) ? "selected" : "" %>>待处理</option>
                    <option value="completed" <%= "completed".equals(order.getStatus()) ? "selected" : "" %>>已完成</option>
                    <option value="cancelled" <%= "cancelled".equals(order.getStatus()) ? "selected" : "" %>>已取消</option>
                </select>
            </td>
            <td>
                <!-- 修改订单状态 -->
                <form id="updateForm<%= order.getOrderId() %>" action="/order?action=update" method="POST">
                    <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                    <button type="submit" style="background-color: #6bd16b">更新状态</button>
                </form>
                <!-- 查看订单详情 -->
                <form action="/order?action=detail" method="POST">
                    <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                    <button type="submit">查看详情</button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="7">暂无订单</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
