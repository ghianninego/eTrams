function checkSelect(){
	if($("#session_venue").val() == "--"){
		alert("Please select a valid venue");
		return false;	
	}else if($("#session_speaker").val() == "--"){
		alert("Please select a valid speaker");
		return false;	
	}else{
		return true;	
	}
}