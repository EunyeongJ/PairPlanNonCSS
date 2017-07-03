<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); //일단 세션 무조건 끔.
	response.sendRedirect("main"); //로그아웃하면 바로 메인창
%>