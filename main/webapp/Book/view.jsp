<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="hairshop.dto.BookDTO"%>
<%@page import="hairshop.dao.BookDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../Common/check_grade1.jsp"%>
<%@include file="../Common/check_login.jsp"%>
<%
String num = request.getParameter("num"); // 제목 클릭시 게시물의 번호가 num, parameter로 넘어옴
BookDAO bookDAO = new BookDAO(); // 1단계, 2단계

BookDTO bookDTO = bookDAO.selectView(num); // 번호를 이용해서 객체가 넘어옴
bookDAO.close();
System.out.print(bookDTO.getBno());
session.setAttribute("bookDTO", bookDTO);
Date today = new Date();
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<!DOCTYPE html>
<html>
<head>
<title>View.jsp : 제목 클릭시 상세 보기 페이지</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Barlow+Condensed:500,600,700&display=swap"
	rel="stylesheet">

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
<style>
.hero-wrap {
	height: 50vh;
}

.form-group {
	margin-bottom: 1rem;
	text-align: left;
}

.form-group label {
	width: 150px; /* 레이블 너비를 설정하여 정렬 */
	margin-right: 10px; /* 레이블과 입력 박스 사이의 간격 */
}

.col-sm-6 {
	padding: 0 15px;
}

.full-width {
	width: 100%;
}

.appointment-form {
	padding: 2rem;
	border-radius: 10px;
	background: rgba(255, 255, 255, 0.9);
}
</style>
</head>
<body>
	<%@ include file="../Common/header.jsp"%>
	<section class="hero-wrap hero-wrap-2">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate pb-4 text-center">
					<form method="post"
						action="ucount.jsp?buno=<%=bookDTO.getBuno()%>&bno=<%=bookDTO.getBno()%>"
						class="appointment-form">
						<div class="row">
							<div class="col-sm-5">
								<div class="form-group">
									예약번호 <input type="text" class="form-control"
										value="${ bookDTO.getBno() }" readonly />
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									매장명 <input type="text" class="form-control"
										value="${ bookDTO.getBsname() }" readonly />
								</div>

							</div>
							<div class="col-sm-5">
								<div class="form-group">
									예약날짜 <input type="text" class="form-control"
										value="${ bookDTO.getBdate() }" readonly />
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									커트명 <input type="text" class="form-control"
										value="${ bookDTO.getBcut() }" readonly />
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									디자이너명 <input type="text" class="form-control"
										value="${ bookDTO.getBdname() }" readonly />
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									사용자 번호 <input type="text" class="form-control"
										value="${ bookDTO.getBuno() }" readonly />
								</div>
							</div>


							<%
							Date bookDate = simpleDateFormat.parse(bookDTO.getBdate());
							if (bookDate.after(today)) {

							} else {
							%>
							<div>
								<input type="radio" name="status" value="noshow" /> NOSHOW <input
									type="radio" name="status" value="show" /> SHOW <input
									type="submit" name="check" class="btn btn-secondary"
									value="submit" />
									<input type="hidden" name="cutName" value="<%=bookDTO.getBcut()%>" } />
							</div>
							<%
							}
							%>




						</div>
					</form>
				</div>
			</div>
		</div>

	</section>




	</form>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="../js/google-map.js"></script>
	<script src="../js/main.js"></script>
	<%@ include file="../Common/footer.jsp"%>
</body>
</html>