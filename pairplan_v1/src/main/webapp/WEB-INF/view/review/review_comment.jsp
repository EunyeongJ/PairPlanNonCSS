<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="dto" items="${comments }">
	<li style="padding: 15px;">
		<div class="comment-avater">
			<a href="javascript:sendMessageModal(${dto.mem_num}, '${dto.mem_nick}');" data-toggle="tooltip" data-placement="top" title="Send Message"> <img style="width:70px; height:70px;" class="media-object img-circle" src="${pageContext.request.contextPath}/resources/images${dto.mem_img }"> </a>
		</div>
		<c:if test="${sessionScope.session_mem_num eq dto.mem_num}">
	        <div style="float:right;">
	              <button id="del_btn" type="button" class="close" aria-label="Close" onclick="delComment(${dto.cmt_num })"><i class="fa fa-times fa-1x"></i></button>
	        </div>
        </c:if>
		<div class="comment-text">
			<h4>${dto.mem_nick }</h4>
			<p>${dto.cmt_cont }</p>
		</div>
	</li>
</c:forEach>