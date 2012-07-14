window.fbAsyncInit = function() {
  FB.init({
    appId      : '436449876400154', // App ID
	channelUrl : '//www.oxynum.fr/channel.html', // Channel File
	status     : true, // check login status
	cookie     : true, // enable cookies to allow the server to access the session
	xfbml      : true  // parse XFBML
  });
  // Additional initialization code here
};
// Load the SDK Asynchronously
(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/fr_FR/all.js#xfbml=1&appId=436449876400154";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));