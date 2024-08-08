<%@page import="hairshop.dto.MemberDTO"%>
<%@page import="hairshop.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String sessionID = session.getAttribute("mid").toString();
MemberDAO memberDAO = new MemberDAO();
MemberDTO memberDTO = memberDAO.getMember(sessionID);

request.setAttribute("memberDTO", memberDTO);
String grade;

if (memberDTO != null) {
	System.out.print(memberDTO.getMid());

	if (memberDTO.getMgrade() == 1) {
		grade = "관리자 전용 계정";
		request.setAttribute("grade", grade);
		System.out.print(grade);
	} else if (memberDTO.getMgrade() == 2) {
		grade = "디자이너 계정";
		request.setAttribute("grade", grade);
		System.out.print(grade);
	} else {
		grade = "손님 계정";
		request.setAttribute("grade", grade);
		System.out.print(grade);
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<title>회원 수정</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
	<%@ include file="../Common/check_login.jsp" %>
	<%@ include file="../Common/header.jsp"%>
	<section class="hero-wrap hero-wrap-2">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate pb-4 text-center">
					<div class="form-title"
						style="text-align: center; font-size: 1.5em; margin-bottom: 1em; color: orange;">회원
						정보 수정</div>
					<form method="post" action="updateProcess.jsp"
						class="appointment-form full-width"
						onsubmit="return validateForm(this);">
						<div class="row equal-width">
							<div class="form-group">
								아이디 <input
									style="background-color: #e0e0e0 !important; width: 100%; box-sizing: border-box;"
									type="text" class="form-control"
									value="${ memberDTO.getMid() }" readonly />
							</div>

							<div class="form-group">
								비밀번호 <input type="password" class="form-control" name="UpdatePw"
									placeholder="Password" required value="${ memberDTO.getMpw() }" />
							</div>

							<div class="form-group">
								이름 <input
									style="background-color: #e0e0e0 !important; width: 100%; box-sizing: border-box;"
									type="text" class="form-control"
									value="${ memberDTO.getMname() }" readonly />
							</div>

							<div class="form-group">
								핸드폰 번호 <input type="text" class="form-control"
									name="UpdatePhone" placeholder="Phone"
									value="${ memberDTO.getMphone() }" required />
							</div>

							<div class="form-group">
								현재 계정 권한 <input
									style="background-color: #e0e0e0 !important; width: 100%; box-sizing: border-box;"
									type="text" class="form-control" value="${ grade }" readonly />
							</div>

							<div class="form-group">
								회원가입일 <input
									style="background-color: #e0e0e0 !important; width: 100%; box-sizing: border-box;"
									value="${ memberDTO.getMdate() }" readonly />
							</div>


						</div>
						<div class="button-group">
							<input type="submit" value="수정완료" class="btn btn-primary" /> <input
								type="button" value="회원탈퇴" class="btn btn-secondary"
								onclick="confirmDelete()" /> <input type="button" value="뒤로가기"
								class="btn btn-secondary" onclick="location.href='../Common/index.jsp'" />

						</div>

					</form>
				</div>
			</div>
		</div>

	</section>
	<script>
		function confirmDelete() {
			if (confirm("정말 탈퇴하시겠습니까?")) {
				location.href = "deleteMember.jsp";
			}

		}
	</script>
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