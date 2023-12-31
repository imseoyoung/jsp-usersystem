<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sylim.userex.UserDAO" %>
<%@ page import="sylim.userex.UserDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입 승인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }
        
        h1 {
            color: #555;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        
        th {
            background-color: #f5f5f5;
        }
        
        input[type="checkbox"] {
            margin: 0;
            vertical-align: middle;
        }
        
        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #FFB9B9;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }
        
        input[type="submit"]:hover {
            background-color: #ED9595;
        }
    </style>
</head>
<body>
<h1>회원 가입 승인</h1>
<%
    UserDAO userDAO = new UserDAO();
    List<UserDTO> userList = userDAO.getUsersByStatus("승인 전");
%>
<form action="managejoinOk.jsp" method="post">
    <table>
        <thead>
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>상태</th>
            <th>승인</th>
        </tr>
        </thead>
        <tbody>
        <% for (UserDTO user : userList) { 
        String phoneNumber = user.getPhone();
        String formattedPhone = "010-" + "X".repeat(4) + "-" + "X".repeat(4);
        %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getName() %></td>
                <td><%= formattedPhone %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getUserstatus() %></td>
                <td>
                    <input type="checkbox" name="joinUsers" value="<%= user.getId() %>">
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
    <br>
    <input type="submit" value="승인">
</form>
</body>
</html>