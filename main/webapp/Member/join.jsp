<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
<style>
.hero-wrap {
	height: 50vh;
}

.form-group {
	margin-bottom: 1rem;
}

.col-sm-6 {
	padding: 0 15px;
}

.full-width {
	width: 100%;
}

.equal-width {
	display: flex;
	flex-wrap: wrap;
	gap: 15px;
}

.equal-width .form-group {
	flex: 1;
	min-width: calc(50% - 15px);
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
					<form method="post" action="joinProcess.jsp"
						class="appointment-form full-width"
						onsubmit="return validateForm(this);">
						<div class="row equal-width">
							<div class="form-group">
								아이디 <input type="text" class="form-control" name="JoinId"
									placeholder="Id" required />
							</div>
							<div class="form-group">
								패스워드 <input type="text" class="form-control" name="JoinPw"
									placeholder="Password" required />
							</div>
							<div class="form-group">
								이름 <input type="text" name="JoinName" class="form-control"
									placeholder="이름" required />
							</div>
							<div class="form-group">
								주민번호or사업자번호 <input type="text" name="JoinSsn"
									class="form-control" placeholder="주민번호 or 사업자번호" required />
							</div>
							<div class="form-group">
								<div class="select-wrap">
									<div class="icon">
										<span class="ion-ios-arrow-down"></span>

									</div>
									가입 권한 <select name="joinGrade" id="joinGrade"
										class="form-control" required>
										<option value="3">일반회원</option>
										<option value="1">사업자</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								핸드폰번호 <input type="text" class="form-control" name="JoinPhone"
									placeholder="Phone" required />
							</div>
						</div>
						<div class="button-group">
							<input type="submit" value="회원가입" class="btn btn-primary" /> <input
								type="button" value="뒤로가기" class="btn btn-secondary"
								onclick="../Common/index.jsp" />
						</div>

					</form>
				</div>
			</div>
		</div>

	</section>
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