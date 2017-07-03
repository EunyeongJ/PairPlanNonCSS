<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="PairPlan">
	<meta name="description" content="">
	
	<title> PairPlan | Update Info </title>

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
					<h1>User Update</h1>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/member/main">Home</a></li>
						<li class="active">User</li>
					</ol>
				</div>
			</div>
		</div><!-- breadcrumb-section -->

		<!-- 회원정보 수정 폼 -->
    	<div class="ad-post-wrapper section">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2"> <!-- offset은 좌측 마진을 줘서 오른쪽으로 이동하게 함-->
						<div class="user-form">
						
							<!-- 회원정보 수정 폼 -->
							<form method="post" action="memberModifySubmit" enctype="multipart/form-data" onsubmit="return modifyCheck()">
				                <div class="form-group">				                  
				                  	<label>User Update</label>
									<input type="hidden" class="form-control" name="mem_num" value="${memberInfo.mem_num}" />
				                </div>
				                
				                <div class="form-group">				                  
				                  	<input type="text" class="form-control" id="mem_id" name="mem_id" value="${memberInfo.mem_id}" disabled="disabled"/>
				                </div>
				                
				                <div class="form-group">
									<input type="password" class="form-control" id="mem_pass" name="mem_pass" required="required" placeholder="Password" />
								</div>
								
							    <div class="form-group">
							    	<input type="password" class="form-control" id="mem_pass2" name="mem_pass2" required="required" placeholder="Confirm Password" />
							    </div>
							    
								<div class="form-group">
							    	<input type="text" class="form-control" id="mem_name" name="mem_name" value="${memberInfo.mem_name}" disabled="disabled"/>
							    </div>
							    
							    <div class="form-group">
							    	<input type="text" class="form-control" id="mem_nick" name="mem_nick" value="${memberInfo.mem_nick}" disabled="disabled" />	
							    </div>							 
							    
							    <div class="form-group">
							    	<c:if test="${memberInfo.mem_gender == 1}">
							    		<input type="radio" required="required" name="mem_gender" value="1" checked="checked" disabled="disabled"> male
							    		<input type="radio" required="required" name="mem_gender" value="2" disabled="disabled"> female
							    	</c:if>
							    	
							    	<c:if test="${memberInfo.mem_gender == 2}">
							    		<input type="radio" required="required" name="mem_gender" value="1" disabled="disabled"> male
							    		<input type="radio" required="required" name="mem_gender" value="2" checked="checked" disabled="disabled"> female
							    	</c:if>
							    </div>
							    
                  				<div class="form-group">
							    	<input type="text" class="form-control" id="mem_age" name="mem_age" value="${memberInfo.mem_age}" disabled="disabled" />
							    </div>
							    
                  				<div class="form-group">
							    	<input type="text" class="form-control" id="mem_email" name="mem_email" placeholder="email 입력" value="${memberInfo.mem_email}" disabled="disabled"/>
								</div>
							   							   
							   	<div class="form-group">
							   		<div style="float:right;  padding-right: 20px;">
										<button id="deletethumbnail" type="button" class="close" aria-label="Close" onclick="imageDelete();"><i class="fa fa-times fa-1x"></i></button>
									</div>
							   		<p class="text-center"><img class="img-circle" id="thumbnailImage" style="width:200px; height:200px;" src=""></p>
									<input type="file" id="thumbnail" name="thumbnail" accept="image/*" onchange="imageChange();">
									<input type="hidden" id="mem_img" name="mem_img" value="${pageContext.request.contextPath}/resources/images${memberInfo.mem_img}" />
							   	</div>
							   	
								<div class="form-group">	
									<label> 선호 지역 </label>
									<div style="border: 1px #e3e3e3 solid; border-radius: 4px;  padding:6px 12px"> 
                    				<c:forEach var="location" items="${memberWishLocation}">
										<c:if test="${location.mem_num == 0}">
											<input type="checkbox" name="loc_name"	value="${location.loc_num}" > ${location.loc_name} </input>
   										</c:if>
   						
   										<c:if test="${location.mem_num != 0}">
											<input type="checkbox" name="loc_name"	value="${location.loc_num}" checked="checked" > ${location.loc_name} </input>
   										</c:if>		
									</c:forEach>
									</div>
                  				</div>
                  				
                  				<div class="form-group">
                  					<label> 선호 여행 스타일 </label>
                  					<div style="border: 1px #e3e3e3 solid; border-radius: 4px;  padding:6px 12px"> 
                    				<c:forEach var="travel" items="${memberWishTravelStyle}">
										<c:if test="${travel.mem_num == 0}">
											<input type="checkbox" name="style_name" value="${travel.style_num}" > ${travel.style_name} </input>
   										</c:if>
   						
   										<c:if test="${travel.mem_num != 0}">
											<input type="checkbox" name="style_name" value="${travel.style_num}" checked="checked" > ${travel.style_name} </input>
   										</c:if>		
									</c:forEach>
									</div>
                  				</div>
                  				
							    <center><button type="submit" class="btn btn-primary"> Update Info </button></center>
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