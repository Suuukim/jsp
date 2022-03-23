<%@page import="koreait.dao.HrdMemberDao"%>
<%@page import="koreait.vo.HrdMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int custno = Integer.parseInt(request.getParameter("num"));
		
		HrdMember vo = new HrdMember();
		vo.setCustNo(custno);
		out.print(vo);
		
		HrdMemberDao dao = HrdMemberDao.getInstance();
		dao.delete(custno);
		out.print(dao.selectOne(custno));
	%>
</body>
</html>