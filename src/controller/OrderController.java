package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

import bean.Order;
import bean.OrderItem;
import bean.Product;
import bean.User;
import dao.ProductDao;
import service.OrderService;
import service.UserService;

import java.util.Date;


public class OrderController extends HttpServlet {

    private OrderService orderService = new OrderService();

    // 处理订单请求
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            doPostUpdate(request, response);
        }
        if("detail".equals(action)){
            doPostDetail(request,response);
        }
    }

    // 处理更新订单请求
    protected void doPostUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取订单ID和新状态
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String status = request.getParameter("status");

        // 更新订单状态
        boolean success = orderService.updateOrderStatus(orderId, status);

        if (success) {
            // 更新成功，重定向到订单管理页面
            response.sendRedirect("/AdminView/orders/orders_list.jsp");
        }else {
            // 更新失败，返回错误信息
            request.setAttribute("error", "更新订单状态失败！");
            request.getRequestDispatcher("/AdminView/orders/orders_list.jsp").forward(request, response);
        }
    }

    // 处理查看订单详情请求
    protected void doPostDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取订单ID
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        // 从服务层获取订单及其订单项详情
        Order order = orderService.getOrderById(orderId);
        List<OrderItem> orderItems = orderService.getOrderItemsByOrderId(orderId);
        UserService userService = new UserService();
        User user = userService.getUserById(order.getUserId());

        // 将数据传递到 JSP 页面
        request.setAttribute("userName", user.getUsername());
        request.setAttribute("order", order);
        request.setAttribute("orderItems", orderItems);

        // 转发到订单详情页面
        request.getRequestDispatcher("/AdminView/orders/orders_detail.jsp").forward(request, response);
    }

}

