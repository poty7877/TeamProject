package hairshop.dto;

public class UserDTO {

	private String umno;
	private String umname;
	private int ugrade; //유저등급
	private String ucount;
	private int umoney;
	
	
	public UserDTO() {}


	public String getUmno() {
		return umno;
	}


	public String getUmname() {
		return umname;
	}


	public int getUgrade() {
		return ugrade;
	}


	public String getUcount() {
		return ucount;
	}


	public int getUmoney() {
		return umoney;
	}


	public void setUmno(String umno) {
		this.umno = umno;
	}


	public void setUmname(String umname) {
		this.umname = umname;
	}


	public void setUgrade(int ugrade) {
		this.ugrade = ugrade;
	}


	public void setUcount(String ucount) {
		this.ucount = ucount;
	}


	public void setUmoney(int umoney) {
		this.umoney = umoney;
	}
	
	
}//class end
