<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sylim.userex.UserDAO"%>
<%@ page import="sylim.userex.UserDTO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 수정</title>
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
	display: inline-block;
	text-align: left;
}

label {
	display: inline-block;
	width: 120px;
	font-weight: bold;
	margin-bottom: 10px;
}

input[type="text"], input[type="password"] {
	width: 300px;
	padding: 5px;
	margin-bottom: 10px;
}

input[type="submit"] {
	padding: 10px 20px;
	width: 430px;
	background-color: #FFB9B9;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #ED9595;
}
</style>
</head>
<body>
	<h1>사용자 정보 수정</h1>
	<%
	UserDTO user = (UserDTO) session.getAttribute("user");

	if (user == null) {
	    // 로그인되지 않은 경우, 로그인 페이지로 이동
	    response.sendRedirect("login.jsp");
	    return;
	}
	%>
	<form action="usermodifyOk.jsp" method="post">
		<label for="name">이름:</label> <input type="text" id="name" name="name"
			value="<%=user.getName()%>"><br>
		<br> <label for="password">비밀번호:</label> <input type="password"
			id="password" name="password" value=""><br>
		<br> <label for="phone">전화번호:</label> <input type="text"
			id="phone" name="phone" value="<%=user.getPhone()%>"><br>
		<br> <label for="email">이메일:</label> <input type="text"
			id="email" name="email" value="<%=user.getEmail()%>"><br>
		<br> <input type="submit" value="수정">
	</form>
</body>
</html>