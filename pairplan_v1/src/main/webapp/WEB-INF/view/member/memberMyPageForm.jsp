<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="PairPlan">
	<meta name="description" content="">
	
	<title> PairPlan | My Page </title>

	<!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    
    <link rel='stylesheet' href='https://fullcalendar.io/js/fullcalendar-3.3.1/fullcalendar.css' />

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
    
    <style>

   body {


   #calendar {
      text-align: center;
      font-size: 14px;
      font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
      width: 900px;
 
   }

</style>
</head>
<body>

	<jsp:include page="/WEB-INF/view/header.jsp"/>

	<div class="page">
      <div id="breadcrumb-section" class="section">
         <div class="container">
            <div class="page-title text-center">
               <h1>User MyPage</h1>
               <ol class="breadcrumb">
                  <li><a href="${pageContext.request.contextPath}/member/main">Home</a></li>
                  <li class="active">User</li>
               </ol>
            </div>
         </div>
      </div><!-- breadcrumb-section -->

       <div class="avt-post-wrapper section">      
       
       <div class="container">
			  <div class="blog-content blog-detail">
                <div class="blog-post">
                  
            		<div class="seller-option avtpost-fields" style=" margin-top: 0px;">
						<div class="row">
							<div class="col-md-12">
							<h3>User Information <span>						
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
			                                <img src="${pageContext.request.contextPath}/resources/images${memberInfo.mem_img}" class="img-circle" style="width:150px; height:150px;">
			                              </p>
			                            </div>
			                          </div>
			                        </div><!-- post-inner -->
			                        <hr>
			                        <div class="post-inner">
			                            <label class="col-md-4"><i class="fa fa-id-card" aria-hidden="true"></i> &nbsp;ID: </label>
			                            <div class="col-md-8">
			                              <label style="font-weight:400;">${memberInfo.mem_id} </label>
			                            </div>
			                        </div><!-- post-inner -->
			                        <div class="post-inner">
			                            <label class="col-md-4"><i class="fa fa-id-badge" aria-hidden="true"></i> &nbsp;Name: </label>
			                            <div class="col-md-8">
			                              <label style="font-weight:400;">${memberInfo.mem_name} </label>
			                            </div>
			                        </div><!-- post-inner -->
			                        <div class="post-inner">
			                          <div>
			                            <label class="col-md-4"><i class="fa fa-user" aria-hidden="true"></i> &nbsp;Nick name: </label>
			                            <div class="col-md-8">
			                              <label style="font-weight:400;">${memberInfo.mem_nick} &nbsp;
			                              <c:if test="${memberInfo.mem_gender eq 1}"><i class="fa fa-mars" aria-hidden="true"></i></c:if>
			                              <c:if test="${memberInfo.mem_gender eq 2}"><i class="fa fa-venus" aria-hidden="true"></i></c:if>
			                              </label>
			                            </div>
			                            </div>
			                        </div><!-- post-inner -->
			                        <div class="post-inner">
			                            <label class="col-md-4"><i class="fa fa-heart" aria-hidden="true"></i> &nbsp;Age: </label>
			                            <div class="col-md-8">
			                              <label style="font-weight:400;">${memberInfo.mem_age} </label>
			                            </div>
			                        </div><!-- post-inner -->
			                        <div class="post-inner">
			                            <label class="col-md-4"><i class="fa fa-envelope" aria-hidden="true"></i> &nbsp;Email: </label>
			                            <div class="col-md-8">
			                              <label style="font-weight:400;">${memberInfo.mem_email} </label>
			                            </div>
			                        </div><!-- post-inner -->
			                        <div style="float: right; margin-top: 30px;">
				                        <a href="javascript:ModifyMemNumPost();"><i class="fa fa-wrench" aria-hidden="true"></i> 정보 수정</a> &nbsp; &nbsp;
										<a href="javascript:DeleteMemNumPost();"><i class="fa fa-user-times" aria-hidden="true"></i> 회원 탈퇴</a>
			                        </div>
			                      </div>
			                    </div>
			
			                  </div>
			                  <div class="col-md-6">
			                  <div class="panel panel-default">
			                    <div class="panel-body">
			                    <div class="post-inner">
			                      <div class="row form-group" style="padding-left: 10px;  overflow-x: auto; overflow-y: hidden; white-space:nowrap">
			                        <label><i class="fa fa-picture-o" aria-hidden="true"></i> &nbsp;My Schedule :</label>	
										<div id='calendar' class="text-center" style="height: 400px; width: 500px;"></div>  
			                      </div>
			                    </div><!-- post-inner -->
			                  </div>
							</div>
			              </div>
			            </div>
					</div><!-- seller-option -->
            
                
                	<div class="entry-content" style="border: 1px solid #ddd; padding-top: 25px; border-radius: 4px; margin-top: 30px;">
					<h3 style="color: #000; margin-bottom: 30px;">Group Infomation</h3>
					
		<!-----------------------------------------------------------------------  -->
					<div class="col-sm">                     
			                         <div class="form-group">
			                         
			                        <!-- Nav tabs -->
			                          <ul class="nav nav-tabs" role="tablist"  id="myTab">
			                            <c:forEach items="${groupInfos}" varStatus = "status">
			                               <li role="presentation"><a href="#${status.index}" aria-controls="${status.index}" role="tab" data-toggle="tab" style="padding: 12px 24px;">${status.index+1}</a></li>
			                             </c:forEach>
			                          </ul>
			   
			                          <!-- Tab panes -->
			                          <div class="tab-content">
			                          <c:forEach var="group" items="${groupInfos}" varStatus = "status">
			                             <div role="tabpanel" class="tab-pane" id="${status.index}">
			                              <h3>그룹정보</h3>
			                              
			                              <div class="panel panel-default">
											  <div class="panel-body">
											    <div id="wait_body" style="max-height:300px; overflow:auto; margin-bottom:20px;">
											
												<c:forEach var="dto" items="${group}">
												
											      <div style="padding:10px; border-bottom:1px solid #eee">
											        <div class="comment-avater">
											          <a href="javascript:sendMessageModal(${dto.mem_num },'${dto.mem_nick}');"> <img alt="" class="img-circle" src="${pageContext.request.contextPath}/resources/images${dto.mem_img }" style="width:70px; height:70px;"> </a>
											        </div>
											        <div style="float:right;">
											          <a href="javascript:sendMessageModal(${dto.mem_num },'${dto.mem_nick}');"><i class="fa fa-envelope fa-2x" aria-hidden="true"></i></a> &nbsp;
											        </div>
											        <div class="comment-text">
											          <h4>${dto.mem_nick}</h4>
											          <p class="overtext">별명: ${dto.mem_nick} &nbsp; | &nbsp; 이름: ${dto.mem_name} &nbsp; | &nbsp; 나이: ${dto.mem_age} &nbsp; | &nbsp; 이메일: ${dto.mem_email}</p>
											        </div>
											      </div>
												
												</c:forEach>
												
											    </div>
											  </div>
											</div>
			                              
			                              <h3>일정 정보</h3>
				                     		
									<hr>	
								
									<fmt:setLocale value="en_US" scope="session"/>	<!-- 시간 로케일 설정 -->
									
									<c:forEach items="${scheduleInfos[status.index]}" var="i">   
				                      <p class="quote-text">
				                      <span class="label-color-red">${i.sche_order}</span> &nbsp; &nbsp; <i class="fa fa-map-marker"></i> ${i.sche_addr } &nbsp; &nbsp; <i class="fa fa-map-pin"></i> ${i.sche_title }<br>
				                          	<span><i class="fa fa-clock-o"></i> <fmt:formatDate value="${i.sche_start }" type="date"/></span>
				                          	 ~ <span><fmt:formatDate value="${i.sche_end }" type="date"/></span>
				                      </p>
				                    </c:forEach>
			                    </div>
			                    <div class="entry-meta">
			                    <jsp:useBean id="now" class="java.util.Date" />	<!-- 현재 시간 구하기 -->
			                    </div>
			                    <a class="date">
			                    	<span><fmt:formatDate value="${now }" type="date" pattern="d"/></span> 
			                    	<fmt:formatDate value="${now }" type="date" pattern="MMM"/>
			                    </a>
	                      </c:forEach>
	                    </div>
	                           
                    </div>
                             
				                           <div class="form-group">
				                              <div>
				                                <c:if test="${!empty groupInfos}">
													 <div class="map_wrap">
												    <div id="map" style="width:100%; height:300px; position:relative; overflow:hidden;"></div>
												    <!-- 지도타입 컨트롤 div -->
												    <div class="custom_typecontrol radius_border">
												        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
												        <span id="btnSkyview" class="non_btn" onclick="setMapType('skyview')">스카이뷰</span>
												    </div>
												</div>
				                               </c:if>
				       
				                               <c:if test="${empty groupInfos}">
				                                  	그룹정보가 없습니다.
				                               </c:if>   
				                            </div>                                                                                              
				                        </div>   
                     </div>                    
                  </div>
                  
            <!-----------------------------------------------------------------------  -->
					
                    
                  </div>
                 
       			</div>
       		</div>
       </div>
   </div>   <!-- page -->


	<jsp:include page="/WEB-INF/view/footer.jsp"/>
	
	<!-- JS -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/modernizr.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>    
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/custom.js"></script>
	
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=6277bf7a1c54113effe51dbd6375f8cd&libraries=services"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plan/mapMypageScript.js"></script>
	
	<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
    <script src='https://fullcalendar.io/js/fullcalendar-3.3.1/fullcalendar.min.js'></script>
 	<script>
      var today = new Date();   //오늘날짜
      $(document).ready(function() {
         
         var test = $('#calendar').fullCalendar({
            header: {
               rigth: 'prev,next today',
               left: 'title'
               /*right: 'month' ,agendaWeek,agendaDay */
            },
            defaultDate: today,
            defaultView: 'month',
            editable: false,
            events: [
               <c:forEach var="group" items="${groupInfos}" varStatus = "status">
               <c:forEach items="${scheduleInfos[status.index]}" var="dto">
               {
                  title : '${dto.sche_title}', 
                    start : '${dto.sche_start}',
                    end : '${dto.sche_end}'
                },
                </c:forEach>
                </c:forEach>
            ]
         });
      });
   </script>
	
	
	<script>
	$('#myTab a').click(function (e) {
		var index = $(this).attr('aria-controls');
		
		printLocation(index);            //리스트 출력
		setBounds(index);                //지도 범위 재설정 
	});
		
	//페이지가 전부 로딩이 되었을때 실행
	$(function(){
		<c:forEach var="scheduleInfos" items="${scheduleInfos}" varStatus="status">
			var listArray = [];
			<c:forEach var="dto" items="${scheduleInfos}">
				//선택한 지역의 정보를 저장할 객체 생성
				var latitude = ${dto.sche_lat};            //위도좌표
				var longitude = ${dto.sche_lng};            //경도좌표
				var locationInfo = {
				location_addr : "${dto.sche_addr}",         		//지역의 주소
				location_description : "${dto.sche_title}",         //장소명
				start_date : "${dto.sche_start}",            			//시작일
				end_date : "${dto.sche_end}",              		  	  //종료일
				select_position : new daum.maps.LatLng(latitude, longitude)         //선택한 지역의 좌표값                                 
			};
			listArray.push(locationInfo);            //배열에 지역 정보 추가
			</c:forEach>
		totalList.push(listArray);
		</c:forEach>
		
		if($('#map').length > 0){
			$('#myTab a:first').tab('show');	//처음 선택
		  	printLocation(0);            		//첫번째 지도설정
			setBounds(0); 						//첫번째 지도설정
		}
	});
	</script>

</body>
</html>