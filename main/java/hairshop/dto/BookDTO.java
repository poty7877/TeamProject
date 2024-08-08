package hairshop.dto;

import java.sql.Date;

public class BookDTO {
	
	private String bno;
	private String bsname;
	private String bdate; // yyyy-MM-dd hh:mm
	private String bdno;
	private String bdname;
	private String bcut;
	private String buno;
	
	public BookDTO() {}
	
	public String getBno() {
		return bno;
	}
	public String getBsname() {
		return bsname;
	}
	public String getBdate() {
		return bdate;
	}
	public String getBdno() {
		return bdno;
	}
	public String getBdname() {
		return bdname;
	}
	public String getBcut() {
		return bcut;
	}
	public String getBuno() {
		return buno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public void setBsname(String bsname) {
		this.bsname = bsname;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public void setBdno(String bdno) {
		this.bdno = bdno;
	}
	public void setBdname(String bdname) {
		this.bdname = bdname;
	}
	public void setBcut(String bcut) {
		this.bcut = bcut;
	}
	public void setBuno(String buno) {
		this.buno = buno;
	}
	
	

}//class end
