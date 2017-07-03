	// 지도 스크립트 ------------------------------------------------------------------------------------
	if($('#map').length > 0){
		var container = document.getElementById('map');				// 지도를 표시할 div 
		var options = {
			center: new daum.maps.LatLng(37.566826, 126.978657),	// 지도의 중심좌표
			level: 5												// 지도의 확대 레벨
		};
		var totalList = [];
		var circleArray = [];									//동그라미를 저장할 배열 선언		
		var markerArray = []									//마커를 저장할 배열 선언
		var windowArray = [];									//인포윈도우를  저장할 배열 선언
		var templist = [];
		
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
		
		   //지도 범위 재설정
		   function setBounds(index){
		   	bounds = null;											// bounds 초기화
		   	bounds = new daum.maps.LatLngBounds();					// LatLngBounds 객체생성
		   	
		   	var templist = totalList[index];
		   	for(var i=0; i< templist.length; i++){
		   		// LatLngBounds 객체에 좌표를 추가
		           bounds.extend(templist[i].select_position);
		      	}
		   
		   		// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정
	           // 이때 지도의 중심좌표와 레벨이 변경
	           map.setBounds(bounds);
		   }
		   
		   //여행 리스트와 지도에 장소를 출력
		   function printLocation(index){
		   	
		   	var templist = totalList[index];
		   	for(var i=0; i < markerArray.length; i++){
		   		markerArray[i].setMap(null);	//화면상의 마커 모두 제거
		   		circleArray[i].setMap(null);	//화면상의 동그라미 모두 제거
		   		windowArray[i].close();			//화면상의 인포 윈도우 모두 제거
		   	}
		   	markerArray.length = 0;				//배열 초기화
		   	circleArray.length = 0;				//배열 초기화
		   	windowArray.length = 0;				//배열 초기화
		   	polyline.setMap(null);				//화면상의 진선 모두 제거	   	
		   	$("#locationList").html("")			//화면상의 여행 목록 모두 제거
		   	
		   	
		       for(var i=0; i < templist.length; i++){
		       	var listTag = "<li>";
		       	listTag += templist[i].location_addr + " / ";
		       	listTag += templist[i].location_description  + " / ";
		       	listTag += templist[i].start_date + " / ";
		       	listTag += templist[i].end_date;
		       	listTag += "<input type='button' value='삭제' onclick='deleteList(" + i + ")\'></li>"
		       	$("#locationList").append(listTag);			//여행 목록 화면에 항목 추가
		       	
		       	// 클릭 지점을 표시할 마커
		       	var selectMarker = new daum.maps.Marker({			
		       		map:map,
		       		position: templist[i].select_position,
		       		image: setMarkerImage(i),
		       		zIndex: 2
		   		});
		       	
		       	// 마커에 표시할 인포윈도우를 생성합니다 
		           var title_infowindow = new daum.maps.InfoWindow({
		               content: templist[i].location_description // 인포윈도우에 표시할 내용
		           });
		       	
		       	// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이
		      	    var circleOverlay = new daum.maps.CustomOverlay({
		      	    	map:map,
		      	    	content: '<span class="dot"></span>',
		      	        position: templist[i].select_position,
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
		   	if(templist.length > 1){
		   		drawline(index);				// 경로를 설정
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
			var markerImageUrl = 'http://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_normal.png', 
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
		   function drawline(index){
		   	var templist = totalList[index];
		  		var linePath = [];
		  		for(var i=0; i< templist.length; i++){
		      		linePath.push(templist[i].select_position);
		      	}
		  		polyline.setPath(linePath)
		  		polyline.setMap(map);
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
	}