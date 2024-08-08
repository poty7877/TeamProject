<%@page import="hairshop.dao.MemberDAO"%>
<%@page import="common.JSFunction"%>
<%@page import="hairshop.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String searchId = request.getParameter("search_id");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.searchUser(searchId);
	dao.close();
	
	
	
	if(dto != null){
		response.sendRedirect("gradeMain.jsp?searchId="+ dto.getMid());
	}else{
		response.sendRedirect("gradeEditMain.jsp"); /* 데드코드 원인 모름 */
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