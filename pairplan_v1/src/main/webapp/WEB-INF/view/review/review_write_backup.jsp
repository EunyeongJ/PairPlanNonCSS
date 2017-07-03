<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if(session.getAttribute("session_mem_num")==null) response.sendRedirect("../../member/memberLogin");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Map Test</title>


<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>

<!-- editor upload -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/review/editorUploadScript.js"></script>
</head>
<body>

계획번호:${e_plan_content.e_plan_num }<br>
인원:${e_plan_content.e_plan_people }<br>
내용:${e_plan_content.e_plan_cont }<br>
제목:${e_plan_content.e_plan_title }<br>
날자:${e_plan_content.e_plan_date }<br>
이미지:${e_plan_content.e_plan_img }<br>
조회수:${e_plan_content.e_plan_hit }<br>


*지역정보*<br>
<c:forEach var="dto" items="${e_plan_schedule}">
	계획번호: ${dto.e_plan_num }<br>
	지역순서: ${dto.e_sche_order }<br>
	경도좌표: ${dto.e_sche_lng }<br>
	위도좌표: ${dto.e_sche_lat }<br>
	지역주소: ${dto.e_sche_addr }<br>
	지역제목: ${dto.e_sche_title }<br>
	출발일자: ${dto.e_sche_start }<br>
	도착일자: ${dto.e_sche_end }<br>
</c:forEach>

<form action="../review_write" method="post" id="editorForm" name="editorForm" onsubmit="checkImage()">
	<input type="hidden" id="e_plan_num" name="e_plan_num" value="${e_plan_content.e_plan_num }">
	<input type="hidden" name="mem_num" value="${sessionScope.session_mem_num}">
	
	<div id="" style="width: 800px;">
		제목<br>
		<input type="text" name="re_title"><br>
		
		<hr>
		
		내용<br>
		<textarea id="summernote" name="re_cont"></textarea>
	</div>
	<button type="button" id="goListBtn">글목록</button>
	<button type="submit" id="submitBtn">전송하기</button>
</form>
</body>
</html>