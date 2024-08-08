<%@page import="hairshop.dto.CutDTO"%>
<%@page import="hairshop.dao.CutDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<%@ include file="../Common/check_login.jsp" %>
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
					<h2 class="mb-4">헤어컷 상세 보기</h2>
					<p>입력된 헤어컷의 정보를 수정합니다.</p>
				</div>
			</div>
			<div
				class="row no-gutters d-flex justify-content-center align-items-center">
				<!-- justify-content-center align-items-center : 가운데 정렬 -->
				<div
					class="col-md-6 col-lg-3 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block text-center">
	<%
	int cno = Integer.parseInt(request.getParameter("cno"));
	CutDAO dao = new CutDAO(); // 1,2 단계
	CutDTO detailHaitCut = dao.selectHair(cno); // 3,4 단계
	dao.close(); // 5단계
	%>
		<div class="col-md-12 d-flex ftco-animate" style="width: 600px; height: 400px";>
			<div class="blog-entry align-self-stretch d-md-flex">
				<img src="<%=request.getContextPath()%>/Haircut_images/<%=detailHaitCut.getSfile()%>" width="245" height="300">
                  <div class="text d-block pl-md-4">
                    <div class="meta mb-3">
                      <div>
                      </div>
                    </div>
                    <p>
					헤어 이름 : <%=detailHaitCut.getCcutname()%>
                    </p>
                    <p>
					헤어 설명 : <%=detailHaitCut.getCcontents()%>
                    </p>
                    <p>
					헤어 가격 : <%=detailHaitCut.getCprice()%>
                    </p>
                    <p>
                      <a
                        href="deleteHairCut.jsp?cno=<%= detailHaitCut.getCno()%>"
                        class="btn btn-primary py-2 px-3"
                        >삭제</a
                      >
                    </p>
                  </div>
                </div>
              </div>
					</div>
				</div><!-- hairCutList.jsp 로가는 div -->
			</div>
		</div>

		<form action="editHairCut.jsp" method="post" name="edtHairFrm"
		onsubmit="return validateForm(this);">
		<div class="container">
			<div
				class="row no-gutters d-flex justify-content-center align-items-center">
				<!-- justify-content-center align-items-center : 가운데 정렬 -->
				<div
					class="col-md-6 col-lg-3 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block text-center">
		<div class="col-md-12 d-flex ftco-animate" style="width: 600px;">
			<div class="blog-entry align-self-stretch d-md-flex">
				<img src="<%=request.getContextPath()%>/Haircut_images/<%=detailHaitCut.getSfile()%>" width="245" height="300">
                  <div class="text d-block pl-md-4">
                    <div class="meta mb-3">
                      <div>
                      </div>
                    </div>
                    <input type="hidden" name="edit_cno" value="<%=detailHaitCut.getCno()%>">
                    <p>
					헤어 이름 수정:<input class="form-control" type="text" name="edit_cname" required	placeholder="변경할 헤어 이름" /><br />
                    </p>
                    <p>
					헤어 설명 수정:<input class="form-control" type="text" name="edit_ccon" required placeholder="변경할 설명" /><br />
                    </p>
                    <p>
					헤어 가격 수정:<input class="form-control" type="text" name="edit_pri" required	placeholder="변경할 금액" /><br />
                    </p>
                    <p>
					<input type="submit" class="btn btn-primary btn-outline-primary"
					value="변경" />
                    </p>
                  </div>
                </div>
              </div>
					</div>
				</div><!-- hairCutList.jsp 로가는 div -->
			</div>
		</div>
	</form>
		
		
		
	</section>
	<!-- 중단부 클릭 메뉴 -->



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