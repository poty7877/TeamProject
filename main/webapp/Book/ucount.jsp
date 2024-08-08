<%@page import="common.JSFunction"%>
<%@page import="hairshop.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../Common/check_grade1.jsp"%>
<%@include file="../Common/check_login.jsp"%>
<%
BookDAO bookDAO = new BookDAO();
String check = request.getParameter("status");
String num = request.getParameter("buno");
String num2 = request.getParameter("bno");
String cutName = request.getParameter("cutName");
System.out.println(cutName + "  " + num + " " + num2);
if (check != null && check.equals("noshow")) {
   int result = 0;
   int result1 = 0;
   result = bookDAO.ucount(num);
   result1 = bookDAO.deleteBook(num2);
   if (result >= 1 && result1 >= 1) {
      JSFunction.alertLocation("ucount가 1 증가 했습니다, 예약 삭제 완료", "bookList.jsp", out);
   } else {
      JSFunction.alertBack("ucount 처리 실패", out);
   }
} else if (check != null && check.equals("show")) {
   int result = 0;
   int result1 = 0;
   result = bookDAO.deleteBook(num2);
   result1 = bookDAO.umoney(cutName, num);
   if (result >= 1 && result1 >= 1) {
      JSFunction.alertLocation("umoney가 증가 했습니다", "bookList.jsp", out);
   } else {
      JSFunction.alertBack("ucount 처리 실패", out);
   }

}
%>
