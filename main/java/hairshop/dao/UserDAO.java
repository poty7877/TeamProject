package hairshop.dao;

import java.sql.SQLException;

import common.Connection_pool;
import hairshop.dto.UserDTO;

public class UserDAO extends Connection_pool{

	public UserDTO get_user(String umno) {
		UserDTO udto = new UserDTO();
		String query = "select * from users where umno=?";
		try {
			pst=con.prepareStatement(query);
			pst.setString(1,umno);
			rs=pst.executeQuery();
			if(rs.next()) {
				udto.setUcount(rs.getString("ucount"));
				udto.setUgrade(rs.getInt("ugrade"));
				udto.setUmname(rs.getString("umname"));
				udto.setUmno(rs.getString("umno"));
				udto.setUmoney(rs.getInt("umoney"));
			}
			
		} catch (SQLException e) {
			System.out.println("UserDAO.get_user 오류");
			e.printStackTrace();
		}
		
		return udto;
	}
	
}//class end

