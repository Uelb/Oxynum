  window.fbAsyncInit = function() {
    FB.init({
      appId      : '436449876400154', // App ID
      channelUrl : '//www.oxynum.fr/channel.html', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true  // parse XFBML
    });
    // Additional initialization code here
	FB.getLoginStatus(function(response)
		{
			if(response.status == "connected")
			{
				$(document).ready(function() {
					FB.api('/me', function(user)
							{
								$('#user_username').attr('value', user.username);
								$('#user_fb_first_name').attr('value',user.first_name);
								$('#user_fb_last_name').attr('value',user.last_name);
								$('#user_location').attr('value',user.location.name);
								$('#user_fb_id').attr('value',user.id);
								$('#user_fb_status').attr('value',user.quotes);
								$('#user_email').attr('value',user.email);
								$('#birthday').attr('value', user.birthday);
								$('.fb-login-button').hide();
								if(user.gender == "male"){
									$('#user_gender_true').attr('checked', 'checked');
								}
								else{
									$("#user_gender_false").attr('checked', 'checked');
									}
							});
				})
			}
		});
  };

  // Load the SDK Asynchronously
  (function(d){
     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/fr_FR/all.js";
     ref.parentNode.insertBefore(js, ref);
   }(document));
