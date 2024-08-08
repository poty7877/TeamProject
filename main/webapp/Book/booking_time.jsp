<%@page import="hairshop.dao.BookDAO"%>
<%@page import="hairshop.dto.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script>



</script>

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

.time-selection {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  margin-bottom: 20px;
}

.time-selection input[type="radio"] {
  display: none;
}

.time-selection label {
  display: inline-block;
  padding: 10px 15px;
  background-color: #f0f0f0;
  border: 1px solid #ddd;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s;
}
.time-selection input[type="radio"]:checked + label {
  background-color: #e29912;
  color: white;
}
</style>
<title>예약하기</title>
</head>
<body>
	<%@ include file="../Common/header.jsp"%>
	<%@ include file="../Common/check_login.jsp" %>
	<!-- header -->
	<%
ShopDTO sdto = new ShopDTO();
BookDAO bdao = new BookDAO();
String bsname = request.getParameter("bsname");
sdto = bdao.check_time(bsname);
String[] times = {"10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30", "20:00", "20:30", "21:00", "21:30", "22:00"};
String ddate = request.getParameter("ddate");//ajax배우고 구현해야 될듯... 불가능
%>
   
 
	<section class="hero-wrap hero-wrap-2">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate pb-4 text-center">
					<form method="post" action="booking_designer.jsp"
						class="appointment-form full-width">
						<div class="row equal-width">
							<div class="form-group">
								 <input type="hidden" name="bsname" value=<%=bsname%> />
								 <input type="date" class="form-control" name="bdate" pattern="\d{4}-\d{2}-\d{2}" required />
							</div>	
  <div class="time-selection">
    <%
      
      for (String time : times) {
        boolean isBooked = time.equals(ddate); // ddate와 시간이 같은지 확인합니다
    %>
      <input type="radio" required id="<%= time %>" name="btime" value="<%= time %>" <%= isBooked ? "readonly disabled" : "" %>>
      <label for="<%= time %>" class="time-slot <%= isBooked ? "booked" : "" %>"><%= time %></label>
    <% } %>
  </div>

						</div>
						<div class="button-group">
							<input type="submit" value="예약하기" class="btn btn-primary" /> <input
								type="button" value="뒤로가기" class="btn btn-secondary"
								onclick="../Common/index.jsp" />
						</div>

					</form>
				</div>
			</div>
		</div>

		<!-- loader -->
		<div id="ftco-loader" class="show fullscreen">
			<svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke="#eeeeee" />
        <circle class="path" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
      </svg>
		</div>

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
		<!-- footer -->
</body>
</html>