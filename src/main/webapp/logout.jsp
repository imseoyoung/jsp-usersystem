<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그아웃</title>
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
        
        p {
            margin: 10px 0;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <h1>로그아웃</h1>
    <%
        // 세션 무효화
        session.invalidate();
    %>
    <p>로그아웃되었습니다.</p>
</body>
</html>