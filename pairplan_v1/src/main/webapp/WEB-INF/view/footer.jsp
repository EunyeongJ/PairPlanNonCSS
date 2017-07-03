<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- footer -->
	<footer id="footer">
		<div class="footer-top section">
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="footer-widget about-widget">
							<h3>About PairPlan</h3>
							<p> Our site is provides information to the trip you want to accompany. There are various travel reviews, you can refer.</p>
							<br> <p> You can share your travel plans with other users and communication with your travel companion. </p>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="footer-widget link-widget">
							<h3>Useful Links</h3>
							<ul>
								<li><a href="/pairplan_v1/plan/planInsertForm"> <i class="fa fa-angle-double-right"></i> Make a plan</a></li>
								<li><a href="/pairplan_v1/plan/planList"> <i class="fa fa-angle-double-right"></i> Plan List</a></li>
								<li><a href="javascript:reviewWrite(${sessionScope.session_mem_num});"> <i class="fa fa-angle-double-right"></i> Write Review</a></li>
								<li><a href="/pairplan_v1/review/review_list"> <i class="fa fa-angle-double-right"></i> Review List</a></li>
								<li><a href="/pairplan_v1/qna/list"> <i class="fa fa-angle-double-right"></i> Q&A</a></li>
							</ul>
						</div>
					</div>

					<div class="col-sm-4">
						<div class="footer-widget contact-widget">
							<h3>Contact Us</h3>
							<ul>
								 <li><span><i class="fa fa-map-marker"></i> Address :</span> 823-24, Yeoksam-dong, Gangnam-gu</li>
						     <li><span><i class="fa fa-phone"></i> Phone number :</span> (010) 9975-7628</li>
						     <li><span><i class="fa fa-envelope"></i> E-mail :</span> inchuls2@naver.com</li>
					        </ul>
						</div>
					</div>
				</div>
			</div><!-- container -->
		</div><!-- footer-top -->
	</footer><!-- footer -->

	<jsp:include page="/WEB-INF/view/modal/modal_expiredPlan.jsp"/>	<!-- 만료 계획 보기 모달 -->
	<jsp:include page="/WEB-INF/view/modal/modal_planStatus.jsp"/>		<!-- 동행 현황 모달 -->
	<jsp:include page="/WEB-INF/view/modal/modal_message.jsp"/>		<!-- 메시지 모달 -->
	<jsp:include page="/WEB-INF/view/modal/modal_alert.jsp"/>		<!-- 메시지 모달 -->