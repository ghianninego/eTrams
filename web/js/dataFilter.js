

$(document).ready(function () {
	
	$('#fltrbtn').text('SELECT ALL FROM THIS COLLEGE ONLY');
	
	var pname = $('#pNames').map(function(i) {
	    return [$.map($(this).data(), function(v) {
	        return v;
	    })];
	});
    filterNames(pname);

});

function refilter(){
	var pname = $('#pNames').map(function(i) {
	    return [$.map($(this).data(), function(v) {
	        return v;
	    })];
	});
    filterNames(pname);
}

function filterNames(pname){
	    /*$('#pvalues').filter(function(){
	    	return $('#pvalues').data('pname') === pname.get();
	    }).remove();*/
	
		$('tr[id="pvalues"]').each(function(){
			for(var i=0;i<pname.length;i++){

			if($(this).data('pname') == pname[i]){
				$(this).remove();
			}
			}
		});	
	 
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

}