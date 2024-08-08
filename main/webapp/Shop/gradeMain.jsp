<%@page import="hairshop.dao.MemberDAO"%>
<%@page import="hairshop.dto.ShopDTO"%>
<%@page import="java.util.List"%>
<%@page import="hairshop.dao.ShopDAO"%>
<%@page import="hairshop.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String findId = request.getParameter("searchId");
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.searchUser(findId);
	
	// 헤어샵 목록 제공용
	ShopDAO shopdao = new ShopDAO(); // 1,2 단계
	List<ShopDTO> shopLists = shopdao.shopList(); // 3,4 단계
	dao.close(); // 5단계

	%>
<!DOCTYPE html>
<html>
<head>
<title>Haircare - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Barlow+Condensed:500,600,700&display=swap"
	rel="stylesheet" />

<link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css" />
<link rel="stylesheet" href="../css/animate.css" />

<link rel="stylesheet" href="../css/owl.carousel.min.css" />
<link rel="stylesheet" href="../css/owl.theme.default.min.css" />
<link rel="stylesheet" href="../css/magnific-popup.css" />

<link rel="stylesheet" href="../css/aos.css" />

<link rel="stylesheet" href="../css/ionicons.min.css" />

<link rel="stylesheet" href="../css/bootstrap-datepicker.css" />
<link rel="stylesheet" href="../css/jquery.timepicker.css" />

<link rel="stylesheet" href="../css/flaticon.css" />
<link rel="stylesheet" href="../css/icomoon.css" />
<link rel="stylesheet" href="../css/style.css" />
<meta charset="UTF-8">
</head>
<body>
	<%@ include file="../Common/header.jsp" %>
	<%@ include file="../Common/check_grade1.jsp" %>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('../images/bg-1.jpg')"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center"></div>
			</div>
		</div>
	</section>
	<!-- 백그라운드 이미지 -->

	<section class="services-section ftco-section">
		<div class="container">
			<div class="row justify-content-center pb-3">
				<div class="col-md-10 heading-section text-center ftco-animate">
					<span class="subheading">ADMINISTRATOR</span>
					<h2 class="mb-4">디자이너 임명</h2>
					<p>유저 아이디를 검색하고 디자이너로 임명하세요.</p>
				</div>
			</div>
			<div
				class="row no-gutters d-flex justify-content-center align-items-center">
				<!-- justify-content-center align-items-center : 가운데 정렬 -->
			</div>
		</div>
	</section>
	<!-- 중단부 클릭 메뉴 -->

	
	<%if(findId == null) { %>
	    <script>/* Form 유효성 검사 */
    function validateForm(form) {
        if (form.search_id.value == "") {
            alert("아이디를 입력해주세요.");
            document.add_ccutname.focus();
            return false; 
        }
    }
    </script>
	<div class="row justify-content-center pb-3" onsubmit="return validateForm(this);">
		<form action="gradeSearchProcess.jsp" method="post" name="gradeSchFrm">
			아이디 : <input class="form-control" type="text" name="search_id" required	placeholder="찾을 아이디" /><br />
			<input type="submit" class="btn btn-primary btn-outline-primary"
				value="검색" />
		</form>
	</div>
	<% } %>
	
	<%if(findId != null) {%>

	<% for (ShopDTO s : shopLists) { %>


	매장정보 | 샵이름: <%= s.getSname() %> |샵 코드: <%= s.getSno() %>

	<% } %>

	회원정보 | 회원번호 : <%= dto.getMno() %> 아이디 : <%= dto.getMid() %> 이름 :<%= dto.getMname() %> Grade : <%= dto.getMgrade() %>

		<form action="gradeEditProcess.jsp" method="post" name="gradeEdtFrm">
			지명 매장 코드 : <input class="form-control" type="text" name="input_dsno" required	placeholder="소속시킬 매장 코드입력.." /><br />
			디자이너명 : <input class="form-control" type="text" name="input_dname" required	placeholder="디자이너 이름 입력.." /><br />
			<input type="submit" class="btn btn-primary btn-outline-primary" value="변경" />
		</form>

	<% } %>
	
	
	
	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2 logo">Haircare</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">FAQs</a></li>
							<li><a href="#" class="py-2 d-block">Privacy</a></li>
							<li><a href="#" class="py-2 d-block">Terms Condition</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Links</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">Home</a></li>
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Services</a></li>
							<li><a href="#" class="py-2 d-block">Work</a></li>
							<li><a href="#" class="py-2 d-block">Blog</a></li>
							<li><a href="#" class="py-2 d-block">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- 하단 샵 관련 세부사항 -->

	<!-- script src 기능들이 살아남 -->
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

</body>
</html>