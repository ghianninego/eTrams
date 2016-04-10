
    <%@ page import="eTrams.model.EventBean, java.util.ArrayList " %>

  <!-- TO JESSIE:
  
  		I AM SO SORRY
  		DON'T TOUCH THIS ANYMORE WITHOUT MY CONSENT
  		BAKA MAY MANGYARI
  
  		HAYAAN MO NA
  
  		from your QA,
  		The Perfect One <3
  		
   -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">		


<script type="text/javascript">

$(document).ready(function() {
	
	<%ArrayList<EventBean> eBean = (ArrayList<EventBean>)session.getAttribute("eventsList"); %>

	
	$('#calendar').fullCalendar({
	dayRender: function (date, cell) {
        cell.css("background-color", "white");
    },
    minTime: 7,
    theme:false,
    allDaySlot:false,
    weekMode:'liquid',
	timeFormat: 'h:mm',
	header: {
        left: 'month, agendaWeek, agendaDay',
        center: 'title',
        right: 'prev, next today'
    },
    
	events: [
	 		<%for(int i=0; i<eBean.size() ; i++){ %>
	 		<%if(i==eBean.size()-1){%>
        	{
        		id: <%=eBean.get(i).getSessionID()%> ,
              title: ' <%=eBean.get(i).getSessionName()%> ',
              <%String temp1 = eBean.get(i).getDate() + " " +  eBean.get(i).getStartTime();%>
              start: new Date("<%=temp1%>"),
              <%String temp2 = eBean.get(i).getDate() + " " +  eBean.get(i).getEndTime();%>
              end: new Date("<%=temp2%>"),
              allDay: false,
              seminar: ' <%=eBean.get(i).getSeminarName()%> ',
              startTime: ' <%=TimeDateConverterClass.convertTime(eBean.get(i).getStartTime())%> ',
              endTime: ' <%=TimeDateConverterClass.convertTime(eBean.get(i).getEndTime())%> ',
              capacity: ' <%=eBean.get(i).getCapacity()%> ',
              venue: ' <%=eBean.get(i).getVenueName()%> ',
              venueRemarks: ' <%=eBean.get(i).getVenueRemarks()%> ',
              speaker: ' <%=eBean.get(i).getSpeakerName()%> ',
              status:
            	  <%if(eBean.get(i).getCompletion() == 1){%>'Completed'
            	  <%} else if(eBean.get(i).getCompletion() == 0){%>'Ongoing'<%}%>,
              color: 
            	  <%if(eBean.get(i).getCompletion() == 1){%>'#0489B1'
            	  <%} else if(eBean.get(i).getCompletion() == 0){%>'#5FB404'<%}%>
            	  
          	}
        <%}else{%>
        {
        	id: <%=eBean.get(i).getSessionID()%> ,
            title: ' <%=eBean.get(i).getSessionName()%> ',
            <%String temp1 = eBean.get(i).getDate() + " " +  eBean.get(i).getStartTime();%>
            start: new Date("<%=temp1%>"),
            <%String temp2 = eBean.get(i).getDate() + " " +  eBean.get(i).getEndTime();%>
            end: new Date("<%=temp2%>"),
            allDay: false,
            seminar: ' <%=eBean.get(i).getSeminarName()%> ',
            startTime: ' <%=TimeDateConverterClass.convertTime(eBean.get(i).getStartTime())%> ',
            endTime: ' <%=TimeDateConverterClass.convertTime(eBean.get(i).getEndTime())%> ',
            capacity: ' <%=eBean.get(i).getCapacity()%> ',
            venue: ' <%=eBean.get(i).getVenueName()%> ',
            venueRemarks: ' <%=eBean.get(i).getVenueRemarks()%> ',
            speaker: ' <%=eBean.get(i).getSpeakerName()%> ',
            status:
            	<%if(eBean.get(i).getCompletion() == 1){%>'Completed'
        	  	<%} else if(eBean.get(i).getCompletion() == 0){%>'Ongoing'<%}%>,
            color:
            	<%if(eBean.get(i).getCompletion() == 1){%>'#0489B1'
            	<%} else if(eBean.get(i).getCompletion() == 0){%>'#5FB404'<%}%>
          	  
        	},
	            <%}}%>
	            
	          ],
	          
	          eventMouseover: function(calEvent, jsEvent) {
	        	    var tooltip = '<div class="tooltipevent" ' + 
	        	    	'style="min-height:150px;padding:12px;background:rgba(225, 225, 225, 0.8);'
	        	    	+ 'position:absolute;z-index:10001;">'
	        	    			
	        	    +'<b>Seminar Name:</b> ' + calEvent.seminar + '<br>'
	        	    +'<b> Session Name:</b> ' + calEvent.title + '<br>'
	        	    		+'<b>Speaker:</b> ' +  calEvent.speaker + '<br>'
	        	    		+'<b>Venue:</b> ' +  calEvent.venue + ': ' +  calEvent.venueRemarks + '<br>'
	        	    		+'<b>Capacity:</b> ' +  calEvent.capacity + '<br>'
	        	    		+'<b>Time:</b> ' +  calEvent.startTime + ' <b>to</b> '
	        	    		+  calEvent.endTime + '<br>'
	        	    		+'<b>Status:</b> ' +  calEvent.status + '<br>'
	        	    		+'</div>';
	        	    $("body").append(tooltip);
	        	    $(this).mouseover(function(e) {
	        	        $(this).css('z-index', 10000);
	        	        $('.tooltipevent').fadeIn('500');
	        	        $('.tooltipevent').fadeTo('10', 1.9);
	        	    }).mousemove(function(e) {
	        	        $('.tooltipevent').css('top', e.pageY + 10);
	        	        $('.tooltipevent').css('left', e.pageX + 20);
	        	    });
	        	},

	        	eventMouseout: function(calEvent, jsEvent) {
	        	    $(this).css('z-index', 8);
	        	    $('.tooltipevent').remove();
	        	}
	          
	});
});
// $("select option").filter(function() {
//     //may want to use $.trim in here
//     return $(this).text() == text; 
// }).prop('selected', true);
// });
</script>
</head>
<body>

<div id="calendar"></div>

	

</body>
</html>