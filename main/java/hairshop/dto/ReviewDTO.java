package hairshop.dto;

import java.sql.Date;

public class ReviewDTO {
	
	private int rno; 
	private Date rdate;
	private String rwriter; //작성자
	private String rcontents; //내용
	private String rdno; //리뷰할 디자이너 번호
	private String rsno; //리뷰할 매장번호
	private String rofile;
	private String rsfile;
	


	private String rsname; //리뷰 표츌용 매장이름
	private String rdname; //리뷰 표츌용 디자이너이름
	
	public String getRofile() {
		return rofile;
	}
	public String getRsfile() {
		return rsfile;
	}
	public void setRofile(String rofile) {
		this.rofile = rofile;
	}
	public void setRsfile(String rsfile) {
		this.rsfile = rsfile;
	}
	public String getRsname() {
		return rsname;
	}
	public String getRdname() {
		return rdname;
	}
	public void setRsname(String rsname) {
		this.rsname = rsname;
	}
	public void setRdname(String rdname) {
		this.rdname = rdname;
	}
	public String getRsno() {
		return rsno;
	}
	public void setRsno(String rsno) {
		this.rsno = rsno;
	}
	public int getRno() {
		return rno;
	}
	public Date getRdate() {
		return rdate;
	}
	public String getRwriter() {
		return rwriter;
	}
	public String getRcontents() {
		return rcontents;
	}
	public String getRdno() {
		return rdno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public void setRcontents(String rcontents) {
		this.rcontents = rcontents;
	}
	public void setRdno(String rdno) {
		this.rdno = rdno;
	}
	
}
