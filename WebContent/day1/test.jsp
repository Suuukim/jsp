<%@page import="day1.MyUser"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	table{
		width:70%;
		margin:auto;
		border-collapse: collapse;
	}
	caption {
		text-align: right;font-size: 0.8em;
	}
	td,th{
		border : 1px solid gray;
		text-align: center;
		padding: 7px 4px;
	}
	th{
		background-color: tomato;
		color:white;
	}
</style>
<body>
	<%
		List<MyUser> girl = new ArrayList<>();
		girl.add(new MyUser("아이유",25,"서울시 강남구"));
		girl.add(new MyUser("태연",29,"서울시 관악구"));
		girl.add(new MyUser("카리나",22,"충남 당진시"));
	%>
	
	<table>
		<tr> 
		<th>이름</th>
		<th>나이</th>
		<th>주소</th>
		</tr>
		
		<% 
			for(int i=0;i<girl.size();i++) {
				MyUser user = girl.get(i);
		%>
			<tr> 
				<td><%=user.getName()%></td>
				<td><%=user.getAge()%></td>
				<td><%=user.getAddress()%></td>
			</tr>
		
		<%
		}
		%>
	</table>
</body>
</html>