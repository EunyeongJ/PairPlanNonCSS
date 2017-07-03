<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach  var="msg" items="${message}">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="comment-avater">
				<a href="javascript:sendMessage_Onmodal(${msg.msg_rcv}, ${msg.msg_snd}, '${msg.s_nick}');"> <img class="img-circle" src="${pageContext.request.contextPath}/resources/images${msg.s_img}" style="width:70px; height:70px;"> </a>
			</div>
	        <div style="float:right;">
	            <a href="javascript:sendMessage_Onmodal(${msg.msg_rcv}, ${msg.msg_snd}, '${msg.s_nick}');"><i class="fa fa-reply fa-2x" aria-hidden="true"></i></a> &nbsp;
	            <a href="javascript:deleteMessage(${msg.msg_num});"><i class="fa fa-trash fa-2x" aria-hidden="true"></i></a>
	        </div>
			<div class="comment-text">
				<h4>${msg.s_nick}</h4>
				<p class="overtext">${msg.msg_cont} </p>
			</div>
		</div>
	</div>
</c:forEach>