package hairshop.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import common.Connection_pool;
import hairshop.dto.MemberDTO;
import hairshop.dto.ShopDTO;

public class ShopDAO extends Connection_pool{
	   
	   public List<ShopDTO> shopList(){ // 헤어샵 전체 리스트 2024_08_06
			List<ShopDTO> fileList = new Vector<ShopDTO>(); 
			
				String qurey = "select * from shop order by sno desc"; // 모든 데이터를 찾아옴(내림차순)
				
				try {
					pst = con.prepareStatement(qurey);
					rs = pst.executeQuery(); // 쿼리문 실행 후 결과를 표로 받음
					
					while(rs.next()) {
						
						ShopDTO dto = new ShopDTO(); // 빈 객체 생성
						dto.setSno(rs.getString("sno"));
						dto.setSmno(rs.getString("smno"));
						dto.setSname(rs.getString("sname"));
						dto.setSlocation(rs.getString("slocation"));
						dto.setSopen(rs.getString("sopen"));
						dto.setSclose(rs.getString("sclose"));

						
						fileList.add(dto); // 리스트에 객체 삽입
					}
				} catch (SQLException e) {
					System.out.println("ShopDAO.myFileList() 메서드 오류");
					e.printStackTrace();
				} 
			
			return fileList; // 결론 테이블에 있는 모든 값이 리스트의 객체로 리턴한다
		}

	   

}
