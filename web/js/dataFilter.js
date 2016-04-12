

$(document).ready(function () {
	
	$('#fltrbtn').text('SELECT ALL FROM THIS COLLEGE ONLY');
	
	var pname = $('#pName tr').map(function(i) {
	    return [$.map($(this).data(), function(v) {
	        return v;
	    })];
	});

    filterNames(pname);

});

function filterNames(pname){
	alert(pname.length);
	for(var i = 0;i<pname.length;i++){
		rex = pname[i];
	    $('#pvalues').filter(function(){
	    	alert($(this).data('pname') + " " + rex);
	    	return $(this).data('pname') == rex;
	    }).remove();
	    
	}
    
}



function filter(){
	var rex;
    if($('#fltrbtn').data('state') == '1'){
    	$('#fltrbtn').text('SELECT ALL FROM YOUR COLLEGE');
    	rex = new RegExp($('').val());
    	$('#fltrbtn').data('state', '0');
    }else{
    	$('#fltrbtn').text('SELECT FROM ALL COLLEGES');
    	rex = new RegExp($('#dataSelector').data('college'));
    	$('#fltrbtn').data('state', '1');
    }
    
    $('#dataSelector tr').hide();
    $('#dataSelector tr').filter(function () {
        return rex.test($(this).data('colaf'));
    }).show();

    var pname = $('#pName').map(function(i) {
	    return [$.map($(this).data(), function(v) {
	        return v;
	    })];
	});

    
    filterNames(pname);
}