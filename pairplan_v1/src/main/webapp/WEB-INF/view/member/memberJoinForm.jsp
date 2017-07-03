<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="PairPlan">
	<meta name="description" content="">
	
	<title> PairPlan | SignUp</title>

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
					<h1>User Registration</h1>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/member/main">Home</a></li>
						<li class="active">User</li>
					</ol>
				</div>
			</div>
		</div><!-- breadcrumb-section -->

		<!-- 회원가입 폼 -->
    	<div class="ad-post-wrapper section">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2"> <!-- offset은 좌측 마진을 줘서 오른쪽으로 이동하게 함-->
						<div class="user-form">
						
							<!-- 회원가입 폼 -->
							<form method="post" action="memberJoinSubmit" enctype="multipart/form-data" onsubmit="return insertCheck()">
				                <div class="form-group">				                  
				                  	<label>User Registration</label>
									<input type="hidden" class="form-control" name="mem_num" value="${mem_num}" />
				                </div>
				                
				                <div class="form-group">				                  
				                  	<input type="text" class="form-control" id="mem_id" name="mem_id" required="required" placeholder="ID" onchange="reConfirmId()" onblur="confirmId()">  <!-- pattern="[A-Za-z0-9]{4,10}" --> 
				                  	<!-- <input type="button" class="btn btn-primary" name="confirm_id" value="ID중복확인" onclick="confirmId()" /> -->
				               		<div id="id_status" style="color:#FF5E00"></div>
				                </div>
				                <input type="hidden" id="id_check" value="N"><!-- 중복이 됐는지 안됐는지 확인하는 태그 -->
				                
				                
				                <div class="form-group">
									<input type="password" class="form-control" id="mem_pass" name="mem_pass" required="required" placeholder="Password">
								</div>
								
							    <div class="form-group">
							    	<input type="password" class="form-control" id="mem_pass2" name="mem_pass2" required="required" placeholder="Confirm Password">
							    </div>
							    
								<div class="form-group">
							    	<input type="text" class="form-control" id="mem_name" name="mem_name" required="required" placeholder="Name">
							    </div>
							    
							    <div class="form-group">
							    	<input type="text" class="form-control" id="mem_nick" name="mem_nick" required="required" placeholder="Nickname" onchange="reConfirmNick()" onblur="confirmNick()" >
							    	<!-- <input type="button" class="btn btn-primary" name="confirm_nick" value="NICK중복확인" onclick="confirmNick()" /> -->			
							    	<div id="nick_status" style="color:#FF5E00"></div>
							    </div>
							    <input type="hidden" id="nick_check" value="N"><!-- 중복이 됐는지 안됐는지 확인하는 태그 -->
							    							    
							    <div class="form-group">
							    	<input type="radio" required="required" name="mem_gender" value="1" checked="checked"> male
							    	<input type="radio" required="required" name="mem_gender" value="2"> female
							    </div>
							    
                  				<div class="form-group">
							    	<input type="text" class="form-control" pattern="[0-9]{2}" id="mem_age" name="mem_age" required="required" placeholder="Age">
							    </div>
							    
                  				<div class="form-group">
                  					<div class="input-group">
								    	<input type="email" class="form-control" id="mem_email" name="mem_email" required="required" placeholder="Email" onchange="reConfirmEmail()">
								    	<span class="input-group-btn">
								    	<input style="height: 44px; width: 100px;" type="button" class="btn btn-primary" name="confirm_email" value="번호 전송" onclick="confirmEmail()"/>
								    	</span> 
								    </div><!-- /input-group -->		    
							    	<div id="email_status1" style="color:#FF5E00; clear:both"></div>    
							    		    
							    		    	
							    	<input style="margin-top: 3px;" type="text" class="form-control" id="mem_email_check" name="mem_email_check" required="required" placeholder="인증번호 입력" onblur="confirmEmailCheck()">
									<!-- <input type="button" class="btn btn-primary" name="confirm_email_check" value="email인증" onclick="confirmEmailCheck()"/> -->
									<div id="email_status2" style="color:#FF5E00"></div>
								</div>
								<input type="hidden" id="email_check" value="N"><!-- 이메일 인증했니 안했니 -->
							   
							   
							   	<div class="form-group">
							   		<p class="text-center"><img class="img-circle" id="thumbnailImage" style="width:200px; height:200px;" src=""></p>
									<input type="file" id="thumbnail" name="thumbnail" accept="image/*" onchange="imageChange();">
									<input type="hidden" id="mem_img" name="mem_img" value="${pageContext.request.contextPath}/resources/images/member/default.png" />
							   	</div>
							   
                  				<div class="form-group"> 
                  					<label> 선호 지역 </label>
                  					<div style="border: 1px #e3e3e3 solid; border-radius: 4px; padding:6px 12px"> 
                    				<c:forEach var="location" items="${location}">
										<input type="checkbox" name="loc_name" value="${location.loc_num}"> ${location.loc_name}
									</c:forEach>
									</div>
                  				</div>
                  				
                  				<div class="form-group">
                  					<label> 선호 여행 스타일 </label>	    
                  					<div style="border: 1px #e3e3e3 solid; border-radius: 4px; padding:6px 12px"> 
                    				<c:forEach var="travel_style" items="${travel_style}">
										<input type="checkbox" name="style_name" value="${travel_style.style_num}"> ${travel_style.style_name}
									</c:forEach>
									</div>
                  				</div>
                  				
							    <center><button type="submit" class="btn btn-primary">Sign Up</button></center>
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
    
    <script src="${pageContext.request.contextPath}/resources/js/member/memberJoinScript.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/member/memberUploadScript.js"></script>
</body>
</html>