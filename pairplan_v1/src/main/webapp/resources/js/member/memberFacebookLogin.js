// Load the SDK asynchronously
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=414412315594963";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
  	
  	
    // This is called with the results from from FB.getLoginStatus().
    //2. 로그인 되었는지 안되었는지 확인하면서 호출하는 함수(response가 넘어온다.)
    function statusChangeCallback(response) {
      console.log('statusChangeCallback');
      console.log(JSON.stringify(response));
      // The response object is returned with a status field that lets the
      // app know the current login status of the person.
      // Full docs on the response object can be found in the documentation
      // for FB.getLoginStatus().
      // 로그인 되었는지 안되었는지 감지!!!
      if (response.status === 'connected') { //response가 연결되었다~
        // Logged into your app and Facebook.        
        testAPI(); //로그인 되었으면 호출
      } else { //response가 연결안되었다~
        // The person is not logged into your app or we are unable to tell.		
      }
    }

	// This function is called when someone finishes with the Login
	// Button.  See the onlogin handler attached to it in the sample
	// code below.
	// 1. 버튼을 누르면 들어오는 곳.
	function checkLoginState() {
		//로그인 되었는지 안되었는지 확인
	  	FB.getLoginStatus(function(response) {
	    	statusChangeCallback(response); //함수 호출
	  	});
		
		//얘는 로그아웃 할때 쓰는거 일단 그냥 여기 넣어놓음
	  	/* FB.logout(function(response) {
	    	// Person is now logged out
	    }); */
	}
		
	//0. FB.init을 제일 처음 부른답니다..
	window.fbAsyncInit = function() {
		FB.init({
		  appId      : '{414412315594963}',
		  cookie     : true,  // enable cookies to allow the server to access 
		                      // the session
		  xfbml      : true,  // parse social plugins on this page
		  version    : 'v2.8' // use graph api version 2.8
		});
		
		// Now that we've initialized the JavaScript SDK, we call 
		// FB.getLoginStatus().  This function gets the state of the
		// person visiting this page and can return one of three states to
		// the callback you provide.  They can be:
		//
		// 1. Logged into your app ('connected')
		// 2. Logged into Facebook, but not your app ('not_authorized')
		// 3. Not logged into Facebook and can't tell if they are logged into
		//    your app or not.
		//
		// These three cases are handled in the callback function.

		//로그인 상태 확인
   		FB.getLoginStatus(function(response) {
   		  	statusChangeCallback(response);
   		});

    };    

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
    //3. 로그인이 되었으면 호출되는 함수
    function testAPI() {
      console.log('Welcome!  Fetching your information.... ');
      FB.api('/me', function(response) { // /me는 현재 로그인 된 사용자
        console.log('Successful login for:' + response.name);
        console.log(JSON.stringify(response));
      });
    }