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
		
		<title>UST eTrams - Home</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "coordinatorHeader.jsp" %>
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
			 	<div class="col-md-5">
			 		<h1 class="page-header">Announcements</h1>
						
		 			<!-- Content -->
			 		<div class="content">
			 			<!-- Announcements Container -->
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
  										<a href="#" data-toggle="modal" data-target="#viewAnnouncementModal">View</a> | 
  										<a href="#" data-toggle="modal" data-target="#editAnnouncementModal">Edit</a>
  									</p>
  								</div>
  								<div class="announcements fade in" id="announcement2">
  									<button type="button" class="close" data-target="#announcement2" data-dismiss="alert">
  										<span aria-hidden="true">&times;</span>
  									</button>
  									<h4>Announcement 2</h4>
  									<p>Content content content content con... <br>
  										<a href="#" data-toggle="modal" data-target="#viewAnnouncementModal">View</a> | 
  										<a href="#" data-toggle="modal" data-target="#editAnnouncementModal">Edit</a>
  									</p>
  								</div>
  								<div class="announcements fade in" id="announcement2">
  									<button type="button" class="close" data-target="#announcement2" data-dismiss="alert">
  										<span aria-hidden="true">&times;</span>
  									</button>
  									<h4>Announcement 3</h4>
  									<p>Content content content content con... <br>
  										<a href="#" data-toggle="modal" data-target="#viewAnnouncementModal">View</a> | 
  										<a href="#" data-toggle="modal" data-target="#editAnnouncementModal">Edit</a>
  									</p>
  								</div>
  							</div>
  							<!-- End of List of announcements -->
  							
 							<!-- Announcements pagination -->
  							<div class="announcementPager text-center">
  							</div>
  							<!-- End of Announcements pagination -->
  							
  						</div>
  						<!-- End of Announcements Container -->
  							
  						<!-- Announcement Tools -->
  						<div class="text-center" style="padding: 5px;">
  							<button type="button" class="btn btn-yellow" data-toggle="modal" data-target="#createAnnouncementModal">
  								<span class="glyphicon glyphicon-plus"></span> New Announcement
  							</button>
  						</div>
  						<!-- End of Announcement Tools -->
		 			</div>
			 		<!-- End of content -->
			 		
			 		<!-- Modals -->
					<!-- VIEW ANNOUNCEMENT MODAL -->
  					<div class="modal fade" id="viewAnnouncementModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
  						<div class="modal-dialog" role="document">
  							<div class="modal-content">
  								<div class="modal-header">
  									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  									<h4 class="modal-title" id="gridSystemModalLabel">TITLE</h4>
  								</div>
  								<div class="modal-body">
  									<p>Content</p>
									<p><em style="color: #848484 !important">Date created:</em></p>
								</div>
							</div>
						</div>
					</div>
					<!-- VIEW ANNOUNCEMENT MODAL -->
							
					<!-- EDIT ANNOUNCEMENT MODAL -->
					<div class="modal fade" id="editAnnouncementModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="gridSystemModalLabel">Edit Announcement</h4>
								</div>
							<form class="form-horizontal" action="" method="">
								<div class="modal-body">
										
									<!-- Announcement Title -->
									<div class="form-group">
										<label for="Title" class="col-sm-2 control-label">Title</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="announcementTitle" name="announcementTitle" value="sdfg" required />
										</div>
									</div>
										
									<!-- Announcement Content -->
									<div class="form-group">
										<label for="Content" class="col-sm-2 control-label">Content</label>
										<div class="col-sm-10">
											<textarea class="form-control" name="announcementContent" id="announcementContent" rows="5"  required></textarea>
										</div>
									</div>
								</div>
									
								<div class="modal-footer">
									<button type="submit" class="btn btn-yellow pull-left">Submit</button>
									<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
								</div>
							</div>
							</form>
						</div>
					</div>
					<!-- EDIT ANNOUNCEMENT MODAL -->
							
					<!-- DELETE MODAL -->
					<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog modal-sm" role="document">
							<div class="modal-content">
							<form class="form-horizontal" action="">
								<div class="modal-body text-center">
									<p>Are you sure you want to delete this account?</p>
									<div class="someButton text-center">
										<button type="submit" class="btn btn-default">Yes</button>
										<button type="button" class="btn btn-gray" data-dismiss="modal">Cancel</button>
									</div>
								</div>
							</form>
							</div>
						</div>
					</div>
					<!-- DELETE MODAL -->
							
					<!-- NEW ANNOUNCEMENT MODAL -->
  					<div class="modal fade" id="createAnnouncementModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
  						<div class="modal-dialog modal-lg" role="document">
  							<div class="modal-content">
  								<div class="modal-header">
  									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  									<h4 class="modal-title" id="gridSystemModalLabel">New Announcement</h4>
  								</div>
  							<form class="form-horizontal" action="" method="">
  								<div class="modal-body">
  									
  									<!-- Announcement Title -->
  									<div class="form-group">
  										<label for="Title" class="col-sm-2 control-label">Title</label>
  										<div class="col-sm-10">
  											<input type="text" class="form-control" id="announcementTitle" name="announcementTitle" placeholder="Title" required />
  										</div>
  									</div>
  								
  									<!-- Announcement Content -->
  									<div class="form-group">
  										<label for="Content" class="col-sm-2 control-label">Content</label>
  										<div class="col-sm-10">
  											<textarea class="form-control" name="announcementContent" id="announcementContent" rows="5" required></textarea>
  										</div>
  									</div>
  								</div>
  								
  								<div class="modal-footer">
  									<button type="submit" class="btn btn-yellow pull-left">Submit</button>
  									<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
  								</div>
  							</div>
  							</form>
  						</div>
  					</div>
  					<!-- NEW ANNOUNCEMENT_MODAL -->
					<!-- End of Modals -->
					
			 	</div>
				<!-- End of Announcements -->
		 		
			 </div>
		</div>
		<!-- End of Container -->
				
		<!-- Footer -->
		<%@ include file= "../footer.jsp" %>
		<!-- End of Footer -->
				
	</body>
	
	<script src="../../js/jquery.js"></script>
	<script src="../../js/bootstrap/bootstrap.js"></script>
	<script type="text/javascript" src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>
		
	<script type="text/javascript" src="../../js/jquery.bootpag.min.js"></script>
	<script type="text/javascript" src="../../js/myscript.js"></script>
		
</html>