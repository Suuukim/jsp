<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP1 프로젝트[3]</title>
</head>
<body>
	
	<h3>Request 객체의 정보</h3>
	<hr> 
	<!-- request 객체의 타입은?	HttpServletRequest 클래스이고 사용자가 요청을 보내는 객체입니다. -->
	<!-- 요청 url : http://localhost:8082/jsp1/day2/request_object.jsp 
		요청 url의 localhost를 내컴퓨터 ip로 바꿔보기 (cmd창에서 ipconfig 명령실행하면 ip 알 수 있습니다.)
				 http://192.168.1.1:8082/jsp1/day2/request_object.jsp 
	-->
	
	<ul>
		<li>요청 URL : <%= request.getRequestURL() %></li>   <!--   L위치(주소)-->
		<li>요청 URI : <%= request.getRequestURI() %></li>	<!-- U(통합) R(리소스,자원) I(식별자) -->
															<!-- /jsp1/day2/request_object.jsp -->
		<li>컨텍스트(context,프로젝트 이름) : <%=request.getContextPath() %></li>  <!-- 프로젝트이름 /jsp1 -->
		<li>서버 IP : <%= request.getLocalAddr() %>, 서버컴퓨터 이름 : <%= request.getLocalName() %></li>
		<li>서버 Port : <%= request.getLocalPort() %></li>
		<li>클라이언트 IP : <%= request.getRemoteAddr() %></li>  <!-- IPv6 (64바이트,16진수 16자리로 표시 ) 
																   IPv4 : 32비트-->
		<%    	//request 객체로 전달되는 인코딩 형식 설정.
				request.setCharacterEncoding("UTF-8"); //이 명령 없으면 아래 결과는 null%>
		<li>문자 인코딩 형식 : <%= request.getCharacterEncoding() %></li>
		<li></li>
	</ul>
	<!-- 출력 IPv4 설정 : Run -> Run Configurations -> tomcat -> Arguments -> VM Arguments 에 입력
								- Djava.net.preferIPv4Stack=true -->
	 
</body>
</html>