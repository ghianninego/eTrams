<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="eTrams.utilities.helperClasses.TimeDateConverterClass" %>
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
					<small><a href="../../dbcontrol?requestType=goToAdminSeminar"><%=(String) session.getAttribute("seminarName")%></a>
						/ </small> Sessions
				</h1>

				<!-- Content -->
				<div class="content">
				
				<%
					ResultSet rs = (ResultSet) session.getAttribute("session");
					ResultSet rs2 = (ResultSet) session.getAttribute("venue");
					ResultSet rs3 = (ResultSet) session.getAttribute("speakers");
					int sessions = 0;
					DateFormat format = new SimpleDateFormat("h:mm a");
					DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
					DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
					boolean isNotEmpty = rs.next();
					if (!isNotEmpty) {
				%>
					<div style="padding: 5px 0px;">
						<h4>There are currently no sessions for this seminar.</h4>
					</div>
				<% } else { %>
					<div class="row options">
			 			<!-- Filter Data -->
						<div class="col-sm-2">
						
								<div class="input-group">
									<div class="bfh-selectbox" data-name="filterData" data-value="All" id="filterData">
										<div data-value="All">All</div>
										<div data-value="Ongoing">Ongoing</div>
										<div data-value="Completed">Completed</div>
									</div>
									<span class="input-group-btn">
										<button class="btn btn-default" id="filterDataBtn">Filter</button>
									</span>
								</div>
							
						</div>
						<!-- End of Filter -->
						
						<!-- Other Filter Data -->
						<div class="col-sm-3">

								<div class="input-group">
									<div class="bfh-selectbox" data-name="sortData" data-value="AlphabeticalAsc" id="sortData">
										<div data-value="AlphabeticalAsc">By Alphabetical (Asc)</div>
										<div data-value="AlphabeticalDesc">By Alphabetical (Desc)</div>
										<div data-value="DateAsc">By Date (Asc)</div>
										<div data-value="DateDesc">By Date (Desc)</div>
									</div>
									<span class="input-group-btn">
										<button class="btn btn-default" type="submit" onclick="sort('sortData')">Sort</button>
									</span>
								</div>

						</div>
						<!-- End of Other Filter -->
			 		</div>
			 		
			 		<br>
			 		
					<div class="row" id="ssList">
						<%
							while (isNotEmpty) {
								String str = format.format(rs.getTime(8));
								String str2 = format.format(rs.getTime(9));
								String editDate = df.format(rs.getDate(7));
								String dateDisplay = df2.format(rs.getDate(7));
						%>
						<div class="col-sm-6 col-md-3" id="datavalues">
							<span class="hidden" id="alpha"><%=rs.getString(3) %></span>
							<span class="hidden" id="date"><%=rs.getDate(7)%></span>
								
							<div class="panel panel-default" id="dataContent_<%= rs.getInt(1)%>" data-sessionname="<%= rs.getString(3)%>" data-sessiondate="<%=editDate%>"
									data-timein="<%= str%>" data-timeout="<%= str2%>" data-venue="<%=rs.getInt(16)%>" data-remarks="<%= rs.getString(5)%>" 
									data-capacity="<%=rs.getInt(6)%>" data-speaker="<%=rs.getInt(10)%>" data-sessionid="<%= rs.getInt(1)%>">
									
								<div class="panel-body">
									<div class="sessionTitle">
										<h3><%=rs.getString(3)%></h3>
									</div>
								</div>
									
							<% if (rs.getInt(11) == 1) { %>
								<ul class="list-group">
									<li class="list-group-item status complete">
										<p><span>COMPLETE</span></p>
									</li>
									<li class="list-group-item">
										<button class="btn btn-link" data-toggle="popover" data-trigger="focus" data-html="true" 
												data-placement="bottom" data-content="
  											<p><strong>Time:</strong> <%=str%> - <%=str2%></p>
  											<p><strong>Date:</strong> <%=TimeDateConverterClass.convertToStringDate(dateDisplay)%></p>
			  								<p><strong>Venue:</strong> <%=rs.getString(4)%> <em><%=rs.getString(5)%></em>
											<p><strong>Speaker:</strong> <%=rs.getString(13)%>, <%=rs.getString(14)%> <%=rs.getString(15)%></p>
											<p><strong>Capacity:</strong> <%=rs.getInt(6)%></p>
  										">More Info</button> &bull; 
  										<button class="btn btn-link" data-toggle="modal" data-target="#editSessionModal" data-sid="<%= rs.getInt(1)%>">Edit</button>
  										 &bull; 
  										<button class="btn btn-link" data-toggle='modal' data-target='#deleteModal' data-sid="<%= rs.getInt(1)%>">Delete</button>
									</li>
									<li class="list-group-item setting1">
  										<a href="../../dbcontrol?requestType=goToAdminManageParticipantsFromAdminSessions&sessionID=<%=rs.getInt(1)%>&sessionName=<%=rs.getString(3)%>">Manage Participants</a>
									</li>
									<li class="list-group-item setting2">
										<a href="../../dbcontrol?requestType=goToAdminManageCertificationFromAdminSessions&sessionID=<%=rs.getInt(1)%>&sessionName=<%=rs.getString(3)%>">Manage Certification</a>
									</li>
								</ul>
							<% } else { %>
								
								<ul class="list-group">
									<li class="list-group-item status">
										<p><span>ONGOING</span></p>
									</li>
									<li class="list-group-item">
										<button class="btn btn-link" data-toggle="popover" data-trigger="focus" data-html="true" 
												data-placement="bottom" data-content="
  											<p><strong>Time:</strong> <%=str%> - <%=str2%></p>
  											<p><strong>Date:</strong> <%=TimeDateConverterClass.convertToStringDate(dateDisplay)%></p>
			  								<p><strong>Venue:</strong> <%=rs.getString(4)%> <em><%=rs.getString(5)%></em>
											<p><strong>Speaker:</strong> <%=rs.getString(13)%>, <%=rs.getString(14)%> <%=rs.getString(15)%></p>
											<p><strong>Capacity:</strong> <%=rs.getInt(6)%></p>
  										">More Info</button> &bull; 
  										<button class="btn btn-link" data-toggle="modal" data-target="#editSessionModal" data-sid="<%= rs.getInt(1)%>">Edit</button>
  										 &bull; 
  										<button class="btn btn-link" data-toggle='modal' data-target='#deleteModal' data-sid="<%= rs.getInt(1)%>">Delete</button>
									</li>
									<li class="list-group-item setting1">
  										<a href="../../dbcontrol?requestType=goToAdminManageParticipantsFromAdminSessions&sessionID=<%=rs.getInt(1)%>&sessionName=<%=rs.getString(3)%>">Manage Participants</a>
									</li>
									<li class="list-group-item setting2">
										<a href="../../dbcontrol?requestType=goToFrontDeskFromSessions&sessionID=<%=rs.getInt(1)%>&sessionName=<%=rs.getString(3)%>">Front Desk Interface</a>
									</li>
								</ul>
							<% } %>
								
							</div>
						</div>

						<%
							sessions++;
							isNotEmpty = rs.next();
							}
							rs.first();
							rs.previous();
						%>
					</div>
 
 					<!-- Announcements pagination -->
					<p id="legend1"></p>
					<br><br>
					<div class="holder">
   					</div>
					<!-- End of Announcements pagination -->
					
					<% } %>
					<br>
					
					<div class="someButton">
						<button type="button" class="btn btn-yellow" data-toggle="modal"
							data-target="#sessionModal">
							<span class="glyphicon glyphicon-plus"></span> New Session
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
												id="sessionDate" data-name="sessionDate" data-min="today"></div>
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
											
											<select class="form-control" id="sessionVenue" name="sessionVenue" required>
					            				<option class="hidden" disabled selected> -- select an option -- </option>
					            				<%while (rs2.next()) {%>
												<option value="<%=rs2.getInt(1)%>"><%=rs2.getString(2)%></option>
												<%}
													rs2.first();
													rs2.previous();
												%>
					            			</select>
											<!--
											<div class="bfh-selectbox" data-name="sessionVenue"
												id="sessionVenue" data-value="" data-filter="true">
												<%
													while (rs2.next()) {
												%>
												<div data-value="<%=rs2.getInt(1)%>"><%=rs2.getString(2)%></div>
												<%
													}
													rs2.first();
													rs2.previous();
												%>
												USE <div data-value="(value)">(NAME)</div> instead of <option> tags
											</div>-->
											
											
										</div>	
									</div>
									<div class="form-group">
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
												required min="0"/>
										</div>
									</div>

									<!-- Speaker -->
									<div class="form-group">
										<label for="Session Speaker" class="col-sm-2 control-label">Speaker</label>
										<div class="col-sm-10">
										
											<select class="form-control" id="sessionSpeaker" name="sessionSpeaker" required>
					            				<option class="hidden" disabled selected> -- select an option -- </option>
					            				<%
													while (rs3.next()) {
												%>
												<option value="<%=rs3.getInt(1)%>"><%=rs3.getString(2)%>,
													<%=rs3.getString(3)%>
													<%=rs3.getString(4)%></option>
												<%
													}
													rs3.first();
													rs3.previous();
												%>
					            			</select>
										
										<!-- <div class="bfh-selectbox" data-name="sessionSpeaker"
												id="sessionSpeaker" data-filter="true" >
												<%
													while (rs3.next()) {
												%>
												<div data-input="hidden" data-value="<%=rs3.getInt(1)%>"><%=rs3.getString(2)%>,
													<%=rs3.getString(3)%>
													<%=rs3.getString(4)%></div>
												<%
													}
													rs3.first();
													rs3.previous();
												%>
												<!-- USE <div data-value="(value)">(NAME)</div> instead of <option> tags
											</div> -->
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
						</form>
						</div>
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
						<input type="hidden" name="sessionID" id="sessionID" value=""> <input
							type="hidden" name="requestType" value="editSession">

					</div>
					<div class="modal-footer">
						<button type="submit" onclick="return checkSelect()"
							class="btn btn-yellow pull-left">Submit</button>
						<button type="button" class="btn btn-gray pull-left"
							data-dismiss="modal">Cancel</button>
					</div>
			</form>
			</div>
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
						<p>Are you sure you want to delete this session?</p>
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
	
	<!-- INFO MODAL -->
	<div class="modal fade infoModal" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<br>
					<div class="text-center" style="padding: 5px;">
						<p>The capacity for this session is already full.</p>
						<p>You cannot add another participant.</p>
					</div>
				
				</div>
			</div>
		</div>
	</div>
	<!-- INFO MODAL -->
	
</body>

<script src="../../js/jquery.js"></script>
<script src="../../js/bootstrap/bootstrap.js"></script>
<script type="text/javascript"
	src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>

<script type="text/javascript" src="../../js/jPages.js"></script>
<script type="text/javascript" src="../../js/myscript.js"></script>

<!-- FOR SESSION MODAL -->
<script type="text/javascript" src="../../js/sessionModal.js"></script>
<script type="text/javascript" src="../../js/datacontrol.js"></script>

<script type="text/javascript">

		$(".editSessionModal").on(
				"show.bs.modal",
				function(event) {
					var event = $(event.relatedTarget);
					id = event.data("sid");
					var url = $("#dataContent_" + id);
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
					var event = $(event.relatedTarget);
					id = event.data("sid");
					var url = $("#dataContent_" + id);
					var sessionID = url.data("sessionid");
					var sessionName = url.data("sessionname");

					var modal = $(this);
					modal.find("#sessionID").val(sessionID);
					modal.find("#sessionName").val(sessionName);
	
		});
		
	</script>
</html>