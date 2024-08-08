<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="../Common/index.jsp"><span
				class="flaticon-scissors-in-a-hair-salon-badge"></span>미용실 예약 사이트</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="../Common/index.jsp"
						class="nav-link">Home</a></li>
					
						<%if (session.getAttribute("mid") != null) {
					switch (session.getAttribute("mgrade").toString()) {
					case "1" : %>
						<li class="nav-item"><a href="../Cut/adminservice.jsp"
						class="nav-link">관리자 메뉴</a></li>
						<li class="nav-item"><a href="../Book/bookList.jsp"
						class="nav-link">예약목록 보기</a></li>
						<%
						break;
					case "2" :
						break;
					case "3" :%>
					<li class="nav-item"><a href="../Book/booking_main.jsp"
						class="nav-link">예약하기</a></li>
						<li class="nav-item"><a href="../Member/activity.jsp"
						class="nav-link">나의 활동내역</a></li>
					<%
					}}//switch,if end
					//else end
					%>
					<%
					if (session.getAttribute("mid") == null) {
					%>
					<li class="nav-item active"><a href="../Member/login.jsp"
						class="nav-link">로그인</a></li>
					<%
					} else {
					%><li class="nav-item active"><a href="../Member/logout.jsp"
						class="nav-link">로그아웃</a></li>
					<li class="nav-item"><a href="../Member/user_profile.jsp"
						class="nav-link">회원정보</a></li><%}%>
					
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>