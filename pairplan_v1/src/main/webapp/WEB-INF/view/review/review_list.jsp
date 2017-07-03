<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="PairPlan">
   	<meta name="description" content="">

	<title>PairPlan | Review List</title>

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

	<div class="page">
		<div id="breadcrumb-section" class="section">
			<div class="container">
				<div class="page-title text-center">
					<h1>Review List</h1>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/member/main">Home</a></li>
						<li class="active">Review</li>
					</ol>
				</div>
			</div>
		</div><!-- breadcrumb-section -->

		<div class="ad-post-wrapper section">
			<div class="container">
				<div class="blog-content">
					<div class="row">
					
						<fmt:setLocale value="en_US" scope="session"/>	<!-- 시간 로케일 설정 -->
						<c:forEach var="dto" items="${review_list}" varStatus="status">	<!-- 리스트 반복문 -->
						
						
						<div class="col-sm-6 col-md-4">
							<div class="blog-post">
								<div class="entry-thubmnail">
									<a href="review_view/${dto.re_num}"><img class="img-responsive" src="${pageContext.request.contextPath}/resources/images${dto.re_mainImg}" alt=""/></a>
								</div>
								<div class="entry-content">
									<h3 class="entry-title overtext" style="width:auto;">
					                    <a href="review_view/${dto.re_num}" title="${dto.re_title}">${dto.re_title}</a>
					                </h3>
									<div class="entry-meta" style="overflow:hidden">
										<div class="overtext" style="width:130px; float:left;">
				                      	  <span>By <a href="javascript:sendMessageModal(${review_writers[status.index].mem_num },'${review_writers[status.index].mem_nick }')" 
				                      	  data-toggle="tooltip" data-placement="top" title="Send Message">
				                      	  ${review_writers[status.index].mem_nick }</a></span>
				                    	</div>
					                    <div style="width:auto; float:left;">
					                      <span style="padding: 0 0 0 10px;">|</span>
					                      <span>
						                      <c:choose>
						                      	<c:when test="${comments[status.index] eq 0}">No</c:when>
						                      	<c:otherwise>${comments[status.index]}</c:otherwise>
						                      </c:choose> Comments
					                      </span>
					                    </div>
									</div>
									<a class="date"><span><fmt:formatDate value="${dto.re_date }" type="date" pattern="d"/></span> 
									<fmt:formatDate value="${dto.re_date }" type="date" pattern="MMM"/></a>
								</div>
							</div>
						</div>
						
						
						</c:forEach>
						
						
					</div>
				</div>
				<div class="pager-section text-center">
					
				</div><!-- pager-section -->
        		<button type="button" class="btn btn-success btn-lg" onclick="reviewWrite(${sessionScope.session_mem_num})"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> &nbsp; New</button>
			</div>
		</div> <!-- ad-post -->
	</div>	<!-- page -->
	
	<jsp:include page="/WEB-INF/view/footer.jsp"/>
	
	<!-- JS -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/modernizr.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/custom.js"></script>
    <script>
	function reviewContent(review_num){
		location.href = "review_view/" + review_num;
	}
	</script>
  </body>
</html>
