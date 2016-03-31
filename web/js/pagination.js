jQuery(function($) {
	$("div.holder").jPages({
		containerID: "announcementList",
		perPage: 5,
		keyBrowse: true,
		first: "«",
		previous: "‹",
		next: "›",
		last: "»",
		callback: function (pages, items) {
			$("#legend1").html(items.range.start + " - " + items.range.end + " of " + items.count);
		}
	});
	
	
	$("div.holder").jPages({
		containerID: "someTable",
		perPage: 10,
		first: "«",
		previous: "‹",
		next: "›",
		last: "»",
		callback: function (pages, items) {
			$("#legend1").html(items.range.start + " - " + items.range.end + " of " + items.count);
		}
	});
});