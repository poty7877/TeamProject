<%@page import="hairshop.dao.CutDAO"%>
<%@page import="hairshop.dto.CutDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="hairshop.dao.BookDAO"%>
<%@page import="hairshop.dto.DesignerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
     <link
      href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Barlow+Condensed:500,600,700&display=swap"
      rel="stylesheet"
    />
	 <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
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
    <style>/* 버튼 스타일 */
        .button {
            background-color: #4CAF50; /* 녹색 배경 */
            border: none; /* 테두리 제거 */
            color: white; /* 글씨 색상 */
            padding: 15px 32px; /* 여백 */
            text-align: center; /* 글씨 중앙 정렬 */
            text-decoration: none; /* 텍스트 장식 제거 */
            display: inline-block; /* 버튼을 인라인 블록으로 표시 */
            font-size: 16px; /* 글씨 크기 */
            margin: 4px 2px; /* 여백 */
            cursor: pointer; /* 커서 모양을 포인터로 변경 */
            border-radius: 4px; /* 둥근 모서리 */
        }
        .button:hover {
            background-color: #45a049; /* 마우스를 올렸을 때 배경 색상 */
        }
    </style>
<title>예약하기</title>
</head>
<body>
	<%@ include file="../Common/header.jsp" %> <!-- header -->

	   <section
      class="hero-wrap hero-wrap-2"
      style="background-image: url('../images/bg-1.jpg')"
      data-stellar-background-ratio="0.5"
    >
      <div class="overlay"></div>
      <div class="container">
        <div
          class="row no-gutters slider-text js-fullheight align-items-end justify-content-center"
        >
          <div class="col-md-9 ftco-animate pb-5 text-center">
            <h2 class="mb-0 bread">예약메뉴</h2>
            <p class="breadcrumbs">
              <span class="mr-2"
                ><a href="index.jsp"
                  >예약 <i class="ion-ios-arrow-round-forward"></i></a
              ></span>
              <span>매장 선택<i class="ion-ios-arrow-round-forward"></i></span>
              <span>시간 선택<i class="ion-ios-arrow-round-forward"></i></span>
              <span>디자이너 선택</span>
            </p>
          </div>
        </div>
      </div>
    </section>
	 
    
	 <section class="ftco-section ftco-no-pt ftco-no-pb">
      <div class="container-fluid p-0">
        <div class="row no-gutters">
       <% CutDAO dao = new CutDAO(); // 1,2 단계
   	List<CutDTO> hairLists = dao.hairCutList(); // 3,4 단계
   	dao.close(); // 5단계  
   	String bsname= request.getParameter("bsname");
   	String bdate= request.getParameter("bdate");
   	String bdno= request.getParameter("bdno");
   	String bdname= request.getParameter("bdname");
         %>
         <%
		for (CutDTO f : hairLists) {
		%>
		<div class="col-md-12 d-flex ftco-animate" style="width: 600px; height: 400px";>
			<div class="blog-entry align-self-stretch d-md-flex">
				<img src="<%=request.getContextPath()%>/Haircut_images/<%=f.getSfile()%>" width="245" height="300">
                  <div class="text d-block pl-md-4">
                    <div class="meta mb-3">
                      <div>
                      </div>
                    </div>
                    <h3 class="heading">
                   	No. <%=f.getCsno()%> 헤어샵 : <%=f.getCsname()%>
                    </h3>
                    <p>
					헤어 이름 : <%=f.getCcutname()%>
                    </p>
                    <p>
					헤어 설명 : <%=f.getCcontents()%>
                    </p>
     
                   <form action="./booking_process.jsp" method="post" >
                   <input type="hidden" name="bcut" value="<%=f.getCcutname()%>" /> <!-- 커트명 넘기기 -->
                <input type="hidden" name="bsname" value="<%=bsname%>" />  <!-- 매장명 넘기기 -->
                <input type="hidden" name="bdate" value="<%=bdate%>" />    <!-- 예약일 넘기기 -->
                <input type="hidden" name="bdno" value="<%=bdno%>" />     <!-- 디자이너 번호 넘기기 -->
                <input type="hidden" name="bdname" value="<%=bdname%>" /> <!-- 디자이너 이름 넘기기 -->
                <button class="button">예약하기</button>
                </form>
                 
                  </div>
                </div>
              </div>
	<%}%>
          
        
           </div>
      </div>
    </section>
	
	<!-- loader -->
	  <div id="ftco-loader" class="show fullscreen">
      <svg class="circular" width="48px" height="48px">
        <circle
          class="path-bg"
          cx="24"
          cy="24"
          r="22"
          fill="none"
          stroke-width="4"
          stroke="#eeeeee"
        />
        <circle
          class="path"
          cx="24"
          cy="24"
          r="22"
          fill="none"
          stroke-width="4"
          stroke-miterlimit="10"
          stroke="#F96D00"
        />
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
     <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script src="../js/jquery.animateNumber.min.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script>
    <script src="../js/jquery.timepicker.min.js"></script>
    <script src="../js/scrollax.min.js"></script>
    <script src="../js/main.js"></script>
    <%@ include file="../Common/footer.jsp" %> <!-- footer -->
</body>
</html>