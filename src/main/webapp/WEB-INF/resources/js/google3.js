var auth2;
var googleAuth;
var googleUser;

var initClient = function() {
    gapi.load('auth2', function(){
        
        auth2 = gapi.auth2.init({
            client_id: '65257694703-upl97b2f58a3spn0ts8opmtefbkbgnkd.apps.googleusercontent.com'
        });

        
        
    });
};

function onSignIn(googleUser) {
	var id_token  = googleUser.getAuthResponse().id_token;
	googleAuth = gapi.auth2.getAuthInstance();
	googleAuth.signOut();
	if (googleAuth.isSignedIn.get()) {
		
		
		var form = document.createElement("form");
		form.setAttribute("action", "Template");
		form.setAttribute("method", "POST");

		var inputId = document.createElement("input");
		inputId.setAttribute("type", "hidden");
		inputId.setAttribute("name", "idToken");
		inputId.setAttribute("value", id_token);
		form.appendChild(inputId);
		document.getElementById("test").appendChild(form);
		form.submit();
		googleUser.disconnect();
	}
}
	function signOut() {
        
		gapi.auth2.getAuthInstance().signOut();
		
//       auth2.signOut();
//        googleAuth.signOut();
	}