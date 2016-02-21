<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link type="text/css" rel="stylesheet" href="../../css/style.css" />
		<link type="text/css" rel="stylesheet" href="../../css/headerAndFooter.css" />
		<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="../../css/bootstrap-formhelpers.css" rel="stylesheet" type="text/css" />
		
		<script src="../../js/jquery.js"></script>
		<script src="../../js/bootstrap/bootstrap.js"></script>
		<script type="text/javascript" src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>
		
		<script type="text/javascript" src="../../js/jquery.bootpag.min.js"></script>
		<script type="text/javascript" src="../../js/myscript.js"></script>
		
		<title>UST eTrams - Home</title>
	</head>
	
	<body>
				
			<!-- Header -->
			<%@ include file= "staffHeader.jsp" %>
			<!-- End of Header -->
				
			<!-- Container -->
			<div class="container">
			 	<div class="row">
			 		<!-- Calendar -->
			 		<div class="col-md-7">
			 			<h1 class="page-header">Calendar</h1>
			 			
			 			<div class="content">
			 				<div class="someContainer">
  								<p>Calendar</p>
  							</div>
			 			</div>
			 		</div>
			 		<!-- End of Calendar -->
			 		
			 		<!-- Announcements -->
			 		<div class="col-md-offset-1 col-md-4">
			 			<h1 class="page-header">Announcements</h1>
			 			
			 			<!-- Content -->
			 			<div class="content">
			 				<div class="someContainer">
			 					
			 					<!-- No announcement -->
  								<div class="noAnnouncement">
  									No announcement.
  								</div>
  								<!-- End of No announcement -->
  								
  								<!-- List of announcements -->
  								<div id="announcementList">
  									<div class="announcements fade in" id="announcement1">
  										<button type="button" class="close" data-target="#announcement1" data-dismiss="alert">
  											<span aria-hidden="true">&times;</span>
  										</button>
  										<h4>Announcement 1</h4>
  										<p>Content content content content con... <br>
  											<a href="">View</a></p>
  									</div>
  									<div class="announcements fade in" id="announcement2">
  										<button type="button" class="close" data-target="#announcement2" data-dismiss="alert">
  											<span aria-hidden="true">&times;</span>
  										</button>
  										<h4>Announcement 2</h4>
  										<p>Content content content content con... <br>
  											<a href="">View</a></p>
  									</div>
  									<div class="announcements fade in" id="announcement3">
  										<button type="button" class="close" data-target="#announcement3" data-dismiss="alert">
  											<span aria-hidden="true">&times;</span>
  										</button>
  										<h4>Announcement 3</h4>
  										<p>Content content content content con... <br>
  											<a href="">View</a></p>
  									</div>
  								</div>
  								<!-- End of List of announcements -->
  								
  								<!-- Announcements pagination -->
  								<div class="announcementPager text-center">
  									<ul class="pagination pager" id="myPager"></ul>
  								</div>
  								<!-- End of Announcements pagination -->
  								
  							</div>
			 			</div>
			 			<!-- End of content -->
			 			
			 		</div>
			 		<!-- End of Announcements -->
			 		
			 	</div>
			</div>
			<!-- End of Container -->
				
			<!-- Footer -->
			<%@ include file= "../footer.jsp" %>
			<!-- End of Footer -->
				
	</body>
</html>