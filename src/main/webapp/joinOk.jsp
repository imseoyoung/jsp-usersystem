<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sylim.userex.UserDTO" %>
<%@ page import="sylim.userex.UserDAO" %>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    
    String userstatus = "승인 전";
    String userrole = "일반사용자";

    UserDTO user = new UserDTO(id, name, password, phone, email, userstatus, userrole);

    UserDAO userDAO = new UserDAO();
    userDAO.insertUser(user);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입 완료</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
            text-align: center;
        }
        
        h1 {
            color: #555;
        }
        
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #FFB9B9;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
        }
        
        .btn:hover {
            background-color: #ED9595;
    </style>
</head>
<body>
    <h1>회원 가입이 요청이 완료되었습니다.</h1>
    <a href="main.html" class="btn">메인페이지</a>
</body>
</html>