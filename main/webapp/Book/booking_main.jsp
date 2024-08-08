<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="hairshop.dao.BookDAO"%>
<%@page import="hairshop.dto.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
ShopDTO sdto = new ShopDTO();
   BookDAO bdao = new BookDAO();
   List<ShopDTO> lists = new Vector<>();
   lists = bdao.read_shop();
  
   
%>
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
<title>예약하기</title>
</head>
<body>
	<%@ include file="../Common/header.jsp" %> <!-- header -->
	<%@ include file="../Common/check_login.jsp" %>
	<!-- 예약 최상단 -->
	 <section
      class="hero-wrap hero-wrap-2"
      style="background-image: url('images/bg-1.jpg')"
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
              <span>매장선택</span>
            </p>
          </div>
        </div>
      </div>
    </section>
    

	 <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
            <div class="row">
            <%for(ShopDTO dto : lists){ 
            		out.print(dto.getSno());
              	%>
              <div class="col-md-12 d-flex ftco-animate">
                <div class="blog-entry align-self-stretch d-md-flex">
                  <a
                    href="blog-single.jsp"
                    class="block-20"
                    style="background-image: url('../images/chahong_main.jpg')" 
                  > <!-- 매장이미지 -->
                  </a>
                  <div class="text d-block pl-md-4">
                    <div class="meta mb-3">
                      <div><a><%=dto.getSopen()%> ~ <%=dto.getSclose()%></a></div>
                      <div>
                        <a href="../Review/review.jsp?rsno=<%=dto.getSno()%>" class="meta-chat"
                          ><span class="icon-chat"><%=bdao.get_review_count(dto.getSno())%></span></a
                        >
                      </div>
                    </div>
                    <h3 class="heading">
                      <a href="#"
                        ><%=dto.getSname()%>
                        </a
                      >
                    </h3>
                    <p>
                     매장위치 : <%=dto.getSlocation()%>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </p>
                    <p>
                      <a
                        href="booking_time.jsp?bsname=<%=dto.getSname()%>"
                        class="btn btn-primary py-2 px-3"
                        >예약하기</a
                      >
                    </p>
                  </div>
                </div> 
              </div>
              <%} bdao.close();%>
               </div>
                <div class="row mt-5">
              <div class="col">
                <div class="block-27">
                  <ul>
                    <li><a href="#">&lt;</a></li>
                    <li class="active"><span>1</span></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">&gt;</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!-- .col-md-8 -->
          <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box bg-light">
              <form action="#" class="search-form bg-light">
                <div class="form-group">
                  <span class="icon ion-ios-search"></span>
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Search..."
                  />
                </div>
              </form>
            </div>
            <div class="sidebar-box bg-light ftco-animate">
              <h3 class="heading-2">Categories</h3>
              <ul class="categories">
                <li>
                  <a href="#">Bags <span>(12)</span></a>
                </li>
                <li>
                  <a href="#">Shoes <span>(22)</span></a>
                </li>
                <li>
                  <a href="#">Dress <span>(37)</span></a>
                </li>
                <li>
                  <a href="#">Accessories <span>(42)</span></a>
                </li>
                <li>
                  <a href="#">Makeup <span>(14)</span></a>
                </li>
                <li>
                  <a href="#">Beauty <span>(140)</span></a>
                </li>
              </ul>
            </div>

            

            <div class="sidebar-box bg-light ftco-animate">
              <h3 class="heading-2">Tag Cloud</h3>
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">donate</a>
                <a href="#" class="tag-cloud-link">charity</a>
                <a href="#" class="tag-cloud-link">non-profit</a>
                <a href="#" class="tag-cloud-link">organization</a>
                <a href="#" class="tag-cloud-link">child</a>
                <a href="#" class="tag-cloud-link">abuse</a>
                <a href="#" class="tag-cloud-link">help</a>
                <a href="#" class="tag-cloud-link">volunteer</a>
              </div>
            </div>

            <div class="sidebar-box bg-light ftco-animate">
              <h3 class="heading-2">Paragraph</h3>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Ducimus itaque, autem necessitatibus voluptate quod mollitia
                delectus aut, sunt placeat nam vero culpa sapiente consectetur
                similique, inventore eos fugit cupiditate numquam!
              </p>
            </div>
          </div>
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
    <script src="../js/jquery.animateNumber.min.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script>
    <script src="../js/jquery.timepicker.min.js"></script>
    <script src="../js/scrollax.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="../js/google-map.js"></script>
    <script src="../js/main.js"></script>
    <%@ include file="../Common/footer.jsp" %> <!-- footer -->
</body>
</html>