<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header" class="clearfix">
    <nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="/pairplan_v1/member/main"><img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/Logo.png" alt="Logo"></a>
			세션 멤버 아이디 : ${sessionScope.session_mem_id} <br>
			세션 멤버 번호 : ${sessionScope.session_mem_num} <br>	
        </div><!-- /navbar-header -->

        <div class="navbar-right">
          <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav">
              <li><a href="/pairplan_v1/plan/planInsertForm">Make a plan</a></li>
              <li><a href="/pairplan_v1/plan/planList">Plans</a></li>
              <li><a href="/pairplan_v1/review/review_list">Reviews</a></li>
              <li><a href="/pairplan_v1/qna/list">Q&A</a></li>
              <li><a href="#"><img class="img-circle" style="width:35px; height:35px" src="${pageContext.request.contextPath}/resources/images/bg/main5.jpg" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false" data-target="#loginMenu"></a></li>
              <!-- data-toggle의 value는 모달기능을 수행하겠다는 뜻. data-target은 버튼 클릭시 모달로 띄우고자하는 id값.-->
            </ul>
          </div>

          <!-- 마이페이지 dropdown -->
          <div class="dropdown" id="loginMenu">
            <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="loginMenu">
              <c:if test="${sessionScope.session_mem_num == null}"> <!-- 로그인 안된 상태 -->
	              <li role="presentation"><a href="#" role="menuitem" tabindex="-1" data-toggle="modal" data-target="#loginpage"><i class="fa fa-sign-in" aria-hidden="true"></i> &nbsp; Sign In</a></li>
	              <li role="presentation"><a href="/pairplan_v1/member/memberJoin" role="menuitem" tabindex="-1"><i class="fa fa-user-plus" aria-hidden="true"></i> &nbsp; Sign Up</a></li>	              
	           </c:if>
	           
	           <c:if test="${sessionScope.session_mem_num != null}"> <!-- 로그인 된 상태 -->
	              <li role="presentation"><a href="/pairplan_v1/member/memberLogout" role="menuitem" tabindex="-1"><i class="fa fa-sign-out" aria-hidden="true"></i> &nbsp; Sign out</a></li>
	              
	              	<form name="myPageForm" style="margin: 0px;">
						<input type="hidden" name="mem_num" value="${sessionScope.session_mem_num}">						
					</form>
	              
	              <li role="presentation"><a href="javascript:myPageMemNumPost();" role="menuitem" tabindex="-1"><i class="fa fa-user-circle" aria-hidden="true"></i> &nbsp; My Page</a></li>
	              <li role="presentation"><a href="javascript:messageBoxModal();" role="menuitem" tabindex="-1"><i class="fa fa-envelope" aria-hidden="true"></i> &nbsp; Message</a></li>
	              <li role="presentation"><a href="javascript:statusModal();" role="menuitem" tabindex="-1"><i class="fa fa-handshake-o" aria-hidden="true"></i> &nbsp; Plan Status</a></li>
	           </c:if>	           
            </ul>
          </div>

        </div>
      </div><!-- container -->
    </nav><!-- navbar -->

    <!-- 로그인 Modal -->
    <div class="modal fade" id="loginpage" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="padding-right:0px">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
          <form action="#">
          <div class="modal-header">
            <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
            <h4 class="modal-title" id="myModalLabel">Login</h4>
          </div>
          <div class="modal-body">
            <div class="container-fluid">
              <div class="row">
                <div class="col-xs-8 col-xs-offset-2">
                
                    <div class="form-group">
                      <input type="text" class="form-control" id="form-control-input" name="mem_id" required="required" placeholder="User ID">
                    </div>
                    
                    <div class="form-group">
                       <input type="password" class="form-control" id="form-control-input" name="mem_pass" required="required" placeholder="Password">
                    </div>
                    
                    <!-- 페이스북 로그인 -->
                    <div class="form-group">
                    	<!-- <div class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false" scope="public_profile,email" onlogin="checkLoginState();"></div> -->
                    	<div class="fb-login-button" data-max-rows="1" data-size="small" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false" scope="public_profile,email" onlogin="checkLoginState();"></div>
                    </div>                    
                    
                    <div class="form-group">
                       <a href="/pairplan_v1/member/memberFind">아이디/비밀번호 찾기</a>
                    </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
          	<div style="margin:0 29px auto;">
            	<a href="../member/memberJoin"><button type="button" class="btn btn-default">Sign up</button></a> <!-- 회원가입 -->
            	<button type="button" class="btn btn-default" onclick="return loginCheck()">Sign In</button>
            	<button type="button" class="btn btn-default" style="margin:0px" data-dismiss="modal">Close</button> <!-- data-dismiss는 모달을 닫게하는 기능 -->
          	</div>
          </div>          
          </form>
        </div>
      </div>
    </div>

  </header><!-- header -->
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberFacebookLogin.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberLoginScript.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberGoToPostScript.js"></script>
  
  