<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.ResultSet" %>

<%@ page import = "java.text.DateFormat" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link type="text/css" rel="stylesheet" href="../../css/style.css" />
		<link type="text/css" rel="stylesheet" href="../../css/headerAndFooter.css" />
		<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="../../css/bootstrap-formhelpers.css" rel="stylesheet" type="text/css" />
		<link href="../../css/bootstrap-table.css" rel="stylesheet" type="text/css" />
		<link href="../../css/jquery_ui/jquery-ui.css" rel="stylesheet" type="text/css" />
		<link href="../../css/jquery_ui/jquery-ui.structure.css" rel="stylesheet" type="text/css" />
		
		<title>UST eTrams - Seminars & Sessions - Manage Participants</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "coordinatorHeader.jsp" %>
		<!-- End of Header -->
		<% ResultSet rs2 = (ResultSet) session.getAttribute("sessionParticipants"); 
			int participants = 1;
			int certParticipants = 1;
		%>
		<!-- Container -->
		<div class="container">
			 <div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header"><small><a href="coordinatorSeminars.jsp"><%= (String) session.getAttribute("seminarName") %></a> / 
			 			<a href="coordinatorSessions.jsp"><%= (String) session.getAttribute("sessionName") %></a> /</small> Manage Participants</h1>
			 			
			 		<!-- For Completed Sessions -->
			 		<!-- Content -->
			 		<% ResultSet rs = (ResultSet) session.getAttribute("sessionDetails"); 
			 		DateFormat format = new SimpleDateFormat( "h:mm a" );
	 				DateFormat df = new SimpleDateFormat("MM/dd/yyyy");	
					rs.next();
					if (rs.getInt(11) == 1) 
					{
					%>
			 		<div class="content">
			 			
			 			<div class="row options">
			 				<!-- Filter Data -->
							<div class="col-sm-2">
							
									<div class="input-group">
										<div class="bfh-selectbox" data-name="filterData" data-value="All" id="filterData">
											<div data-value="All">All</div>
											<div data-value="Complete">Complete</div>
											<div data-value="Incomplete">Incomplete</div>
										</div>
										<span class="input-group-btn">
											<button class="btn btn-default" id="filterDataBtn">Filter</button>
										</span>
									</div>
								
							</div>
							<!-- End of Filter -->
						</div>
						
						<br>
  						<table class="table table-condensed table-striped table-hover" data-toggle="table" data-pagination="true">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>College/Faculty/Institute</th>
									<th>Time In</th>
									<th>Time Out</th>
									<th>Status</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="dataValues">
								<%
									while(rs2.next())
									{
										String timeIn = format.format(rs2.getTime(4));
										String timeOut = format.format(rs2.getTime(5));
										
										if (timeIn.equals("12:00 AM"))
										{
											timeIn = "00:00:00";
										}
										
										if (timeOut.equals("12:00 AM"))
										{
											timeOut = "00:00:00";
										}
								%>
								<tr>
									<td><%= certParticipants %></td>
									<td><%= rs2.getString(9) %>, <%= rs2.getString(10) %> <%=rs2.getString(11) %></td>
									<td><%= rs2.getString(12) %></td>
									<td><%= timeIn %></td>
									<td><%= timeOut %></td>
									<td><a href="#" data-toggle="modal" data-target="#setStatusModal" data-attendanceid="<%=rs2.getInt(1)%>" data-status="<%=rs2.getString(6) %>">
			 							<%=rs2.getString(6) %>
			 						</a></td>
									<td><a href="" data-toggle="modal" data-target="#attendanceModal" data-attendanceid="<%=rs2.getInt(1) %>" data-timein="<%=timeIn%>" data-timeout="<%=timeOut%>">Set Attendance</a></td>			
								</tr>
								
								<% 	
									certParticipants++;	}
									rs2.first(); rs2.previous();
								%>
							</tbody>
						</table>
						
					</div>
			 		<!-- End of Content -->
			 		
			 		<% } else { %>
			 		
			 		<!-- For Ongoing/Unfinished Sessions -->
			 		<!-- Content -->			 		
			 		<div class="content">
			 			<div class="row options">
			 			
			 				<!-- Filter Data --
							<div class="col-sm-2">
								<form action="">
									<div class="input-group">
										<div class="bfh-selectbox" data-name="filterUsers" data-value="All" id="filterUsers">
											<div data-value="All">All</div>
											<div data-value="Complete">Complete</div>
											<div data-value="Incomplete">Incomplete</div>
										</div>
										<span class="input-group-btn">
											<button class="btn btn-default" type="submit">Filter</button>
										</span>
									</div>
								</form>
							</div>
							<!-- End of Filter -->
						</div>
						
						<br>
						
			 			<table class="table table-condensed table-striped table-hover" data-toggle="table" data-pagination="true">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>College/Faculty/Institute</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<% 
								while (rs2.next())
								{
							%>
								<tr>
									<td><%= participants %></td>
									<td><%= rs2.getString(9) %>, <%= rs2.getString(10) %> <%=rs2.getString(11) %></td>
									<td><%= rs2.getString(12) %></td>
									<td><a href="#" data-toggle="modal" data-target="#unregisterModal" data-attendanceid="<%=rs2.getInt(1)%>">Cancel Registration</a></td>			
								</tr>
								
							<% participants++; } rs2.first(); rs2.previous(); %>
							</tbody>
						</table>
						
						<% 	if ((int) session.getAttribute("countParticipants") < rs.getInt(6)) 
							{	%>
						<br>
						<div class="someButton">
  							<button type="button" class="btn btn-yellow" data-toggle="modal" data-target="#addParticipantsModal">
  							<span class="glyphicon glyphicon-plus"></span> Add Participants</button>
  						</div>
						<% } else { %>
						<br>
						<em>Participant capacity for this session is already full.</em>
						<% } %>
			 		</div>
			 		<% } rs.beforeFirst(); %>
			 		<!-- End of Content -->
			 		
			 	</div>
			</div>
		</div>
		<!-- End of Container -->
				
		<!-- Footer -->
		<%@ include file= "../footer.jsp" %>
		<!-- End of Footer -->
		
		<!-- MODALS -->
			<!-- ADD PARTICIPANTS MODAL -->
			<div class="modal fade addParticipantsModal" id="addParticipantsModal" tabindex="-1" role="dialog">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title">Add Participants</h4>
						</div>
					<form class="form-horizontal" action="../../dbcontrol" method="get">
			            <div class="modal-body">
			            	
			            	<input type="hidden" name="requestType" value="addParticipants"/>
							
							<div style="padding-left: 15px;">
								<h4>Select participant/s to register to this session:</h4>
							</div>
							
							<div style="padding: 5px 50px;">
								<table class="listTable table-condensed table-hover" data-pagination="true"
										data-id-field="id" data-select-item-name="participants">
									<thead>
										<tr>
											<th data-field="state" data-checkbox="true"></th>
											<th data-field="id" data-visible="false" data-switchable="false" class="hidden">ID</th>
											<th data-field="name">Select all</th>
										</tr>
									</thead>
									<tbody>
										<tr>
										<% ResultSet rs3 = (ResultSet) session.getAttribute("allParticipants");
											while(rs3.next()) {
										%>
											<td><input type="checkbox" name="participants" value="<%= rs3.getInt(1)%>"></td>
											<td class="hidden"><%= rs3.getInt(1)%></td>
											<td><%= rs3.getString(2) %>, <%= rs3.getString(3) %> <%= rs3.getString(4) %></td>
										</tr>
								
										<% } rs3.first(); rs3.previous(); %>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="modal-footer">
							<button type="submit" class="btn btn-yellow pull-left">Submit</button>
							<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
						</div>
					</form>
					</div>
				</div>
			</div>
			<!-- ADD PARTICIPANTS MODAL -->
			
			<!-- UNREGISTER MODAL -->
			<div class="modal fade unregisterModal" id="unregisterModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
				<div class="modal-dialog modal-sm" role="document">
				<form action="../../dbcontrol">
					<div class="modal-content">
						<div class="modal-body text-center">
							<p>Are you sure you want to unregister this participant?</p>
							<div class="someButton text-center">	
								<input type="hidden" name="requestType" value="cancelRegistration" />
								<input type="hidden" id="attendanceID" name="attendanceID" value="" />
															
								<button type="submit" class="btn btn-default">Yes</button>
								<button type="button" class="btn btn-gray" data-dismiss="modal">Cancel</button>
							</div>
						</div>
					</div>
				</form>
				</div>
			</div>
			<!-- UNREGISTER MODAL -->
								
			<!-- SET STATUS MODAL -->
			<div class="modal fade setStatusModal" id="setStatusModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="gridSystemModalLabel">Set Status</h4>
						</div>
					<form class="form-horizontal" action="../../dbcontrol" method="post">
						<div class="modal-body">
							<input type="hidden" name="requestType" value="setStatus"/>
							<input type="hidden" id="attendanceID" name="attendanceID" value="" />
							
							<!-- Status -->
							<div class="form-group">
								<label for="status" class="col-sm-3 control-label">Status</label>
								<div class="col-sm-8">
									<div class="bfh-selectbox" data-name="status" id="status">
										<div data-value="Complete">Complete</div>
										<div data-value="Incomplete">Incomplete</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-yellow pull-left">Submit</button>
							<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
						</div>
					</form>
					</div>
				</div>
			</div>
			<!-- SET STATUS MODAL -->
			
			<!-- ATTENDANCE MODAL -->
			<div class="modal fade attendanceModal" id="attendanceModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="gridSystemModalLabel">Set Attendance</h4>
						</div>
					<form class="form-horizontal" action="../../dbcontrol" method="post">
						<div class="modal-body">
							<input type="hidden" name="requestType" value="setAttendance"/>
							<input type="hidden" id="attendanceID" name="attendanceID" value="" />
								            	
							<!-- Time In -->
							<div class="form-group">
								<label for="Time In" class="col-sm-2 control-label">Time In</label>
								<div class="col-sm-10">
									<div class="bfh-timepicker" data-mode="12h" id="timeIn" data-name="timeIn"></div>
								</div>
							</div>
							
							<!-- Time Out -->
							<div class="form-group">
								<label for="Time Out" class="col-sm-2 control-label">Time Out</label>
								<div class="col-sm-10">
									<div class="bfh-timepicker" data-mode="12h" id="timeOut" data-name="timeOut"></div>
								</div>
							</div>
								            	
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-yellow pull-left">Submit</button>
							<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
						</div>
					</form>
					</div>
				</div>
			</div>
			<!-- ATTENDANCE MODAL -->
		<!-- MODALS -->
		
	</body>

	<script src="../../js/jquery.js"></script>
	<script src="../../js/bootstrap/bootstrap.js"></script>
	<script type="text/javascript" src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>
	<script type="text/javascript" src="../../js/bootstrap/bootstrap-formhelpers.js"></script>
		<script type="text/javascript" src="../../js/datacontrol_2.js"></script>
	
	<script type="text/javascript" src="../../js/bootstrap-table.js"></script>
	
	<!-- FOR ADD PARTICIPANT MODAL -->
	<script type="text/javascript" src="../../js/jquery_ui/jquery-ui.js"></script>
	<script type="text/javascript" src="../../js/addParticipantModal.js"></script>
	
	<script type="text/javascript">
		$(".unregisterModal").on(
			"show.bs.modal",
			function(event) {
				var url = $(event.relatedTarget);
				var attendanceID = url.data("attendanceid");
				
				var modal = $(this);
				modal.find("#attendanceID").val(attendanceID);
		})
	
		$(".setStatusModal").on(
				"show.bs.modal",
				function(event) {
					var url = $(event.relatedTarget);
					var attendanceID = url.data("attendanceid");
					var status = url.data("status");
	
					var modal = $(this);
					modal.find("#attendanceID").val(attendanceID);
					modal.find("#status").val(status);
	
		})
		
		$(".attendanceModal").on(
				"show.bs.modal",
				function(event) {
					var url = $(event.relatedTarget);
					var attendanceID = url.data("attendanceid");
					var timeIn = url.data("timein");
					var timeOut = url.data("timeout");
					
					var modal = $(this);
					
					modal.find("#attendanceID").val(attendanceID);
					modal.find("#timeIn").val(timeIn);
					modal.find("#timeOut").val(timeOut);
	
		})
	</script>
	
</html>