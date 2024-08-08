<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<%if(!session.getAttribute("mgrade").equals(1)){
	JSFunction.alertBack("관리자등급만 접근 가능합니다", out);
} %>
