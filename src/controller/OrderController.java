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
//
//    // 处理更新订单状态请求
//    @Override
//    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int orderId = Integer.parseInt(request.getParameter("orderId"));
//        String status = request.getParameter("status");
//
//        // 调用 OrderService 更新订单状态
//        boolean isUpdated = orderService.updateOrderStatus(orderId, status);
//
//        // 返回操作结果
//        if (isUpdated) {
//            response.sendRedirect("orderUpdated.jsp");  // 成功跳转到订单更新页面
//        } else {
//            response.sendRedirect("orderUpdateFailed.jsp");   // 失败跳转到更新失败页面
//        }
//    }
//
//    // 处理删除订单请求
//    @Override
//    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int orderId = Integer.parseInt(request.getParameter("orderId"));
//
//        // 调用 OrderService 删除订单
//        boolean isDeleted = orderService.deleteOrder(orderId);
//
//        // 返回操作结果
//        if (isDeleted) {
//            response.sendRedirect("orderDeleted.jsp");  // 成功跳转到订单删除页面
//        } else {
//            response.sendRedirect("orderDeleteFailed.jsp");   // 失败跳转到删除失败页面
//        }
//    }
//
//    // 从请求中获取订单项列表（假设前端传递了商品ID和数量）
//    private List<OrderItem> getOrderItemsFromRequest(HttpServletRequest request) {
//        List<OrderItem> orderItems = new ArrayList<>();
//        // 假设前端传递商品ID和数量（以商品ID为key，数量为value的方式）
//        String[] productIds = request.getParameterValues("productId");
//        String[] quantities = request.getParameterValues("quantity");
//
//        if (productIds != null && quantities != null && productIds.length == quantities.length) {
//            for (int i = 0; i < productIds.length; i++) {
//                int productId = Integer.parseInt(productIds[i]);
//                int quantity = Integer.parseInt(quantities[i]);
//
//                // 获取商品信息并创建订单项
//                Product product = getProductById(productId);  // 需要根据商品ID查询商品信息
//                if (product != null) {
//                    OrderItem orderItem = new OrderItem();
//                    orderItem.setProductId(productId);
//                    orderItem.setQuantity(quantity);
//                    orderItem.setUnitPrice(product.getPrice());
//                    orderItems.add(orderItem);
//                }
//            }
//        }
//        return orderItems;
//    }
//
//    // 假设有方法从数据库或缓存获取商品信息
//    private Product getProductById(int productId) {
//        // 假设有 ProductDao 或其他方式获取商品信息
//        ProductDao productDao = new ProductDao();
//        return productDao.getProductById(productId);
//    }
}

