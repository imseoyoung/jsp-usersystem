<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sylim.userex.UserDAO" %>
<%@ page import="sylim.userex.UserDTO" %>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("pw");
    
    UserDAO userDAO = new UserDAO();
    
    UserDTO user = userDAO.getUserById(id);
    
    if (user != null) {
        if (password.equals(user.getPassword())) {
            // 회원 상태가 "정상"이고 사용자 역할이 "일반사용자"인 경우에만 로그인 허용
            if (user.getUserstatus().equals("정상") && user.getUserrole().equals("일반사용자")) {
                // 로그인 성공
                session.setAttribute("user", user);
                response.sendRedirect("userInfo.jsp");
            } else {
                // 회원 상태가 "정상"이 아니거나 사용자 역할이 "일반사용자"가 아닌 경우
                out.println("<script>alert('회원 가입 승인 전 또는 일시 정지 상태입니다.'); history.back();</script>");
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
