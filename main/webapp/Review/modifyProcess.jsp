<%@page import="common.JSFunction"%>
<%@page import="hairshop.dao.ReviewDAO"%>
<%@page import="hairshop.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String rno = request.getParameter("rno"); 
    String content = request.getParameter("rcontents"); 
    
    ReviewDTO reviewDTO = new ReviewDTO();
    reviewDTO.setRno(Integer.parseInt(rno)); // rno 값을 설정
    reviewDTO.setRcontents(content); // rcontents 값을 설정
    
    ReviewDAO reviewDAO = new ReviewDAO(); // DAO 생성
    int affected = reviewDAO.updateEdit(reviewDTO); // 수정 작업 수행
    reviewDAO.close(); // DAO 종료
    
    // 성공 여부 처리
    if (affected == 1) {
        // 성공 시 수정된 리뷰 페이지로 리다이렉트
        response.sendRedirect("viewReview.jsp?rno=" + rno);
    } else {
        // 실패 시 뒤로가기
        JSFunction.alertBack("수정 실패", out);
    }
    %>