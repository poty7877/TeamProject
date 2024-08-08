package hairshop.dto;

public class MemberDTO {
	
	private int mno;
	private String mid;
	private String mpw;
	private String mname;
	private String mphone;
	private int mgrade; // 1 : 매니저 2: 디자이너 3: 일반유저
	private String mssno;
	private String mdate;

	
	
	
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getMssno() {
		return mssno;
	}
	public void setMssno(String mssno) {
		this.mssno = mssno;
	}
	public int getMno() {
		return mno;
	}
	public String getMid() {
		return mid;
	}
	public String getMpw() {
		return mpw;
	}
	public String getMname() {
		return mname;
	}
	public String getMphone() {
		return mphone;
	}
	public int getMgrade() {
		return mgrade;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public void setMgrade(int mgrade) {
		this.mgrade = mgrade;
	}

}//class end
