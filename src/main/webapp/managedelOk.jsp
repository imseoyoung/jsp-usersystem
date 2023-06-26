<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sylim.userex.UserDAO" %>
<%@ page import="sylim.userex.UserDTO" %>
<%
    String[] delUsers = request.getParameterValues("delUsers");
    
    if (delUsers != null) {
        UserDAO userDAO = new UserDAO();
        
        for (String userId : delUsers) {
            userDAO.deleteUser(userId);
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴 승인 완료</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
            text-align: center;
        }
        
        p {
            color: #555;
            font-size: 18px;
            margin-bottom: 20px;
        }
        
        a {
            display: inline-block;
            padding: 10px;
            width: 200px;
            background-color: #FFB9B9;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
        }
        
        a:hover {
            background-color: #ED9595;
        }
    </style>
</head>
<body>
    <p>회원 탈퇴 승인이 완료되었습니다.</p>
    <a href="confirm.html">회원관리하기</a><br>
	<a href="logout.jsp">로그아웃</a>
</body>
</html>
