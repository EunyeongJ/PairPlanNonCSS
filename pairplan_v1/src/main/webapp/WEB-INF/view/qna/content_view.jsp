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

	<title>PairPlan | View QnA</title>

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
					<h1>QnA View</h1>
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
              <h2 class="text-center"><span><i class="fa fa-question-circle fa-2x" aria-hidden="true"></i></span> &nbsp; QnA</h2>
	          <hr style="margin-bottom: 0px; border-top: 4px solid #6f6f6f;">
              
                  <div class="panel-body"> 
                    <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> &nbsp;${article.qna_date} &nbsp; &nbsp; &nbsp;
                  </div>
                  <table class="table table-striped" id="content_table">
                    <tbody>
                      <tr>
                        <th scope="row" width="120px">
                          <label class="control-label">Nickname</label>
                        </th>
                        <td>
                          <div class="col-sm-3">
                            <div>${article.mem_nick}</div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">
                          <label class="control-label">Title</label>
                        </th>
                        <td>
                          <div class="col-sm-6">
                            <div>${article.qna_title}</div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">
                          <label class="control-label">Content</label>
                        </th>
                        <td>
                          <div class="col-sm-12">
                            <div>${article.qna_cont}</div>
                          </div>
                        </td>
                      </tr>
                      <tr id="password_form">
                        <th scope="row">
                          <label for="bPassword" class="control-label">Password</label>
                        </th>
                        <td>
                          <div class="col-sm-3">
                            <input type="password" class="form-control" id="qna_pass" name="qna_pass" placeholder="Number">
                          </div>
                          <div class="col-sm-9" id="password_alert">
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="panel-body">
                    <div class="row text-right">
                      <div class="col-md-12">
                        
                        <!-- 관리자 계정 -->
                        <c:if test="${sessionScope.session_mem_num == 0}">                        	
                        	<a class="btn btn-warning" href="../list">List <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span></a>&nbsp;
                       		<a class="btn btn-success" href="../reply_form/${article.qna_num}"> Reply <span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span></a>&nbsp;
                        	<a class="btn btn-danger" onclick="onPassword('../delete/',${article.qna_num});"> Delete <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>&nbsp;
                        </c:if> 
                        
                        <!-- 일반 계정 -->
                        <c:if test="${sessionScope.session_mem_num != 0}">    
                        
                        	<!-- 답변 : 관리자가 쓴거면 수정, 삭제 못하게 --> 
                        	<c:if test="${article.mem_nick == 'admin'}">
                        		<a class="btn btn-info" href="../list">List <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span></a>&nbsp;
                        	</c:if> 
                        	
                        	<!-- 질문 : 지가 쓴거면 수정, 삭제 가능하게 -->
                        	<c:if test="${article.mem_nick != 'admin'}">
                        		<a class="btn btn-warning" href="../list">List <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span></a>&nbsp;
                        		<a class="btn btn-success" onclick="onPassword('../update_form/',${article.qna_num});"> Modify <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>&nbsp;  
                        		<a class="btn btn-danger" onclick="onPassword('../delete/',${article.qna_num});"> Delete <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>&nbsp;
                        	</c:if> 
                     	</c:if>
                     	
                      </div>
                    </div>
                  </div>
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
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/qna/board_script.js"></script>
</body>
</html>