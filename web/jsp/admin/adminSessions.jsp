<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link type="text/css" rel="stylesheet" href="../../css/style.css" />
	<link type="text/css" rel="stylesheet" href="../../css/headerAndFooter.css" />
	<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../../css/bootstrap-formhelpers.css" rel="stylesheet" type="text/css" />

	<title>UST eTrams - Seminars & Sessions</title>
</head>


<body>

	<!-- Header -->
	<%@ include file="adminHeader.jsp"%>
	<!-- End of Header -->

	<!-- Container -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header">
					<small><a href="adminSeminars.jsp"><%=(String) session.getAttribute("seminarName")%></a>
						/ </small> Sessions
				</h1>

				<!-- Content -->
				<div class="content">
				
					<div class="row options">
			 			<!-- Filter Data -->
						<div class="col-sm-2">
							<form action="">
								<div class="input-group">
									<div class="bfh-selectbox" data-name="filterUsers" data-value="All" id="filterUsers">
										<div data-value="All">All</div>
										<div data-value="ongoing">Ongoing</div>
										<div data-value="completed">Completed</div>
									</div>
									<span class="input-group-btn">
										<button class="btn btn-default" type="submit">Filter</button>
									</span>
								</div>
							</form>
						</div>
						<!-- End of Filter -->
						
						<!-- Other Filter Data -->
						<div class="col-sm-3">
							<form action="">
								<div class="input-group">
									<div class="bfh-selectbox" data-name="filterUsers" data-value="All" id="filterUsers">
										<div data-value="AlphabeticalAsc">By Alphabetical (Asc)</div>
										<div data-value="AlphabeticalDesc">By Alphabetical (Desc)</div>
										<div data-value="DateAsc">By Date (Asc)</div>
										<div data-value="DateAsc">By Date (Desc)</div>
									</div>
									<span class="input-group-btn">
										<button class="btn btn-default" type="submit">Filter</button>
									</span>
								</div>
							</form>
						</div>
						<!-- End of Other Filter -->
			 		</div>
			 		
			 		<br>
			 		
					<div class="row">
						<%
							ResultSet rs = (ResultSet) session.getAttribute("session");
							ResultSet rs2 = (ResultSet) session.getAttribute("venue");
							ResultSet rs3 = (ResultSet) session.getAttribute("speakers");
							int sessions = 0;
							DateFormat format = new SimpleDateFormat("h:mm a");
							DateFormat df = new SimpleDateFormat("MM/dd/yyyy");

							while (rs.next()) {
								String str = format.format(rs.getTime(8));
								String str2 = format.format(rs.getTime(9));
								String editDate = df.format(rs.getDate(7));
						%>
						<div class="col-sm-6 col-md-3">
							<% if (rs.getInt(11) == 1) { %>
							
								<button class="thumbnail" id="dataContent" data-toggle="popover"
									data-trigger="focus" data-html="true" data-placement="bottom" data-sessionname="<%= rs.getString(3)%>" data-sessiondate="<%=editDate%>"
									data-timein="<%= str%>" data-timeout="<%= str2%>" data-venue="<%=rs.getInt(16)%>" data-remarks="<%= rs.getString(5)%>" 
									data-capacity="<%=rs.getInt(6)%>" data-speaker="<%=rs.getInt(10)%>" data-sessionid="<%= rs.getInt(1)%>"
									data-content="
  										<div class='btn-group btn-group-justified' role='group' aria-label='...'>
  											<a class='btn btn-gray' data-toggle='modal' data-target='#editSessionModal'>Edit</a>
  											<a class='btn btn-gray' data-toggle='modal' data-target='#deleteModal'>Delete</a>
										</div>
  										<div class='someButton'>
  											<a class='btn btn-yellow btn-block' href='../../dbcontrol?requestType=goToAdminManageParticipantsFromAdminSessions&sessionID=<%=rs.getInt(1)%>&sessionName=<%=rs.getString(3)%>'>Manage Participants</a>
  											<a class='btn btn-yellow btn-block' href='adminManageCertification.jsp'>Manage Certification</a>
  											<a class='btn btn-yellow btn-block' href='frontDeskInterface.jsp'>Front-Desk Interface</a>
  										</div>
  									">

									<div class="caption complete">
										<div class="sessionTitle">
											<h3><%=rs.getString(3)%></h3>
										</div>
										<p>
											<strong>Time:</strong> <%=str%> - <%=str2%>
											<br>
  											<strong>Date:</strong> <%=rs.getDate(7)%>
  											<br>
  											<strong>Venue:</strong> <%=rs.getString(5)%>, <%=rs.getString(4)%>
  											<br>
  											<strong>Speaker:</strong> <%=rs.getString(13)%>, <%=rs.getString(14)%> <%=rs.getString(15)%>
  											<br>
  											<strong>Capacity:</strong> <%=rs.getInt(6)%>
											<br>	
											<strong>Status:</strong> <span>COMPLETED</span>
										</p>
									</div>
								</button>
								
							<% } else { %>
								<button class="thumbnail" id="dataContent" data-toggle="popover"
									data-trigger="focus" data-html="true" data-placement="bottom" data-sessionname="<%= rs.getString(3)%>" data-sessiondate="<%=editDate%>"
									data-timein="<%= str%>" data-timeout="<%= str2%>" data-venue="<%=rs.getInt(16)%>" data-remarks="<%= rs.getString(5)%>" 
									data-capacity="<%=rs.getInt(6)%>" data-speaker="<%=rs.getInt(10)%>" data-sessionid="<%= rs.getInt(1)%>"
									data-content="
  										<div class='btn-group btn-group-justified' role='group' aria-label='...'>
  											<a class='btn btn-gray' data-toggle='modal' data-target='#editSessionModal'>Edit</a>
  											<a class='btn btn-gray' data-toggle='modal' data-target='#deleteModal'>Delete</a>
										</div>
  										<div class='someButton'>
  											<a class='btn btn-yellow btn-block' href='../../dbcontrol?requestType=goToAdminManageParticipantsFromAdminSessions&sessionID=<%=rs.getInt(1)%>&sessionName=<%=rs.getString(3)%>'>Manage Participants</a>
  											<a class='btn btn-yellow btn-block' href='frontDeskInterface.jsp'>Front-Desk Interface</a>
  										</div>
  									">

									<div class="caption">
										<div class="sessionTitle">
											<h3><%=rs.getString(3)%></h3>
										</div>
										<p>
											<strong>Time:</strong> <%=str%> - <%=str2%>
											<br>
  											<strong>Date:</strong> <%=rs.getDate(7)%>
  											<br>
  											<strong>Venue:</strong> <%=rs.getString(5)%>, <%=rs.getString(4)%>
											<br>
  											<strong>Speaker:</strong> <%=rs.getString(13)%>, <%=rs.getString(14)%> <%=rs.getString(15)%>
  											<br>
											<strong>Capacity:</strong> <%=rs.getInt(6)%>
											<br>
											<strong>Status:</strong> <span>ONGOING</span>
										</p>
									</div>
								</button>
							<% } %>
						</div>

						<%
							sessions++;
							}
							rs.first();
							rs.previous();
						%>
					</div>
 
					<br>
					<div class="someButton">
						<button type="button" class="btn btn-yellow" data-toggle="modal"
							data-target="#sessionModal">
							<span class="glyphicon glyphicon-plus"></span> New session
						</button>
					</div>
				</div>
				<!-- End of Content -->

				<!-- Modals -->
				<!--  CREATE SESSION MODAL -->
				<div class="modal fade" id="sessionModal" tabindex="-1"
					role="dialog" aria-labelledby="gridSystemModalLabel">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="gridSystemModalLabel">New
									Session</h4>
							</div>
							<form class="form-horizontal" action="../../dbcontrol"
								method="post">
								<div class="modal-body">

									<!-- Session Name -->
									<div class="form-group">
										<label for="Session Name" class="col-sm-2 control-label">Session
											Name</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="sessionName"
												name="sessionName" placeholder="Session Name" required />
										</div>
									</div>

									<!-- Session Date -->
									<div class="form-group">
										<label for="Session Date" class="col-sm-2 control-label">Date</label>
										<div class="col-sm-10">
											<div class="bfh-datepicker" date-close="false"
												id="sessionDate" data-name="sessionDate"></div>
										</div>
									</div>

									<!-- Session Time -->
									<div class="form-group">
										<label for="Session Time In" class="col-sm-2 control-label">Start
											Time</label>
										<div class="col-sm-4">
											<div class="bfh-timepicker" data-mode="12h"
												id="sessionTimeIn" data-name="sessionTimeIn"></div>
										</div>
										<label for="Session Time Out" class="col-sm-2 control-label">End
											Time</label>
										<div class="col-sm-4">
											<div class="bfh-timepicker" data-mode="12h"
												id="sessionTimeOut" data-name="sessionTimeOut"></div>
										</div>
									</div>

									<!-- Session Venue -->
									<div class="form-group">
										<label for="Session Venue" class="col-sm-2 control-label">Venue</label>
										<div class="col-sm-10">
											<div class="bfh-selectbox" data-name="sessionVenue"
												id="sessionVenue" data-value="--" data-filter="true">
												<div data-value>--</div>
												<%
													while (rs2.next()) {
												%>
												<div data-value="<%=rs2.getInt(1)%>"><%=rs2.getString(2)%></div>
												<%
													}
													rs2.first();
													rs2.previous();
												%>
												<!-- USE <div data-value="(value)">(NAME)</div> instead of <option> tags -->
											</div>
										</div>
										<div class="col-sm-offset-2 col-sm-10">
											<textarea class="form-control" id="venueRemarks"
												name="venueRemarks" placeholder="Venue Remarks" rows="3"></textarea>
										</div>
									</div>

									<!-- Capacity -->
									<div class="form-group">
										<label for="Capacity" class="col-sm-2 control-label">Capacity</label>
										<div class="col-sm-10">
											<input type="number" class="form-control" name="capacity"
												id="capacity" placeholder="Number of Participants allowed"
												required />
										</div>
									</div>

									<!-- Speaker -->
									<div class="form-group">
										<label for="Session Speaker" class="col-sm-2 control-label">Speaker</label>
										<div class="col-sm-10">
											<div class="bfh-selectbox" data-name="sessionSpeaker"
												id="sessionSpeaker" data-value="--" data-filter="true">
												<div data-value>--</div>
												<%
													while (rs3.next()) {
												%>
												<div data-value="<%=rs3.getInt(1)%>"><%=rs3.getString(2)%>,
													<%=rs3.getString(3)%>
													<%=rs3.getString(4)%></div>
												<%
													}
													rs3.first();
													rs3.previous();
												%>
												<!-- USE <div data-value="(value)">(NAME)</div> instead of <option> tags -->
											</div>
										</div>
									</div>

								</div>
								<input type="hidden" name="requestType" value="createSession" />
								<input type="hidden" name="seminarID"
									value="<%=session.getAttribute("seminarID")%>" />
								<div class="modal-footer">
									<button type="submit" onclick="return checkSelect()"
										class="btn btn-yellow pull-left">Submit</button>
									<button type="button" class="btn btn-gray pull-left"
										data-dismiss="modal">Cancel</button>
								</div>
						</div>
						</form>
					</div>
				</div>
				<!--  CREATE SESSION MODAL -->
				<!-- End of Modals -->

			</div>
		</div>
	</div>
	<!-- End of Container -->

	<!-- Footer -->
	<%@ include file="../footer.jsp"%>
	<!-- End of Footer -->
	<!-- EDIT SESSION MODAL -->
	<div class="modal fade editSessionModal" id="editSessionModal" tabindex="-1"
		role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">Edit Session</h4>
				</div>
				<form class="form-horizontal" action="../../dbcontrol" method="post">
					<div class="modal-body">

						<!-- Session Name -->
						<div class="form-group">
							<label for="Session Name" class="col-sm-2 control-label">Session
								Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="sessionName"
									name="sessionName" value="" required />
							</div>
						</div>
						<!-- Session Date -->
						<div class="form-group">
							<label for="Session Date" class="col-sm-2 control-label">Date</label>
							<div class="col-sm-10">
								<div class="bfh-datepicker" date-close="false" id="sessionDate"
									data-name="sessionDate"></div>
							</div>
						</div>
						<!-- Session Time -->
						<div class="form-group">
							<label for="Session Time In" class="col-sm-2 control-label">Start
								Time</label>
							<div class="col-sm-4">
								<div class="bfh-timepicker" data-mode="12h" id="sessionTimeIn"
									data-name="sessionTimeIn"></div>
							</div>
							<label for="Session Time Out" class="col-sm-2 control-label">End
								Time</label>
							<div class="col-sm-4">
								<div class="bfh-timepicker" data-mode="12h" id="sessionTimeOut"
									data-name="sessionTimeOut"></div>
							</div>
						</div>
						
						<!-- Session Venue -->
						<div class="form-group">
							<label for="Session Venue" class="col-sm-2 control-label">Venue</label>
							<div class="col-sm-10">
								<div class="bfh-selectbox" data-name="sessionVenue"
									id="sessionVenue" data-filter="true" data-value="--">
									<div data-value="--">--</div>
									<%
										while (rs2.next()) {
									%>
									<div data-value="<%=rs2.getInt(1)%>"><%=rs2.getString(2)%></div>
									<%
										}
										rs2.first();
										rs2.previous();
									%>
									<!-- USE <div data-value="(value)">(NAME)</div> instead of <option> tags -->
								</div>
							</div>
							<div class="col-sm-offset-2 col-sm-10">
								<textarea class="form-control" id="venueRemarks"
									name="venueRemarks" placeholder="Venue Remarks" rows="3"></textarea>
							</div>

						</div>

						<!-- Capacity -->
						<div class="form-group">
							<label for="Capacity" class="col-sm-2 control-label">Capacity</label>
							<div class="col-sm-10">
								<input type="number" min="1" class="form-control"
									name="capacity" id="capacity"
									placeholder="Number of Maximum Participants " value="" required />
							</div>
						</div>

						<!-- Session Speaker -->
						<div class="form-group">
							<label for="Session Speaker" class="col-sm-2 control-label">Speaker</label>
							<div class="col-sm-10">
								<div class="bfh-selectbox" data-name="sessionSpeaker"
									id="sessionSpeaker" data-value=""
									data-filter="true">
									<%
										while (rs3.next()) {
									%>
									<div data-value="<%=rs3.getInt(1)%>"><%=rs3.getString(2)%>,
										<%=rs3.getString(3)%>
										<%=rs3.getString(4)%></div>
									<%
										}
										rs3.first();
										rs3.previous();
									%>
								</div>
							</div>
						</div>
						<input type="hidden" name="sessionID" value=""> <input
							type="hidden" name="requestType" value="editSession">

					</div>
					<div class="modal-footer">
						<button type="submit" onclick="return checkSelect()"
							class="btn btn-yellow pull-left">Submit</button>
						<button type="button" class="btn btn-gray pull-left"
							data-dismiss="modal">Cancel</button>
					</div>
			</div>
			</form>
		</div>
	</div>
	<!-- EDIT SESSION MODAL -->

	<!-- DELETE MODAL -->
	<div class="modal fade deleteModal" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<form action="../../dbcontrol" method="post">
				<div class="modal-content">
					<div class="modal-body text-center">
						<p>1Are you sure you want to delete this item?</p>
						<div class="someButton text-center">
							<input type="hidden" name="sessionID" id="sessionID"
								value="" /> <input type="hidden"
								name="requestType" value="deleteSession" />
							<button type="submit" class="btn btn-default">Yes</button>
							<button type="button" class="btn btn-gray" data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- DELETE MODAL -->
</body>

<script src="../../js/jquery.js"></script>
<script src="../../js/bootstrap/bootstrap.js"></script>
<script type="text/javascript"
	src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>

<script type="text/javascript" src="../../js/myscript.js"></script>

<!-- FOR SESSION MODAL -->
<script type="text/javascript" src="../../js/sessionModal.js"></script>
<script type="text/javascript">
	function showInfo(){
    	$('.popover-content').html($('#moreInfo').html())
	}
		$(".editSessionModal").on(
				"show.bs.modal",
				function(event) {
					var url = $("#dataContent");
					var sessionName = url.data("sessionname");
					var sessionDate = url.data("sessiondate");
					var timeIn = url.data("timein");
					var timeOut = url.data("timeout");
					var venue = url.data("venue");
					var remarks = url.data("remarks");
					var capacity = url.data("capacity");
					var speaker = url.data("speaker");
					var sessionID = url.data("sessionid");
					        
					var modal = $(this);
					modal.find("#sessionName").val(sessionName);
					modal.find("#sessionDate").val(sessionDate);
					modal.find("#sessionTimeIn").val(timeIn);
					modal.find("#sessionTimeOut").val(timeOut);
					modal.find("#sessionVenue").val(venue);
					modal.find("#venueRemarks").val(remarks);
					modal.find("#capacity").val(capacity);
					modal.find("#sessionSpeaker").val(speaker);
					modal.find("#sessionID").val(sessionID);

					
	
		});
		
		$(".deleteModal").on(
				"show.bs.modal",
				function(event) {
					var url = $("#dataContent");
					var sessionID = url.data("sessionid");

					var modal = $(this);
					modal.find("#sessionID").val(sessionID);
	
		});
		

	</script>
</html>