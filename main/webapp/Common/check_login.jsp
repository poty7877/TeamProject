<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//로그인 상태인지 아닌지 체크
if(session.getAttribute("mid")==null){
	JSFunction.alertLocation("로그인 후 이용가능합니다","../Member/login.jsp", out);
}


%>