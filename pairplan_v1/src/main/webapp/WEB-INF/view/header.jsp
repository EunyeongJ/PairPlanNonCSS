<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header" class="clearfix">
    <nav class="navbar navbar-default">
		

			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/pairplan_v1/member/main"><img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/Logo.png" alt="Logo"></a>
				</div><!-- /navbar-header -->

				<div class="navbar-right">
          
					<div class="collapse navbar-collapse" id="navbar-collapse">
            
						<ul class="nav navbar-nav">
							<li><a href="/pairplan_v1/plan/planInsertForm" style="font-size: 18; line-height: 60px;">Make a plan</a></li>
							<li><a href="/pairplan_v1/plan/planList" style="font-size: 18; line-height: 60px;">Plans</a></li>
							<li><a href="/pairplan_v1/review/review_list" style="font-size: 18; line-height: 60px;">Reviews</a></li>
							<li><a href="/pairplan_v1/qna/list" style="font-size: 18; line-height: 60px;">Q&A</a></li>
							<li class="dropdown">
							<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
							
							<!-- Users <span class="caret"></span> -->
							
							
							<c:if test="${sessionScope.session_mem_num == null}"> <!-- 로그인 안된 상태 -->
								<img class="img-circle" style="width:64px; height:64px; border: 2px solid #0a0a0a;" src="${pageContext.request.contextPath}/resources/images/member/default.png">
							</c:if>
							
							<c:if test="${sessionScope.session_mem_num != null}"> <!-- 로그인 된 상태 -->
								<img class="img-circle" style="width:64px; height:64px; border: 2px solid #0a0a0a;" src="${pageContext.request.contextPath}/resources/images${sessionScope.session_mem_img}">
							</c:if>	
							 
							</a>
								<ul class="dropdown-menu">
								
								
								<c:if test="${sessionScope.session_mem_num == null}"> <!-- 로그인 안된 상태 -->
									<li><a href="javascript:loginModal()"><i class="fa fa-sign-in" aria-hidden="true"></i> &nbsp; Sign In</a></li>
									<li><a href="/pairplan_v1/member/memberJoin"><i class="fa fa-user-plus" aria-hidden="true"></i> &nbsp; Sign Up</a></li>
								 </c:if>
								 <c:if test="${sessionScope.session_mem_num != null}"> <!-- 로그인 된 상태 -->
								 	<li><a href="/pairplan_v1/member/memberLogout"><i class="fa fa-sign-out" aria-hidden="true"></i> &nbsp; Sign out</a></li>
								 	<form name="myPageForm" style="margin: 0px;">
										<input type="hidden" name="mem_num" value="${sessionScope.session_mem_num}">						
									</form>
									<li><a href="javascript:myPageMemNumPost();"><i class="fa fa-user-circle" aria-hidden="true"></i> &nbsp; My Page</a></li>
									<li><a href="javascript:messageBoxModal();"><i class="fa fa-envelope" aria-hidden="true"></i> &nbsp; Message</a></li>
									<li><a href="javascript:statusModal();"><i class="fa fa-handshake-o" aria-hidden="true"></i> &nbsp; Plan Status</a></li>
								 </c:if>	
								</ul>
							</li>
						</ul>
            
					</div>
				</div>
				
			</div><!-- container -->
		</nav><!-- navbar -->
  </header><!-- header -->
  
  <!-- 로그인 Modal -->
    <div class="modal fade" id="loginpage" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="padding-right:0px">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
          <form action="#">
          <div class="modal-header">
            <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
            <h4 class="modal-title" id="myModalLabel"><i class="fa fa-sign-in" aria-hidden="true"></i> &nbsp; Sign In</h4>
          </div>
          <div class="modal-body">
            <div class="container-fluid">
              <div class="row">
                <!-- <div class="col-xs-8 col-xs-offset-2"> -->
                
                    <div class="form-group" style="padding:0px 20px;">
                      <input type="text" class="form-control" id="login_mem_id" name="mem_id" required="required" placeholder="User ID">
                    </div>
                    
                    <div class="form-group" style="padding:0px 20px;">
                       <input type="password" class="form-control" id="login_mem_pass" name="mem_pass" required="required" placeholder="Password">
                    </div>
                    
                    <!-- 페이스북 로그인 -->
                    <div class="form-group  text-center">
                    	<!-- <div class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false" scope="public_profile,email" onlogin="checkLoginState();"></div> -->
                    		<div class="fb-login-button" data-max-rows="1" data-size="small" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false" scope="public_profile,email" onlogin="checkLoginState();"></div>
                    </div>                    
                    
                    <div class="form-group text-center">
                       <a href="/pairplan_v1/member/memberFind" style="color: #6f6f6f;"><i class="fa fa-search" aria-hidden="true"></i> 아이디/비밀번호 찾기</a>
                    </div>
                    <div class="text-center">
                       <div id="login_status" style="color:#FF5E00"></div>
                    </div>
                <!-- </div> -->
              </div>
            </div>
          </div>
          <div class="modal-footer">
          	<div style="margin:0 29px auto;">
            	<a href="/pairplan_v1/member/memberJoin"><button type="button" class="btn btn-default">Sign up</button></a> <!-- 회원가입 -->
            	<button type="button" class="btn btn-default" onclick="return loginCheck()">Sign In</button>
            	<button type="button" class="btn btn-default" style="margin:0px" data-dismiss="modal">Close</button> <!-- data-dismiss는 모달을 닫게하는 기능 -->
          	</div>
          </div>          
          </form>
        </div>
      </div>
    </div>
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberFacebookLogin.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberLoginScript.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberGoToPostScript.js"></script>
  
  