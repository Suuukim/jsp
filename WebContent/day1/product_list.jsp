<%@page import="day1.Product"%>
<%@page import="day1.ProductDao"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="day1.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
<!-- 오라클과 jdbc 연결을 위해서 ojdbc6.jar 라이브러리 추가해야 합니다.
: [WebContent 폴더] - 	[WEB-INF폴더] - [lib] 폴더에 파일을 복사합니다
-->
<%
	ProductDao dao = ProductDao.getProductDao();
	List<Product> list = dao.selectAll();
%>	
	<h3>TBL_PRODUCT# 테이블 데이터</h3>
	<table>
		<caption>현재 시간 : <%= LocalDate.now() %></caption>
		<tr>
			<th>상품코드</th>
			<th>카테고리</th>
			<th>상품이름</th>
			<th>가격</th>
			
		</tr>
		<!-- 아래의 1행 한명의 MyUser 객체 출력을 list 크기만큼 반복합니다. -->
	<%
		for(Product p : list){		//for(MyUser user : list)
	%>
		<tr> <!-- MyUser 타입 객체의 데이터를 출력 -->
			<td><%= p.getPcode()%></td>             
			<td><%= p.getCategory()%></td>
			<td><%= p.getPname()%></td>
			<td><%= p.getPrice()%></td>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>