$(document).ready(function() {	
		
	myvar = document.getElementById("noticeParam").value;

	//alert(myvar);
	
	switch(myvar){
	case "1":
		document.getElementById("loginNotice").innerHTML = "<p class='bg-warning noticePanel text-center'>" +
		"<br />You must login to continue! <span class='glyphicon glyphicon-alert'></span></p>";
		break;
	case "2":
		document.getElementById("loginNotice").innerHTML = "<p class='bg-warning noticePanel text-center'>" +
		"<br />Invalid Username/Password! <span class='glyphicon glyphicon-alert'></span></p>";
		break;
		default:
			break;
	}
	

});