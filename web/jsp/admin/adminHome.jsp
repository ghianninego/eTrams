<jsp:useBean id="announcement" type="java.sql.ResultSet" scope="session"/>
<jsp:useBean id="user" class="eTrams.model.FinalUserBean" scope="session"/>
<%@ page import="eTrams.utilities.helperClasses.TimeDateConverterClass" %>
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
	
	<link rel='stylesheet' href='../../Calendar/fullcalendar.css' />
	<link rel='stylesheet' href='../../css/calendar.css' />

	<title>UST eTrams - Home</title>
</head>

<body>

	<!-- Header -->
	<%@ include file="adminHeader.jsp"%>
	<!-- End of Header -->

	<!-- Container -->
	<div class="container">
		<div class="row">

			<!-- Calendar -->
			<div class="col-md-7">
				<h1 class="page-header">Calendar</h1>

				<div class="content">
					<%@ include file="../CalendarEvents.jsp"%>
				</div>
			</div>
			<!-- End of Calendar -->

			<!-- Announcements -->
			<div class="col-md-offset-1 col-md-4">
				<h1 class="page-header">Announcements</h1>

				<!-- Content -->
				<div class="content">

					<!-- Announcements Container -->
					<div class="someContainer">
					<%
						int g = 1;
						boolean q = announcement.next();
						if(!q){
					%>
						<!-- No announcement -->
						<div class="noAnnouncement">No announcement.</div>
						<!-- End of No announcement -->
						
					<% } else { %>
						
						<!-- List of announcements -->
						<div id="announcementList">
						<%
							while (q) {	
								
								String content = announcement.getString("content");
								content = content.replaceAll("<br />","");
						%>
							<div class="paginateClass" id="announcements">

								<h4><%=announcement.getString("title")%></h4>
								<p>
									<a href="#" data-toggle="modal" data-target="#viewAnnouncementModal<%=g%>">View</a> |
									<a href="#" data-toggle="modal" data-target="#editAnnouncementModal<%=g%>">Edit</a> |
									<a href="#" data-toggle="modal" data-target="#deleteModal<%=g%>">Delete</a>
								</p>
							</div>
							
							
							


<!-- VIEW ANNOUNCEMENT MODAL -->
<div class="modal fade" id="viewAnnouncementModal<%=g%>" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">"<%=announcement.getString("Title") %>"</h4>
			</div>
			<div class="modal-body">
				<p><%=announcement.getString("Content") %></p>
				<p><em style="color: #848484 !important;">Date created: <%=TimeDateConverterClass.convertToStringDate(announcement.getString("datecreated"))%></em></p>
			</div>
		</div>
	</div>
</div>
<!-- VIEW ANNOUNCEMENT MODAL -->


<!-- EDIT ANNOUNCEMENT MODAL -->
<div class="modal fade" id="editAnnouncementModal<%=g %>" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit Announcement</h4>
			</div>
		<form class="form-horizontal" action="../../dbcontrol" method="post">
		<input type="hidden" name="requestType" value="announcementEdit" />
		<input type="hidden" name="announcementID" value="<%=announcement.getString("AnnouncementID") %>" />
            <div class="modal-body">
            		
                    <!-- Announcement Title -->
                    <div class="form-group">
                        <label for="Title" class="col-sm-2 control-label">Title</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" id="announcementTitle" name="announcementTitle" value="<%=announcement.getString("title") %>" required />
                        </div>
                    </div>

                    <!-- Announcement Content -->
                    <div class="form-group">
                        <label for="Content" class="col-sm-2 control-label">Content</label>
                        <div class="col-sm-10">
                        <textarea class="form-control" name="announcementContent" id="announcementContent" rows="5" required><%=content%></textarea>
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
<!-- EDIT ANNOUNCEMENT_MODAL -->
<!-- DELETE MODAL -->
	<div class="modal fade deleteModal" id="deleteModal<%=g %>" tabindex="-1"
		role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<form class="form-horizontal" action="../../dbcontrol">
					<div class="modal-body text-center">
						<p>Are you sure you want to delete this account?</p>

						<	<input type="hidden" name="requestType" value="announcementDelete" />
					<input type="hidden" name="announcementID" value="<%=announcement.getString("AnnouncementID") %>" />

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
							
							
						<%
								
								g++;
								q = announcement.next();
								}
							}
							announcement.first();
							announcement.previous();
						%>
						</div>
						<!-- End of List of announcements -->
						
						<p id="legend2"></p>
						<!-- Announcements pagination -->
						<div class="paginationHomeHolder text-center">
							<div class="holder text-center">
        					</div>
						</div>
						<!-- End of Announcements pagination -->

					</div>
					<!-- End of Announcements Container -->

					<!-- New Announcement -->
					<div class="someButton text-center" style="padding-top: 15px;">
						<button type="button" class="btn btn-yellow" data-toggle="modal"
							data-target="#createAnnouncementModal">
							<span class="glyphicon glyphicon-plus"></span> New Announcement
						</button>
					</div>
					<!-- New Announcement -->

				</div>
				<!-- End of content -->

			</div>
			<!-- End of Announcements -->

		</div>
	</div>
	<!-- End of Container -->

	<!-- Footer -->
	<%@ include file="../footer.jsp"%>
	<!-- End of Footer -->
	
	<!-- MODALS -->
	<!-- NEW ANNOUNCEMENT MODAL -->
	<div class="modal fade" id="createAnnouncementModal" tabindex="-1"
		role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">New Announcement</h4>
				</div>
			<form class="form-horizontal" action="../../dbcontrol" method="post">
				<div class="modal-body">

					<!-- Announcement Title -->
					<div class="form-group">
						<label for="Title" class="col-sm-2 control-label">Title</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="announcementTitle" 
								name="announcementTitle" placeholder="Title" required />
						</div>
					</div>

					<!-- Announcement Content -->
					<div class="form-group">
						<label for="Content" class="col-sm-2 control-label">Content</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="announcementContent"
								id="announcementContent" rows="5" required></textarea>
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<input name="requestType" value="addAnnouncement" type="hidden" />
					<input name="creatorID" value="<%=user.getAccountID()%>" type="hidden" />
					<input name="userInfoID" value="<%=user.getUserInfoID()%>" type="hidden" />

					<button type="submit" class="btn btn-yellow pull-left">Submit</button>
					<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
				</div>
			</form>
			</div>
		</div>
	</div>
	<!-- NEW ANNOUNCEMENT_MODAL -->
	
	
</body>

<script src="../../js/bootstrap/bootstrap.js"></script>
<script type="text/javascript"
	src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>

<script type="text/javascript" src="../../js/jPages.min.js"></script>


<script>
$(document).ready(function($) {
	$("div.holder").jPages({
		containerID: "announcementList",
		perPage: 5,
		keyBrowse: true,
		previous: "‹",
		next: "›",
		delay: 10,
		callback: function (pages, items) {
			$("#legend2").html("Showing " + items.range.start + " - " + items.range.end + " of " + items.count + " items");
		}
	});
});
</script>

<script src='../../Calendar/jquery.min.js'></script>
<script src='../../Calendar/moment.min.js'></script>
<script src='../../Calendar/fullcalendar.js'></script>
</html>