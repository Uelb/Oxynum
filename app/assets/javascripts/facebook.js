  window.fbAsyncInit = function() {
    FB.init({
      appId      : 'YOUR_APP_ID', // App ID
      channelUrl : '//WWW.YOUR_DOMAIN.COM/channel.html', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true  // parse XFBML
    });

    // Additional initialization code here
	FB.getLoginStatus(function(response)
			{
				if(response.status == 'connected')
				{
					FB.api('/me', function(response)
					{
						$('#user_fb_first_name').attr('value',response.first_name);
						$('#user_fb_last_name').attr('value',response.last_name);
						$('#user_location').attr('value',response.location.name);
						$('#user_fb_id').attr('value',response.id);
						$('#user_fb_status').attr('value',response.quotes);
						$('.fb-login-button').hide();
						if(response.gender == "male"){
							$('#user_gender_true').attr('checked', 'checked');
						}
						else{
							$("#user_gender_false").attr('checked', 'checked');
						}
					});
				}
			});
  };

  // Load the SDK Asynchronously
  (function(d){
     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/en_US/all.js";
     ref.parentNode.insertBefore(js, ref);
   }(document));
