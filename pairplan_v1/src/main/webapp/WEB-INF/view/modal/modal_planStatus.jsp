			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			
			<!-- Use age -->
			<!-- 
				statusModal();를 호출하면 모달이 뜹니다. session에 mem_num과 mem_nick이 있어야합니다.
			-->
			
			
			<!-- Modal -->
				  <div class="modal fade" id="statusModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog">">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				          <h4 class="modal-title" id="myModalLabel"><label style="margin-bottom:0px;">Accompany Status</label></h4>
				        </div>
				        <div class="modal-body" id="statusModal_body" style="max-height:1000px; overflow-y: auto;">

				        </div>
				      </div>
				    </div>
				  </div>
        		<script>
        		function statusModal(){
	       			$.ajax({
	       	            type : "post",
	       	            url : '/pairplan_v1/plan/planStatus',
	       	            success : function(data) {
	       	            	console.log(data);
	       	            	$('#statusModal_body').html("");
	       	            	$('#statusModal_body').append(data);
	       	            	
	       	            	console.log($('#wait_body > div').size());
	       	            	if($('#wait_body > div').size() == 0)
	       	            		$('#wait_body').append("There is no request data.");
	       	            	
	       	            	console.log($('#request_body > div').size());
	       	            	if($('#request_body > div').size() == 0)
	       	            		$('#request_body').append("There is no request data.");
	       	            	
	       	            	$('#statusModal').modal('show');
	       	            },
	       	            error : function(e){
	       	            	alert(e.responseText);
	       	            }
	       	        });
       		    }
        		function deletePlanRequest(plan_num, mem_num){
        			var url = '/pairplan_v1/plan/deletePlanRequest/' + plan_num + '/' + mem_num
        			
        			$.ajax({
        				type : 'get',
        				url : url,
        				success : function(data){
        					alert('동행이 취소되었습니다.');
        					//이 ajax가 필요없을경우 차라리 컨트롤러에서 redirect하는게 좋음
        					statusModal();
        				},
        				error : function(e){
        					alert(e.responseText);
        				}
        			});
        		}
        		function acceptPlanRequest(plan_num, mem_num){
        			var url = '/pairplan_v1/plan/acceptPlanRequest/' + plan_num + '/' + mem_num
        			
        			$.ajax({
        				type : 'get',
        				url : url,
        				success : function(data){
        					alert('요청을 수락했습니다.');
        					//이 ajax가 필요없을경우 차라리 컨트롤러에서 redirect하는게 좋음
        					statusModal();
        				},
        				error : function(e){
        					alert(e.responseText);
        				}
        			});
        		}
        		</script>