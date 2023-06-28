<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
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
        }
        
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <h1>User List</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Password</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Status</th>
            <th>Role</th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.getId()}</td>
                <td>${user.getName()}</td>
                <td>${user.getPassword()}</td>
                <td>${user.getPhone()}</td>
                <td>${user.getEmail()}</td>
                <td>${user.getUserstatus()}</td>
                <td>${user.getUserrole()}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
