<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Theme Region">
   	<meta name="description" content="">

	<title>PairPlan | main</title>

	<!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">

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

	<div class="home-page">
		<div id="home-section" class="parallax-section carousel slide" data-ride="carousel">
			<div class="carousel-inner">

				<div class="item active" style="background-image:url(${pageContext.request.contextPath}/resources/images/bg/main1.jpg)">
					<div class="container">
						<div class="row">
							<div class="col-md-9">
								<div class="slider-content">
									<h1 data-animation="animated lightSpeedIn">Welcome</h1>
									<h2 data-animation="animated lightSpeedIn">Start Your Travel</h2>
									<p data-animation="animated lightSpeedIn">원하는 사람들과 함께 여행을 떠나보세요. 여행 일정을 검색할 수 있습니다.</p>
                  					<div class="ad-btn">
										<a href="/pairplan_v1/plan/planList" class="btn btn-primary" data-animation="animated lightSpeedIn">Go To Plans</a>
									</div>
                				</div>
							</div>
						</div><!-- row -->
					</div><!-- contaioner -->
				</div><!-- item -->

				<div class="item" style="background-image:url(${pageContext.request.contextPath}/resources/images/bg/main8.jpg)">
					<div class="container">
						<div class="row">
							<div class="col-md-9">
								<div class="slider-content">
									<h1 data-animation="animated lightSpeedIn">Right Now</h1>
									<h2 data-animation="animated lightSpeedIn">Make A Plan</h2>
									<p data-animation="animated lightSpeedIn">지금 당장 원하는 여행 계획을 세워 보세요.</p>
                 					<div class="ad-btn">
										<a href="/pairplan_v1/plan/planInsertForm" class="btn btn-primary" data-animation="animated lightSpeedIn">Make A Plan</a>
									</div>
								</div>
							</div>
						</div><!-- row -->
					</div><!-- contaioner -->
				</div><!-- item -->

				<div class="item" style="background-image:url(${pageContext.request.contextPath}/resources/images/bg/main5.jpg)">
					<div class="container">
						<div class="row">
							<div class="col-md-9">
								<div class="slider-content">
									<h1 data-animation="animated lightSpeedIn">Featured Plans</h1>
									<h2 data-animation="animated lightSpeedIn">See The Travel Reviews</h2>
									<p data-animation="animated lightSpeedIn">여행을 다녀온 사람들의 후기를 생생하게 느껴보세요.</p>
                  					<div class="ad-btn">
										<a href="/pairplan_v1/review/review_list" class="btn btn-primary" data-animation="animated lightSpeedIn">Go To Reviews</a>
									</div>
                				</div>
							</div>
						</div><!-- row -->
					</div><!-- contaioner -->
				</div><!-- item -->
			</div>

			<!-- 슬라이드 버튼 -->
			<a class="left carousel-control" href="#home-section" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
		  	</a>
			<a class="right carousel-control" href="#home-section" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
		  	</a>
		</div><!-- #home-section -->


		<div id="search-section">
			<div class="container">
				<form action="../plan/search_plan">
					<div class="search-section">
						<ul>
			               <li>
			                 <input type="date" class="form-control" name="start_date">
			               </li>
			               <li>
			                 <input type="date" class="form-control" name="end_date">
			               </li>
			               <li>
								<input type="text" class="form-control" name="search_text" placeholder="What are you looking for ?">
							</li>
							<li>
							<button type="submit" class="form-control btn btn-primary" value="Search">Search</button>
							</li>
						</ul>
					</div>
				</form>
			</div>
		</div>
		<!-- search-section -->


		<!-- avt-category -->
		<div id="avt-category" class="clearfix">
			<div class="container">

			</div><!-- container -->
		</div><!-- category-avt -->

		<fmt:setLocale value="en_US" scope="session"/>	<!-- 시간 로케일 설정 -->

    	<!-- All -->
		<div class="section" style="padding: 0 60px;">
			<div class="container">
				<div class="section-title">
					<div class="title-content">
						<h2>Browse Plan Schedule</h2>
						<p>저희 사이트는 동행하고 싶은 여행에 대한 정보를 제공합니다. 당신이 원하는 계획 일정을 탐색해보세요. 다양한 여행 후기를 참조하여 당신만의 계획을 만들어 보세요.</p>
					</div>
				</div>
				<div class="category-adds">
					<div id="category-tab">
						<div class="tab-view">
							<ul class="list-inline">
								<li class="grid-view-tab"><i class="fa fa-th-large" aria-hidden="true"></i></li>
								<li class="small-view-tab"><i class="fa fa-th" aria-hidden="true"></i></li>
								<li class="list-view-tab active"><i class="fa fa-th-list" aria-hidden="true"></i></li>
							</ul>
						</div>
						<div class="category-tab">
							<ul class="nav nav-tabs" role="tablist">
							   <li role="presentation" class="active"><a href="#recent" aria-controls="recent" role="tab" data-toggle="tab">Recent</a></li>
							   <li role="presentation"><a href="#popular" aria-controls="popular" role="tab" data-toggle="tab">Popular</a></li>
							   <li role="presentation"><a href="#Random" aria-controls="Random" role="tab" data-toggle="tab">Random</a></li>
							</ul>
							<!-- Tab panes -->
							  	<div class="tab-content list-view-tab">
							    	<div role="tabpanel" class="tab-pane active" id="recent">
							    		<ul id="recent_ul">
							    		
											<c:forEach var="plan" items="${plan_recent}" >
								    			<li class="item-wrap">
								    				<div class="item">
														<div class="item-image">
															<a href="select_plan/${plan.plan_num}"><img src="${pageContext.request.contextPath}/resources/images${plan.plan_img}" class="img-responsive" style="width:100%; height:260px;"></a>
															<div class="item-price">
																<span><i class="fa fa-eye" aria-hidden="true"></i> ${plan.plan_hit}</span>
															</div>
														</div>
														<div class="item-description">
															<div class="item-meta">
																<div class="item-post-date">
																	<span><i class="fa fa-clock-o" aria-hidden="true"></i> <fmt:formatDate value="${plan.plan_date}" type="date"/></span>
																	 &nbsp; <span><i class="fa fa-users" aria-hidden="true"></i> ${plan.plan_people}</span>
																</div>
															</div>
															<div class="item-title">
																<h3 class="overtext"><a href="select_plan/${plan.plan_num}" title="${plan.plan_title}">${plan.plan_title}</a></h3>
															</div>
															<div class="item-info">
																<p class="overtext multiovertext">${plan.plan_cont}</p>
															</div>
														</div><!-- item-description -->	
													</div><!-- item -->
								    			</li><!-- item-wrap -->
											</c:forEach>
											
							    		</ul>
							    	</div><!-- tab-pane -->
							    	
							    	<div role="tabpanel" class="tab-pane" id="popular">
							    		<ul id="popular_ul">
							    			
							    			<c:forEach var="plan" items="${plan_popular}" >
								    			<li class="item-wrap">
								    				<div class="item">
														<div class="item-image">
															<a href="select_plan/${plan.plan_num}"><img src="${pageContext.request.contextPath}/resources/images${plan.plan_img}" class="img-responsive" style="width:100%; height:260px;"></a>
															<div class="item-price">
																<span><i class="fa fa-eye" aria-hidden="true"></i> ${plan.plan_hit}</span>
															</div>
														</div>
														<div class="item-description">
															<div class="item-meta">
																<div class="item-post-date">
																	<span><i class="fa fa-clock-o" aria-hidden="true"></i> <fmt:formatDate value="${plan.plan_date}" type="date"/></span>
																	 &nbsp; <span><i class="fa fa-users" aria-hidden="true"></i> ${plan.plan_people}</span>
																</div>
															</div>
															<div class="item-title">
																<h3 class="overtext"><a href="select_plan/${plan.plan_num}" title="${plan.plan_title}">${plan.plan_title}</a></h3>
															</div>
															<div class="item-info">
																<p class="overtext multiovertext">${plan.plan_cont}</p>
															</div>
														</div><!-- item-description -->
													</div><!-- item -->
								    			</li><!-- item-wrap -->
											</c:forEach>
							    			
							    		</ul>
							    	</div><!-- tab-pane -->

							    	<div role="tabpanel" class="tab-pane" id="Random">
							    		<ul id="random_ul">
							    		
							    			<c:forEach var="plan" items="${plan}" >
								    			<li class="item-wrap">
								    				<div class="item">
														<div class="item-image">
															<a href="select_plan/${plan.plan_num}"><img src="${pageContext.request.contextPath}/resources/images${plan.plan_img}" class="img-responsive" style="width:100%; height:260px;"></a>
															<div class="item-price">
																<span><i class="fa fa-eye" aria-hidden="true"></i> ${plan.plan_hit}</span>
															</div>
														</div>
														<div class="item-description">
															<div class="item-meta">
																<div class="item-post-date">
																	<span><i class="fa fa-clock-o" aria-hidden="true"></i> <fmt:formatDate value="${plan.plan_date}" type="date"/></span>
																	 &nbsp; <span><i class="fa fa-users" aria-hidden="true"></i> ${plan.plan_people}</span>
																</div>
															</div>
															<div class="item-title">
																<h3 class="overtext"><a href="select_plan/${plan.plan_num}" title="${plan.plan_title}">${plan.plan_title}</a></h3>
															</div>
															<div class="item-info">
																<p class="overtext multiovertext">${plan.plan_cont}</p>
															</div>
														</div><!-- item-description -->
													</div><!-- item -->
								    			</li><!-- item-wrap -->
											</c:forEach>
											
							    		</ul>
							    	</div><!-- tab-pane-->
							  	</div>
							</div>
						</div><!-- category-tab-->
					</div>
				<div class="view-all-ads text-center">
					<button id="morelist" class="btn btn-primary"> More Plans </button>
				</div>
			</div>
		</div><!-- category-tab-->
	</div><!-- .home-page -->

	  <div id="call-to-act">
	    <div class="container">
	      <div class="call-to-act">
	        <h1>Travel With Pair Plan</h1>
	        <p>이용해 주셔서 감사합니다.</p>
	      </div>
	    </div>
	  </div><!-- #call-to-act -->


	<jsp:include page="/WEB-INF/view/footer.jsp"/>

	<!-- JS -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/modernizr.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>    
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/custom.js"></script>
</body>
</html>	