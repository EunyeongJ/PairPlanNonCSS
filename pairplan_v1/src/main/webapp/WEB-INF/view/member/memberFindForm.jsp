<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="PairPlan">
	<meta name="description" content="">
	
	<title> PairPlan | Find Info </title>

	<!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
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
					<h1>Find ID·Password </h1>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/member/main">Home</a></li>
						<li class="active">User</li>
					</ol>
				</div>
			</div>
		</div><!-- breadcrumb-section -->
  
  		<!-- 아이디 비번 찾기 -->
    	<div class="ad-post-wrapper section" style="padding:60px 0 60px; margin:auto;">
			<div class="container">
				<div class="row">
					<div class="col-sm-6"> 
						<div class="user-form" style="margin-top:0px">
							<h2>Find ID</h2>
							<h6>가입시 사용한 이름과 이메일을 입력해주세요. 이메일로 ID를 발송해드립니다.</h6>
			                <div class="form-group">				                  
			                  	<input style="margin-bottom: 5px;" type="text" class="form-control" id="mem_name" name="mem_name" required="required" placeholder="name">
			                  	<input style="margin-bottom: 5px;" type="email" class="form-control" id="idFind_mem_email" name="idFind_mem_email" required="required" placeholder="email">
			                  	<p class="text-center">
			                  	<button style="margin-top: 5px;" type="button" class="btn btn-success" name="idFind" onclick="return idFindCheck()" style="position:center" ><i class="fa fa-search"></i> Find ID</button>
			                  	</p>
			                </div>
						</div>
					</div>
					
					<div class="col-sm-6">
						<div class="user-form" style="margin-top:0px">			                
							<h2>Find Password</h2>
							<h6>가입시 사용한 아이디과 이메일을 입력해주세요. 이메일로 Password를 발송해드립니다.</h6>
			                <div class="form-group">				                  
			                  	<input style="margin-bottom: 5px;" type="text" class="form-control" id="mem_id" name="mem_id" required="required" placeholder="ID">
			               		<input style="margin-bottom: 5px;" type="email" class="form-control" id="passwordFind_mem_email" name="passwordFind_mem_email" required="required" placeholder="email">
			               		<p class="text-center">
			                  	<button style="margin-top: 5px;" type="button" class="btn btn-success" name="passwordFind" onclick="return passwordFindCheck()" style="position:center" ><i class="fa fa-search"></i> Find Pwd</button>
			                  	</p>
			             	</div>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- ad-post -->		
	</div>

	<jsp:include page="/WEB-INF/view/footer.jsp"/>

    <!-- JS -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/modernizr.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap/custom.js"></script>
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberFindScript.js" charset="utf-8"></script>
</body>
</html>