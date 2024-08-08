<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>시술 추가</title>
</head>
<body>
	<%@ include file="../Common/header.jsp" %>
	<%@ include file="../Common/check_grade1.jsp" %>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg-1.jpg')"
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
					<h2 class="mb-4">Add New Hair Cut</h2>
					<p>Input the properties of hair cut. follow down below</p>
				</div>
			</div>
		</div>
	</section>

    <script>/* Form 유효성 검사 */
    function validateForm(form) {
        if (form.add_ccutname.value == "") {
            alert("커트이름을 입력하세요.");
            document.add_ccutname.focus();
            return false; 
        }
        if (form.add_cprice.value == "") {
            alert("커트가격을 입력하세요.");
            document.add_cprice.focus();
            return false; 
        }
        if (form.add_ccontent.value == "") {
            alert("커트설명을 입력하세요.");
            document.add_ccontent.focus();
            return false; 
        }
        if (form.add_cimage.value == "") {
            alert("이미지파일을 업로드하세요.");
            document.add_cimage.focus();
            return false; 
        }
    }
    </script>
	<div class="row justify-content-center pb-3">
		<form action="addHairCutProcess.jsp" method="post" name="addHairFrm" enctype="multipart/form-data"
		onsubmit="return validateForm(this);">
			커트이름 : <input class="form-control" type="text" name="add_ccutname" required	placeholder="커트이름.." /><br />
			커트내용설명 : <input class="form-control" type="text" name="add_ccontent" required placeholder="커트설명.." /><br />
			커트가격 : <input class="form-control" type="text" name="add_cprice" required	placeholder="커트가격.." /><br />
			이미지 : <input class="form-control" type="file" name="add_cimage" required placeholder="image..." /><br />
			<input type="submit" class="btn btn-primary btn-outline-primary"
				value="추가" />
		</form>
	</div>

	<!-- 하단 메뉴 -->
	<%@ include file="../Common/footer.jsp" %>

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