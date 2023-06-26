<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="sylim.userex.UserDAO" %>
<%@ page import="sylim.userex.UserDTO" %>

<%
// 파라미터 가져오기
String id = request.getParameter("id");
String phone = request.getParameter("phone");
String userstatus = request.getParameter("userstatus");
String userrole = request.getParameter("userrole");
String newName = request.getParameter("newName");
String newPassword = request.getParameter("newPassword");
String newEmail = request.getParameter("newEmail");

// 사용자 정보 객체 생성 및 설정
UserDTO user = new UserDTO(id, newName, newPassword, phone, newEmail, userstatus, userrole);

// 사용자 정보 업데이트
UserDAO userDAO = new UserDAO();
int result = userDAO.updateUser(user);

if (result > 0) {
   	response.sendRedirect("manageInfo.jsp");
} else {
    out.println("사용자 정보 수정에 실패하였습니다.");
}
%>
