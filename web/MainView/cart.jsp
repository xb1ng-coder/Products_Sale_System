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
    <style>
        /* 通用样式 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
            font-size: 28px;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
            margin-bottom: 20px;
            display: inline-block;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #f1f1f1;
            color: #333;
            font-weight: bold;
        }

        table td {
            background-color: #fff;
            color: #666;
        }

        .total-price {
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
            text-align: right;
            color: #333;
        }

        form {
            margin-top: 20px;
            text-align: center;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        input[type="text"] {
            padding: 10px;
            margin: 10px 0;
            width: 80%;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #007bff;
            outline: none;
        }

        button {
            padding: 12px 25px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        .empty-cart {
            text-align: center;
            color: #e74c3c;
            font-size: 18px;
        }

        .error-message {
            color: #e74c3c;
            font-size: 16px;
            text-align: center;
            margin-top: 20px;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }

            input[type="text"] {
                width: 90%;
            }

            button {
                padding: 10px 20px;
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            h2 {
                font-size: 24px;
            }

            table th, table td {
                padding: 8px;
            }
        }

    </style>
</head>
<body>

<h2>购物车</h2>
<a href="index.jsp">回到首页</a>

<%
    // 获取购物车
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart != null && !cart.getItems().isEmpty()) {
%>
<table>
    <tr>
        <th>商品名称</th>
        <th>数量</th>
        <th>价格</th>
        <th>总价</th>
    </tr>
    <%
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

<div class="total-price">
    <h3>总价: ¥<%= cart.getTotal() %></h3>
</div>

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
<p class="empty-cart">购物车为空</p>
<%
    }
%>

</body>
</html>
