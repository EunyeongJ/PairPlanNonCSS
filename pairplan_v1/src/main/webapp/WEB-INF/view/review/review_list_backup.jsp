<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#box {width:200px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
	.float-frame {
	 	background: #eee;
	 	border: 1px solid #ddd;
		padding: 20px;
		overflow: hidden;
	}
	.article{
		background: #333;
		color: #fff;
		width: 300px;
		height: 300px;
		float: left;
		margin: 10px;
		text-align: center; 
		cursor: pointer;
	}
	.img{
		width: 300px;
		height: 250px;
	}
</style>
<script>
	function reviewContent(review_num){
		location.href = "review_view/" + review_num;
	}
	
	function reviewWrite(session_mem_num){
		if(session_mem_num == "" || session_mem_num == null)
			location.href = '../member/memberLogin';
		else{
			var url = 'expired_plan_view/' + session_mem_num;
			location.href = url;
		}
	}
</script>
</head>
<body>

	<div class="float-frame">
		<c:forEach var="dto" items="${review_list}">
		<div class="article" onclick="reviewContent(${dto.re_num})">
			<div class="img">
				<img src="${dto.re_mainImg}" width="300" height="250">
			</div>
			<div class="title">
				${dto.re_title}<br>
			</div>
		</div>
		</c:forEach>
	</div>
	<button type="button" onclick="reviewWrite(${sessionScope.session_mem_num})">리뷰작성</button>
		<!-- 이미지, 제목, 날짜, 지역 -->
</body>
</html>

