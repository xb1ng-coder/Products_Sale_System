package controller;

import bean.User;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class UserController extends HttpServlet {

    private UserService userService = new UserService();

    // 处理用户Post请求
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            doPostregister(request, response);
        } else if ("login".equals(action)) {
            doPostLogin(request, response);
        }
    }

    // 处理用户注册
    private void doPostregister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // 获取请求参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");

        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setEmail(email);
        newUser.setPhoneNumber(phoneNumber);
        newUser.setAddress(address);

        // 调用UserService进行注册
        boolean success = userService.registerUser(newUser);
        if (success) {
            response.sendRedirect("/LoginView/login.jsp");  // 注册成功，跳转到登录页面
        } else {
            request.setAttribute("errorMessage", "用户名已存在！");
            request.getRequestDispatcher("/LoginView/register_fail.jsp").forward(request, response);  // 注册失败，返回注册页面
        }
    }

    // 处理用户登录
    protected void doPostLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 调用UserService进行登录验证
        int userId = userService.loginUser(username, password);
        if (userId > 0) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);  // 设置登录用户Id到session中
            session.setAttribute("userName", username);  // 设置登录用户Id到session中
            // 登录成功后，进行用户身份验证
            User user = userService.getUserById(userId);
            if (Objects.equals(user.getRole(), "admin")) {
                response.sendRedirect("/AdminView/index.jsp");  // 管理员登录成功，跳转到管理员页面
            } else if (Objects.equals(user.getRole(), "user")) {
                response.sendRedirect("/MainView/index.jsp");  // 登录成功，跳转到网站首页
            }
        } else {
            request.setAttribute("errorMessage", "用户名或密码错误！");
            request.getRequestDispatcher("/LoginView/login_fail.jsp").forward(request, response);  // 登录失败，返回登录页面
        }
    }

    // 获取用户信息
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");
        if (userIdStr != null) {
            int userId = Integer.parseInt(userIdStr);
            User user = userService.getUserById(userId);
            request.setAttribute("user", user);
            request.getRequestDispatcher("/userProfile.jsp").forward(request, response);  // 返回用户资料页面
        }
    }

    // 更新用户信息
    protected void doPostUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        // 获取当前登录用户ID
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");

        User user = new User();
        user.setUserId(userId);
        user.setUsername(username);
        user.setEmail(email);

        // 调用UserService更新用户信息
        boolean success = userService.updateUser(user);
        if (success) {
            response.sendRedirect("userProfile.jsp");  // 更新成功，跳转到用户资料页面
        } else {
            request.setAttribute("errorMessage", "更新失败！");
            request.getRequestDispatcher("/userProfile.jsp").forward(request, response);  // 更新失败，返回用户资料页面
        }
    }

    // 用户修改密码
    protected void doPostChangePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        // 获取当前登录用户ID
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");

        boolean success = userService.changePassword(userId, oldPassword, newPassword);
        if (success) {
            response.sendRedirect("login.jsp");  // 修改密码成功，跳转到登录页面
        } else {
            request.setAttribute("errorMessage", "旧密码不正确！");
            request.getRequestDispatcher("/changePassword.jsp").forward(request, response);  // 修改密码失败，返回修改页面
        }
    }

    // 用户注销
    protected void doPostLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();  // 销毁session，注销用户
        response.sendRedirect("index.jsp");  // 注销后跳转到首页
    }
}

