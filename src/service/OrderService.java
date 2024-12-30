package service;

import java.util.List;
import bean.Order;
import dao.OrderDao;
import bean.OrderItem;

public class OrderService {

    private OrderDao orderDao = new OrderDao();

    // 创建新订单
    public boolean createOrder(Order order) {
        // 计算订单总金额
        double totalAmount = 0;
        for (OrderItem item : order.getOrderItems()) {
            totalAmount += item.getQuantity() * item.getUnitPrice();
        }
        order.setTotalAmount(totalAmount);

        // 设置初始状态为 "pending"
        order.setStatus("pending");

        // 调用 DAO 层方法保存订单
        return orderDao.addOrder(order);
    }

    // 获取订单详情
    public Order getOrderById(int orderId) {
        return orderDao.getOrderById(orderId);
    }

    // 获取所有订单
    public List<Order> getAllOrders() {
        return orderDao.getAllOrders();
    }

    // 获取某个订单的所有订单项

    // 获取某个用户的所有订单
    public List<Order> getOrdersByUserId(int userId) {
        return orderDao.getOrdersByUserId(userId);
    }

    public boolean updateOrderStatus(int orderId, String status) {
        // 只有订单状态为 "pending" 或 "processing" 时，才能修改为 "completed" 或 "cancelled"
        Order order = orderDao.getOrderById(orderId);
        if (order != null && (order.getStatus().equals("pending") || order.getStatus().equals("processing"))) {
            return orderDao.updateOrderStatus(orderId, status);
        }
        return false;
    }

    // 删除订单
    public boolean deleteOrder(int orderId) {
        // 删除订单前可以检查订单是否符合删除条件（比如：未付款、未完成）
        Order order = orderDao.getOrderById(orderId);
        if (order != null && order.getStatus().equals("pending")) {
            return orderDao.deleteOrder(orderId);
        }
        return false;
    }

    // 查询订单项
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {
        OrderDao orderDao = new OrderDao();
        return orderDao.getOrderItemsByOrderId(orderId);
    }
}

