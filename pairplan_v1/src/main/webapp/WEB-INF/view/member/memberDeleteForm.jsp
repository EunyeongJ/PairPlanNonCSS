<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="PairPlan">
	<meta name="description" content="">
	
	<title> Pair Plan 회원탈퇴 </title>

	<!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

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
					<h1>User Secession</h1>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/member/main">Home</a></li>
						<li class="active">User</li>
					</ol>
				</div>
			</div>
		</div><!-- breadcrumb-section -->

		<!-- 회원탈퇴 폼 -->
    	<div class="ad-post-wrapper section">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2"> <!-- offset은 좌측 마진을 줘서 오른쪽으로 이동하게 함-->
						<div class="user-form">
						
							<!-- 회원탈퇴 폼 -->
							<form method="post" enctype="multipart/form-data">
				                <div class="form-group">				                  
				                  	<label>Thank you for using our site.</label>
									<input type="hidden" class="form-control" id="mem_num" name="mem_num" value="${mem_num}" />
				                </div>
				                
				                <div class="form-group">				                  
				                  	<input type="password" class="form-control" id="mem_pass" name="mem_pass" required="required" placeholder="Password" />
				                </div>				                
				                
							    <center><button type="button" class="btn btn-success" onclick="return memberDeletePasswordCheck()"/> Secession Info </center>
							</form>
							
						</div>
					</div>
				</div>
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
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberDeleteScript.js" charset="utf-8"></script>
</body>
</html>