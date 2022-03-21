package day1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class ProductDao {
	//변수명 한꺼번에 바꾸기 : alt + shift + r (커서놓고 해야함)
	
	private static ProductDao productdao = new ProductDao();
	
	private ProductDao() {
		
	}
	
	public static ProductDao getProductDao() {
		return productdao;
	}
	
	public void insert(Product vo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "INSERT INTO TBL_Product# "+ 
				"(PCODE, CATEGORY, PNAME, PRICE)" + 
				" VALUES(PCODE, ?, ?, ?)"; 
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(2, vo.getCategory());
			pstmt.setString(3, vo.getPname());
			pstmt.setInt(4, vo.getPrice());
			
			pstmt.execute();
			System.out.println("고객 1건이 새로 등록되었습니다.!!");
			pstmt.close();
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " +  e.getMessage());
		}
		OracleConnectUtil.close(conn);	
	}
	
	public void update(Product vo) { 
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE TBL_Product# SET CATEGORY=? WHERE PNAME=?"; 
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(2, vo.getCategory());  
			pstmt.setString(3, vo.getPname());	
			
			pstmt.execute();
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		System.out.println("정상적으로 email이 변경되었습니다.");
		OracleConnectUtil.close(conn);
	}
	
	public void delete(String category) { 
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql ="DELETE FROM TBL_Product# WHERE CATEGORY=?";
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(2, category);
			pstmt.execute();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL실행 오류 : "  +e.getMessage());
		}
		System.out.println("정상적으로 회원 탈퇴 되었습니다.");
		OracleConnectUtil.close(conn);
	}
	
	public List<Product> selectAll() {
		Connection conn = OracleConnectUtil.connect();
		String sql ="select * from tbl_product#";
		PreparedStatement pstmt = null;
		ResultSet rs = null;  
		List<Product> products= new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				products.add(new Product(rs.getString(1),
							rs.getString(2), 
							rs.getString(3), 
							rs.getInt(4)));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL실행 오류  : " +  e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return products;
	}
	
	public static Product selectOne(String category) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "select * from tbl_product# where category=?";
		ResultSet rs = null;
		Product vo = null;
		//?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(2, category);
			rs = pstmt.executeQuery();
			if(rs.next()) { 	// 조회 결과 1개 행 있으면
				vo = new Product();
				vo.setCategory(rs.getString(2));
				vo.setPname(rs.getString(3));
				vo.setPrice(rs.getInt(4));
			}  
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return vo;
	}
}
