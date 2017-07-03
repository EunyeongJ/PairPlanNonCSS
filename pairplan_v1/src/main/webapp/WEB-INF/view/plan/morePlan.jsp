<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" scope="session"/>	<!-- 시간 로케일 설정 -->

<c:forEach var="plan" items="${plan_recent}" >
 			<li class="item-wrap">
 				<div class="item">
			<div class="item-image">
				<a href="select_plan/${plan.plan_num}"><img src="${pageContext.request.contextPath}/resources/images${plan.plan_img}" class="img-responsive" style="width:100%; height:260px;"></a>
				<div class="item-price">
					<span><i class="fa fa-eye" aria-hidden="true"></i> ${plan.plan_hit}</span>
				</div>
			</div>
			<div class="item-description">
				<div class="item-meta">
					<div class="item-post-date">
						<span><i class="fa fa-clock-o" aria-hidden="true"></i> <fmt:formatDate value="${plan.plan_date}" type="date"/></span>
						&nbsp; <span><i class="fa fa-users" aria-hidden="true"></i> ${plan.plan_people}</span>
					</div>
				</div>
				<div class="item-title">
					<h3 class="overtext"><a href="select_plan/${plan.plan_num}" title="${plan.plan_title}">${plan.plan_title}</a></h3>
				</div>
				<div class="item-info">
					<p class="overtext multiovertext">${plan.plan_cont}</p>
				</div>
			</div><!-- item-description -->
		</div><!-- item -->
 			</li><!-- item-wrap -->
</c:forEach>
|
<c:forEach var="plan" items="${plan_popular}" >
 			<li class="item-wrap">
 				<div class="item">
			<div class="item-image">
				<a href="select_plan/${plan.plan_num}"><img src="${pageContext.request.contextPath}/resources/images${plan.plan_img}" class="img-responsive" style="width:100%; height:260px;"></a>
				<div class="item-price">
					<span><i class="fa fa-eye" aria-hidden="true"></i> ${plan.plan_hit}</span>
				</div>
			</div>
			<div class="item-description">
				<div class="item-meta">
					<div class="item-post-date">
						<span><i class="fa fa-clock-o" aria-hidden="true"></i> <fmt:formatDate value="${plan.plan_date}" type="date"/></span>
						&nbsp; <span><i class="fa fa-users" aria-hidden="true"></i> ${plan.plan_people}</span>
					</div>
				</div>
				<div class="item-title">
					<h3 class="overtext"><a href="select_plan/${plan.plan_num}" title="${plan.plan_title}">${plan.plan_title}</a></h3>
				</div>
				<div class="item-info">
					<p class="overtext multiovertext">${plan.plan_cont}</p>
				</div>
			</div><!-- item-description -->
		</div><!-- item -->
 			</li><!-- item-wrap -->
</c:forEach>
|
<c:forEach var="plan" items="${plan}" >
 			<li class="item-wrap">
 				<div class="item">
			<div class="item-image">
				<a href="select_plan/${plan.plan_num}"><img src="${pageContext.request.contextPath}/resources/images${plan.plan_img}" class="img-responsive" style="width:100%; height:260px;"></a>
				<div class="item-price">
					<span><i class="fa fa-eye" aria-hidden="true"></i> ${plan.plan_hit}</span>
				</div>
			</div>
			<div class="item-description">
				<div class="item-meta">
					<div class="item-post-date">
						<span><i class="fa fa-clock-o" aria-hidden="true"></i> <fmt:formatDate value="${plan.plan_date}" type="date"/></span>
						&nbsp; <span><i class="fa fa-users" aria-hidden="true"></i> ${plan.plan_people}</span>
					</div>
				</div>
				<div class="item-title">
					<h3 class="overtext"><a href="select_plan/${plan.plan_num}" title="${plan.plan_title}">${plan.plan_title}</a></h3>
				</div>
				<div class="item-info">
					<p class="overtext multiovertext">${plan.plan_cont}</p>
				</div>
			</div><!-- item-description -->
		</div><!-- item -->
 			</li><!-- item-wrap -->
</c:forEach>