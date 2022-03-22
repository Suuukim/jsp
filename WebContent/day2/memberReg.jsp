<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- memberReg.html 에서 입력한 7개의 사용자 입력값을 전달받아서 table 태그에 출력해보세요.-->
<%
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");
	
%>

<table>
	<tr>
		<th>이름</th>
		<td><%= name%></td>
	</tr>
	<tr>
		<th>패스워드</th>
		<td><%= password%></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%= email%></td>
	</tr>
	<tr>
		<th>나이</th>
		<td><%= age%></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><%= addr %></td>
	</tr>
	<tr>
		<th>성별</th>
		<td><%= gender%></td>
	</tr>
	<tr>
		<th>취미</th>
		<td><%for(int i=0;i<hobby.length;i++) { 
			out.print(hobby[i]);
			out.print("/");} %>
		</td>
	</tr>

</table>
</body>
</html>