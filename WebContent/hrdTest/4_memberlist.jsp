<%@page import="koreait.vo.HrdMember"%>
<%@page import="java.util.List"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회/수정</title>
<link rel="stylesheet" href="0_hrdkorea.css">
</head>
	
<body>
  <div class="wrap_container">
  <header>
        <h3 class="header-item">쇼핑몰 회원관리 ver1.0</h3>
    </header>
    <nav class="haeder-nav">
        <ul class="container">
          	<li><a href="2_insertForm.jsp">회원등록</a></li>
            <li><a href="4_memberlist.jsp">회원목록조회/수정</a></li>
            <li><a href="7_saleList.jsp">회원매출조회</a></li>
            <li><a href="1_index.jsp">홈으로.</a></li>
        </ul>
    </nav>
	 <section>
            <h2 style="text-align: center;" class="section"><strong>회원목록조회/수정</strong></h2>
            <table style="width: 90%;margin: auto;text-align: center;"> 
                <tr style="text-align: center;">    
                    <td><strong>회원번호</strong></td>       
                    <td><strong>회원성명</strong></td>
                    <td><strong>전화번호</strong></td>
                    <td><strong>주소</strong></td>
                    <td><strong>가입일자</strong></td>
                    <td><strong>고객등급</strong></td>
                    <td><strong>거주지역</strong></td>
                </tr>
            <%
				//테이블의 데이터 모두 가져오기
				HrdMemberDao dao =HrdMemberDao.getInstance();
				List<HrdMember> list = dao.selectAll();
			%>
				
			<%
				for(int i=0;i<list.size();i++){
			%>
				<tr> 
					<td > <a style="color: blue;" href="5_updateForm.jsp?custno=<%= list.get(i).getCustNo()%>">
					:<%=list.get(i).getCustNo() %></a> 
					</td>
					<td><%=list.get(i).getCustName()%></td>
					<td><%=list.get(i).getPhone() %></td>
					<td><%=list.get(i).getAddress()%></td>
					<td><%=list.get(i).getJoinDate()%></td>
					<td><%
						String temp = list.get(i).getGrade();
						switch(temp) {
						case "A":
							out.print("VIP");
							break;
						case "B":
							out.print("일반");
							break;
						case "C":
							out.print("직원");
							break;
						}
					
					%></td>
					<td><%=list.get(i).getCity()%></td>
				</tr>
			<%
				}
			%>					
              	
            </table>

        </section>
    <footer>
        <p>HRDKOREA Copyrightⓒ2016 All rights reserved. Human Resources Development Service of Korea</p>
    </footer>
    </div>
</body>
</html>