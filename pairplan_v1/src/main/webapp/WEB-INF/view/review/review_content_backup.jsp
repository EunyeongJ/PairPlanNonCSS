
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<div id=container style="width: 800px;">
	*계획정보*
	계획번호: ${review_content.e_plan_num}<br>
	계획인원: ${review_content.e_plan_people}<br>
	계획제목: ${review_content.e_plan_title}<br>
	계획내용: ${review_content.e_plan_cont}<br>
	계획사진: ${review_content.e_plan_img}<br>
	계획날짜: ${review_content.e_plan_date}<br>

	<hr>

	*리뷰정보*<br>
	리뷰번호: ${review_content.re_num}<br>
	회원번호: ${review_content.mem_num}<br>
	리뷰제목: ${review_content.re_title}<br>
	작성날자: ${review_content.re_date}<br>
	
	<hr>
	리뷰내용:
	<div style="height: 400px; border: 1px solid balck; overflow:auto;">
		${review_content.re_cont}
	</div>
	<hr>
	
	*지역정보*<br>
	<c:forEach var="dto" items="${review_schedule}">
		계획번호: ${dto.e_plan_num }<br>
		지역순서: ${dto.e_sche_order }<br>
		경도좌표: ${dto.e_sche_lng }<br>
		위도좌표: ${dto.e_sche_lat }<br>
		지역주소: ${dto.e_sche_addr }<br>
		지역제목: ${dto.e_sche_title }<br>
		출발일자: ${dto.e_sche_start }<br>
		도착일자: ${dto.e_sche_end }<br>
	</c:forEach>
	
	<hr>
	<br>
	<br>
	<div class="map_wrap">
	    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	    <!-- 지도타입 컨트롤 div -->
	    <div class="custom_typecontrol radius_border">
	        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
	        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
	    </div>
	</div>
	<button type="button" onclick="location.href='../review_list'">목록</button>
	
	<c:if test="${sessionScope.session_mem_num eq review_content.mem_num}">
		<button type="button" onclick="location.href='../review_modify_form/${review_content.re_num}'">수정</button>
		<button type="button" onclick="location.href='../review_delete/${review_content.re_num}/${review_content.e_plan_num}'">삭제</button>
	</c:if>
	
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
</script>
</body>
</html>

