package hairshop.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import common.Connection_pool;
import hairshop.dto.CutDTO;

public class CutDAO extends Connection_pool {


	
	public int insertHair(CutDTO dto) { // 헤어컷 추가 메서드 2024_08_06
		int applyResult = 0;
		String query = "insert into cut (cno,csno,csname,ccutname,cprice,ccontents,ofile, sfile) "
				+ "values (cno_seq.nextval,?,?,?,?,?,?,?)";
		try {
			pst = con.prepareStatement(query);
			pst.setString(1, dto.getCsno());
			pst.setString(2, dto.getCsname());
			pst.setString(3, dto.getCcutname());
			pst.setString(4, dto.getCprice());
			pst.setString(5, dto.getCcontents());
			pst.setString(6, dto.getOfile());
			pst.setString(7, dto.getSfile());

			applyResult = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return applyResult;
	}// end insertHair

	public List<CutDTO> hairCutList() { // 헤어 리스트 출력 메서드 2024_08_06
		List<CutDTO> hairList = new Vector<CutDTO>();

		try {
			String qurey = "select * from cut order by cno desc"; // 모든 데이터를 찾아옴(내림차순)

			pst = con.prepareStatement(qurey);
			rs = pst.executeQuery(); // 쿼리문 실행 후 결과를 표로 받음

			while (rs.next()) {

				CutDTO dto = new CutDTO(); // 빈 객체 생성

				dto.setCno(rs.getString("cno"));
				dto.setCsno(rs.getString("csno"));
				dto.setCsname(rs.getString("csname"));
				dto.setCcutname(rs.getString("ccutname"));
				dto.setCcontents(rs.getString("ccontents"));
				dto.setCprice(rs.getString("cprice"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));

				hairList.add(dto); // 리스트에 객체 삽입
			}
		} catch (SQLException e) {
			System.out.println("MyfileDAO.myFileList() 메서드 오류");
			System.out.println("select 쿼리문을 확인하세요");
			e.printStackTrace();
		}

		return hairList; // 결론 테이블에 있는 모든 값이 리스트의 객체로 리턴한다
	}

	public int deleteHairCut(int cno) {
		int resultDel = 0;
		String query = "delete from cut where cno=?";

		try {
			pst = con.prepareStatement(query);
			pst.setInt(1, cno);

			resultDel = pst.executeUpdate();
		} catch (SQLException e) {
			System.out.println("오류 경로 : CutDAO.deleteHairCut() ");
			e.printStackTrace();
		}

		return resultDel;
	}// end insertHair

	public CutDTO selectHair(int cno) { // 특정 헤어컷 값 불러오는 메서드 2024_08_07
		CutDTO selectHair = new CutDTO();

		String qurey = "select * from cut where cno=?"; // 모든 데이터를 찾아옴(내림차순)

		try {
			pst = con.prepareStatement(qurey);
			pst.setInt(1, cno);

			rs = pst.executeQuery(); // 쿼리문 실행 후 결과를 표로 받음

			while (rs.next()) {
				selectHair.setCno(rs.getString("cno"));
				selectHair.setCsno(rs.getString("csno"));
				selectHair.setCsname(rs.getString("csname"));
				selectHair.setCcutname(rs.getString("ccutname"));
				selectHair.setCprice(rs.getString("cprice"));
				selectHair.setCcontents(rs.getString("ccontents"));
				selectHair.setOfile(rs.getString("ofile"));
				selectHair.setSfile(rs.getString("sfile"));
			}
		} catch (SQLException e) {
			System.out.println("오류 경로 : CutDAO.selectHair() 메소드 오류");
			e.printStackTrace();
		}

		return selectHair; // 결론 테이블에 있는 모든 값이 리스트의 객체로 리턴한다
	}// end selectHair()

	public int editHairCut(String cname, String ccontents, String price, int cno) { // 특정 헤어컷 값 불러오는 메서드 2024_08_07
		int editresult = 0;
		String query = "update cut set ccutname=?, ccontents=?, cprice=? where cno=?";

			try {
				pst = con.prepareStatement(query);
				pst.setString(1, cname);
				pst.setString(2, ccontents);
				pst.setString(3, price);
				pst.setInt(4, cno);

				editresult = pst.executeUpdate();
			} catch (SQLException e) {
				System.out.println("오류 경로 : CutDAO.editHairCut()");
				e.printStackTrace();
			}
		return editresult;
	}// end insertHair
	
	
	
	
	
}// class end
