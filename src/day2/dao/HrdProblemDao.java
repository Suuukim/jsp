package day2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import day1.OracleConnectUtil;
import day2.vo.SaleSum;

public class HrdProblemDao {	 //Data Access Object : db의 sql실행 메소드정의 클래스

	
	//회원 insert     : insert
	//회원 update		 : update
	//회원 전체 select   : selectMemberAll
	//회원 pk select    : selectMember
	//매출집계 select   : selectSale
	private static HrdProblemDao hrd = new HrdProblemDao();
	private HrdProblemDao() {}
	public static HrdProblemDao getProblemDao() {
		return hrd;
	}
	
	//insert
	public void insert(SaleSum vo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "INSERT INTO MEMBER_TBL_02" +
						"(CUSTNO,CUSTNAME,PHONE,ADDRESS,JOINDATE,GRADE,CITY)"+ 
						"VALUES(?,?,?,?,TIMESTAMP,?,?,?)";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getCustNo());
			pstmt.setString(2, vo.getCustName());
			pstmt.setString(3, vo.getGrade());
			pstmt.setInt(4, vo.getSum());
			
			
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
	
	OracleConnectUtil.close(conn);
	}

	//update
	public void update() {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql  ="UPDATE MEMBER_TBL_02 SET CUSTNAME=?, PHONE=?, ADDRESS=?,CITY=? WHERE CUSTNO = ?";
		String custno=null;
		String custname1=null;
		String 
	
	}	
	
	
	
}