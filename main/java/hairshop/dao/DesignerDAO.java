package hairshop.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.Connection_pool;
import hairshop.dto.BookDTO;

public class DesignerDAO extends Connection_pool{

	   public int newDesigner(String dname, int dsno) { // 권한 변경된 디자이너 추가 메서드 2024_08_06
	    	int resultDesigner = 0;
	    	
	    	String query = "insert into designer(dno, dname, dsno) "
	    			+ "values(dno_seq.nextval, ?, ?)";
	    	try {
				pst = con.prepareStatement(query);
				pst.setString(1, dname);
				pst.setInt(2, dsno);
				
				resultDesigner = pst.executeUpdate();
				
		         if (resultDesigner > 0) {
			            System.out.println("디자이너 변경 성공");
			         } else {
			            System.out.println("디자이너 변경 실패");
			         }

				
			} catch (SQLException e) {
				System.out.println("오류 경로 : DesignerDAO.entitleDesigner()");
				e.printStackTrace();
			}
	    	
	    	return resultDesigner;
	    	
	    }// end entitleDesigner()
	
	
	
	
}//class end

