<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="hairshop.dto.User_grade"%>
<%@page import="hairshop.dao.UserDAO"%>
<%@page import="hairshop.dto.UserDTO"%>
<%@page import="hairshop.dao.ReviewDAO"%>
<%@page import="hairshop.dto.ReviewDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="common.Page"%>
<%@page import="hairshop.dto.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="hairshop.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>나의 활동내역</title>

    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Barlow+Condensed:500,600,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">

    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/ionicons.min.css">

    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/style.css">
  </head>
  <body>
<%@ include file="../Common/header.jsp" %>
	<%
	List<BookDTO> bookLists = new Vector<BookDTO>();
			List<ReviewDTO> reviewLists = new Vector<ReviewDTO>();
			ReviewDAO rdao = new ReviewDAO();
			BookDAO bdao = new BookDAO();
			UserDTO udto = new UserDTO();
			UserDAO udao = new UserDAO();
			
			
			String mno = session.getAttribute("mno").toString(); //세션에서 유저번호 불러오기
			String rwriter = session.getAttribute("mid").toString(); //Attribute는 Object로 반환해서 toString() 필수
			reviewLists = rdao.selectList2(rwriter); //리뷰리스트 가져오기
			bookLists = bdao.get_book(mno); //예약목록 가져오기
			udto = udao.get_user(mno); // users테이블 가져오기
			rdao.close();
			bdao.close();
			udao.close();
			User_grade grade2 = User_grade.fromValue(udto.getUgrade());//유저 등급가져오기
			String grade = grade2.name(); // enum 값을 문자열로 변환
	%>



<section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-11 ftco-animate">
 <div class="sidebar-box bg-light ftco-animate">
              <h3 class="heading-2">나의 예약목록 확인</h3>
             	<table class="table table-bordered">
						<thead>
							<tr>
								<th width="20%" >매장명</th>
								<th width="20%" >디자이너명</th>
								<th width="20%" >시술명</th>
								<th width="25%" >예약일</th>
								<th width="15%" >리뷰</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (bookLists.isEmpty()) {
							%>
							<tr>
								<td colspan="5" class="text-center">등록된 예약이 없습니다.</td>
							</tr>
							<%
							} else { // 등록된 게시물이 있으면,

							for (BookDTO dto : bookLists) { // boardLists dao에서 받은 결과 리스트
							
							%>
							<tr>
								<td><%=dto.getBsname()%></td>
								<td><%=dto.getBdname()%></td>
								<td><%=dto.getBcut()%></td>
								<td><%=dto.getBdate()%></td>
								<%
								Date today = new Date();
								SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
								Date bookDate = simpleDateFormat.parse(dto.getBdate());
							if (bookDate.after(today)) {%>
								<td><a>리뷰등록</a></td>
							<% } else {
							%>
								<td><a href='../Review/writeReview.jsp?rdno=<%=dto.getBdno()%>'>리뷰등록</a></td>
							</tr>
							<%
							}
							%>
							<%
							}
							}
							%>
						</tbody>
					</table>
					<table class="table table-bordered">
             		<tr>
								<th >회원등급</th>
								<th ><%=grade%></th>
								<th >총 이용금액</th>
								<th colspan="2"><%=udto.getUmoney()%>원</th>
								
							</tr>
							</table>
             
            </div>

            <div class="sidebar-box bg-light ftco-animate">
              <h3 class="heading-2">내가 작성한 리뷰 확인</h3>
              	<table class="table table-bordered">
						<thead>
							<tr>
								<th width="15%">매장</th>
								<th width="10%">디자이너</th>
								<th width="60%">내용</th>
								<th width="25%">작성일</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (reviewLists.isEmpty()) {
							%>
							<tr>
								<td colspan="5" class="text-center">작성한 리뷰가 없습니다.</td>
							</tr>
							<%
							} else { // 등록된 게시물이 있으면,

							for (ReviewDTO dto : reviewLists) { // boardLists dao에서 받은 결과 리스트
							%>
							<tr>
								<td><%=dto.getRsname()%></td>
								<td><%=dto.getRdname()%></td>
								<td><%=dto.getRcontents()%></td>
								<td><%=dto.getRdate()%></td>
							</tr>
							<%
							}
							}
							
							%>
						</tbody>
					</table>
            </div>
			    </div>
        </div>
      </div>
    </section>







<!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/bootstrap-datepicker.js"></script>
  <script src="../js/jquery.timepicker.min.js"></script>
  <script src="../js/scrollax.min.js"></script>
 
  <script src="../js/main.js"></script>
    <%@ include file="../Common/footer.jsp" %>
</body>
</html>