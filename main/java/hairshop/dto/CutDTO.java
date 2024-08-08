package hairshop.dto;

public class CutDTO {
	private String cno;
	private String csno;
	private String csname;
	private String ccutname;
	private String cprice;
	private String ccontents;
	private String ofile;
	private String sfile;
	
public CutDTO() {} // basic constructor
	

	public String getCno() {
		return cno;
	}

	public String getCsno() {
		return csno;
	}

	public String getCsname() {
		return csname;
	}

	public String getCcutname() {
		return ccutname;
	}

	public String getCprice() {
		return cprice;
	}

	public String getCcontents() {
		return ccontents;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public void setCsno(String csno) {
		this.csno = csno;
	}

	public void setCsname(String csname) {
		this.csname = csname;
	}

	public void setCcutname(String ccutname) {
		this.ccutname = ccutname;
	}

	public void setCprice(String cprice) {
		this.cprice = cprice;
	}

	public void setCcontents(String ccontents) {
		this.ccontents = ccontents;
	}
	
	public String getOfile() {
		return ofile;
	}

	public String getSfile() {
		return sfile;
	}

	public void setOfile(String ofile) {
		this.ofile = ofile;
	}

	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	

	

}//class end
