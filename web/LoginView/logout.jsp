<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 清除会话中的所有用户信息
    session.invalidate();

    // 跳转到登录页面
    response.sendRedirect("/LoginView/login.jsp");
%>
