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

    <title>PairPlan | View Plan</title>

   <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" >  
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
				<h1>View Plan</h1>
				<ol class="breadcrumb">
					<li><a href="/pairplan_v1/member/main">Home</a></li>
					<li class="active">Plans</li>
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
					
					<span><i class="fa fa-clock-o"></i> <fmt:formatDate value="${plan.plan_date }" type="date"/></span>
					&nbsp; | &nbsp; <i class="fa fa-users" aria-hidden="true"></i> &nbsp;${planPeople} / ${plan.plan_people}
                    <h3 class="entry-title" style="padding-top: 5px;">${plan.plan_title }</h3>
                    <div class="post-excerpt">
                      <p>${plan.plan_cont }</p>
					<hr>
					<c:forEach var="dto" items="${planInfo}">
                      <p class="quote-text">
                      <span class="label-color-red">${dto.sche_order }</span> &nbsp; &nbsp; <i class="fa fa-map-marker"></i> ${dto.sche_addr } &nbsp; &nbsp; <i class="fa fa-map-pin"></i> ${dto.sche_title }<br>
                          	<span><i class="fa fa-clock-o"></i> <fmt:formatDate value="${dto.sche_start }" type="date"/></span>
                          	 ~ <span><fmt:formatDate value="${dto.sche_end }" type="date"/></span>
                      </p>
                    </c:forEach>
                    
                    </div>
                    <div class="entry-meta">
                      <span>By <a href="javascript:sendMessageModal(${member.mem_num}, '${member.mem_nick}');" data-toggle="tooltip" data-placement="top" title="Send Message">
                      ${member.mem_nick}</a></span> | <span>${plan.plan_hit } Hits</span>
                      |<span>Travel Styles: <c:forEach items="${plan_style }" var="plan_style">${plan_style.style_name} </c:forEach> </span>
                    </div>
                    <a class="date">
                    	<span><fmt:formatDate value="${plan.plan_date }" type="date" pattern="d"/></span> 
                    	<fmt:formatDate value="${plan.plan_date }" type="date" pattern="MMM"/>
                    </a>
                  </div>
                  
                  	<div class="seller-option avtpost-fields">
						<div class="row">
							<div class="col-md-12">
							<h3>Writer Information <span>
								<a href="javascript:sendMessageModal(${member.mem_num}, '${member.mem_nick}');" data-toggle="tooltip" data-placement="top" title="Send Message">
				                <i class="fa fa-paper-plane" aria-hidden="true"></i> &nbsp;Send Message</a>
			                </span></h3>
							</div>
			                  <div class="col-md-6">
			                    <div class="panel panel-default">
			                      <div class="panel-body">
			                        <div class="post-inner">
			                          <div class="row form-group">
			                            <label class="col-md-4">
			                            	<i class="fa fa-user-circle-o" aria-hidden="true"></i> &nbsp;Member Image: <br>
			                            </label>
			                            <div class="col-md-8">
			                              <p class="text-center">
			                                <img src="${pageContext.request.contextPath}/resources/images${member.mem_img}" class="img-circle" style="width:150px; height:150px;">
			                              </p>
			                            </div>
			                          </div>
			                        </div><!-- post-inner -->
			                        <hr>
			                        <div class="post-inner">
			                          <div>
			                            <label class="col-md-4"><i class="fa fa-user" aria-hidden="true"></i> &nbsp;Nick name: </label>
			                            <div class="col-md-8">
			                              <label style="font-weight:400;">${member.mem_nick} &nbsp;
			                              <c:if test="${member.mem_gender eq 1}"><i class="fa fa-mars" aria-hidden="true"></i></c:if>
			                              <c:if test="${member.mem_gender eq 2}"><i class="fa fa-venus" aria-hidden="true"></i></c:if>
			                              </label>
			                            </div>
			                            </div>
			                        </div><!-- post-inner -->
			                        <div class="post-inner">
			                            <label class="col-md-4"><i class="fa fa-heart" aria-hidden="true"></i> &nbsp;Age: </label>
			                            <div class="col-md-8">
			                              <label style="font-weight:400;">${member.mem_age} </label>
			                            </div>
			                        </div><!-- post-inner -->
			                        <div class="post-inner">
			                            <label class="col-md-4"><i class="fa fa-envelope" aria-hidden="true"></i> &nbsp;Email: </label>
			                            <div class="col-md-8">
			                              <label style="font-weight:400;">${member.mem_email} </label>
			                            </div>
			                        </div><!-- post-inner -->
			                      </div>
			                    </div>
			
			                  </div>
			                  <div class="col-md-6">
			                  <div class="panel panel-default">
			                    <div class="panel-body">
			                    <div class="post-inner">
			                      <div class="row form-group">
			                        <label class="col-md-4"><i class="fa fa-picture-o" aria-hidden="true"></i> &nbsp;Plan Image :	</label>
			                        <div class="col-md-8">
			                          <p class="text-center">
			                            <img src="${pageContext.request.contextPath}/resources/images${plan.plan_img}" style="width:330px; height:246px; border-radius:6px;">
			                          </p>
			                        </div>
			                      </div>
			                    </div><!-- post-inner -->
			                  </div>
							</div>
			              </div>
			            </div>
					</div><!-- seller-option -->
				    
				    <div class="submit-section">
						<div class="submit-button" style="padding-top: 20px;">
							<button type="button" style="margin-bottom: 5px;" class="btn btn-warning btn-lg" onclick="location.href='../planList'">
									<i class="fa fa-bars" aria-hidden="true"></i>
							</button>
						    <c:choose>
								<c:when test="${sessionScope.session_mem_num eq member.mem_num}">
									<button type="button" style="margin-bottom: 5px;" class="btn btn-danger btn-lg" onclick="location.href='../planDelete/${plan.plan_num}'">
									<i class="fa fa-trash-o"></i>
									</button>
									<button type="button" style="margin-bottom: 5px;" class="btn btn-success btn-lg" onclick="location.href='../planUpdateForm/${plan.plan_num}'">
										Modify&nbsp; <i class="fa fa-wrench"></i>
									</button>
								</c:when>
								<c:otherwise>
									<button type="button" style="margin-bottom: 5px;" class="btn btn-success btn-lg" onclick="request(${sessionScope.session_mem_num});">
										Accompany&nbsp; <i class="fa fa-handshake-o" aria-hidden="true"></i>
									</button>
								</c:otherwise>
							</c:choose>
				    	</div>
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
	   	<c:forEach var="dto" items="${planInfo}">
	    	//선택한 지역의 정보를 저장할 객체 생성
	    	var latitude = ${dto.sche_lat };				//위도좌표
	    	var longitude = ${dto.sche_lng };				//경도좌표
	    	var locationInfo = {
				location_addr : "${dto.sche_addr}",			//지역의 주소
		    	location_title : "${dto.sche_title }",			//장소명
		    	start_date : "${dto.sche_start }",				//시작일
		    	end_date : "${dto.sche_end }",					//종료일
		    	select_position : new daum.maps.LatLng(latitude, longitude)			//선택한 지역의 좌표값											
			};
	    	listArray.push(locationInfo);				//배열에 지역 정보 추가
		</c:forEach>
	
		printLocation();						//리스트 출력
		setBounds();						//지도 범위 재설정	
    });
    
  //신청하기
	function request(session_mem_num){
		//현재 인원 분석
		var nowPeople = ${planPeople};
		var maxPeople = ${plan.plan_people};
		if(nowPeople==maxPeople){
			falertModal('더 이상 동행인원을 추가할 수 없습니다.');
			return false;
		}
		
		//세션이 존재하지 않을 경우 로그인 처리
		if(session_mem_num==null || session_mem_num==""){
			location.href="/pairplan_v1/member/memberLogin";
		}
		else
			makePlanRequest(session_mem_num);
	}
	
	function makePlanRequest(session_mem_num){
		var mem_num = session_mem_num;
		var plan_num = ${plan.plan_num};
		$.ajax({
			type : 'post',
			data : {"mem_num" : mem_num, "plan_num" : plan_num},
			url : '../makePlanRequest',
			success : function(data){
				if(data=='check')
					falertModal('동행 신청이 완료되었습니다.');
				else
					falertModal('이미 동행 신청 하였습니다.');
			},
			error : function(e){
				alert(e.responseText);
			}
		});
	}
	</script>
  </body>
</html>
