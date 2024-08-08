<%@page import="hairshop.dao.CutDAO"%>
<%@page import="common.JSFunction"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cno = Integer.parseInt(request.getParameter("cno"));
	CutDAO dao = new CutDAO();
	int resultDel = dao.deleteHairCut(cno);
	
	if(resultDel == 1 ){
		JSFunction.alertLocation("삭제 완료", "hairCutList.jsp", out);
	}else{
		JSFunction.alertBack("삭제 실패", out);
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