package bean;

import java.util.Date;

import java.util.List;

public class Order {
    private int orderId;               // 订单ID
    private int userId;                // 用户ID
    private Date orderDate;            // 订单日期
    private double totalAmount;        // 订单总金额
    private String status;             // 订单状态（pending, completed, cancelled）
    private String shippingAddress;    // 送货地址
    private String phoneNumber;        // 用户电话
    private List<OrderItem> orderItems; // 订单项列表（包含商品信息）

    // 无参构造函数
    public Order() {}

    // 带参构造函数
    public Order(int orderId, int userId, Date orderDate, double totalAmount, String status, String shippingAddress, String phoneNumber, List<OrderItem> orderItems) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
        this.shippingAddress = shippingAddress;
        this.phoneNumber = phoneNumber;
        this.orderItems = orderItems;
    }

    // Getters and Setters

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }
}


