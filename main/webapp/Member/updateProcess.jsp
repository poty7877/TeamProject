<%@page import="common.JSFunction"%>
<%@page import="hairshop.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String mid = (String) session.getAttribute("mid");
String pw = request.getParameter("UpdatePw");
String phone = request.getParameter("UpdatePhone");

MemberDAO memberDAO = new MemberDAO();
int result = 0;
result = memberDAO.update(mid, pw, phone);
memberDAO.close();
if (result >= 0) {
	JSFunction.alertLocation("수정 완료", "../Common/index.jsp", out);
} else {
	JSFunction.alertBack("수정 실패", out);
}

%>
