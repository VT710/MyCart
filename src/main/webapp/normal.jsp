<%@page import="com.vt.mycart.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if(user==null){
	session.setAttribute("message", "You are not Logged in !! Login First");
	response.sendRedirect("login.jsp");
	return;
}else{
	if(user.getUserType().equals("admin")){
		session.setAttribute("message", "  Do not access Other users page");
		response.sendRedirect("login.jsp");
		return;
	}
}


%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<h1>User Pannel</h1>

</body>
</html>