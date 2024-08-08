package hairshop.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.Connection_pool;
import hairshop.dto.MemberDTO;
import hairshop.dto.ShopDTO;

public class MemberDAO extends Connection_pool {

	public MemberDTO login(String id, String pw) {
		MemberDTO memberDTO = null;
		String sql = "SELECT * FROM member WHERE mid=? AND mpw=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, pw);
			rs = pst.executeQuery();
			if (rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setMno(rs.getInt("MNO"));
				memberDTO.setMid(rs.getString("MID"));
				memberDTO.setMpw(rs.getString("MPW"));
				memberDTO.setMname(rs.getString("MNAME"));
				memberDTO.setMphone(rs.getString("MPHONE"));
				memberDTO.setMssno(rs.getString("MSSNO"));
				memberDTO.setMgrade(rs.getInt("MGRADE"));
				memberDTO.setMdate(rs.getString("MDATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return memberDTO;
	}

	public int join(MemberDTO memberDTO) {
		String sql = "INSERT INTO MEMBER(MNO, MID, MPW, MNAME, MPHONE, MSSNO, MGRADE)"
				+ "VALUES(MNO_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		int result = 0;

		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, memberDTO.getMid());
			pst.setString(2, memberDTO.getMpw());
			pst.setString(3, memberDTO.getMname());
			pst.setString(4, memberDTO.getMphone());
			pst.setString(5, memberDTO.getMssno());
			pst.setInt(6, memberDTO.getMgrade());
			result = pst.executeUpdate();

			if (result > 0) {
				System.out.println("회원가입 성공");
			} else {
				System.out.println("회원가입 실패");
			}

		} catch (SQLException e) {
			System.out.println("MemberDAO.join() 오류발생");
			e.printStackTrace();
		}

		return result;
	}

	public ShopDTO get_shopDTO(MemberDTO memberDTO) {
		ShopDTO sdto = new ShopDTO();
		String query = "select * from shop where smno=?";
		try {
			pst = con.prepareStatement(query);
			pst.setInt(1, memberDTO.getMno());
			rs = pst.executeQuery();
			if (rs.next()) {
				sdto.setSname(rs.getString("sname"));
				sdto.setSmno(rs.getString("smno"));
			}
		} catch (SQLException e) {
			System.out.println("MemberDAO.get_shopDTO 오류");
			e.printStackTrace();
		}
		return sdto;
	}// method end

	public MemberDTO getMember(String id) {
		MemberDTO memberDTO = null;
		String sql = "SELECT * FROM member WHERE mid=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, id);

			rs = pst.executeQuery();
			if (rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setMno(rs.getInt("MNO"));
				memberDTO.setMid(rs.getString("MID"));
				memberDTO.setMpw(rs.getString("MPW"));
				memberDTO.setMname(rs.getString("MNAME"));
				memberDTO.setMphone(rs.getString("MPHONE"));
				memberDTO.setMssno(rs.getString("MSSNO"));
				memberDTO.setMgrade(rs.getInt("MGRADE"));
				memberDTO.setMdate(rs.getString("MDATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return memberDTO;
	}

	public int update(String mid, String pw, String phone) {
		int result = 0;

		String sql = "UPDATE MEMBER SET mpw = ?, mphone = ? WHERE mid = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, pw);
			pst.setString(2, phone);
			pst.setString(3, mid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public int delete(String id) {
		int result = 0;

		String sql = "DELETE FROM MEMBER WHERE MID = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			result = pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}
	   
	   
	   public MemberDTO searchUser(String id) {// 권한을 주기위해 아이디 조회시 정보 확인용 메서드 2024_08_06
		   MemberDTO memberDTO = new MemberDTO();
		   
		   String query = "select * from member where mid=?";
		   try {
			pst = con.prepareStatement(query);
			   pst.setString(1, id);
			   
			   rs = pst.executeQuery();
			   
			     if (rs.next()) {
			            memberDTO.setMno(rs.getInt("MNO"));
			            memberDTO.setMid(rs.getString("MID"));
			            memberDTO.setMpw(rs.getString("MPW"));
			            memberDTO.setMname(rs.getString("MNAME"));
			            memberDTO.setMphone(rs.getString("MPHONE"));
			            memberDTO.setMssno(rs.getString("MSSNO"));
			            memberDTO.setMgrade(rs.getInt("MGRADE"));
			         }
		} catch (SQLException e) {
			System.out.println("오류발생 경로 : MemberDAO.searchUser()");
			e.printStackTrace();
		}
		   
		  return memberDTO;
	   }// end searchUser() method
	   
	   public int userGrade(String mname) {// 권한 변경 메서드 2024_08_06
		   int resultGrade = 0;
		   
		   try {
			String query = "update member set mgrade=2 where mname=?";
			   pst = con.prepareStatement(query);
			   pst.setString(1, mname);
			   
			   resultGrade = pst.executeUpdate();
		} catch (SQLException e) {
			System.out.println("오류 경료 : MemberDAO.userGradeEdit() 메서드");
			e.printStackTrace();
		}
		   
		   return resultGrade;
	   }// end userGrade()
	   

	
	   public String memberName (String buno) {
			String getName = null;
			try {
				String sql = "SELECT MNAME FROM MEMBER WHERE MNO = ?";
				pst = con.prepareStatement(sql);
				pst.setString(1, buno);
				rs = pst.executeQuery();
				while (rs.next()) {

					getName = rs.getString("MNAME");
					return getName;

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return getName;

		}
	   
	
	   

}// class end
