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

//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Product> productList = productService.getAllProducts();
//
//        // 设置响应内容类型为 JSON
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//
//        // 使用 Gson 序列化商品列表为 JSON
//        Gson gson = new Gson();
//        String jsonResponse = gson.toJson(productList);
//
//        // 将 JSON 响应发送给前端
//        response.getWriter().write(jsonResponse);
//    }

//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            List<Product> productList = productService.getAllProducts();
//
//
//            // 设置响应内容类型为 JSON
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//
//            // 使用 Gson 序列化商品列表为 JSON
//            Gson gson = new Gson();
//            String jsonResponse = gson.toJson(productList);
//
//            // 将 JSON 响应发送给前端
//            response.getWriter().write(jsonResponse);
//        } catch (Exception e) {
//            // 打印异常堆栈信息，便于调试
//            e.printStackTrace();
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//            response.getWriter().write("{\"error\": \"Server error occurred while processing the request.\"}");
//        }
//    }

//@Override
//protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    try {
//        // 获取所有商品
//        List<Product> productList = productService.getAllProducts();
//
//        // 设置响应内容类型为 JSON
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//
//        // 使用 Jackson 的 ObjectMapper 序列化商品列表为 JSON
//        ObjectMapper objectMapper = new ObjectMapper();
//        String jsonResponse = objectMapper.writeValueAsString(productList);
//
//        // 将 JSON 响应发送给前端
//        response.getWriter().write(jsonResponse);
//    } catch (Exception e) {
//        // 打印异常堆栈信息，便于调试
//        e.printStackTrace();
//        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//        response.getWriter().write("{\"error\": \"Server error occurred while processing the request.\"}");
//    }
//}

    // 处理商品搜索
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Product> productList = productService.searchProducts(keyword);
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("/productList.jsp").forward(request, response);  // 返回商品搜索结果页面
    }
    // 其他方法...
}