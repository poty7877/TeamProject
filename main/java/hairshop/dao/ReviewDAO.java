package hairshop.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.Connection_pool;
import hairshop.dto.ReviewDTO;

public class ReviewDAO extends Connection_pool {


	// 리뷰 리스트 조회(사업자 회원용)
	public List<ReviewDTO> selectList(Map<String, Object> map) {
		List<ReviewDTO> listReviewDTO = new Vector<ReviewDTO>();
		String query = "SELECT * FROM (SELECT TB.*, ROWNUM rbno FROM (SELECT * FROM review where rsno=? ORDER BY rno DESC) TB) WHERE rbno BETWEEN ? AND ?";

		try {
			pst = con.prepareStatement(query);
			pst.setString(1, map.get("rsno").toString()); // 매장이름
			pst.setString(2, map.get("start").toString()); // 시작번호
			pst.setString(3, map.get("end").toString()); // 끝번호
			rs = pst.executeQuery();

			while (rs.next()) {
				ReviewDTO reviewDTO = new ReviewDTO();
				reviewDTO.setRno(rs.getInt("rno"));
				reviewDTO.setRdate(rs.getDate("rdate"));
				reviewDTO.setRwriter(rs.getString("rwriter"));
				reviewDTO.setRcontents(rs.getString("rcontents"));

				listReviewDTO.add(reviewDTO);
			}
		} catch (SQLException e) {
			System.out.println("ReviewDAO.selectList() 메서드 오류");
			e.printStackTrace();
		}
		return listReviewDTO;
	}
	
	// 리뷰 리스트 조회(일반 회원용)
		public List<ReviewDTO> selectList2(String rwriter) {
			List<ReviewDTO> listReviewDTO = new Vector<ReviewDTO>();
			String query = "SELECT DISTINCT r.*,b.bdname,b.bsname FROM review r join book b on b.bdno=r.rdno where rwriter=?";
			
			try {
				pst = con.prepareStatement(query);
				pst.setString(1,rwriter); 
				rs = pst.executeQuery();

				while (rs.next()) {
					ReviewDTO rdto = new ReviewDTO();
					rdto.setRsname(rs.getString("bsname"));
					rdto.setRdname(rs.getString("bdname"));
					rdto.setRdate(rs.getDate("rdate"));
					rdto.setRcontents(rs.getString("rcontents"));

					listReviewDTO.add(rdto);
				}
			} catch (SQLException e) {
				System.out.println("ReviewDAO.selectList() 메서드 오류");
				e.printStackTrace();
			}
			return listReviewDTO;
		}


  
	// 게시글 등록용 메서드(이미지 파일 첨부 없을때
		public int insertWrite(ReviewDTO dto) {
			int result = 0;
			
			// 3단계
			
			  String query = "INSERT INTO review(rno, rwriter, rcontents, rdno,rsno) VALUES (rno_seq.nextval, ?, ?, ?,?)";
			  int rdno = Integer.parseInt(dto.getRdno());//int로 변환
			   int rsno =Integer.parseInt(dto.getRsno());//int로 변환
			  
			  
			    try {
			        pst = con.prepareStatement(query);
			        pst.setString(1, dto.getRwriter());
			        pst.setString(2, dto.getRcontents());
			        pst.setInt(3, rdno);
			        pst.setInt(4, rsno);

			        result = pst.executeUpdate();
			    } catch (SQLException e) {
			        System.out.println("ReviewDAO.insertWrite() 메서드 예외 발생");
			        e.printStackTrace();
			    }
			    return result;
			}
		
		// 게시글 등록용 메서드(이미지 파일 첨부 있을때
				public int insertWrite2(ReviewDTO dto) {
					int result = 0;
					
					// 3단계
					
					  String query = "INSERT INTO review(rno, rwriter, rcontents, rdno,rsno,rofile,rsfile) VALUES (rno_seq.nextval, ?, ?, ?,?,?,?)";
					  int rdno = Integer.parseInt(dto.getRdno());//int로 변환
					   int rsno =Integer.parseInt(dto.getRsno());//int로 변환
					  
					  
					    try {
					        pst = con.prepareStatement(query);
					        pst.setString(1, dto.getRwriter());
					        pst.setString(2, dto.getRcontents());
					        pst.setInt(3, rdno);
					        pst.setInt(4, rsno);
					        pst.setString(5, dto.getRofile());
					        pst.setString(6, dto.getRsfile());

					        result = pst.executeUpdate();
					    } catch (SQLException e) {
					        System.out.println("ReviewDAO.insertWrite() 메서드 예외 발생");
					        e.printStackTrace();
					    }
					    return result;
					}
		
		// 수정할 객체를 받아서 성공 시 1개의 값을 수정했다는 리턴
		public int updateEdit(ReviewDTO reviewDTO) {
			int result = 0;
			String query = "update review set rcontents=? where rno=?";
			try {
				pst = con.prepareStatement(query);
				pst.setString(1, reviewDTO.getRcontents());
				pst.setInt(2, reviewDTO.getRno());
				
				result = pst.executeUpdate();
				System.out.println("수정개수 : "+ result);
			} catch (SQLException e) {
				System.out.println("ReviewDTO.updateEdit() 메서드 예외발생");
				System.out.println("쿼리문을 확인하세요");
				e.printStackTrace();
			}	
			return result;
		}
		

		// 게시글 수정을 눌렀을 떄 게시글 수정페이지
		public ReviewDTO selectView(String rno) {
			//메서드 호출 시 입력은 num(board pk) 받고 가져온 데이터를 BoardDTO 객체에 넣어 리턴
			ReviewDTO viewDTO = new ReviewDTO();
			
			// 3단계(쿼리문 생성) member pk -> board fk 
//			String query = "select * from board where num = ?"; // 작성자임을 판단 못함
			
			// member에 있는 작성자를 가져올 수 있도록 join 처리용
			String query = "SELECT B.*, M.rwriter FROM member M INNER JOIN review B ON M.mid = B.rwriter WHERE rno = ?";
			// member 테이블의 별칭은 M으로 review 테이블의 별칭은 B로 선언
			// 부모테이블의 M에 이너 조인 B를 이용하고 id가 같은 자료를 찾음 M.mid = B.rwriter
			// 조건은 파라미터로 받은 rno를 이용
			// 찾아온 값은 review에 모든 것과 member의 id을 가져옴 -> dto에 rid필드를 추가
			
			try {
				pst = con.prepareStatement(query); // 객체 생성
				pst.setString(1, rno); 
				rs = pst.executeQuery(); // 쿼리실행 -> 표로 받음
				
				if(rs.next()) {					
					  viewDTO.setRno(rs.getInt("rno")); // rno 값 설정
			          viewDTO.setRwriter(rs.getString("rwriter")); // rwriter 값 설정
			          viewDTO.setRcontents(rs.getString("rcontents")); // rcontents 값 설정
	        // dto객체의 값 저장
					System.out.println(viewDTO.toString());
				}
			} catch (SQLException e) {
				System.out.println("ReviewDTO.selectView() 메서드 예외발생");
				System.out.println("쿼리문을 확인하세요");
				e.printStackTrace();
			}	
			return viewDTO;
		}
		
		// 삭제 메서드 dto를 받아서 삭제 후에 int로 리턴
		public int deletePost(ReviewDTO reviewDTO) {
			int result = 0;
			String query ="delete from review where rno=?";
			
			try {
				pst = con.prepareStatement(query);
				pst.setInt(1, reviewDTO.getRno());
				result = pst.executeUpdate();
			} catch (SQLException e) {
				System.out.println("ReviewDTO.deletePost() 메서드 예외발생");
				System.out.println("쿼리문을 확인하세요");
				e.printStackTrace();
			}			
			return result;
		}
		
		//리뷰작성을 위한 rsno가져오기
		public String get_rsno(String rdno2) {
			int rdno = Integer.parseInt(rdno2);
			
			String query="select dsno from designer where dno=?";
			try {
				pst =con.prepareStatement(query);
				pst.setInt(1, rdno);
				rs=pst.executeQuery();
				if(rs.next()) {
					String rsno=rs.getString("dsno");
					return rsno;
				}
			} catch (SQLException e) {
				System.out.println("ReviewDAO.get_rsno오류");
				e.printStackTrace();
			}
			String rsno2="1";
			return rsno2;
		}
		
}//class end

