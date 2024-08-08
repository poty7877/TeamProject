<%@page import="hairshop.dto.ShopDTO"%>
<%@page import="hairshop.dao.MemberDAO"%>
<%@page import="common.JSFunction"%>
<%@page import="hairshop.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("userID");
String pw = request.getParameter("userPW");


MemberDAO memberDAO = new MemberDAO();
MemberDTO dto = memberDAO.login(id, pw);
if (dto == null || dto.getMid() == null) { // DB에 정보가 없음
	JSFunction.alertBack("로그인 정보가 없습니다.", out);
} else { // DB에 정보가 있음
	session.setAttribute("mid", dto.getMid()); // 세션에 id 넣음
	session.setAttribute("mname", dto.getMname()); // 세션에 name 넣음
	session.setAttribute("mno", dto.getMno()); //세션에 mno 넣음
	session.setAttribute("mgrade", dto.getMgrade()); //세션에 등급 넣음
	// 페이지 이동 해야 함
	response.sendRedirect("../Common/index.jsp");
	ShopDTO sdto = new ShopDTO();
	switch(dto.getMgrade()){
	case 1 : //관리자세션에 shopDTO 정보 저장
	sdto = memberDAO.get_shopDTO(dto);
	session.setAttribute("smno",sdto.getSmno()); //매장 번호
	session.setAttribute("sname",sdto.getSname()); //매장 이름
	break;
	case 2 :
	break;
	case 4 : 
		session.invalidate(); //세션값 모두 지우기
		JSFunction.alertBack("접근이 정지된 회원입니다. 관리자에게 문의하세요", out);
	break;
	}
	memberDAO.close();
}
%>
