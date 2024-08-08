<%@page import="hairshop.dao.MemberDAO"%>
<%@page import="common.JSFunction"%>
<%@page import="hairshop.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
MemberDTO memberDTO = new MemberDTO();
int result = 0;
String id = request.getParameter("JoinId");
String pw = request.getParameter("JoinPw");
String name = request.getParameter("JoinName");
String ssn = request.getParameter("JoinSsn");
int grade = Integer.parseInt(request.getParameter("joinGrade"));
String phone = request.getParameter("JoinPhone");

memberDTO.setMid(id);
memberDTO.setMpw(pw);
memberDTO.setMname(name);
memberDTO.setMssno(ssn);
memberDTO.setMgrade(grade);
memberDTO.setMphone(phone);
MemberDAO memberDAO = new MemberDAO();
result = memberDAO.join(memberDTO);
if (result >= 1) {
	JSFunction.alertLocation(memberDTO.getMid() + "님 회원가입을 축하 드립니다.", "../Common/index.jsp", out);
} else {
	JSFunction.alertBack("회원가입 실패", out);
}
%>