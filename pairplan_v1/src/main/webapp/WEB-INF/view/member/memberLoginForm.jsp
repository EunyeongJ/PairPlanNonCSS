<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="PairPlan">
   	<meta name="description" content="">

	<title>PairPlan | SignIn</title>

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
					<h1>User SignIn</h1>
					<ol class="breadcrumb">
						<li><a href="/pairplan_v1/member/main">Home</a></li>
						<li class="active">User</li>
					</ol>
				</div>
			</div>
		</div><!-- breadcrumb-section -->

		<div class="ad-post-wrapper section">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div class="user-form">
							<form style="margin-bottom: 0px;">
								<div class="form-group">
							    	<h4><label><i class="fa fa-sign-in" aria-hidden="true"></i> &nbsp;Sign In</label></h4>
							    </div>
							    <div class="form-group">
							    	<input type="text" class="form-control" name="no_modal_mem_id" required="required" placeholder="User ID">
							    </div>
							    <div class="form-group">
							    	 <input type="password" class="form-control" name="no_modal_mem_pass" required="required" placeholder="Password">
							    </div>
							    <div class="form-group">
							    <p class="text-center">
			                       <a href="/pairplan_v1/member/memberFind" style="color: #6f6f6f;"><i class="fa fa-search" aria-hidden="true"></i> 아이디/비밀번호 찾기</a>
			                    </p>
			                    </div>
							    
							    <div class="form-group" style="margin-bottom: 10px;">
									<button type="button" class="btn btn-success" onclick="return noModalLoginCheck()" style="width:100%;">Sign In</button>		    	
			                    </div>
							    
							    <div class="form-group" style="margin-bottom: 10px;">
							    	<button type="button" class="btn btn-warning" style="width:100%; " onclick="location.href='/pairplan_v1/member/memberJoin'">Sign Up</button>
			                    </div>
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
</body>
</html>	