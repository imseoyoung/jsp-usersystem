<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="sylim.userex.UserDAO" %>
<%@ page import="sylim.userex.UserDTO" %>

<%
// 사용자 ID 가져오기
String id = request.getParameter("id");

// 사용자 정보 조회
UserDAO userDAO = new UserDAO();
UserDTO user = userDAO.getUserById(id);

if (user == null) {
    out.println("해당 사용자를 찾을 수 없습니다.");
} else {
    String name = user.getName();
    String password = user.getPassword();
    String phone = user.getPhone();
    String email = user.getEmail();
    String userstatus = user.getUserstatus();
    String userrole = user.getUserrole();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
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
        
        form {
            margin-top: 20px;
            display: inline-block;
			text-align: left;
        }
        
        label {
            display: inline-block;
            width: 120px;
            margin-bottom: 10px;
            font-weight: bold;
        }
        
        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 300px;
            padding: 5px;
            margin-bottom: 10px;
        }
        
        input[type="submit"] {
            padding: 5px 10px;
            background-color: #FFB9B9;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            width: 435px;
        }
        
        input[type="submit"]:hover {
            background-color: #ED9595;
        }
    </style>
</head>
<body>
    <h1>회원 정보 수정</h1>
    <form action="managemodifyOk.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <input type="hidden" name="phone" value="<%= phone %>">
        <input type="hidden" name="userstatus" value="<%= userstatus %>">
        <input type="hidden" name="userrole" value="<%= userrole %>">
        
        <label for="newName">새로운 이름:</label>
        <input type="text" name="newName" id="newName" required><br>
        <label for="newPassword">새로운 비밀번호:</label>
        <input type="password" name="newPassword" id="newPassword" required><br>
        <label for="newEmail">새로운 이메일:</label>
        <input type="email" name="newEmail" id="newEmail" required><br><br>
        
        <input type="submit" value="수정">
    </form>
</body>
</html>
<%
}
%>