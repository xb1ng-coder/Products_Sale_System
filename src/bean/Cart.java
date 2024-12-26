package bean;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<Integer, CartItem> items = new HashMap<>();

    public void addItem(Product product, int quantity) {
        CartItem item = items.get(product.getProductId());
        if (item == null) {
            item = new CartItem(product, quantity);
            items.put(product.getProductId(), item);
        } else {
            item.setQuantity(item.getQuantity() + quantity);
        }
    }

    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public void removeItem(int productId) {
        items.remove(productId);
    }

    public double getTotal() {
        double total = 0;
        for (CartItem item : items.values()) {
            total += item.getTotalPrice();
        }
        return total;
    }

    public void clear() {
        items = new HashMap<>();
    }
}
