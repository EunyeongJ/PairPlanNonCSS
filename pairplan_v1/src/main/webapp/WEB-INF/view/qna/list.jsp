<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
 SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
 String today = formatter.format(new Date());
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Theme Region">
   	<meta name="description" content="">

	<title>PairPlan | Reviews</title>

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
					<h1>QnA List</h1>
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
	                   <span class="glyphicon glyphicon-home" aria-hidden="true"></span> &nbsp;Total ${count} &nbsp; &nbsp; &nbsp;
                  	   <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> &nbsp;<%=today%> &nbsp; &nbsp; &nbsp;
	                   <span class="glyphicon glyphicon-flag" aria-hidden="true"></span> &nbsp;${page} page
	                 </div>
	                 <table class="table table-hover">
	                   <thead>
	                     <tr class="active">
	                       <th width="10%">#</th>
	                       <th width="10%">Nickname</th>
	                       <th width="35%">Title</th>
	                       <th width="15%">Date</th>
	                     </tr>
	                   </thead>
	                   <tbody>
	                     <c:forEach items="${list}" var="list">
	                     <tr>
	                       <td>
	                         <c:out value="${number}"/>
	                         <c:set var="number" value="${number - 1}"/>
	                       </td>
	                       <td>${list.mem_nick}</td>
	                       <td>
	                         <c:forEach begin="1" end="${list.qna_step}">└</c:forEach>	  
	                               
	                         <!-- 로그인 안한 사람이면 -->       
	                         <c:if test="${sessionScope.session_mem_num == null}">
	                         	<a style="color: #6f6f6f;" href="/pairplan_v1/member/memberLogin">${list.qna_title}</a>
	                         </c:if>      
	                                         
	                         <!-- 로그인 한 사람이면 -->
	                         <c:if test="${sessionScope.session_mem_num != null}">
	                         
		                         <!-- 관리자 계정 아니면 비밀번호 확인 -->       
		                         <c:if test="${sessionScope.session_mem_num != 0}">
		                         	<a style="color: #6f6f6f;" href="../qnaContPassCheck/${list.qna_num}">${list.qna_title}</a>
		                         </c:if>
		                         
		                         <!-- 관리자 계정이면 비밀번호 확인x -->
		                         <c:if test="${sessionScope.session_mem_num == 0}">
		                         	<a style="color: #6f6f6f;" href="../content_view/${list.qna_num}">${list.qna_title}</a>
		                         </c:if>
		                         
	                         </c:if>
	                      
	                       </td>
	                       <td>${list.qna_date}</td>	                       
	                     </tr>
	                     </c:forEach>
	                   </tbody>
	                 </table> 
	                 
	                 <div class="panel-body">
	                   <div class="row text-right">
	                     <div class="col-md-12">
	                     
	                     <c:if test="${sessionScope.session_mem_num != 0}">
	                       <a class="btn btn-success" href="../insert_form"> New <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
	                     </c:if>
	                     
	                     </div>
	                   </div>
	                
	             </div>
	           </div>
	           <c:if test="${count > 0}">
	             <div class="row">
	               <div class="col-md-12 text-center">
	               	 <ul class="pagination .pagination-sm">
	               	   <!-- 이전 버튼 생성 -->
					   <c:if test="${startPage > pageBlock}">
					     <li><a href="../list/${tempEndPage - pageBlock }">Prev</a></li>
					   </c:if>
					   <c:forEach var="i" begin="${startPage}" end="${endPage}">
					   	 <c:choose>
						 <c:when test="${page == i}">
						   <li class="active"><a href="../list/${i}">${i}</a></li>
						 </c:when>
						 <c:otherwise> 
						   <li><a href="../list/${i}">${i}</a></li> 
						 </c:otherwise>
						 </c:choose>
					   </c:forEach>
					   <!-- 다음 버튼 생성 -->
					   <c:if test="${endPage < pageCount}">
					     <li><a href="../list/${startPage + pageBlock}">Next</a></li>
					   </c:if>
				     </ul>
	               </div>
	             </div>
	           </c:if>
	         </div>
	         <div class="col-md-2"></div>
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
    
</body>
</html>