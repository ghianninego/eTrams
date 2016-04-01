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
		<link href="../../css/jquery_ui/jquery-ui.css" rel="stylesheet" type="text/css" />
		<link href="../../css/jquery_ui/jquery-ui.structure.css" rel="stylesheet" type="text/css" />
		
		<title>UST eTrams - Seminars & Sessions - Manage Participants</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "adminHeader.jsp" %>
		<!-- End of Header -->
		<% ResultSet rs2 = (ResultSet) session.getAttribute("sessionParticipants"); 
			int participants = 1;
			int certParticipants = 1;
		%>
		<!-- Container -->
		<div class="container">
			 <div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header"><small><a href="adminSeminars.jsp"><%= (String) session.getAttribute("seminarName") %></a> / 
			 			<a href="adminSessions.jsp"><%= (String) session.getAttribute("sessionName") %></a> /</small> Manage Participants</h1>
			 			
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
						
							<!-- Search -->
							<div class="col-sm-offset-4 col-sm-3">
								<form method="post" action="">
									<div class="input-group">
										<input name="search" type="text" class="form-control" placeholder="Search">
										<span class="input-group-btn">
											<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
										</span>
									</div>
								</form>
							</div>
							<!-- End of Search -->
						</div>
						
						<br>
						
  						<table class="table table-condensed table-striped table-hover ">
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
							<tbody id="someTable">
								<%
									while(rs2.next())
									{
										String timeIn = format.format(rs2.getTime(4));
										String timeOut = format.format(rs2.getTime(5));
										if (rs2.getInt(7) == 1)
										{System.out.println("c: " + certParticipants);
								%>
								<tr>
									<td><%= certParticipants %></td>
									<td><%= rs2.getString(9) %>, <%= rs2.getString(10) %> <%=rs2.getString(11) %></td>
									<td><%= rs2.getString(12) %></td>
									<td><%= timeIn %></td>
									<td><%= timeOut %></td>
									<td><a href="#" data-toggle="modal" data-target="#setStatusModal" data-attendanceid="<%=rs2.getInt(1)%>">
			 							<%=rs2.getString(6) %>
			 						</a></td>
									<td><a href="" data-toggle="modal" data-target="#attendanceModal" data-attendanceid="<%=rs2.getInt(1) %>">Set Attendance</a></td>			
								</tr>
								
								<% 	
								certParticipants++;	}
								    } rs2.first(); rs2.previous();%>
							</tbody>
						</table>
						
						<!-- Announcements pagination -->
						<p id="legend1"></p>
						<div class="holder text-center">
        				</div>
						<!-- End of Announcements pagination -->
						
					</div>
			 		<!-- End of Content -->
			 		
			 		<% } else { %>
			 		
			 		<!-- For Ongoing/Unfinished Sessions -->
			 		<!-- Content -->
			 		<div class="content">
			 			<div class="row options">
			 			
			 				<!-- Filter Data -->
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
						
							<!-- Search -->
							<div class="col-sm-offset-4 col-sm-3">
								<form method="post" action="">
									<div class="input-group">
										<input name="search" type="text" class="form-control" placeholder="Search">
										<span class="input-group-btn">
											<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
										</span>
									</div>
								</form>
							</div>
							<!-- End of Search -->
						</div>
						
						<br>
						
			 			<table class="table table-condensed table-striped table-hover ">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>College/Faculty/Institute</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody id="someTable">
							<% 
								while (rs2.next())
								{
									
							%>
								<tr>
									<td><%= participants %></td>
									<td><%= rs2.getString(9) %>, <%= rs2.getString(10) %> <%=rs2.getString(11) %></td>
									<td><%= rs2.getString(12) %></td>
									<td><a href="../../dbcontrol?requestType=cancelRegistration&attendanceID=<%= rs2.getInt(1) %>">Cancel Registration</a></td>			
								</tr>
							<% participants++; } rs2.first(); rs2.previous(); %>
							</tbody>
						</table>
						
						<!-- Announcements pagination -->
						<p id="legend1"></p>
						<div class="holder text-center">
        				</div>
						<!-- End of Announcements pagination -->
						
						<br>
						<div class="someButton">
  							<button type="button" class="btn btn-yellow" data-toggle="modal" data-target="#addParticipantsModal">
  							<span class="glyphicon glyphicon-plus"></span> Add Participants</button>
  						</div>
  						
			 		</div>
			 		<% } rs.previous(); %>
			 		<!-- End of Content -->
			 		
					<!-- ADD PARTICIPANTS_MODAL -->
					<div class="modal fade addParticipantsModal" id="addParticipantsModal" tabindex="-1" role="dialog">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title">Add Participants</h4>
								</div>
							<form class="form-horizontal" action="../../dbcontrol" method="post">
					            <div class="modal-body">
					            	<input type="hidden" name="requestType" value="addParticipants"/>
									<div class="form-group">
										<label for="Participant Names" class="col-sm-2 control-label" id="participantLabel" >Participants (1)</label>
										<div class="col-sm-10">
					                    	<!-- MUST STORE ALL NAMES FROM DATABASE TO HIDDEN SELECT -->	                    	
						                    <% ResultSet rs3 = (ResultSet) session.getAttribute("allParticipants"); %>
					                    	<select class="participantLists hidden">
					                    	<% while(rs3.next())
					                    		{ %>
					                        	<option value="<%=rs3.getInt(1)%>"> <%= rs3.getString(2) %>, <%= rs3.getString(3) %> <%= rs3.getString(4) %> </option>
					                        <% } rs3.first(); rs3.previous();%>
					                        </select>
					                    	<!-- MUST STORE ALL NAMES FROM DATABASE TO HIDDEN SELECT -->
					
					                        
											<div class="row participantList">
												<div id="participantGroup_1">
													<div class="col-sm-2">
														<label class="control-label">Participant 1</label>
													</div>
													<div class="col-sm-10">
														<div class="input-group ui-widget">
															<input type="text" id="participant_1" name="participants" class="form-control" placeholder="Please type the participant's name here" required />
															<div class="input-group-addon"><button type="button" onclick="return addParticipant()" class="glyphicon glyphicon-plus"></button></div>
														</div>
													</div>
												</div>
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
					<!-- ATTENDANCE MODAL -->
					
			 	</div>
			</div>
		</div>
		<!-- End of Container -->
				
		<!-- Footer -->
		<%@ include file= "../footer.jsp" %>
		<!-- End of Footer -->
								
								
								
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
								            	<div class="form-group">`
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
	</body>

	<script src="../../js/jquery.js"></script>
	<script src="../../js/bootstrap/bootstrap.js"></script>
	<script type="text/javascript" src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>
	<script type="text/javascript" src="../../js/bootstrap/bootstrap-formhelper.js"></script>
	
	<script type="text/javascript" src="../../js/jPages.min.js"></script>
	<script type="text/javascript" src="../../js/pagination.js"></script>
	
	<!-- FOR ADD PARTICIPANT MODAL -->
	<script type="text/javascript" src="../../js/jquery_ui/jquery-ui.js"></script>
	<script type="text/javascript" src="../../js/addParticipantModal.js"></script>
	
	<script type="text/javascript">
		$(".setStatusModal").on(
				"show.bs.modal",
				function(event) {
					var url = $(event.relatedTarget);
					var attendanceID = url.data("attendanceid");
					
	
					var modal = $(this);
					modal.find("#attendanceID").val(attendanceID);
	
		})
		
		$(".certifyModal").on(
				"show.bs.modal",
				function(event) {
					var url = $(event.relatedTarget);
					var attendanceID = url.data("attendanceid");
					var certification = url.data("certification");
					
					alert(attendanceID);
					
					var modal = $(this);
					
					if(certification == "1"){
						modal.find("#certText").text("Are you sure you want to certify this participant?");
					}else if(certification == "0"){
						modal.find("#certText").text("Are you sure you want to uncertify this participant?");
					}
					modal.find("#certification").val(certification);
					modal.find("#attendanceID").val(attendanceID);
	
		})
		
		$(".attendanceModal").on(
				"show.bs.modal",
				function(event) {
					var url = $(event.relatedTarget);
					var attendanceID = url.data("attendanceid");
					
					
					var modal = $(this);
					
					modal.find("#attendanceID").val(attendanceID);
	
		})
	</script>
	
</html>