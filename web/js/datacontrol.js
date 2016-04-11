function sort(dir) {
	var rows = $('#ssList #datavalues').get();

	var dirVal = $("#"+ dir ).val();
	var tags = returnTags(dirVal);
	
	rows.sort(function(a, b) {

		var A = $(a).children(tags).eq(0).text().toUpperCase();
		var B = $(b).children(tags).eq(0).text().toUpperCase();
		
		if (A < B) {
			return returnvals(dirVal, 0);
		}

		if (A > B) {
			return returnvals(dirVal, 1);

		}

		return 0;

	});

	$.each(rows, function(index, row) {
		$('#ssList').append(row);
	});
}

function returnvals(dir, dx){
	switch(dir){
	case "AlphabeticalAsc":
	case "DateAsc":
		if(dx == 0){
			return -1;
		}else{
			return 1;
		}
		break;
	case "DateDesc":
	case "AlphabeticalDesc":
		if(dx == 0){
			return 1;
		}else{
			return -1;
		}
		break;
	default:
		return 0;
	}
}

function returnTags(dir){
	switch(dir){
		case "AlphabeticalAsc":
		case "AlphabeticalDesc":
			return "#alpha";
			break;
		case "DateAsc":
		case "DateDesc":
			return "#date";
			break;
		default:
			return "#alpha";
	}
}
/*
var $rows = $('#ssList #datavalues');
$('#filterDataBtn').click(function() {
	    var val = $.trim($('#filterData').val()).replace(/ +/g, ' ').toLowerCase();
	    if(val == "all"){
	    	val = "";
	    }
	    $rows.show().filter(function() {
	        var text = $('#status').text().replace(/\s+/g, ' ').toLowerCase();
	        return !~text.indexOf(val);
	    }).hide();
<<<<<<< HEAD
	});*/

$(document).ready(function () {

    (function ($) {

        $('#filterDataBtn').click(function () {

        	
            var rex;
            if($('#filterData').val() == "All"){
            	rex = new RegExp($('').val());
            }else{
            	rex = new RegExp($('#filterData').val().toUpperCase());
            }
            
            $('#ssList #datavalues').hide();
            $('#ssList #datavalues').filter(function () {
                return rex.test($(this).text());
            }).show();

        })

    }(jQuery));

});
