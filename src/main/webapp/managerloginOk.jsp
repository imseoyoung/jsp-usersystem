<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sylim.userex.UserDAO" %>
<%@ page import="sylim.userex.UserDTO" %>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("pw");
    
    UserDAO userDAO = new UserDAO();
    
    UserDTO manager = userDAO.getUserById(id);
    
    if (manager != null) {
        if (password.equals(manager.getPassword())) {
            if (manager.getUserrole().equals("관리자")) {
                // 로그인 성공
                session.setAttribute("manager", manager);
                response.sendRedirect("confirm.html");
            } else {
                // 사용자 역할이 "관리자"가 아닌 경우
                out.println("<script>alert('관리자 권한이 없습니다.'); history.back();</script>");
            }
        } else {
            // 비밀번호가 일치하지 않음
            out.println("<script>alert('비밀번호가 일치하지 않습니다.'); history.back();</script>");
        }
    } else {
        // 사용자가 존재하지 않음
        out.println("<script>alert('존재하지 않는 사용자입니다.'); history.back();</script>");
    }
%>