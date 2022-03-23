<%@page import="koreait.vo.HrdMember"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
td,th{
    border: 1px dotted gray;
}
td.col1_title {
    text-align: center;
    font-weight: bold;
    width: 40%;
    padding: 7px;
}
input[type=text]{
    padding: 5px;
    margin-left: 10px;
}
button {
    padding: 5px 15px;
    margin: 5px;
}


</style>
<title>day3 get 요청 처리</title>
</head>
<body>
	<%
		String custno = request.getParameter("custno");
		out.print("custno :");
		out.print(custno);
		out.print("<br>");
		int no=0;
		
		if(custno == null){   //?custno 자체가 없을때  http://localhost:8081/jsp1/day3/get_result.jsp
			out.print("<script>alert('검색값이 없습니다.');location.href='get_test.jsp';");
			out.print("</script>");
		}else {
			try{
				no = Integer.parseInt(custno);
			}catch(NumberFormatException e) {
		//form 태그 조회값 없이 실행됬을 때 http://localhost:8081/jsp1/day3/get_result.jsp?custno=
				out.print("<script>alert('잘못된 검색값입니다.');location.href='get_test.jsp';");
				out.print("</script>");
			}
		}
		
		HrdMemberDao dao = HrdMemberDao.getInstance();
		HrdMember member = dao.selectOne(no);
		out.print(member);
		
		String custno1 = request.getParameter("custno");
		
		
		
	%>
	<button onclick="history.back()">뒤로가기</button>
	<h4 style="text-align: center;">홈쇼핑 회원 수정</h4>
        <form action="member_update.jsp" method="post">  

			<!-- 화면에 표시하지 않고 입력요소로 전달하고 싶을 때 type = "hidden" -->
            <input type="hidden" name="num" value= "<%= member.getCustNo() %>" >            
            <table style="width:70%;margin:auto;">
                <tr>
                    <td class="col1_title">회원번호(자동발생)</td>
                    <td><input type="text" name="num" value= "<%= member.getCustNo() %>" 
                    disabled="disabled"></td>  
                    <!-- disabled 가 설정되어 있으면 파라미터값 전달안됩니다. -->
                </tr>
                <tr>
                    <td class="col1_title">회원성명</td>
                    <td><input type="text" name="name" value= "<%= member.getCustName() %>" disabled="disabled"></td>
                    <!-- required="required" 를 간단히 표현 -->
                </tr>  
                <tr>
                    <td class="col1_title">회원전화</td>
                    <td><input type="text" name="tel" size="30" value= "<%= member.getPhone() %>"></td>
                </tr> 
                <tr>
                    <td class="col1_title">회원주소</td>
                    <td><input type="text" name="addr" size="40" value= "<%= member.getAddress() %>" ></td>
                </tr>
	<tr>
                    <td class="col1_title">가입일자</td>
                    <td><input type="text" name="reg_date" value= "<%= member.getJoinDate() %>"  disabled="disabled"></td>
                </tr>  
                <tr>
                    <td class="col1_title">고객등급<br>[A:VIP,B:일반,C:직원]</td>
                    <td><input type="text" name="grade" value= "<%= member.getGrade() %>" disabled="disabled"></td>
                </tr>  
                <tr>
                    <td class="col1_title">도시코드</td>
                    <td><input type="text" name="city_code" value= "<%= member.getCity() %>"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <button>등록</button>
                        <button type="reset">다시쓰기</button>
                        -->
                    </td>
                </tr>

            </table>
        </form>
	
	<!-- 아래코드는 테스트용 -->
	<%-- <input value= "<%= member.getCustNo() %>"> 
	<input value= "<%= member.getCustName() %>"> 
	<input value= "<%= member.getPhone() %>"> 
	<input value= "<%= member.getJoinDate() %>"> 
	<input value= "<%= member.getAddress() %>"> 
	<input value= "<%= member.getGrade() %>"> 
	<input value= "<%= member.getCity() %>">  --%>
</body>
</html>