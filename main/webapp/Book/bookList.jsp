
<%@page import="hairshop.dao.MemberDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.Page"%>
<%@page import="hairshop.dto.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="hairshop.dao.BookDAO"%>
<%@include file="../Common/check_grade1.jsp" %>
<%@include file="../Common/check_login.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BookDAO bookDAO = new BookDAO();
Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) { // 검색어가 있으면
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);

}
int totalCount = bookDAO.selectCount(param); // 검색조건을 파라미터로 dao로 넘어가고 결과는 int totalCount로 받음
// 전체 페이지 수 계산
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
// 현재 페이지에 보여줄 리스트 개수 10
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
// 한 화면에 보여줄 블럭 수 5
int totalPage = (int) Math.ceil((double) totalCount / pageSize);
// 총 페이지 수 = 	11	  <-	(올림)10.8	=	108     /    10 // 3단계

// 현재 페이지용 코드
int pageNum = 1; // 무조건 처음페이지는 1
String pageTemp = request.getParameter("pageNum"); // List.jsp?pageNum=1
if (pageTemp != null && !pageTemp.equals("")) {
	try {
		pageNum = Integer.parseInt(pageTemp);
	} catch (NumberFormatException e) {
		pageNum = 1;
	}
}
//목록에 출력할 게시물 범위를 계산 2단계

int start = (pageNum - 1) * pageSize + 1; // 첫 게시물 번호 (11)
//	    11  =   ( 2  -   1) *   10   +   1
int end = pageNum * pageSize; // 마지막 게시물 번호 (20)
//	    20  =  2   *   10
param.put("start", start);
param.put("end", end); // map을 통해 검색조건과 같은 타입으로 전달이 됨
Date today = new Date();
//검색조건에 대한 변수 선언 - Map<String, Obeject> maps
List<BookDTO> bookLists = bookDAO.selectList(param); // 검색조건을 파라미터로 dao로 넘어가고 결과는 list로 받음

SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<!DOCTYPE html>
<html>
<head>
<title>예약 확인 게시판</title>
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

.appointment-form {
	width: 100%;
	padding: 3rem;
	border-radius: 10px;
	background: rgba(255, 255, 255, 0.9);
	padding: 3rem;
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
				<form method="get">
					<div style="margin-top: 90px;" class="form-group">
						<table border="1" width="100%">
							<tr>
								<td align="center"><select name="searchField">
										<option value="bsname">매장명</option>
										<option value="bcut">디자이너명</option>
										<option value="bdate">날짜</option>
								</select> <input type="text" name="searchWord" /> <!-- 검색 단어 --> <input
									type="submit" value="검색하기" /> <!-- 버튼 --></td>
							</tr>
						</table>
					</div>
				</form>

				<form method="get" class="appointment-form">
					
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width="10%">예약번호</th>
								<th width="30%">매장명</th>
								<th width="20%">시술명</th>
								<th width="20%">회원명</th>
								<th width="20%">예약날짜</th>
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

							int virtualNum = 0; // 가상번호
							int countNum = 0; // 페이징 처리 처리용으로 개선
							for (BookDTO dto : bookLists) { // boardLists dao에서 받은 결과 리스트 
	
								/* virtualNum = totalCount--; //게시물의 총개수에서 -1 */
								virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
								String name = "" ; // dto의 buno를 가지고, 회원 아이디, 이름을 가져올수 있음?
								MemberDAO dao = new MemberDAO();
								name = dao.memberName(dto.getBuno());
								dao.close();
								
							%>
							<tr>
								<td><a href="view.jsp?num=<%=dto.getBno()%>"><%=virtualNum--%></a></td>
								<td><%=dto.getBsname()%></td>
								<td><%=dto.getBcut()%></td>
								<td><%=name%></td>
								<%
								Date bookDate = simpleDateFormat.parse(dto.getBdate());
								if (bookDate.after(today)) {
								%>
								<td><%=dto.getBdate()%></td>
								<%
								} else {
								%><td style="color: red;"><%=dto.getBdate()%></td>
								<%
								}
								}
								}
								%>
							</tr>
						</tbody>
					</table>
				</form>
				<!-- 페이징 -->
				<table border="1"
					style="background-color: #444444; color: #ffffff; padding: 5px 10px; border-raduis: 5px;">
					<tr align="center">
						<td><%=Page.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI())%>
						</td>
					</tr>
				</table>
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