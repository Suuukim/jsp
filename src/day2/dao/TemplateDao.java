package day2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day1.OracleConnectUtil;
import day2.vo.Member;
import day2.vo.SaleSum;

public class TemplateDao {
	
	
	//싱글톤 패턴
	private static TemplateDao dao = new TemplateDao(); 
	private TemplateDao() { }
	public static TemplateDao getCustomDao() {
		return dao;
	}
	
	
	//insert,update SQL 실행메소드의 인자는 테이블의 컬럼과 매핑되는 vo 클래스로 합니다.
	public void insert(Member vo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = ""; 
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
		
			//? 파라미터에 넘겨줄 값을 set메소드로 설정합니다.
			
			pstmt.execute();
			System.out.println("회원 등록이 완료 되었습니다.");
			pstmt.close();
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " +  e.getMessage());
		}
		OracleConnectUtil.close(conn);	
	}
	
	public void update(Member vo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = ""; 
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
		
			
			pstmt.execute();
			System.out.println("회원 수정이 완료 되었습니다.");
			pstmt.close();
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " +  e.getMessage());
		}
		OracleConnectUtil.close(conn);	
	}
	
	//select SQL 실행메소드의 리턴타입이 테이블의 컬럼과 매핑되는 vo 클래스로 합니다.
	//전체가져오는 select는 List의 <T> 제너릭타입이 vo클래스입니다.
	public List<Member> selectMemberAll() {
		Connection conn = OracleConnectUtil.connect();
		String sql="";
		PreparedStatement pstmt = null;
		ResultSet rs= null;		
		List<Member> members = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();	//select 
			
			while(rs.next()) {
				//리스트에 읽어온 행을 1개씩 추가하기(더이상 행이 없을때까지 반복)
				//객체는 vo 클래스 타입. -> 테이블의 각 컬럼값을 vo클래스
			}
			pstmt.close();
			
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		
		}
		
		OracleConnectUtil.close(conn);
		return members;
	}
	
	public Member selectMember(int cust_no) {
		
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		String sql="";
		Member member=null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//조회결과가 있으면 1개 행을 가져와 객체 생성하기
				
			}
			
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		
		}
		return member;
	}
	
	//위의 selectMemberAll() 메소드에서 List의 객체 타입만 다름.
	public List<SaleSum> selectSale(){
		Connection conn = OracleConnectUtil.connect();
		String sql="";
		PreparedStatement pstmt = null;
		ResultSet rs= null;		
		List<SaleSum> sales = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();	//select 
			
			while(rs.next()) {
			
			}
			pstmt.close();
			
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		
		}
		
		OracleConnectUtil.close(conn);
		return sales;
	}
}
