<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="dto" items="${plan_list}">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="item">
				<div
					style="float: left; width: 150px; position: relative; height: 150px; overflow: hidden; background-color: #f7f7f7; margin-left: 25px; border-radius: 6px;">
					<a href="review_write_form/${dto.e_plan_num}"><img src="${pageContext.request.contextPath}/resources/images${dto.e_plan_img }" style="max-width: 100%; height: 150px;" class="img-responsive"></a>
					<div class="item-price">
						<span><fmt:formatDate value="${dto.e_plan_date}" type="date" pattern="MMM"/></span>
					</div>
				</div>
				<div class="item-description"
					style="padding: 10px 25px; min-height: 0px;">
					<div class="item-meta">
						<div class="item-post-date">
							<fmt:setLocale value="en_US" scope="session"/>	<!-- 시간 로케일 설정 -->
							<span><fmt:formatDate value="${dto.e_plan_date}" type="date"/></span>
						</div>
					</div>
					<div class="item-title">
						<h4 class="overtext">
							<a href="review_write_form/${dto.e_plan_num}">${dto.e_plan_title}</a>
						</h4>
					</div>
					<div class="item-info">
						<p>${dto.e_plan_cont}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>