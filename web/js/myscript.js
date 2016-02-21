jQuery(function($) {
	
	//Seminars and Sessions Popover
	var originalLeave = $.fn.popover.Constructor.prototype.leave;
	$.fn.popover.Constructor.prototype.leave = function(obj){
		var self = obj instanceof this.constructor ?
				obj : $(obj.currentTarget)[this.type](this.getDelegateOptions()).data('bs.' + this.type)
				var container, timeout;

		originalLeave.call(this, obj);

		if(obj.currentTarget) {
			container = $(obj.currentTarget).siblings('.popover')
			timeout = self.timeout;
			container.one('mouseenter', function(){
				clearTimeout(timeout);
				container.one('mouseleave', function(){
					$.fn.popover.Constructor.prototype.leave.call(self, self);
				});
			})
		}
	};


	$('body').popover({
		selector: '[data-popover]',
		trigger: 'click hover',
		placement: 'auto',
		delay: {show: 50, hide: 400}
	});

	
	//Announcements Pagination
	//Credits go to: http://www.bootply.com/66815
	
	var listElement = $('#announcementList');
	var perPage = 3; 
	var numItems = listElement.children().size();
	var numPages = Math.ceil(numItems/perPage);

	$('.pager').data("curr",0);

	var curr = 0;
	
	
	while(numPages > curr){
		$('<li><a href="#" class="page_link">'+(curr+1)+'</a></li>').appendTo('.pager');
		curr++;
	}
	$('.pager .page_link:first').addClass('active');

	listElement.children().css('display', 'none');
	listElement.children().slice(0, perPage).css('display', 'block');

	$('.pager li a').click(function(){
	  var clickedPage = $(this).html().valueOf() - 1;
	  goTo(clickedPage,perPage);
	});

	function previous(){
	  var goToPage = parseInt($('.pager').data("curr")) - 1;
	  if($('.active').prev('.page_link').length==true){
	    goTo(goToPage);
	  }
	}

	function next(){
	  goToPage = parseInt($('.pager').data("curr")) + 1;
	  if($('.active_page').next('.page_link').length==true){
	    goTo(goToPage);
	  }
	}

	function goTo(page){
	  var startAt = page * perPage,
	    endOn = startAt + perPage;
	  
	  listElement.children().css('display','none').slice(startAt, endOn).css('display','block');
	  $('.pager').attr("curr",page);
	}
	
	
	
	//Pagination
	var listElement = $('#announcementList');
	var perPage = 3;
	var numItems = listElement.children().size();
	var numPages = Math.ceil(numItems/perPage);
	
    $('#page-selection').bootpag({
    	 total: numPages,
    	 page: 1,
    	 maxVisible: 5,
    	 leaps: true,
    	 firstLastUse: true,
    	 first: '←',
    	 last: '→',
    	 wrapClass: 'pagination',
    	 activeClass: 'active',
    	 disabledClass: 'disabled',
    	 nextClass: 'next',
    	 prevClass: 'prev',
    	 lastClass: 'last',
    	 firstClass: 'first'
    }).on("page", function(event, num){
        listElement.children().css('display', 'none');
     	listElement.children().slice(0, perPage).css('display', 'block');
     	
     	
    });
});