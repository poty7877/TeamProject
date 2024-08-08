<%@page import="common.JSFunction"%>
<%@page import="hairshop.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = (String) session.getAttribute("mid");
MemberDAO memberDAO = new MemberDAO();
int result = memberDAO.delete(id);

if (result >= 0) {
	session.invalidate();
	JSFunction.alertLocation("회원 탈퇴가 완료 되었습니다.", "../Common/index.jsp", out);
} else { 
	JSFunction.alertBack("회원 탈퇴 실패", out);
}
%>

