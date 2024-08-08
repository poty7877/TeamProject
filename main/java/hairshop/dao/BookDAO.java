package hairshop.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.Connection_pool;
import hairshop.dto.BookDTO;
import hairshop.dto.DesignerDTO;
import hairshop.dto.ReviewDTO;
import hairshop.dto.ShopDTO;

public class BookDAO extends Connection_pool{

	public List<ShopDTO> read_shop() {//전체 매장 리스트 받아서 list에 저장
		ShopDTO dto = new ShopDTO();
		List<ShopDTO> lists = new Vector<>();
		String query = "select * from shop";
		try {
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
				dto.setSclose(rs.getString("sclose"));
				dto.setSlocation(rs.getString("slocation"));
				dto.setSmno(rs.getString("smno"));
				dto.setSname(rs.getString("sname"));
				dto.setSno(rs.getString("sno"));
				dto.setSopen(rs.getString("sopen"));
				lists.add(dto);
			}//while end
		} catch (SQLException e) {
			System.out.println("BookDAO2.read_all 오류");
			e.printStackTrace();
		}
		
		
		return lists;
	}
	
	public List<DesignerDTO> read_designer(String bsname) {//sname값을 매장명과 일치하는 shop테이블의 sno와 디자이너 dsno 비교해서 d.*하기
		
		List<DesignerDTO> lists = new Vector<>();
		String query = "select d.* from shop s join designer d on s.sno = d.dsno where sname=?";
		try {
			pst = con.prepareStatement(query);
			pst.setString(1,bsname);
			rs = pst.executeQuery();
			while(rs.next()) {
				DesignerDTO dto = new DesignerDTO();
				dto.setDclose(rs.getString("dclose"));
				dto.setDname(rs.getString("dname"));
				dto.setDofile(rs.getString("dofile"));
				dto.setDopen(rs.getString("dopen"));
				dto.setDsfile(rs.getString("dsfile"));
				dto.setDsno(rs.getString("dsno"));
				dto.setDno(rs.getString("dno"));
				lists.add(dto);
			}//while end
		} catch (SQLException e) {
			System.out.println("BookDAO2.read_all 오류");
			e.printStackTrace();
		}
		
		
		return lists;
	}
	
	public ShopDTO check_time(String bsname) {//매장의 오픈,클로즈 시간 불러오기
		ShopDTO dto = new ShopDTO();
		String query = "select sclose,sopen from shop where sname=?";
		try {
			pst = con.prepareStatement(query);
			pst.setString(1,bsname); //세션에 저장된 bsname (매장이름)로 시간불러오기
			rs = pst.executeQuery();
			while(rs.next()) {
				dto.setSclose(rs.getString("sclose"));
				dto.setSopen(rs.getString("sopen"));
			}//while end
		} catch (SQLException e) {
			System.out.println("BookDAO2.read_all 오류");
			e.printStackTrace();
		}
		return dto;
	}
	
	//예약내용 저장
	public int save_book(BookDTO bdto) {
		String query = "insert into book(bno,bsname,bdate,bdno,bdname,bcut,buno)"
				+ "values(bno_seq.nextval,?,?,?,?,?,?)";
		int result=0;
		try {
			pst = con.prepareStatement(query);
			pst.setString(1, bdto.getBsname());
			pst.setString(2, bdto.getBdate());
			pst.setString(3, bdto.getBdno());
			pst.setString(4, bdto.getBdname());
			pst.setString(5, bdto.getBcut());
			pst.setString(6, bdto.getBuno());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			System.out.println("BookDAO.save_book 오류");
			e.printStackTrace();
		}
		
		
		return result;
	}
	

		public List<ShopDTO> read_designer() {// 전체 디자이너 리스트 받아서 list에 저장
			
			List<ShopDTO> lists = new Vector<>();
			String query = "select * from shop";
			try {
				st = con.createStatement();
				rs = st.executeQuery(query);
				while (rs.next()) {
					ShopDTO dto = new ShopDTO();
					dto.setSclose(rs.getString("sclose"));
					dto.setSlocation(rs.getString("slocation"));
					dto.setSmno(rs.getString("smno"));
					dto.setSname(rs.getString("sname"));
					dto.setSno(rs.getString("sno"));
					dto.setSopen(rs.getString("sopen"));
					lists.add(dto);
				} // while end
			} catch (SQLException e) {
				System.out.println("BookDAO2.read_all 오류");
				e.printStackTrace();
			}

			return lists;
		}

		public int selectCount(Map<String, Object> map) { // board 테이블의 게시물 개수를 알아와야함
			int totalCount = 0; // 리턴값

			// 3단계 : 쿼리문
			String sql = "SELECT COUNT(*) FROM BOOK";
			if (map.get("searchWord") != null) { // 검색어가 있으면
				sql += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
				// searchField : 제목, 내용, 작성자(Object)
				// searchWord : input text로 넘어온 글자
				// select count(*) from baord where 제목 like ' %딸기%(Object) ';
			} // 검색어가 있으면 조건이 추가된다.

			// 4단계 : 쿼리문 실행
			try {
				pst = con.prepareStatement(sql); // 쿼리문 연결
				rs = pst.executeQuery(sql); // 쿼리문 실행하여 결과를 표로 받음
				rs.next();
				totalCount = rs.getInt(1); // 첫번재 column 값을 가져옴
				System.out.println("totalcount : " + totalCount);
			} catch (SQLException e) {
				System.out.println("BoardDAO.selectCount() 메서드 오류");
				System.out.println("게시물 개수를 구하는 오류 발생");
				e.printStackTrace();
			}
			return totalCount;
		}

		public List<BookDTO> selectList(Map<String, Object> map) {
			// param -> searchField, searchWord, start, end 전달
			List<BookDTO> listBookDTO = new Vector<BookDTO>(); // vector = 멀티스레드용

			String sql = "SELECT * FROM ( SELECT TB.*, ROWNUM RNUM FROM ( SELECT * FROM BOOK ";
			// 조건 추가
			if (map.get("searchWord") != null) { // 검색어가 있으면
				sql += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
				// searchField : 제목, 내용, 작성자(Object)
				// searchWord : input text로 넘어온 글자
				// select count(*) from baord where 제목 like ' %딸기%(Object) ';
			} // 검색어가 있으면 조건이 추가된다.
				// 정렬 추가
			sql += " ORDER BY BNO DESC) TB ) WHERE RNUM BETWEEN ? AND ? ";
			// 3단계 쿼리문 완성

			// 4단계 : 쿼리문 실행
			try {
				pst = con.prepareStatement(sql); // 3단계
				pst.setString(1, map.get("start").toString()); // 시작번호
				pst.setString(2, map.get("end").toString()); // 마지막번호
				rs = pst.executeQuery(); // 4단계

				while (rs.next()) {
					BookDTO bookDTO = new BookDTO(); // 빈 객체 생성
					bookDTO.setBno(rs.getString("bno"));
					bookDTO.setBsname(rs.getString("bsname"));
					bookDTO.setBdate(rs.getString("bdate"));
					bookDTO.setBdno(rs.getString("bdno"));
					bookDTO.setBcut(rs.getString("bcut"));
					bookDTO.setBdname(rs.getString("bdname"));
					bookDTO.setBuno(rs.getString("buno"));

					// name 필드 null

					listBookDTO.add(bookDTO); // 위에서 만든 객체를 리스트(배열)에 넣음

				} // while문 종료

			} catch (SQLException e) {
				System.out.println("BoardDAO.selectList() 메서드 오류");
				System.out.println("board테이블 모든 리스트 출력 오류");
				e.printStackTrace();
			}

			return listBookDTO;
		}

		public BookDTO selectView(String num) {
			BookDTO viewDTO = new BookDTO();
			// 메서드 호출 시 입력은 num(board 테이블의 pk.bno) 으로 받고
			// 가져온 데이터를 BoardDTO 객체에 넣어 리턴.

			// 3단계 쿼리문 작성. (member pk -> board fk)

			// String sql = "SELECT * FROM BOARD WHERE NUM = ?"; // 작성자를 판단 할수 없음
			// member에 있는 작성자를 가져올수 있도록 join을 사용하여 처리
			String sql = "SELECT * FROM BOOK WHERE BNO = ?";

			// MEMBER 테이블의 별칭은 M, BOARD 테이블의 별칭은 B라고 선언.
			// 부모 테이블인 M에 INNER JOIN으로 B 자식테이블을 연결, M.ID와 B.ID가 같은 자료를 찾음.
			// 조건은 파라미터로 받은 BNO를 이용
			// 찾아온 값은 BOARD의 모든 것과, MEMBER의 NAME을 가져옴. -> DTO에 NAME필드를 추가.

			try {
				pst = con.prepareStatement(sql); // 객체 생성
				pst.setString(1, num);
				rs = pst.executeQuery(); // 쿼리 실행 - >표로 받음

				if (rs.next()) {
					viewDTO.setBno(rs.getString("bno"));
					viewDTO.setBsname(rs.getString("bsname"));
					viewDTO.setBdate(rs.getString("bdate"));
					viewDTO.setBdno(rs.getString("bdno"));
					viewDTO.setBcut(rs.getString("bcut"));
					viewDTO.setBdname(rs.getString("bdname"));
					viewDTO.setBuno(rs.getString("buno"));

					System.out.println(viewDTO.toString());
				}
			} catch (SQLException e) {
				System.out.println("BoardDAO.selectView() 메서드 오류 발생");
				System.out.println("쿼리문을 확인하세요");
				e.printStackTrace();
			}

			return viewDTO;
		}
		
		//해당매장에 총 리뷰수 가져오기
		public int get_review_count(String sno) {
			int total_count=0;
			int rsno = Integer.parseInt(sno);
			String query="select count(*) from review where rsno=?";
			try {
				pst = con.prepareStatement(query);
				pst.setInt(1,rsno);
				rs = pst.executeQuery();
				if(rs.next()) {total_count = rs.getInt(1); // count(*)하면 전체 갯수 불러오는데 하나뿐이어서 첫번째것으로 한다
				}
			} catch (SQLException e) {
				System.out.println("BookDAO.get_review_count 오류");
				e.printStackTrace();
			}
			return total_count;
		}
		
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
		
		//예약목록 가져오기(일반회원의 조회용)
		public List<BookDTO> get_book(String mno) {
			List<BookDTO> lists = new Vector<BookDTO>();
	
			String sql = "SELECT * FROM BOOK WHERE BuNO = ? order by bdate desc";

			try {
				pst = con.prepareStatement(sql); // 객체 생성
				pst.setString(1, mno);
				rs = pst.executeQuery(); // 쿼리 실행 - >표로 받음

				while(rs.next()) {
					BookDTO bdto = new BookDTO();
					bdto.setBdno(rs.getString("bdno"));
					bdto.setBsname(rs.getString("bsname"));
					bdto.setBdate(rs.getString("bdate"));
					bdto.setBcut(rs.getString("bcut"));
					bdto.setBdname(rs.getString("bdname"));
					lists.add(bdto);
				}
			} catch (SQLException e) {
				System.out.println("BoardDAO.selectView() 메서드 오류 발생");
				System.out.println("쿼리문을 확인하세요");
				e.printStackTrace();
			}

			return lists;
		}
	
		
		public int ucount(String num) {
			int result = 0;

			String sql = "UPDATE USERS SET UCOUNT = UCOUNT + 1 WHERE UMNO = ?";
			try {
				pst = con.prepareStatement(sql);
				pst.setString(1, num);
				result = pst.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
		}

		public int deleteBook(String num2) {
			int result = 0;
			String sql = "DELETE FROM BOOK WHERE BNO = ?";
			try {
				pst = con.prepareStatement(sql);
				pst.setString(1, num2);
				result = pst.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return result;
		}
		
		public int umoney(String cutName, String num) {
		      int result = 0;
		      int price = 0;
		      String sql1 = "SELECT CPRICE FROM CUT WHERE CCUTNAME = ?";
		      try {
		         pst = con.prepareStatement(sql1);
		         pst.setString(1, cutName);
		         rs = pst.executeQuery();
		         if (rs.next()) {
		            price = rs.getInt("CPRICE");
		         }
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		      System.out.println(price);

		      String sql = "UPDATE USERS SET UMONEY = UMONEY + ? WHERE UMNO = ?";
		      try {
		         pst = con.prepareStatement(sql);
		         pst.setInt(1, price);
		         pst.setString(2, num);
		         result = pst.executeUpdate();
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }

		      return result;
		   }
		
}//class end
