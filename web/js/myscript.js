jQuery(function($) {
	
	$('[data-toggle="popover"]').popover();
		
	$("div.holder").jPages({
		containerID: "ssList",
		perPage: 8,
		keyBrowse: true,
		previous: "‹",
		next: "›",
		callback: function (pages, items) {
			if (items.range.start == 0) {
				$("#legend1").html("There are no items here.");
			}
			else {
				$("#legend1").html("Showing " + items.range.start + " - " + items.range.end + " of " + items.count + " items");
			}
		}
	});
	
	$("div.holder").jPages({
		containerID: "announcementList",
		perPage: 5,
		keyBrowse: true,
		previous: "‹",
		next: "›",
		callback: function (pages, items) {
			$("#legend2").html("Showing " + items.range.start + " - " + items.range.end + " of " + items.count + " items");
		}
	});
});