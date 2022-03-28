<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp</title>
</head>
<body>
	<h3>요청 b.jsp</h3>
	<hr>
	<ul>
		<li>요청 URL : <%= request.getRequestURL() %></li>   <!--   L위치(주소)-->
		<li>요청 URI : <%= request.getRequestURI() %></li>	<!-- U(통합) R(리소스,자원) I(식별자) -->
		<li>session 애트리뷰트 sdata : <%= session.getAttribute("sdata") %></li>
		<!-- 실행 순서 : a.jsp 에서 ctrl + f11 확인
				그 다음에 index.jsp 실행 후 요청 링크로 a.jsp 로 확인
		-->
		<li>application 애트리뷰트 adata : <%=application.getAttribute("adata") %></li>
	</ul>
</body>
</html>