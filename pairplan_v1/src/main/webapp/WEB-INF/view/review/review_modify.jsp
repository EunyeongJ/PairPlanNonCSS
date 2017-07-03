<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="PairPlan">
   	<meta name="description" content="">

    <title>PairPlan | Update Review</title>

   <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    
    <!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">

	<!-- font -->
	<link href="https://fonts.googleapis.com/css?family=Ubuntu:400,500,700,300" rel="stylesheet" type="text/css">
	
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
					<h1>Update Review</h1>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/member/main">Home</a></li>
						<li class="active">Review</li>
					</ol>
				</div>
			</div>
		</div><!-- breadcrumb-section -->

		<div class="avt-post-wrapper section">
			<div class="container">
				<div class="avt-post">

				<form action="../review_modify" method="post" id="editorForm" name="editorForm" onsubmit="checkImage()">
					<input type="hidden" id="e_plan_num" name="e_plan_num" value="${review_content.e_plan_num }">
					<input type="hidden" name="re_num" value="${review_content.re_num }">
					<div class="seller-option avtpost-fields">
						<div class="row">
							<div class="col-md-12">
								<h3>Write Reivew <span style="color: #02743a;">What did you feel after your trip?</span></h3>
							</div>
			                  <div class="col-sm-12">
			                    <div class="form-group">
			                      <input type="text" class="form-control" name="re_title" required="required" placeholder="Review title" value="${review_content.re_title}">
			                    </div>
			                  </div>
			                  <div class="col-sm-12">
			                    <div class="form-group">
			                      <textarea id="summernote" name="re_cont" required="required" class="form-control" rows="10" placeholder="Enter your text">${review_content.re_cont}</textarea>
			                    </div>
			                  </div>
						</div>
					</div><!-- seller-option -->
					<div class="submit-section">
						<div class="submit-button" style="padding-top: 20px;">
							<button type="button" style="margin-bottom: 5px;" class="btn btn-warning btn-lg" onclick="location.href='../review_list'">
								<i class="fa fa-bars" aria-hidden="true"></i>
							</button>
							<button type="submit" style="margin-bottom: 5px;" class="btn btn-success btn-lg">Update&nbsp; <i class="fa fa-check"></i></button>
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
    <!-- summernote -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
    <!-- editor upload -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/review/editorUploadScript.js"></script>
  </body>
</html>
