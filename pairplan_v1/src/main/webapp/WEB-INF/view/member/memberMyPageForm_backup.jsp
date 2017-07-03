<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

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

       <div class="ad-post-wrapper section">          
         <div class="container">
            <div class="row">               
               <div class="user-form">   
                  <h3 style="margin-top: 0px">회원정보</h3>   
                  <div class="col-sm" style="float:left">                     
                         <div class="form-group">
                        <!-- <input type="file" id="thumbnail" name="thumbnail" accept="image/*" onchange="imageChange();"> -->
                        <input type="hidden" id="mem_img" name="mem_img" value="http://localhost:8181/pairplan_v1/resources/images/member/default.png" />
                        <img src="${pageContext.request.contextPath}/resources/images/bg/main1.jpg" style="width:250px; height:250px;">
                        <!-- <input type="file" id="thumbnail" name="thumbnail" accept="image/*" onchange="imageChange();" class="thumbnailImage" style="width:250px; height:250px;"></input> -->
                        </div>
                        
                        <div class="form-group">
                         <center> ${memberInfo.mem_name}님 </center>                                      
                      </div>                     
                  </div>
                  
                       <div class="col-sm-offset-3" style="margin-top:20px;">
                     <%-- <div class="form-group">
                         회원번호 : ${memberInfo.mem_num}
                         <hr>
                      </div> --%>
                      
                      <div class="form-group">
                         ID : ${memberInfo.mem_id}
                         <hr>
                      </div>
                      
                      <div class="form-group">
                         NickName : ${memberInfo.mem_nick}
                         <hr>
                      </div>
                      
                      <div class="form-group">
                         <c:if test="${memberInfo.mem_gender == 1}">
                            Gender : male
                            <hr>
                         </c:if>
                         <c:if test="${memberInfo.mem_gender == 2}">
                            Gender : female
                            <hr>
                         </c:if>                         
                      </div>
                      
                          <div class="form-group">
                         Age : ${memberInfo.mem_age}
                         <hr>
                      </div>
                      
                          <div class="form-group">
                         Email : ${memberInfo.mem_email}
                         <hr>                   
                     </div>
                     
                     <div class="form-group">
                         Point : ${memberInfo.mem_point}
                         <hr>                   
                     </div>
                     <div style="float:right;">
                        <%-- <form name="myPageForm" style="margin: 0px;">
                           <input type="hidden" name="mem_num" value="${memberInfo.mem_num}">                  
                        </form> --%>
                        <a href="javascript:ModifyMemNumPost()" style="color:#6f6f6f;"> 정보 수정 </a> &nbsp; | &nbsp;<a href="javascript:DeleteMemNumPost()" style="color:#6f6f6f;"> 회원 탈퇴 </a>
                     </div>               
                  </div>
               </div>      
            </div>                  
         </div>
         
         
         <div class="container">
            <div class="row">                  
               <div class="user-form">   
                  <div class="col-sm">                     
                         <div class="form-group">
                         
                        <!-- Nav tabs -->
                          <ul class="nav nav-tabs" role="tablist"  id="myTab">
                            <c:forEach items="${groupInfos}" varStatus = "status">
                               <li role="presentation"><a href="#${status.index}" aria-controls="${status.index}" role="tab" data-toggle="tab">${status.index+1}</a></li>
                             </c:forEach>
                          </ul>
   
                          <!-- Tab panes -->
                          <hr>
                          <div class="tab-content">
                          <c:forEach var="group" items="${groupInfos}" varStatus = "status">
                             <div role="tabpanel" class="tab-pane" id="${status.index}">
                              <h3 style="margin-top: 0px">그룹정보</h3>
                              <div class="form-group">
                                <c:forEach var="group2" items="${group}">   
                                      <div class="form-group">별명: ${group2.mem_nick} / 이름: ${group2.mem_name} / 나이: ${group2.mem_age} / 별명: ${group2.mem_gender}</div>
                                      <hr>
                                  </c:forEach>
                           </div>
                              <h3>일정 정보</h3>
                     
                              <div class="tab-content">
                                 <c:forEach items="${scheduleInfos[status.index]}" var="i">                                                 
                                     <div class="form-group">
                                        일정순서 : ${i.sche_order}
                                     </div>
                                     <div class="form-group">
                                        좌표 : ${i.sche_lng},${i.sche_lat}
                                     </div>
                                    <div class="form-group">
                                        일정설명 : ${i.sche_title}
                                     </div>
                                    <div class="form-group">
                                        주소 : ${i.sche_addr}
                                     </div>
                                       <div class="form-group">
                                        출발일 : ${i.sche_start}
                                     </div>
                                     <div class="form-group">
                                        종료일 : ${i.sche_end}
                                     </div>
                                     <hr>
                                   </c:forEach>                                 
                                 </div>
                           </div>
                          </c:forEach>
                          </div>
                             
                           <div class="form-group">
                              <div>
                                <c:if test="${!empty groupInfos}">
                                 <div id=map style="width: 800px; height: 500px; margin: auto;"></div><br>
                               </c:if>
       
                               <c:if test="${empty groupInfos}">
                                  그룹정보가 없습니다.
                               </c:if>   
                            </div>                                                                                              
                        </div>   
                        <div class="form-group">
                              <div id='calendar' style="height: 500px; width: 500px;"></div>      
                           </div>                                                
                     </div>                    
                  </div>      
               </div>                  
            </div>
         </div> <!-- ad-post -->      
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