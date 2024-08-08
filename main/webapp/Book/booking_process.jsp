<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="common.JSFunction"%>
<%@page import="hairshop.dto.BookDTO"%>
<%@page import="hairshop.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<%
	BookDAO bdao = new BookDAO();
	BookDTO bdto = new BookDTO();
	String bdate = request.getParameter("bdate");
	String bdname = request.getParameter("bdname");
	String bdno = request.getParameter("bdno");
	String bsname = request.getParameter("bsname");
	String buno = session.getAttribute("mno").toString();
	String bcut = request.getParameter("bcut");
	bdto.setBdate(bdate);
	bdto.setBcut(bcut);
	bdto.setBdname(bdname);
	bdto.setBdno(bdno);
	bdto.setBsname(bsname);
	bdto.setBuno(buno);
	int result = bdao.save_book(bdto);
	if(result==1){
		JSFunction.alertLocation("예약에 성공하였습니다! 메인페이지로 이동합니다","../Common/index.jsp", out);
	}
	else if(result==0){JSFunction.alertBack("예약실패", out);}
	bdao.close();
%>
