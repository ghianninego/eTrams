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
	<%@ include file="staffHeader.jsp"%>
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
									<a href="#" data-toggle="modal" data-target="#viewAnnouncementModal<%=g%>">View</a>
								</p>
							</div>
							
							<!-- MODALS -->

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
	
</body>

<script src="../../js/bootstrap/bootstrap.js"></script>
<script type="text/javascript"
	src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>

<script type="text/javascript" src="../../js/jPages.js"></script>

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