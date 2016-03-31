jQuery(function($) {
	$("div.holder").jPages({
		containerID: "announcementList",
		perPage: 5,
		keyBrowse: true
	});
	
	
	$("div.holder").jPages({
		containerID: "someTable",
		perPage: 10,
		keyBrowse: true
	});
});