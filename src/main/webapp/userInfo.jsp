<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sylim.userex.UserDTO" %>
<%@ page import="sylim.userex.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
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
    
    table {
        margin: 0 auto;
        border-collapse: collapse;
    }
    
    table th, table td {
        padding: 10px;
        border: 1px solid #ddd;
    }
    
    table th {
        background-color: #f2f2f2;
    }
    
    a {
        display: inline-block;
        padding: 10px;
        width: 200px;
        background-color: #FFB9B9;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        margin-top: 10px;
    }
    
    a:hover {
        background-color: #ED9595;
    }
</style>
</head>
<body>
    <h1>회원 정보</h1>
    <% 
    UserDTO user = (UserDTO) session.getAttribute("user");

    if (user != null) { %>
        <table>
            <tr>
                <td>아이디</td>
                <td><%= user.getId() %></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><%= user.getName() %></td>
            </tr>
            <tr>
                <td>연락처</td>
                <td><%= user.getPhone() %></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><%= user.getEmail() %></td>
            </tr>
        </table>
        <br>
    <% } else { %>
        <script>alert('로그인 후에 이용해주세요.'); history.back();</script>
    <% } %>
    
    <a href="usermodify.jsp">회원 정보 수정하기</a><br>
    <a href="userdel.jsp">회원 탈퇴하기</a><br>
    <a href="logout.jsp">로그아웃</a><br>
</body>
</html>
