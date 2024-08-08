<%@page import="hairshop.dao.CutDAO"%>
<%@page import="hairshop.dto.CutDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%><!-- cos.jar -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* method="post" enctype="multipart/form-data" 처리 */
	/* 필요요소 4가지 cos.jar : request, 저장경로, 단일파일크기, 인코딩 */
	
	try{
	// 1단계 : cos.jar
	String saveDirectory = application.getRealPath("/Haircut_images");
	// 저장할 디렉토리 http://192.168.111.101:80/board-jsp/Uploads
	int maxPostSize = 1024 * 1024 * 100; // 파일 최대 크기 (100메가바이트) kb * mb * gb
	String encoding = "UTF-8" ;
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	
	//실험중
	String addCcutname = mr.getParameter("add_ccutname");
	
	// 2단계 : ofile, sfile 결정
	// 2. 새로운 파일명 생성
    String fileName = mr.getFilesystemName("add_cimage");  // 현재 파일 이름
    String ext = fileName.substring(fileName.lastIndexOf("."));  // 파일 확장자
/*     String newFileName = session.getAttribute("sname")+"_"+mr.getParameter("add_ccutname") + ext;  // 새로운 파일 이름("매장이름_커트이름.확장자") */
    String newFileName = session.getAttribute("sname")+"_"+ addCcutname + ext;  // 새로운 파일 이름("매장이름_커트이름.확장자")

    
    // 3. 파일명 변경
    File oldFile = new File(saveDirectory + File.separator + fileName);
	System.out.println("oldFile :" + oldFile);
	
    File newFile = new File(saveDirectory + File.separator + newFileName);
	System.out.println("newFile :" + newFile);
    oldFile.renameTo(newFile);
	
    // 4. FileUploadMain에서 넘어온 폼 값 처리
    
    String csname = mr.getParameter("add_ccutname");
    String ccontents = mr.getParameter("add_ccontent");

	
    // 5. dto에 4번 값 넣기 
    CutDTO dto = new CutDTO();
    dto.setCcontents(mr.getParameter("add_ccontent"));
    dto.setCcutname(mr.getParameter("add_ccutname"));
    dto.setCprice(mr.getParameter("add_cprice").toString());
    dto.setCsname(session.getAttribute("sname").toString());
    dto.setOfile(fileName);
    dto.setSfile(newFileName);
    dto.setCsno(session.getAttribute("smno").toString());
    
    
    
    // 6. DAO를 통해 데이터베이스에 반영
    CutDAO dao = new CutDAO();
    dao.insertHair(dto);
    dao.close();
    
    // 7. 파일 목록 JSP로 리디렉션
    response.sendRedirect("hairCutList.jsp"); // 성공시 되돌아 감
	}catch(Exception e){
		System.out.println("addHairCutProcess.jsp 오류");
		e.printStackTrace();
		request.setAttribute("errorMessage", "파일 업로드 오류");
		request.getRequestDispatcher("hairCutList.jsp").forward(request, response);
	}
    
    
%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>addHairCutProcess.jsp : cos.jar 을 활용하여 파일처리하고 dao로 연결</title>
</head>
<body>

</body>
</html>