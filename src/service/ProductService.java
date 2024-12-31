package service;

import bean.Product;
import dao.ProductDao;

import java.util.List;

public class ProductService {

    private ProductDao productDao = new ProductDao();

    // 获取所有商品
    public List<Product> getAllProducts() {
        return productDao.getAllProducts();
    }

    // 搜索商品
    public List<Product> searchProducts(String keyword) {
        return productDao.searchProducts(keyword);
    }

    // 根据商品ID获取商品
    public Product getProductById(int productId) {
        return productDao.getProductById(productId);
    }

    // 添加新商品
    public boolean addProduct(Product product) {
        // 可以根据需求验证商品信息
        if (product != null && product.getName() != null && !product.getName().isEmpty()) {
            return productDao.addProduct(product);
        }
        return false;
    }

    // 更新商品信息
    public boolean updateProduct(Product product) {
        // 根据需求可以加入其他的验证逻辑
        if (product != null && product.getProductId() > 0) {
            return productDao.updateProduct(product);
        }
        return false;
    }

    // 删除商品
    public boolean deleteProduct(int productId) {
        // 确保商品存在后才能删除
        Product product = productDao.getProductById(productId);
        if (product != null) {
            return productDao.deleteProduct(productId);
        }
        return false;
    }

    public List<Product> searchAndFilterProducts(String searchKeyword, String category) {
        ProductDao productDao = new ProductDao();
        if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
            searchKeyword = null;
        }
        if (category == null || category.trim().isEmpty()) {
            category = null;
        }
        return productDao.searchAndFilterProducts(searchKeyword, category);
    }

    public List<String> getAllCategories() {
        ProductDao productDao = new ProductDao();
        return productDao.getAllCategories();
    }

    public List<Product> getFilteredProducts(String searchKeyword, String category) {
        ProductDao productDao = new ProductDao();
        return productDao.searchAndFilterProducts(searchKeyword, category);
    }

//
//    // 根据分类获取商品
//    public List<Product> getProductsByCategory(String category) {
//        return productDao.getProductsByCategory(category);
//    }
//
//    // 搜索商品
//    public List<Product> searchProducts(String keyword) {
//        return productDao.searchProducts(keyword);
//    }
}
