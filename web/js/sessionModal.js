function checkSelect(dataID){
	if($("#" + dataID + " #session_venue").val() == "--"){
		alert("Please select a valid venue");
		return false;	
	}

	if($("#" + dataID + " #session_speaker").val() == "--"){
		alert("Please select a valid speaker");
		return false;	
	}

	var timeIn = new Date(Date.parse('2000/01/01 ' + $('#' + dataID + ' #sessionTimeIn').val()));
	var timeOut = new Date(Date.parse('2000/01/01 ' + $('#' + dataID + ' #sessionTimeOut').val()));

	
	if(timeIn <= new Date(Date.parse('2000/01/01 ' + "5:59 AM"))){
		alert("Time In cannot be earlier than 6:00 am");
		$('#' + dataID + ' #sessionTimeIn').val("6:00 AM");
		return false;
	}

	if(timeIn >= timeOut){
		alert("Time Out cannot be earlier or same as the Time In");
		return false;
	}

		return true;	
	
}