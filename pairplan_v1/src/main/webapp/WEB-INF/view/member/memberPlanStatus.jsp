<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <div class="panel panel-default">
	<div class="panel-heading"><label style="margin-bottom:0px;">Waiting for accept</label></div>
	  <div class="panel-body">
	    <div id="wait_body" style="max-height:300px; overflow:auto; margin-bottom:20px;">
	
		<c:forEach var="dto" items="${waitAccept}">
		
	      <div style="padding:10px; border-bottom:1px solid #eee">
	        <div class="comment-avater">
	          <a href="javascript:sendMessage_OnStatus(${sessionScope.session_mem_num}, ${dto.mem_num },'${dto.mem_nick}');"> <img alt="" class="img-circle" src="${pageContext.request.contextPath}/resources/images${dto.mem_img }" style="width:70px; height:70px;"> </a>
	        </div>
	        <div style="float:right;">
	          <a href="javascript:sendMessage_OnStatus(${sessionScope.session_mem_num}, ${dto.mem_num },'${dto.mem_nick}');"><i class="fa fa-envelope fa-2x" aria-hidden="true"></i></a> &nbsp;
	          <a href="${pageContext.request.contextPath}/plan/select_plan/${dto.plan_num}"><i class="fa fa-search fa-2x" aria-hidden="true"></i></a> &nbsp;
	          <a href="javascript:acceptPlanRequest(${dto.plan_num},${dto.mem_num});"><i class="fa fa-check fa-2x" aria-hidden="true"></i></a> &nbsp;
	          <a href="javascript:deletePlanRequest(${dto.plan_num},${dto.mem_num});"><i class="fa fa-times fa-2x" aria-hidden="true"></i></a>
	        </div>
	        <div class="comment-text">
	          <h4>${dto.mem_nick}</h4>
	          <p class="overtext">There is a request waiting for a accept. </p>
	        </div>
	      </div>
		
		</c:forEach>
		
	    </div>
	  </div>
	</div>
	
	<div class="panel panel-default">
	  <div class="panel-heading"><label style="margin-bottom:0px;">Request to accompany</label></div>
	    <div class="panel-body">
	      <div id="request_body" style="max-height:300px; overflow:auto; margin-bottom:20px;">
	
		  <c:forEach var="dto" items="${myRequest }">
		
	        <div style="padding:10px; border-bottom:1px solid #eee">
	          <div class="comment-avater">
	            <!-- <a href="#"> <img alt="" class="img-circle" src="images/blog/thumb.jpg" style="width:70px; height:70px;"> </a> -->
	            
	          </div>
	          <div style="float:right;">
	            <a href="javascript:sendMessage_OnStatus(${dto.mem_num}, ${dto.boss_num },'${dto.boss_nick }');"><i class="fa fa-envelope fa-2x" aria-hidden="true"></i></a> &nbsp;
	            <a href="${pageContext.request.contextPath}/plan/select_plan/${dto.plan_num}"><i class="fa fa-search fa-2x" aria-hidden="true"></i></a> &nbsp;
	            <a href="javascript:deletePlanRequest(${dto.plan_num},${dto.mem_num});"><i class="fa fa-trash fa-2x" aria-hidden="true"></i></a>
	          </div>
	          <div class="comment-text">
	            <h4>${sessionScope.mem_nick }</h4>
	            <p class="overtext">Your request was sent successfully. </p>
	          </div>
	        </div>
	        
	      </c:forEach>
	
	      </div>
	    </div>
	  </div>