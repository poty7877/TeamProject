<%@page import="common.JSFunction"%>
<%@page import="hairshop.dao.ReviewDAO"%>
<%@page import="hairshop.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
    String rno = request.getParameter("rno"); 
    String content = request.getParameter("rcontents");  
  
    ReviewDTO reviewDTO = new ReviewDTO (); // 빈객체 생성
    ReviewDAO reviewDAO = new ReviewDAO(); // 1,2단계
    reviewDTO = reviewDAO.selectView(rno); // 번호를 개체로 가져와 dto에 넣음
    
    String sessionId = session.getAttribute("mid").toString(); // 로그인이름 가져옴
    
    int delResult = 0; // 삭제 성공여부 판단 1:성공 0:실패
    
    if(sessionId.equals(reviewDTO.getRwriter())){ // 로그인한 사용자이름 일치
    	// 작성자 본인이면 삭제
        delResult = reviewDAO.deletePost(reviewDTO); // 객체를 넣어 삭제하고 int로 받음 3,4단계
        reviewDAO.close(); // 5단계
        
        if(delResult == 1){
        	// 삭제 성공
        	JSFunction.alertLocation("삭제되었습니다.", "review.jsp", out);
        }else{
        	// 삭제 실패
        	JSFunction.alertBack("삭제 실패-뒤로 갑니다.", out);
        	return;
        }
    }else{
    	// 본인이 아니면 삭제 안됨
    	JSFunction.alertBack("본인만 삭제됩니다.", out);
    	return;
    }
    
    %>