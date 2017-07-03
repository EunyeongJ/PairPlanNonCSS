<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- Use age -->
	<!-- 
		reviewWrite(${sessionScope.session_mem_num});를 호출하면 모달이 뜹니다. 반드시 session에 mem_num이 있어야합니다. 없을시 로그인 페이지로 돌리게 되어있음
	-->

	<!-- Modal -->
	  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	          <h4 class="modal-title" id="myModalLabel">Expired Plan List</h4>
	        </div>
	        <div class="modal-body" style="max-height:600px; overflow-y: auto;">
	        </div>
	      </div>
	    </div>
	  </div>
	  <script>
	  function reviewWrite(session_mem_num){
			if(session_mem_num == "" || session_mem_num == null)
				location.href = '/pairplan_v1/member/memberLogin';
			else{
				
				var url = 'expired_plan_view/' + session_mem_num;
				//만료 계획 정보 가져오기 
		    	$.ajax({
		            type : "post",
		            url : url,
		            success : function(data) {
		            	console.log(data);
		            	$('.modal-body').html("");
		            	$('.modal-body').append(data);
		            	if($('.modal-body > .panel').size() == 0)
		            		$('.modal-body').append("There is no expired plan data.");
		            	
		            	$('#myModal').modal('show');
		            },
		            error : function(e){
		            	alert(e.responseText);
		            }
		        });
			}
		}
	  </script>
