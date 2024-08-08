<%@page import="hairshop.dao.MemberDAO"%>
<%@page import="hairshop.dao.DesignerDAO"%>
<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String inputName = request.getParameter("input_dname"); // 이름
	int inputdsno = Integer.parseInt(request.getParameter("input_dsno"));
	
	
 	MemberDAO dao = new MemberDAO();
	int resultdao = dao.userGrade(inputName);
	dao.close();
	
	DesignerDAO ddao = new DesignerDAO();
	int resultddao = ddao.newDesigner(inputName, inputdsno);
	ddao.close();

	
	if(resultdao == 1 && resultddao == 1 ){
		JSFunction.alertLocation("디자이너 설정 완료", "gradeMain.jsp", out);
	}else{
		JSFunction.alertBack("권한(grade) 설정 실패", out);
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