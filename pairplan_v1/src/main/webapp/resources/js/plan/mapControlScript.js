// 지도 스크립트---------------------------------------------------------------------------------------------------------------
var container = document.getElementById('map');				// 지도를 표시할 div 
var options = {
	center: new daum.maps.LatLng(37.566826, 126.978657),	// 지도의 중심좌표
	level: 5												// 지도의 확대 레벨
};

var listArray = [];										//지역정보를 저장할 배열 선언
var circleArray = [];									//동그라미를 저장할 배열 선언		
var markerArray = []									//마커를 저장할 배열 선언
var windowArray = [];									//인포윈도우를  저장할 배열 선언

// 지도에 표시할 선을 생성
var polyline = new daum.maps.Polyline({
    strokeWeight: 3, 		// 선의 두께
    strokeColor: '#db4040', // 선의 색
    strokeOpacity: 1, 		// 선의 불투명도
    strokeStyle: 'solid' 	// 선의 스타일
});


var bounds;													// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체

var map = new daum.maps.Map(container, options);			// 지도를 표시할 div와  지도 옵션으로  지도를 생성

var geocoder = new daum.maps.services.Geocoder();			// 주소-좌표 변환 객체를 생성

var marker = new daum.maps.Marker({zIndex:3}), 				// 클릭한 위치를 표시할 마커
infowindow = new daum.maps.InfoWindow({zIndex:3}); 			// 클릭한 위치에 대한 주소를 표시할 인포윈도우

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록
daum.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
        if (status === daum.maps.services.Status.OK) {
                var detailAddr = '<div style="font-size: 12px; width:240px;">지번 주소 : ' + result[0].jibunAddress.name + '</div>';
                
                var content = '<div>' +
                                '<span">여행지 주소</span>' + 
                                detailAddr + 
                            '</div>';

                // 마커를 클릭한 위치에 표시
                marker.setPosition(mouseEvent.latLng);
                marker.setMap(map);

                // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시
                infowindow.setContent(content);
                infowindow.open(map, marker);
                
                $("#locationInfo").hide();
                $("#locationAddr").text("");
                $("#locationAddr").append(result[0].jibunAddress.name); //지역 주소
            }   
        });
    });
    
    function searchDetailAddrFromCoords(coords, callback) {
        // 좌표로 법정동 상세 주소 정보를 요청
        geocoder.coord2detailaddr(coords, callback);
    }
	
    
    function addLocation(){
    	if(!inputValidation())
    		return false
    	
    	//선택한 지역의 정보를 저장할 객체 생성
    	var locationInfo = {
   			location_addr : $("#locationAddr").text(),	//지역의 주소
   			location_title : $("#title").val(),	//장소명
   	    	start_date : $("#start_date").val(),		//시작일
   	    	end_date : $("#end_date").val(),			//종료일
   	    	select_position : marker.getPosition()		//선택한 지역의 좌표값											
   		};	

   		listArray.push(locationInfo);					//배열에 지역 정보 추가
    	printLocation();								//리스트 출력
    	setBounds();									//지도 범위 재설정
    	clear();										//입력값과 마커제거
    }
    
    function inputValidation(){
    	// 입력했는지 검사		
		if ( !($("#locationAddr").text()) || $("#locationAddr").text().trim() == "") {
			falertModal("Please select a location on the map");
			return false;
		}
		// 입력했는지 검사		
		if ( !($("#start_date").val()) || $("#start_date").val().trim() == "") {
			falertModal("Please input date information");
			$('#start_date').focus();
			return false;
		}
		// 입력했는지 검사		
		if ( !($("#end_date").val()) || $("#end_date").val().trim() == "") {
			falertModal("Please input date information");
			$('#end_date').focus();
			return false;
		}
		// 입력했는지 검사		
		if ( !($("#title").val()) || $("#title").val().trim() == "") {
			falertModal("Please input location title");
			$('#title').focus();
			return false;
		}
		
		return true;
    }
    
    //지도 범위 재설정
    function setBounds(){
    	bounds = null;											// bounds 초기화
    	bounds = new daum.maps.LatLngBounds();					// LatLngBounds 객체생성
    	for(var i=0; i< listArray.length; i++){
    		// LatLngBounds 객체에 좌표를 추가
            bounds.extend(listArray[i].select_position);
       	}
    	//선턱한 지역이 1개 이상일 경우
    	if(listArray.length > 1){
    		// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정
            // 이때 지도의 중심좌표와 레벨이 변경
            map.setBounds(bounds);
    	}
    }
    
    //여행 리스트와 지도에 장소를 출력
    function printLocation(){
    	
    	
    	for(var i=0; i < markerArray.length; i++){
    		markerArray[i].setMap(null);	//화면상의 마커 모두 제거
    		circleArray[i].setMap(null);	//화면상의 동그라미 모두 제거
    		windowArray[i].close();			//화면상의 인포 윈도우 모두 제거
    	}
    	markerArray.length = 0;				//배열 초기화
    	circleArray.length = 0;				//배열 초기화
    	windowArray.length = 0;				//배열 초기화
    	polyline.setMap(null);				//화면상의 진선 모두 제거	   	
    	$(".post-excerpt").html("")			//화면상의 여행 목록 모두 제거
    	
    	
        for(var i=0; i < listArray.length; i++){
        	/*var listTag = "<li>";
        	listTag += listArray[i].location_addr + " / ";
        	listTag += listArray[i].location_title  + " / ";
        	listTag += listArray[i].start_date + " / ";
        	listTag += listArray[i].end_date;
        	listTag += "<input type='button' value='삭제' onclick='deleteList(" + i + ")\'></li>"
        	$("#locationList").append(listTag);			//여행 목록 화면에 항목 추가
        	 */
        	
        	var listTag = '<div>';
        	listTag += '<div style="float:right; padding-top: 20px; padding-right: 20px;">';
        	listTag += '<button id="del_btn" type="button" class="close" aria-label="Close" onclick="deleteList(' + i +')"><i class="fa fa-times fa-1x"></i></button>';
        	listTag += '</div>';
        	listTag += '<p class="quote-text">';
        	listTag += '<span class="label-color-red">' + (i+1) + '</span> &nbsp; &nbsp; <i class="fa fa-map-marker"></i> ' + listArray[i].location_addr + ' &nbsp; &nbsp; <i class="fa fa-map-pin"></i> ' + listArray[i].location_title + '<br>';
        	listTag += '<span><i class="fa fa-clock-o"></i> ' + listArray[i].start_date + '</span> ';
        	listTag += '~ <span>' + listArray[i].end_date + '</span>';
        	listTag += '</p>';
        	listTag += '</div>';
        	$(".post-excerpt").append(listTag);			//여행 목록 화면에 항목 추가
        	
        	// 클릭 지점을 표시할 마커
        	var selectMarker = new daum.maps.Marker({			
        		map:map,
        		position: listArray[i].select_position,
        		image: setMarkerImage(i),
        		zIndex: 2
    		});
        	
        	// 마커에 표시할 인포윈도우를 생성합니다 
            var title_infowindow = new daum.maps.InfoWindow({
                content: listArray[i].location_title // 인포윈도우에 표시할 내용
            });
        	
        	// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이
       	    var circleOverlay = new daum.maps.CustomOverlay({
       	    	map:map,
       	    	content: '<span class="dot"></span>',
       	        position: listArray[i].select_position,
       	        zIndex: 1
       	    });
        	
       	 	markerArray.push(selectMarker);				//배열에 마커 추가
       	 	circleArray.push(circleOverlay);			//배열에 동그라미 추가
       	 	windowArray.push(title_infowindow)			//배열에 인포윈도우 추가
       	 	
       	 	
       		// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
       	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
       	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
       	    daum.maps.event.addListener(selectMarker, 'mouseover', makeOverListener(map, selectMarker, title_infowindow));
       	    daum.maps.event.addListener(selectMarker, 'mouseout', makeOutListener(title_infowindow));
        }
    	
    	//선턱한 지역이 1개 이상일 경우
    	if(listArray.length > 1){
    		drawline();				// 경로를 설정
    	}
    }
    
 	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    function makeOverListener(map, marker, infowindow) {
        return function() {
            infowindow.open(map, marker);
        };
    }

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    function makeOutListener(infowindow) {
        return function() {
            infowindow.close();
        };
    }
    
    function setMarkerImage(index){
    	// 마커 이미지의 주소
		var markerImageUrl = 'http://localhost:8181/pairplan_v1/resources/images/map/marker_normal.png',
		    markerImageSize = new daum.maps.Size(33, 44), // 마커 이미지의 크기
		    markerImageOptions = { 
		        spriteOrigin : new daum.maps.Point(139, 10 + index * 46), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		        spriteSize : new daum.maps.Size(644, 946), // 스프라이트 이미지의 전체 크기 
		        offset : new daum.maps.Point(12, 38)// 마커 좌표에 일치시킬 이미지 안의 좌표
		};
    	
		// 마커 이미지를 생성한다
		var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
		
		return markerImage;
    }
    
    //선택한 지역에 경로를 설정
    function drawline(){
    	
   		var linePath = [];
   		for(var i=0; i< listArray.length; i++){
       		linePath.push(listArray[i].select_position);
       	}
   		polyline.setPath(linePath)
   		polyline.setMap(map);
   	}
    
    //입력폼과 지도상의 선택된 핀을 초기화
    function clear(){
    	$("#locationInfo").show();
    	$("#locationAddr").text("");
    	$("#title").val("");
    	$("#start_date").val("");
    	$("#end_date").val("");
    	marker.setMap(null);
    	infowindow.close();
    }
	
    //삭제 버튼을 누르면 리스트 배열에서 삭제
    function deleteList(index){
    	listArray.splice(index, 1);						//배열에서 리스트 제거
    	printLocation();							//화면 다시 출력
    }
	
    //입력한 주소로 지도를 이동
	function move(){
		var location = $("#inputAddress").val();
		geocoder.addr2coord(location, function(status, result) {					// 주소로 좌표를 검색합니다
		     if (status === daum.maps.services.Status.OK) {										// 정상적으로 검색이 완료됐으면 
		        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
		        console.log(result);
		        map.setCenter(coords);															// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		    } 
		});
	}
    
	// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수
	function setMapType(maptype) { 
	    var roadmapControl = document.getElementById('btnRoadmap');
	    var skyviewControl = document.getElementById('btnSkyview'); 
	    if (maptype === 'roadmap') {
	        map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);    
	        roadmapControl.className = 'selected_btn';
	        skyviewControl.className = 'non_btn';
	    } else {
	        map.setMapTypeId(daum.maps.MapTypeId.HYBRID);    
	        skyviewControl.className = 'selected_btn';
	        roadmapControl.className = 'non_btn';
	    }
	}