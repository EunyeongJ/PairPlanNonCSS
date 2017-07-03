<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<form action="../review_modify" method="post" id="editorForm" name="editorForm" onsubmit="checkImage()">
	<input type="hidden" id="e_plan_num" name="e_plan_num" value="${review_content.e_plan_num }">
	<input type="hidden" name="re_num" value="${review_content.re_num }">
	
	<div id="" style="width: 800px;">
		작성날짜: ${review_content.re_date}<br>
		계획번호: ${review_content.e_plan_num}<br>
		리뷰번호: ${review_content.re_num }<br>
		사진: ${review_content.re_imgs}<br>
		메인사진: ${review_content.re_mainImg}<br>		
		<hr>
	
		제목<br>
		<input type="text" name="re_title" value="${review_content.re_title}"><br>
		
		<hr>
		
		내용<br>
		<textarea id="summernote" name="re_cont">${review_content.re_cont}</textarea>
	</div>
	<button type="button" onclick="location.href='../review_list'">글목록</button>
	<button type="submit" id="submitBtn">수정하기</button>
</form>
</body>
</html>