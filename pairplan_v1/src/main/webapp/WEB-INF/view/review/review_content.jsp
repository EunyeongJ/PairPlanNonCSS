<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="PairPlan">
   	<meta name="description" content="">

	<title>PairPlan | View Review</title>

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
					<h1>View Review</h1>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/member/main">Home</a></li>
						<li class="active">Review</li>
					</ol>
				</div>
			</div>
		</div><!-- breadcrumb-section -->

		<div class="avt-post-wrapper section">
			<div class="container">
			  <div class="blog-content blog-detail">
                <div class="blog-post">
                  <div class="entry-content" style="border: 1px solid #ddd; padding-top: 25px; border-radius: 4px;">
					<h3 style="color: #000; margin-bottom: 30px;">Plan Infomation</h3>
                 	<div class="map_wrap">
					    <div id="map" style="width:100%; height:300px; position:relative; overflow:hidden;"></div>
					    <!-- 지도타입 컨트롤 div -->
					    <div class="custom_typecontrol radius_border">
					        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
					        <span id="btnSkyview" class="non_btn" onclick="setMapType('skyview')">스카이뷰</span>
					    </div>
					</div>
					<hr>	
					
					<fmt:setLocale value="en_US" scope="session"/>	<!-- 시간 로케일 설정 -->
					
					<span><i class="fa fa-clock-o"></i> &nbsp; <fmt:formatDate value="${review_content.e_plan_date }" type="date"/></span><br>
					<span><i class="fa fa-users"></i> &nbsp; ${fn:length(e_plan_group)}/${review_content.e_plan_people } Members:  
						<c:forEach var="dto" items="${e_plan_group }">
							&nbsp; <a href="javascript:sendMessageModal(${dto.mem_num}, '${dto.mem_nick}');" data-toggle="tooltip" data-placement="top" title="Send Message">${dto.mem_nick }</a>
						</c:forEach>
					</span>
                    <h3 class="entry-title" style="padding-top: 5px;">${review_content.e_plan_title }</h3>
                    <div class="post-excerpt">
                      <p>${review_content.e_plan_cont }</p>
					<hr>
					<c:forEach var="dto" items="${review_schedule}">
                      <p class="quote-text">
                      <span class="label-color-red">${dto.e_sche_order }</span> &nbsp; &nbsp; <i class="fa fa-map-marker"></i> ${dto.e_sche_addr } &nbsp; &nbsp; <i class="fa fa-map-pin"></i> ${dto.e_sche_title }<br>
                          	<span><i class="fa fa-clock-o"></i> <fmt:formatDate value="${dto.e_sche_start }" type="date"/></span>
                          	 ~ <span><fmt:formatDate value="${dto.e_sche_end }" type="date"/></span>
                      </p>
                    </c:forEach>
                    
                    </div>
                    <div class="entry-meta">
                      <span>By <a href="javascript:sendMessageModal(${e_plan_writer.mem_num}, '${e_plan_writer.mem_nick}');" data-toggle="tooltip" data-placement="top" title="Send Message">
                      ${e_plan_writer.mem_nick}</a></span> | <span>${review_content.e_plan_hit } Hits</span>
                      |<span>Travel Styles: <c:forEach items="${e_plan_style }" var="style">${style} </c:forEach> </span>
                    </div>
                    <a class="date">
                    	<span><fmt:formatDate value="${review_content.re_date }" type="date" pattern="d"/></span> 
                    	<fmt:formatDate value="${review_content.re_date }" type="date" pattern="MMM"/>
                    </a>
                  </div>
                  
                  <div class="seller-option avtpost-fields">
					<div class="row">
						<div class="col-md-12">
							<h3>Plan Review <span style="color: #02743a;">What I felt after my trip!</span></h3>
						</div>
		                  <div class="col-sm-12">
		                    <div class="panel panel-default">
		                      <div class="panel-heading"><i class="fa fa-newspaper-o" aria-hidden="true"></i> &nbsp; ${review_content.re_title}</div>
							  <div class="panel-body">${review_content.re_cont}</div>
							</div>
		                  </div>
					</div>
				  </div><!-- seller-option -->
                  
	              <div class="post-comments" style="border: 1px solid #ddd; border-radius: 4px;">
					<h3>Comments</h3>
					<ul class="comment-list">
					</ul>
				  </div><!-- post-comments -->
				  
				  <div class="comment-box" style="border: 1px solid #ddd; border-radius: 4px;">
					<h3>Leave a Comment</h3>
					<!-- <form action="#" method="post" id="commentform" class="comment-form"> -->
						<div id="comment_form" class="form-group">
							<textarea class="form-control" id="comment_text" name="comment_text" placeholder="Write your Comments" rows="4"></textarea>
						</div>
						<button class="btn btn-success" style="margin-top:10px;" onclick="addComment(${sessionScope.session_mem_num})">Post Comment &nbsp;<i class="fa fa-comment"></i></button>
					<!-- </form> -->
				  </div>
				  
				  
					  <div class="submit-button" style="padding-top: 20px;">
					  	<button type="button" style="margin-bottom: 5px;" class="btn btn-warning btn-lg" onclick="location.href='${pageContext.request.contextPath}/review/review_list'">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</button>
					  	<c:if test="${sessionScope.session_mem_num eq review_content.mem_num}">
							<button type="button" style="margin-bottom: 5px;" class="btn btn-danger btn-lg" onclick="location.href='${pageContext.request.contextPath}/review/review_delete/${review_content.re_num}/${review_content.e_plan_num}'">
								<i class="fa fa-trash-o"></i>
							</button>
							<button type="button" style="margin-bottom: 5px;" class="btn btn-success btn-lg" onclick="location.href='${pageContext.request.contextPath}/review/review_modify_form/${review_content.re_num}'">
								Modify&nbsp; <i class="fa fa-wrench"></i>
							</button>
						</c:if>
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
    <!-- daum map api -->
    <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=6277bf7a1c54113effe51dbd6375f8cd&libraries=services"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plan/mapViewScript.js"></script>
	<script>
    //페이지가 전부 로딩이 되었을때 실행
    $(function(){
	   	<c:forEach var="dto" items="${review_schedule}">
	    	//선택한 지역의 정보를 저장할 객체 생성
	    	var latitude = ${dto.e_sche_lat };				//위도좌표
	    	var longitude = ${dto.e_sche_lng };				//경도좌표
	    	var locationInfo = {
				location_addr : "${dto.e_sche_addr}",			//지역의 주소
		    	location_title : "${dto.e_sche_title }",			//장소명
		    	start_date : "${dto.e_sche_start }",				//시작일
		    	end_date : "${dto.e_sche_end }",					//종료일
		    	select_position : new daum.maps.LatLng(latitude, longitude)			//선택한 지역의 좌표값											
			};
	    	listArray.push(locationInfo);				//배열에 지역 정보 추가
		</c:forEach>
	
		printLocation();						//리스트 출력
		setBounds();						//지도 범위 재설정	
    });
    
    //코멘트 추가 이벤트
    function addComment(session_mem_num){
    	//세션이 존재하지 않을 경우 로그인 처리
		if(session_mem_num==null || session_mem_num==""){
			falertModal('로그인을 해 주세요.');
			//location.href="../../member/memberLogin";
			return false;
		}
    	
		// 입력했는지 검사		
		if ( !($("#comment_text").val()) || $("#comment_text").val().trim() == "") {
			$('#comment_form').addClass("has-error");
			$('#comment_text').focus();
			return false;
		}
    	
		var re_num = ${review_content.re_num};
    	var text = $('#comment_text').val();
    	
    	$.ajax({
            data : {"re_num" : re_num, "cmt_cont" : text, "mem_num" : session_mem_num},
            type : "post",
            url : "/pairplan_v1/review/addComment/",
            success : function(data) {
            	$('.comment-list').html("");
            	$('.comment-list').append(data);
            	$('#comment_text').val("");
            },
            error : function(e){
            	alert(e.responseText);
            }
        });
    }
    
  	//코멘트 삭제 이벤트
    function delComment(cmt_num){
    	var re_num = ${review_content.re_num};
    	$.ajax({
            data : {"re_num" : re_num, "cmt_num" : cmt_num},
            type : "post",
            url : "/pairplan_v1/review/delComment/",
            success : function(data) {
            	$('.comment-list').html("");
            	$('.comment-list').append(data);
            	if($('.comment-list > li').size() == 0)
            		$('.comment-list').append("No Comment");
            },
            error : function(e){
            	alert(e.responseText);
            }
        });
    }
    
    
    $(function(){
    	$('#comment_text').blur(function() {
    		$('#comment_form').removeClass("has-error");
    	});
    	
    	//코멘트가 있다면 로딩
    	if($('.comment-list').length > 0){
	    	var re_num = ${review_content.re_num};
	    	$.ajax({
	            type : "post",
	            url : "/pairplan_v1/review/loadComment/" + re_num,
	            success : function(data) {
	            	$('.comment-list').html("");
	            	$('.comment-list').append(data);
	            	if($('.comment-list > li').size() == 0)
	            		$('.comment-list').append("No Comment");
	            },
	            error : function(e){
	            	alert(e.responseText);
	            }
	        });
    	}
    });
	</script>
  </body>
</html>
