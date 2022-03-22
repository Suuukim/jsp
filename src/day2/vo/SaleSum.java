package day2.vo;

public class SaleSum {	//join 결과 컬럼만 저장할 vo 클래스
	private String custNo;
	private String custName;
	private String grade;
	private int sum;
	
	//생성자
	public SaleSum(String custNo, String custName, String grade, int sum) {
		super();
		this.custNo = custNo;
		this.custName = custName;
		this.grade = grade;
		this.sum = sum;
	}

	//getter,setter
	public String getCustNo() {
		return custNo;
	}

	public void setCustNo(String custNo) {
		this.custNo = custNo;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}
	
	
	
	



}
