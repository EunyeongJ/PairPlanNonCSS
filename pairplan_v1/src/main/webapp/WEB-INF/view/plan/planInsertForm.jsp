<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	if(session.getAttribute("session_mem_num")==null)
		response.sendRedirect(request.getContextPath() + "/member/memberLogin");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="PairPlan">
   	<meta name="description" content="">

    <title>PairPlan | Make A Plan</title>

   <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

	<!-- font -->
	<link href='https://fonts.googleapis.com/css?family=Ubuntu:400,500,700,300' rel='stylesheet' type='text/css'>

	<!-- favicon icon -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/ico/favicon.ico">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>  
<body>
	
	<jsp:include page="/WEB-INF/view/header.jsp"/>

	<div class="page">
		<div id="breadcrumb-section" class="section">
			<div class="container">
				<div class="page-title text-center">
					<h1>Make A Plan</h1>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/member/main">Home</a></li>
						<li class="active">Plans</li>
					</ol>
				</div>
			</div>
		</div><!-- breadcrumb-section -->

		<div class="avt-post-wrapper section">
			<div class="container">
				<div class="avt-post">
				
					<form name="insertform" id="insertform" onsubmit="return locationInfoSet()" action="insert" method="post" enctype="multipart/form-data">
						<input type="hidden" name="plan_infos">
						<input type="hidden" name="mem_num" value="${sessionScope.session_mem_num}">

							<div class="seller-option avtpost-fields">
								<div class="row">
									<div class="col-md-12">
										<h3>Make Your Plan <span style="color: #FF5E00;">What kind of travel do you want?</span></h3>
									</div>
				                  <div class="col-md-6">
				                    <div class="post-inner">
				                      <div class="row form-group">
				                        <label class="col-md-4">Title Of Plan: </label>
				                        <div class="col-md-8">
				                          <input type="text" required="required" class="form-control" name="plan_title" id="text" placeholder="Plan Title Go There" style="background-color:#f7f7f7">
				                        </div>
				                      </div>
				                    </div><!-- post-inner -->
				                    <div class="post-inner select-cat">
				                      <div class="row form-group">
				                        <label class="col-md-4">Select People Number: </label>
				                        <div class="col-md-8">
				                          <select name="plan_people" id="category-group" class="form-control" style="background-color:#f7f7f7">
				                            <option value="1">1</option>
				                            <option value="2">2</option>
				                            <option value="3">3</option>
				                            <option value="4" selected="selected">4</option>
				                            <option value="5">5</option>
				                            <option value="6">6</option>
				                            <option value="7">7</option>
				                            <option value="8">8</option>
				                            <option value="9">9</option>
				                            <option value="10">10</option>
				                          </select>
				                        </div>
				                      </div>
				                    </div><!-- post-inner -->
				                    <div class="post-inner">
				                      <div class="row form-group">
				                        <label class="col-md-4">Description: </label>
				                        <div class="col-md-8">
				                          <textarea class="form-control" required="required" name="plan_cont" id="textarea" placeholder="Write details about your plan" rows="6" style="background-color:#f7f7f7"></textarea>
				                        </div>
				                      </div>
				                    </div><!-- post-inner -->
				                  </div>
				                  <div class="col-md-6">
				                    <div class="post-inner">
				                      <div class="row form-group">
				                        <label class="col-md-4">Plan Image <span>(default)</span> :	</label>
				                        <div class="col-md-8">
				                            <img src="" id="thumbnailImage" style="width:100%; height:270px; border-radius:6px;">
				                        </div>
				                      </div>
				                    </div><!-- post-inner -->
				                    <div class="post-inner">
				                      <div class="row form-group">
				                        <label class="col-md-4">Upload Photo: </label>
				                        <div class="col-md-8">
				                          <div class="upload-section">
				                            <label class="upload-image" for="uploadOne">
				                              <jsp:useBean id="random" class="java.util.Random" scope="application" />	<!-- 랜덤사용 -->
				                              <input type="file" id="thumbnail" name="thumbnail" accept="image/*" onchange="imageChange();" style="background-color:#f7f7f7" />
				                              <input type="hidden" id="plan_img" name="plan_img" value="${pageContext.request.contextPath}/resources/images/plan/default${random.nextInt(2)}.jpg" />
				                            </label>
				                          </div>
				                        </div>
				                      </div>
				                    </div><!-- post-inner -->
				                  </div>
								</div>
								
								
								<hr>
				                <div class="row">
									<div class="col-md-12">
										<label>Choose your travel style: </label>
									</div>
					                <div class="col-md-12">
					                <c:forEach var="travel_style" items="${travel_style}">
					                  <label class="checkbox-inline" style="padding-right:5px;">
					                    <input type="checkbox" name="plan_style" value="${travel_style.style_num}"> ${travel_style.style_name}
					                  </label>
					                </c:forEach>
					                </div>
								</div>
								
							</div><!-- seller-option -->

							<div class="blog-content blog-detail">
				                <div class="blog-post">
				                  <div class="entry-content" style="border: 1px solid #ddd; padding-top: 25px; border-radius: 4px;">
									<h3 style="color: #000; margin-bottom: 30px;">Plan Infomation</h3>
				                 	<div class="map_wrap">
									    <div id="map" style="width:100%; height:400px; position:relative; overflow:hidden;"></div>
									    <!-- 검색타입 컨트롤 div -->
									    <div class="custom_typecontrol radius_border" style="right: 0px; left: 10px; width: 180px;">
									    	<input type="text" id="inputAddress" placeholder="주소 입력">
											<span id="searchAddress" class="non_btn search_btn" onclick="move()">주소 검색</span>
										</div>	
									    <!-- 지도타입 컨트롤 div -->
									    <div class="custom_typecontrol radius_border">
									        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
									        <span id="btnSkyview" class="non_btn" onclick="setMapType('skyview')">스카이뷰</span>
									    </div>
									</div>
									<hr>	
									
									<fmt:setLocale value="en_US" scope="session"/>	<!-- 시간 로케일 설정 -->
									<jsp:useBean id="now" class="java.util.Date" />	<!-- 현재 시간 구하기 -->
									
									<p class="text-right"><i class="fa fa-clock-o"></i> Today: <fmt:formatDate value="${now }" type="date"/></p>
									
									<div class="panel panel-default">
  									  <div class="panel-body">
										<div style="padding-bottom: 10px;">
											<p class="text-center">
												<label style="font-size: 18px;"><i class="fa fa-map-marker fa-2x" aria-hidden="true"></i> 
												<span id="locationAddr"></span>
												<span id="locationInfo">Please select a location on the map.</span></label>
											</p>
											
										</div>
										<div class="row">
										  <div class="col-lg-6">
							                <div class="input-group">
							                  <input type="date" id="start_date" name="start_date" class="form-control" style="height: 34px;">
							                  <span class="input-group-addon" style="background-color: #f7f7f7;">To</span>
							                  <input type="date" id="end_date" name="end_date" class="form-control" style="height: 34px;">
							                </div>
							              </div>
										  <div class="col-lg-6">
										    <div class="input-group">
										      <input type="text" id="title" class="form-control" placeholder="Location title..." style="height: 34px;">
										      <span class="input-group-btn">
										        <button class="btn btn-default" type="button" style="background-color: #f7f7f7;" onclick="addLocation()">Add!</button>
										      </span>
										    </div><!-- /input-group -->
										  </div><!-- /.col-lg-6 -->
										</div><!-- /.row -->
									   </div>
									</div>
				                    
									<hr>
									<div class="post-excerpt" style="overflow: hidden;">
									      <!-- <div>
										      <div style="float:right; padding-top: 20px; padding-right: 20px;">
										              <button id="del_btn" type="button" class="close" aria-label="Close" onclick="deleteList(1)"><i class="fa fa-times fa-1x"></i></button>
										      </div>
										      <p class="quote-text">
						                      <span class="label-color-red">1</span> &nbsp; &nbsp; <i class="fa fa-map-marker"></i> 서울 관악구 성현동 &nbsp; &nbsp; <i class="fa fa-map-pin"></i> 관악우체국<br>
						                          	<span><i class="fa fa-clock-o"></i> 2017-4-13</span>
						                          	 ~ <span>2017-4-13</span>
						                      </p>
					                      </div> -->
				                    </div>
				                    
				                    <a class="date">
				                    	<span><fmt:formatDate value="${now }" type="date" pattern="d"/></span> 
				                    	<fmt:formatDate value="${now }" type="date" pattern="MMM"/>
				                    </a>
				                  </div>
				                </div>
				              </div>

							<div class="submit-section">
								<div class="submit-button" style="padding-top: 20px;">
									<button type="button" style="margin-bottom: 5px;" class="btn btn-danger btn-lg" onclick="location.href='planList'">
										<i class="fa fa-reply"></i>
									</button>
									<button type="submit" style="margin-bottom: 5px;" class="btn btn-success btn-lg">Write&nbsp; <i class="fa fa-check"></i></button>
								</div>
							</div>
					</form>
				</div>
			</div>
		</div> <!-- avt-post -->
	</div>	<!-- page -->

	<jsp:include page="/WEB-INF/view/footer.jsp"/>
	
	 <!-- JS -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/modernizr.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/custom.js"></script>
    <!-- daum map api -->
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=6277bf7a1c54113effe51dbd6375f8cd&libraries=services"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plan/mapControlScript.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plan/planUploadScript.js"></script>

  </body>
</html>
