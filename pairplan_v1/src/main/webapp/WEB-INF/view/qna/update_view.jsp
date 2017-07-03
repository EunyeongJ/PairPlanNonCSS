<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="PairPlan">
   	<meta name="description" content="">

	<title>PairPlan | Update QnA</title>

	<!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
	<link href="${pageContext.request.contextPath}/resources/css/board_style.css" rel="stylesheet">
	
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
					<h1>Update QnA</h1>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/member/main">Home</a></li>
						<li class="active">QnA</li>
					</ol>
				</div>
			</div>
		</div><!-- breadcrumb-section -->
		
	<div class="ad-post-wrapper section">
		<div class="container">
			<div class="contact-us" style="border: 1px solid #ddd;">
        <div class="row">
          <div class="col-md-2"></div>
          <div class="col-md-8">
            <div class="row">
              <div class="col-md-12">
              <h2 class="text-center"><span><i class="fa fa-question-circle fa-2x" aria-hidden="true"></i></span> QnA</h2>
	          <hr style="margin-bottom: 0px; border-top: 4px solid #6f6f6f;">
	               	
              	<form action="../qnaUpdate" method="post">
              	<input type="hidden" name="qna_num" value="${article.qna_num}">
	                  <div class="panel-body">
                    	<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> &nbsp;${article.qna_date} &nbsp; &nbsp; &nbsp;
	                  </div>
		                  <table class="table">
		                    <tbody>
		                      <tr>
		                        <th scope="row" width="120px">
		                          <label for="mem_nick" class="control-label">Nickname</label>
		                        </th>
		                        <td>
		                          <div class="col-sm-3">
		                            ${article.mem_nick}
		                          </div>
		                        </td>
		                      </tr>
		                      <tr>
		                        <th scope="row">
		                          <label for="qna_title" class="control-label">Title</label>
		                        </th>
		                        <td>
		                          <div class="col-sm-6">
		                            <input type="text" class="form-control" id="qna_title" name="qna_title" value="${article.qna_title}">
		                          </div>
		                        </td>
		                      </tr>
		                      <tr>
		                        <th scope="row">
		                          <label for="qna_cont" class="control-label">Content</label>
		                        </th>
		                        <td>
		                          <div class="col-sm-12">
		                            <textarea class="form-control" id="qna_cont" name="qna_cont" rows="6">${article.qna_cont}</textarea>
		                          </div>
		                        </td>
		                      </tr>
		                    </tbody>
		                  </table>
	                  <div class="panel-body">
	                    <div class="row text-right">
	                      <div class="col-md-12">
	                        <a class="btn btn-warning" href="../list">List <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span></a>&nbsp;
	                        <button type="submit" class="btn btn-success">Modify <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button>
	                      </div>
	                    </div>
	                  </div>
                </form>
              </div>
            </div>
          </div>
          <div class="col-md-2"></div>
        </div>
      </div>
    </div>
   </div>
 </div>
   
   	<jsp:include page="/WEB-INF/view/footer.jsp"/>
   	
   	<!-- JS -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/modernizr.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/custom.js"></script>
</body>
</html>