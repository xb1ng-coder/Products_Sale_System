package controller;

import bean.Product;

import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


public class ProductController extends HttpServlet {

    private ProductService productService = new ProductService();

    // 处理获取所有商品的请求
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getParameter("action");
//
//        // 获取所有商品
//        if ("all".equals(action)) {
//            List<Product> productList = productService.getAllProducts();
//            // 将商品列表添加到请求属性中
//            request.setAttribute("productList", productList);
//            // 转发到商品浏览页面
//            request.getRequestDispatcher("/index.jsp").forward(request, response);
//        }
//    }

    // 处理商品请求
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // 修改商品信息
        if ("edit".equals(action)) {
            // 获取要修改的商品 ID
            int productId = Integer.parseInt(request.getParameter("productId"));
            // 根据商品 ID 获取商品信息
            Product product = productService.getProductById(productId);
            // 将商品信息存储到 request 中，供 JSP 页面使用
            request.setAttribute("product", product);
            // 跳转到修改页面
            request.getRequestDispatcher("/AdminView/products/products_update.jsp").forward(request, response);
            return;
        }
        if ("update".equals(action)) {
            doPostUpdate(request, response);
        }

        // 删除商品信息
        if ("delete".equals(action)) {
            doPostDelete(request, response);
        }
        
        // 添加商品信息
        if ("add".equals(action)) {
            doPostAdd(request, response);
        }

    }

    // 添加新商品
    protected void doPostAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
        String category = request.getParameter("category");
        String imageUrl = request.getParameter("imageUrl");

        Product newProduct = new Product();
        newProduct.setName(name);
        newProduct.setDescription(description);
        newProduct.setPrice(price);
        newProduct.setStockQuantity(stockQuantity);
        newProduct.setCategory(category);
        newProduct.setImageUrl(imageUrl);

        boolean success = productService.addProduct(newProduct);
        if (success) {
            response.sendRedirect("/AdminView/products/products_list.jsp");  // 添加商品成功，跳转到商品列表页面
        } else {
            request.setAttribute("errorMessage", "添加商品失败！");
            request.getRequestDispatcher("/AdminView/products/products_list.jsp").forward(request, response);  // 添加失败，返回添加商品页面
        }
    }

    // 删除商品
    protected void doPostDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        boolean success = productService.deleteProduct(productId);
        if (success) {
            response.sendRedirect("/AdminView/products/products_list.jsp");  // 删除商品成功，跳转到商品列表页面
        } else {
            request.setAttribute("errorMessage", "删除商品失败！");
            request.getRequestDispatcher("/AdminView/products/products_list.jsp").forward(request, response);  // 删除失败，返回商品列表页面
        }
    }

    // 更新商品信息
    protected void doPostUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
        String category = request.getParameter("category");
        String imageUrl = request.getParameter("imageUrl");

        Product updatedProduct = new Product();
        updatedProduct.setProductId(productId);
        updatedProduct.setName(name);
        updatedProduct.setDescription(description);
        updatedProduct.setPrice(price);
        updatedProduct.setStockQuantity(stockQuantity);
        updatedProduct.setCategory(category);
        updatedProduct.setImageUrl(imageUrl);

        boolean success = productService.updateProduct(updatedProduct);
        if (success) {
            response.sendRedirect("/AdminView/products/products_list.jsp");  // 更新商品信息成功，跳转到商品列表页面
        } else {
            request.setAttribute("errorMessage", "更新商品信息失败！");
            request.getRequestDispatcher("/AdminView/products/products_list.jsp").forward(request, response);  // 更新失败，返回更新页面
        }
    }
}