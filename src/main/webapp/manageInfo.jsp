<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sylim.userex.UserDAO" %>
<%@ page import="sylim.userex.UserDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 정보 관리</title>
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
            border: 1px solid #ccc;
            text-align: center;
        }
        
        th {
            background-color: #f9f9f9;
            font-weight: bold;
        }
        
        a {
            display: inline-block;
            padding: 5px 10px;
            background-color: #FFB9B9;
            color: #fff;
            text-decoration: none;
            border-radius: 3px;
        }
        
        a:hover {
            background-color: #ED9595;
        }
    </style>
</head>
<body>
    <h1>회원 정보 수정</h1>
    <table>
        <thead>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>상태</th>
                <th>수정</th>
            </tr>
        </thead>
        <tbody>
            <% 
            UserDAO userDAO = new UserDAO();
            List<UserDTO> userList = userDAO.getAllUsers();
            
            for (UserDTO user : userList) {
                String phoneNumber = user.getPhone();
                String formattedPhone = "010-" + "X".repeat(4) + "-" + "X".repeat(4);
            %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getName() %></td>
                <td><%= formattedPhone %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getUserstatus() %></td>
                <td><a href="managemodify.jsp?id=<%= user.getId() %>">수정</a></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>