<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sylim.userex.UserDAO" %>
<%@ page import="sylim.userex.UserDTO" %>

<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    
    UserDTO user = (UserDTO) session.getAttribute("user");
    
    user.setName(name);
    user.setPassword(password);
    user.setPhone(phone);
    user.setEmail(email);
    
    UserDAO userDAO = new UserDAO();
    
    int result = userDAO.updateUser(user);
    
    if (result > 0) {
        // 사용자 정보 업데이트 성공
        out.println("<script>alert('회원 정보 업데이트가 완료되었습니다'); history.back();</script>");
        session.setAttribute("user", user);
        response.sendRedirect("userInfo.jsp");
    } else {
        // 사용자 정보 업데이트 실패
        out.println("<script>alert('회원 정보 업데이트에 실패했습니다.'); history.back();</script>");
    }
%>