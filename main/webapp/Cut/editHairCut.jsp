<%@page import="common.JSFunction"%>
<%@page import="hairshop.dto.CutDTO"%>
<%@page import="hairshop.dao.CutDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int editcon = Integer.parseInt(request.getParameter("edit_cno"));
String editCname = request.getParameter("edit_cname");
String editCcontents = request.getParameter("edit_ccon");
String editprice = request.getParameter("edit_pri").toString();

CutDAO dao = new CutDAO();
int editresult = dao.editHairCut(editCname, editCcontents, editprice, editcon);
dao.close();

if(editresult == 1 ){
	JSFunction.alertLocation("수정 완료", "hairCutList.jsp", out);
}else{
	JSFunction.alertBack("수정 실패", out);
}

	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>