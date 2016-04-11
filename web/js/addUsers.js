$('#college').change(function() {
	$('#department').prop('disabled', false);
	if($(this).data('options') == undefined){
		$(this).data('options', $('#department option').clone());
	}
	
	var id = $(this).val();
	var options = $(this).data('options').filter('[id=' + id + ']');
	
	$('#department').html(options);
});