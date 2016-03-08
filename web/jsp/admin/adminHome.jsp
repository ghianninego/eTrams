<jsp:useBean id="announcement" type="java.sql.ResultSet" scope="session"/>
<jsp:useBean id="user" class="eTrams.model.FinalUserBean" scope="session"/>
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
		
<link rel='stylesheet' href='../../Calendar/fullcalendar.css' />
<link rel='stylesheet' href='../../css/calendar.css' />
<script src='../../Calendar/jquery.min.js'></script>
<script src='../../Calendar/moment.min.js'></script>
<script src='../../Calendar/fullcalendar.js'></script>

		<title>UST eTrams - Home</title>
	</head>
	
	<body>
	
		<!-- Header -->
		<%@ include file= "adminHeader.jsp" %>
		<!-- End of Header -->
				
		<!-- Container -->
		<div class="container">
		 	<div class="row">
			 
			 	<!-- Calendar -->
			 	<div class="col-md-7">
			 		<h1 class="page-header">Calendar</h1>
			 		
			 		<div class="content">
			 			<div class="someContainer">
							<%@ include file= "../CalendarEvents.jsp" %>	
  						</div>
			 		</div>
			 	</div>
			 	<!-- End of Calendar -->
			 		
			 	<!-- Announcements -->
			 	<div class=" col-md-5">
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
  							<%int z = 1;while(announcement.next()) { %>
  							<div id="announcementList">
  								<div class="paginateClass announcements<%=z %> fade in" id="announcement">
  									<button type="button" class="close" data-target="#announcement<%=z %>" data-dismiss="alert">
  										<span aria-hidden="true">&times;</span>
  									</button>
  									<h4><%=announcement.getString("title") %></h4>
  									<p><%=announcement.getString("content") %> <br>
  										<a href="#" data-toggle="modal" data-target="#viewAnnouncementModal<%=z %>">View</a> | 
  										<a href="#" data-toggle="modal" data-target="#editAnnouncementModal<%=z %>">Edit</a> | 
  										<form action="../../dbcontrol">
  										<input type="hidden" name="requestType" value="announcementDelete" />
  										<input type="hidden" name="announcementID" value="<%=announcement.getInt("announcementID") %>" />	
  										<input class="btn btn-link" type="submit" value="delete"/>
  										</form>
  									</p>
  								</div>
  							</div>
  							
  												
					
<!-- VIEW ANNOUNCEMENT MODAL -->
<div class="modal fade" id="viewAnnouncementModal<%=z %>" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel"><%=announcement.getString("title")%></h4>
			</div>
			<div class="modal-body">
				<p><%=announcement.getString("content")%></p>
				<p><em><%=announcement.getString("dateCreated")%></em></p>
			</div>
		</div>
	</div>
</div>
<!-- VIEW ANNOUNCEMENT MODAL -->


<!-- EDIT ANNOUNCEMENT MODAL -->
<div class="modal fade" id="editAnnouncementModal<%=z %>" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit Announcement</h4>
			</div>
		<form class="form-horizontal" action="../../dbcontrol" method="post">
            <div class="modal-body">
            		
                    <!-- Announcement Title -->
                    <div class="form-group">
                        <label for="Title" class="col-sm-2 control-label">Title</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" id="announcementTitle" name="announcementTitle" value="<%=announcement.getString("title")%>" required />
                        </div>
                    </div>

                    <!-- Announcement Content -->
                    <div class="form-group">
                        <label for="Content" class="col-sm-2 control-label">Content</label>
                        <div class="col-sm-10">
                        <textarea class="form-control" name="announcementContent" id="announcementContent" rows="5"  required><%=announcement.getString("content")%>"</textarea>
                        </div>
                    </div>
    
            </div>
                <div class="modal-footer">
                <input type="hidden" name="announcementID" value="<%=announcement.getInt("AnnouncementID")%>">
                <input type="hidden" name="requestType" value="announcementEdit">
                    <button type="submit" class="btn btn-yellow pull-left">Submit</button>
                    <button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
                </div>
            </div>
		</form>
	</div>
</div>
<!-- EDIT ANNOUNCEMENT_MODAL -->
  						<%z++;} announcement.first();announcement.previous();%>
  							<!-- End of List of announcements -->
  								
  							<!-- Announcements pagination -->
  							<!-- End of Announcements pagination -->
  								
  						</div>
  						<!-- End of Announcements Container -->
  							
  						<!-- New Announcement -->
  						<div class="someButton text-center" style="padding-top: 15px;">
  							<button type="button" class="btn btn-yellow" data-toggle="modal" data-target="#createAnnouncementModal">
  								<span class="glyphicon glyphicon-plus"></span> New Announcement
  							</button>
  						</div>
  						<!-- New Announcement -->
			 		</div>
			 		<!-- End of content -->
			 			
			 		<!-- Modals -->
					<%@ include file= "../modals/AnnouncementModals.jsp" %>	
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
	
	
		
</html>