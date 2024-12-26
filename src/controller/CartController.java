package controller;

import bean.*;
import service.OrderService;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CartController extends HttpServlet {

    private ProductService productService = new ProductService();

    // 处理商品到购物车的请求
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            doPostadd(request, response);
        }
        if ("submitOrder".equals(action)) {
            doPostSubmitOrder(request, response);
        }
    }

    // 处理购物车增加
    private void doPostadd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取请求参数
        int productId = Integer.parseInt(request.getParameter("productId"));
//        int productName = Integer.parseInt(request.getParameter("productName"));
//        int productPrice = Integer.parseInt(request.getParameter("productPrice"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // 从会话中获取购物车
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        // 获取商品信息
        Product product = productService.getProductById(productId);
        if (product != null) {
            cart.addItem(product, quantity);
        }

        // 重定向到购物车页面
        response.sendRedirect("/MainView/cart.jsp");
    }

    // 处理提交订单
    private void doPostSubmitOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String shippingAddress = request.getParameter("shippingAddress");
        String phoneNumber = request.getParameter("phoneNumber");

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null && cart.getItems().size() > 0) {
            // 获取用户信息
            int userId = (int) session.getAttribute("userId");

            // 创建一个新的订单
            double totalAmount = cart.getTotal();
            Order order = new Order();
            order.setUserId(userId);
            order.setTotalAmount(totalAmount);
            order.setShippingAddress(shippingAddress);
            order.setPhoneNumber(phoneNumber);
            List<OrderItem> orderItemList = new ArrayList<>();
            // 将购物车中的每个商品添加到订单中
            for (CartItem item : cart.getItems().values()) {
                OrderItem orderItem = new OrderItem();
                // 少一个商品名到订单项名中
                orderItem.setProductId(item.getProduct().getProductId());
                orderItem.setQuantity(item.getQuantity());
                orderItem.setUnitPrice(item.getProduct().getPrice());
                orderItemList.add(orderItem);

            }
            order.setOrderItems(orderItemList);

            // 订单保存到数据库
            OrderService orderService = new OrderService();
            orderService.createOrder(order);

            // 清空购物车
            session.setAttribute("cart", null);

            // 重定向到订单确认页面
            response.sendRedirect("/MainView/order_success.jsp");
        } else {
            // 如果购物车为空，提示用户
            response.sendRedirect("cart.jsp?error=empty_cart");
        }
    }

}
