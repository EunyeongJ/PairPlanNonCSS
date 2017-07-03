<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- Use age -->
	<!-- 
		falertmodal(msg);를 호출하면 실패 모달이 뜹니다. msg에 메시지를 넣으세요. 
		salertmodal(msg);를 호출하면 성공 모달이 뜹니다. msg에 메시지를 넣으세요. 
	-->

<!-- Modal -->
  <div class="modal fade" id="falertmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header"  style="border-bottom:0px;">
      </div>
        <div class="modal-body" style="padding:0px;">
          <div>
             <p class="text-center"><i class="fa fa-exclamation-circle fa-3x" aria-hidden="true"></i> &nbsp; <span id="falert_msg"style="font-size:16px;"></span></p>
          </div>
        </div>
        <div class="modal-footer" style="border-top:0px; padding-top:0px;">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal -->
  <div class="modal fade" id="salertmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header"  style="border-bottom:0px;">
      </div>
        <div class="modal-body" style="padding:0px;">
          <div>
             <p class="text-center"><i class="fa fa-check-circle fa-3x" aria-hidden="true"></i> &nbsp; <span id="salert_msg"style="font-size:16px;"></span></p>
          </div>
        </div>
        <div class="modal-footer" style="border-top:0px; padding-top:0px;">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <script>
    function falertModal(msg){
        $('#falert_msg').text("");
        $('#falert_msg').text(msg);
        $('#falertmodal').modal('show');
    }

    function salertModal(msg){
        $('#salert_msg').text("");
        $('#salert_msg').text(msg);
        $('#salertmodal').modal('show');
    }
    </script>