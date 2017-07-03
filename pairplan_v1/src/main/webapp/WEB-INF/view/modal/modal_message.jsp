<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- Use age -->
	<!-- 
		1. messageBoxModal();를 호출하면 쪽지함 모달이 뜹니다. 반드시 session에 mem_num이 있어야합니다.
		2. sendMessageModal(받는 사람 mem_num, 받는 사람 mem_nick); 를 호출하면 메시지 보내기 모달이 뜹니다. session필요! 
	-->

	<!-- Modal -->
	  <div class="modal fade" id="messageBoxModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	          <h4 class="modal-title" id="myModalLabel"><label style="margin-bottom:0px;">Message Box</label></h4>
	        </div>
	        <div class="modal-body" id="msgModal_body" style="max-height:600px; overflow-y: auto;">
	          
	        </div>
	      </div>
	    </div>
	  </div>
	  <!-- Modal -->
	  <div class="modal fade" id="sendMessagModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	          <h4 class="modal-title" id="myModalLabel"><label style="margin-bottom:0px;">Send Message</label></h4>
	        </div>
	        <div class="modal-body" style="max-height:600px; overflow-y: auto;">
	
	          <div style="padding: 0 30px;">
	            <i class="fa fa-user" aria-hidden="true"></i> <span id="rcv_mem_nick">happy</span>
	          </div>
	          <div class="input-group" style="padding: 10px 20px;">
	            <input id="inputMessage" type="text" class="form-control" placeholder="Search for...">
	            <input id="rcv_mem_num" type="hidden" value="">
	            <input id="snd_mem_num" type="hidden" value="">
	            <span class="input-group-btn">
	              <button class="btn btn-default" type="button" style="height:44px; width:60px; background-color:#eeeeee" onclick="sendMessage();">
	              	<i class="fa fa-paper-plane fa-2x" aria-hidden="true"></i>
	              </button>
	            </span>
	          </div><!-- /input-group -->
	        </div>
	      </div>
	    </div>
	  </div>
	  <script>
		function messageBoxModal(){
			$.ajax({
	            type : "post",
	            url : '/pairplan_v1/member/msg_list',
	            success : function(data) {
	            	console.log(data);
	            	$('#msgModal_body').html("");
	            	$('#msgModal_body').append(data);
	            	
	            	if($('#msgModal_body > div').size() == 0)
	            		$('#msgModal_body').append("There is no message data.");
	            	
	            	$('#messageBoxModal').modal('show');
	            },
	            error : function(e){
	            	alert(e.responseText);
	            }
	        });
	    }
		
		function sendMessage_Onmodal(msg_snd, msg_rcv, rcv_nick){
				
			if(msg_snd == "" || msg_snd==null){
				falertModal('로그인을 해 주세요.');
				return false;
			}
			
		      $('#messageBoxModal').modal('hide');
		      //0.5초 여유주기
		      setTimeout(function(){
		    	$('#rcv_mem_nick').text(rcv_nick);		//받는 회원 별명 지정
		  		$('#rcv_mem_num').val(msg_rcv);			//hidden에 받는 회원 번호 지정
		  		$('#snd_mem_num').val(msg_snd);			//hidden에 회원 번호 지정
		      $('#sendMessagModal').modal('show');
		    }, 500);
		}
		
		function sendMessage_OnStatus(msg_snd, msg_rcv, rcv_nick){
			if(msg_snd == "" || msg_snd==null){
				falertModal('로그인을 해 주세요.');
				return false;
			}
			
		      $('#statusModal').modal('hide');
		      //0.5초 여유주기
		      setTimeout(function(){
		    	$('#rcv_mem_nick').text(rcv_nick);		//받는 회원 별명 지정
		  		$('#rcv_mem_num').val(msg_rcv);			//hidden에 받는 회원 번호 지정
		  		$('#snd_mem_num').val(msg_snd);			//hidden에 회원 번호 지정
		      $('#sendMessagModal').modal('show');
		    }, 500);
		}
		
		function sendMessageModal(mem_num, mem_nick){
			
			
			var session_mem_num = "";
			<c:if test="${sessionScope.session_mem_num ne null}">
				session_mem_num = ${sessionScope.session_mem_num};
			</c:if>
			
			if(session_mem_num == ""){
				falertModal('로그인을 해 주세요.');
				return false;
			}
			
			console.log(mem_num);
			console.log(session_mem_num);
			
			if(session_mem_num == mem_num){
				falertModal("본인에게는 쪽지를 보낼 수 없습니다.");
				return false;
			}
			
			$('#rcv_mem_nick').text(mem_nick);	//받는 회원 별명 지정
			$('#rcv_mem_num').val(mem_num);		//hidden에 받는 회원 번호 지정
			$('#snd_mem_num').val(session_mem_num);		//hidden에 회원 번호 지정
		    $('#sendMessagModal').modal('show');
			
		}
		
		function sendMessage(){
			var msg_cont = $('#inputMessage').val();	//메시지 내용
			var msg_rcv = $('#rcv_mem_num').val();	//메시지 받는사람
			var msg_snd = $('#snd_mem_num').val();		//메시지 보내는 사람
			
			console.log($('#inputMessage').val());
			console.log($('#rcv_mem_num').val());
			console.log($('#snd_mem_num').val());
			
			$.ajax({
	            type : "post",
	            data : {"msg_cont" : msg_cont, "msg_rcv" : msg_rcv, "msg_snd" : msg_snd},
	            url : '/pairplan_v1/member/msg_send',
	            success : function(data) {
	            	$('#sendMessagModal').modal('hide');
	            },
	            error : function(e){
	            	alert(e.responseText);
	            }
	        });
		}
		
		function deleteMessage(msg_num){
			var url = '/pairplan_v1/member/msg_delete/' + msg_num;
			
			$.ajax({
				type : 'get',
				url : url,
				success : function(data){
					alert('메시지가 삭제 되었습니다.');
					//이 ajax가 필요없을경우 차라리 컨트롤러에서 redirect하는게 좋음
					messageBoxModal();
				},
				error : function(e){
					alert(e.responseText);
				}
			});
		}
		</script>
