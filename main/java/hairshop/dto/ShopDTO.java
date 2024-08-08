package hairshop.dto;

public class ShopDTO {
	private String sno; //매장 번호
	private String smno; //매장 관리자 번호
	private String sname; //매장이름
	private String slocation; //매장 위치
	private String sopen; //매장 오픈시간
	private String sclose; //매장 클로즈 시간
	
	//constructor
		public ShopDTO() {} // basic constructor
		
		
		public ShopDTO(String sname, String slocation, String sopen, String sclose) {
		super();
		this.sname = sname;
		this.slocation = slocation;
		this.sopen = sopen;
		this.sclose = sclose;
	}


		public String getSno() {
			return sno;
		}

		public String getSmno() {
			return smno;
		}

		public String getSname() {
			return sname;
		}

		public String getSlocation() {
			return slocation;
		}

		public String getSopen() {
			return sopen;
		}

		public String getSclose() {
			return sclose;
		}

		public void setSno(String sno) {
			this.sno = sno;
		}

		public void setSmno(String smno) {
			this.smno = smno;
		}

		public void setSname(String sname) {
			this.sname = sname;
		}

		public void setSlocation(String slocation) {
			this.slocation = slocation;
		}

		public void setSopen(String sopen) {
			this.sopen = sopen;
		}

		public void setSclose(String sclose) {
			this.sclose = sclose;
		}
		
		
}// class end
