<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="PairPlan">
   	<meta name="description" content="">

	<title>PairPlan | Plan List</title>

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
		<div id="breadcrumb-section" class="section">
			<div class="container">
				<div class="page-title text-center">
					<h1>Plans List</h1>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/member/main">Home</a></li>
						<li class="active">Plans</li>
					</ol>
				</div>
			</div>
		</div><!-- breadcrumb-section -->

   	 	<div id="search-section">
			<div class="container">
				<form action="../plan/search_plan">
					<div class="search-section">
						<ul>
			              <li>
			                <input type="date" class="form-control" name="start_date" value="<c:out value="${plan_search.start_date}" escapeXml="false"></c:out>">
			              </li>
			              <li>
			                <input type="date" class="form-control" name="end_date" value="<c:out value="${plan_search.end_date}" escapeXml="false"></c:out>">
			              </li>
			              <li>
								<input type="text" class="form-control" name="search_text"placeholder="What are you looking for ?" value="<c:out value="${plan_search.search_text}" escapeXml="false"></c:out>">
							</li>
							<li>
								<input type="hidden" name="listBlock" value="0">
								<button type="submit" class="form-control btn btn-primary" value="Search">Search</button>
							</li>
						</ul>
					</div>
				</form>
			</div>
		</div>
		<!-- search-section -->

	
	<fmt:setLocale value="en_US" scope="session"/>	<!-- 시간 로케일 설정 -->
	
<c:if test="${sessionScope.session_mem_num != null}"> <!-- 로그인 된 상태 -->


      <div class="container">
     
     <div id="featured-avts">
			<div class="section featureds">
       		<div class="section-title container">
				 <div class="title-content">
		          <h2>Plan Recommendation</h2>
		          <p>선호하는 지역 및 여행 스타일에 따라 맞춤 정보를 추천해 드립니다. <br>동행하고 싶은 여행 계획을 찾아보세요.</p>
		        </div>
			</div>
	          <div id="top-featured">
	
	          <!-- 게시글 1 -->
	          <c:forEach var="recommand" items="${recommand}">
	            <div class="featured-item">
	              <div class="featured-title">
	                <h3 class="overtext"><a href="select_plan/${recommand.plan_num}" title="${recommand.plan_title}"> ${recommand.plan_title}</a></h3>
	                <h4><i class="fa fa-users" aria-hidden="true"></i> &nbsp; ${recommand.count} / ${recommand.plan_people} </h4>
	              </div>
	              <div class="featured-image">
	                <a href="select_plan/${recommand.plan_num}"><img src="${pageContext.request.contextPath}/resources/images${recommand.plan_img}" class="img-responsive" style="width:330px; height:220px;"></a>
	              </div>
	
	              <!-- ad-info -->
	              <div class="product-meta">
	                <div class="item-info">
	                  <p><i class="fa fa-clock-o" aria-hidden="true"></i> &nbsp;<fmt:formatDate value="${recommand.sche_start}" type="date"/> ~ <fmt:formatDate value="${recommand.sche_end}" type="date"/> </p>
	                  <p class="multiovertext"> ${recommand.plan_cont} </p>
					</div>
					<div class="item-price">
						<span><i class="fa fa-eye" aria-hidden="true"></i> ${recommand.plan_hit}</span>
					</div>
					<ul class="list-inline product-social">
						<li>
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i> 
						<fmt:formatDate value="${recommand.plan_date }" type="date" pattern="MMM"/>,
						<fmt:formatDate value="${recommand.plan_date }" type="date" pattern="d"/> 
						</li>
					</ul>
	              </div><!-- ad-info -->
	            </div><!-- featured -->
			 </c:forEach>
	        </div>
          </div>
        </div>
          
      </div><!-- container -->
      
</c:if>

  <!--메인에서 가져옴-->
  <!-- All -->
  <div class="section" style="padding: 20px 0 60px;">
    <div class="container">
      <div class="section-title">
        <div class="title-content">
          <h2>All the results what you want</h2>
          <p>당신의 여행 계획을 공유하고 여행 동행자와 소통할 수 있습니다. <br>당신의 원하는 모든 계획을 찾아보세요. </p>
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
                  </div> <!--tab-pane-->

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
        <button id="morelist" class="btn btn-primary"> more </button>
      </div>
      
      <a href="/pairplan_v1/plan/planInsertForm"><button type="button" class="btn btn-success btn-lg"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> &nbsp; New Plan</button></a>
    
    </div>
  </div><!-- category-tab-->
</div>	<!-- page -->

	<jsp:include page="/WEB-INF/view/footer.jsp"/>

	<!-- JS -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/modernizr.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>    
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/custom.js"></script>
</body>
</html>