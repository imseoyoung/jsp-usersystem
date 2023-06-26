<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sylim.userex.UserDAO" %>
<%@ page import="sylim.userex.UserDTO" %>

<%
    UserDTO user = (UserDTO) session.getAttribute("user");
    
    UserDAO userDAO = new UserDAO();
    
    user.setUserstatus("일시정지");
    int result = userDAO.updateUserStatus(user);
    
    if (result > 0) {
        // 회원탈퇴 성공
        session.invalidate(); // 세션을 무효화하여 로그아웃 처리
        response.sendRedirect("main.html"); // 탈퇴 후 메인 페이지로 리다이렉트
    } else {
        // 회원탈퇴 실패
        out.println("<script>alert('회원탈퇴에 실패했습니다.'); history.back();</script>");
    }
%>