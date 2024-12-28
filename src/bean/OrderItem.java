package bean;

public class OrderItem {
    private int orderItemId;  // 订单项ID
    private int productId;    // 商品ID
    private String name;      // 订单ID
    private int quantity;     // 商品数量
    private double unitPrice; // 商品单价

    // 无参构造函数
    public OrderItem() {}

    // 带参构造函数
    public OrderItem(int orderItemId, int productId, int quantity, String name, double unitPrice) {
        this.orderItemId = orderItemId;
        this.productId = productId;
        this.name = name;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    // Getters and Setters
    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }
}

