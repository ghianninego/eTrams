var count = 1;
var id = 1;

$(document).ready(function() {
			LoadMyJs('js/bootstrap/bootstrap-formhelpers-min.js');
});

function addDate(){
	if(count < 31){
		count = count + 1;		
		
		var dateHTML = '';	
		dateHTML = dateHTML.concat('<div id="group_' + count + '">');
		dateHTML = dateHTML.concat('<div class="col-sm-2">');

		dateHTML = dateHTML.concat('<label class="control-label">Day ' + count + '</label>');
		dateHTML = dateHTML.concat('</div>');
		dateHTML = dateHTML.concat('<div class="col-sm-10">');
		dateHTML = dateHTML.concat('<div class="bfh-datepicker" data-min="today" date-close="false" id="seminar_date_' + count + '" data-name="seminar_date_' + count + '"></div>');
		dateHTML = dateHTML.concat('</div></div>');



                                    
		$('.dateList').append(dateHTML);
	
		LoadMyJs('js/bootstrap/bootstrap-formhelpers-min.js');

	}else{
		alert("Maximum date entry is 31");
	}
	return false;
}

function removeDate(){	
	if(count != 1){
		$('#group_' + count).remove();
		count = count - 1;

	}	
	return false;
}


function LoadMyJs(scriptName) {
	var docHeadObj = document.getElementsByTagName("head")[0];
	var dynamicScript = document.createElement("script");
	dynamicScript.type = "text/javascript";
	dynamicScript.src = scriptName;
	docHeadObj.appendChild(dynamicScript);
}
