var count = 1;
var id = 1;

 var participants;

$(document).ready(function() {		
	   	 
	 participants = new Array();
	 
	     $('select option').each(function() {
            //participants.push($(this).val());
	    	 participants.push($(this).text());
        });
	 
		reloadParticipants(1);

});

function reloadParticipants(id) {
	$( "#participant_" + id ).autocomplete({
		source: participants
	});
}

function addParticipant(){
	if(count < 50){
	count = count + 1;		
		
	id = id + 1;
		var cloneTag = $('#participantGroup_1').clone().appendTo('.participantList');
		cloneTag = cloneTag.attr("id","participantGroup_" + id);
		cloneTag.find('.form-control').attr('id', 'participant_' + id);
		cloneTag.find('#participant_' + id).val('');
		cloneTag.find('.glyphicon-plus').remove();
		cloneTag.find('.control-label').text('Participant ' + count);
		$('#participantLabel').text('Participants (' + count +')');
		
		$('#participantGroup_'  + id + ' .input-group-addon').append('<button type="button" onclick="return removeParticipant(\''+ id + '\')" class="glyphicon glyphicon-remove"></button></div>');
		reloadParticipants(id);
	}else{
		alert("Maximum temporary participant entry is 50");
	}
	return false;
}

function removeParticipant(id){	
	if(count != 1){
		$('#participantGroup_' + id).remove();
		count = count - 1;
		
		var names = 2;
		var labels = $('.participantList').find('.control-label').toArray();
		for ( var i = 1; i < labels.length; i++ ) {
			labels[i].innerHTML = 'Participant ' + names++;
  		}
		$('#participantLabel').text('Participants (' + count +')');

	}	
	return false;
}

