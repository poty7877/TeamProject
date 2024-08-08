<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="common.JSFunction"%>
<%@page import="hairshop.dao.ReviewDAO"%>
<%@page import="hairshop.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%ReviewDTO reviewDTO = new ReviewDTO(); // 빈 객체 생성

// 1단계 : cod.jar연결
String saveDirectory = application.getRealPath("/Review_images"); //폴더이름
int maxPostSize = 1024*1024*100;
String encoding = "UTF-8";
File uploadDir = new File(saveDirectory);
int result=0;
if (!uploadDir.exists()) {
// 파일 업로드 처리
MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);

String addCcutname = mr.getParameter("rdno"); //디자이너 번호



// 업로드된 파일 이름을 가져옴
String fileName = mr.getFilesystemName("attachedFile"); // form input name="attachedFile"
    String ext = fileName.substring(fileName.lastIndexOf("."));
String newFileName = session.getAttribute("mid")+"_"+ addCcutname+ ext;


// 3. 파일명 변경
File oldFile = new File(saveDirectory + File.separator + fileName);
System.out.println("oldFile :" + oldFile);

File newFile = new File(saveDirectory + File.separator + newFileName);
System.out.println("newFile :" + newFile);
oldFile.renameTo(newFile);

String content= request.getParameter("content"); // review.jsp에서 넘어온 값
reviewDTO.setRdno(request.getParameter("rdno"));
reviewDTO.setRsno(request.getParameter("rsno"));
reviewDTO.setRcontents(content);
reviewDTO.setRwriter(session.getAttribute("mname").toString()); // 세션영역에 있는 값은 객체임
reviewDTO.setRofile(fileName);
reviewDTO.setRsfile(newFileName);
ReviewDAO reviewDAO = new ReviewDAO(); // 1,2단계
result = reviewDAO.insertWrite2(reviewDTO); // 3,4단계

reviewDAO.close(); // 5단계
}//파일이있으면 없로드
else{
String content= request.getParameter("content"); // review.jsp에서 넘어온 값
   reviewDTO.setRdno(request.getParameter("rdno"));
   reviewDTO.setRsno(request.getParameter("rsno"));
   reviewDTO.setRcontents(content);
   reviewDTO.setRwriter(session.getAttribute("mname").toString()); // 세션영역에 있는 값은 객체임

   // 객체에 내용 , 작성자가 보관완료
   
  //3,4단계 적용
   ReviewDAO reviewDAO = new ReviewDAO(); // 1,2단계
   result = reviewDAO.insertWrite(reviewDTO); // 3,4단계
  
   reviewDAO.close(); // 5단계
}
   if(result == 1){
      // insert 결과 값이 1이면 성공
      response.sendRedirect("../Member/activity.jsp"); // 성공시 리스트로 감
   }else{
      // 실패
      JSFunction.alertBack("글저장실패 뒤로 갑니다.", out);
   }
%>