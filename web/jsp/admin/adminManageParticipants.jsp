<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.ResultSet" %>
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
		
		<script src="../../js/jquery.js"></script>
		<script src="../../js/bootstrap/bootstrap.js"></script>
		<script type="text/javascript" src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>
		
		<!-- FOR ADD PARTICIPANT MODAL -->
		<script type="text/javascript" src="../../js/jquery_ui/jquery-ui.js"></script>
		<script type="text/javascript" src="../../js/addParticipantModal.js"></script>

		<script type="text/javascript" src="../../js/jquery.bootpag.min.js"></script>
		<script type="text/javascript" src="../../js/myscript.js"></script>
		
		<title>UST eTrams - Seminars & Sessions</title>
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
			 		<h1 class="page-header"><small><a href="adminSeminars.jsp">Seminars</a> / 
			 			<a href="adminSessions.jsp">Session Name</a> /</small> Manage Participants</h1>
			 			
			 		<!-- For Completed Sessions -->
			 		<!-- Content -->
			 		<% ResultSet rs = (ResultSet) session.getAttribute("sessionDetails"); 
					rs.next();
					if (rs.getInt(11) == 1) 
					{
					%>
			 		<div class="content">
			 			<h3>Certified Participants</h3>
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
							<tbody>
								<%
									while(rs2.next())
									{
										if (rs2.getInt(7) == 1)
										{System.out.println("c: " + certParticipants);
								%>
								<tr>
									<td><%= certParticipants %></td>
									<td><%= rs2.getString(9) %>, <%= rs2.getString(10) %> <%=rs2.getString(11) %></td>
									<td><%= rs2.getString(12) %></td>
									<td><%= rs2.getTime(4) %></td>
									<td><%= rs2.getTime(5) %></td>
									<td><a href="#" data-toggle="modal" data-target="#setStatusModal<%=certParticipants%>">
			 							Incomplete
			 						</a></td>
									<td><a href="">Cancel certification</a> - <a href="" data-toggle="modal" data-target="#attendanceModal<%=certParticipants%>">Set Attendance</a></td>			
								</tr>
								<!-- SET STATUS MODAL -->
								<div class="modal fade" id="setStatusModal<%= certParticipants %>" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="gridSystemModalLabel">Set Status</h4>
											</div>
										<form class="form-horizontal" action="../../dbcontrol" method="post">
								            <div class="modal-body">
								            	<input type="hidden" name="requestType" value="setStatus"/>
								            	<input type="hidden" name="attendanceID" value="<%=rs2.getInt(1) %>"/>
								            	<!-- Status -->
								            	<div class="form-group">
								            		<label for="status" class="col-sm-3 control-label">Status</label>
								            		<div class="col-sm-8">
								            			<div class="bfh-selectbox" data-name="status" name="status" id="status">
								            				<div data-value="Complete" value="Complete">Complete</div>
								            				<div data-value="Incomplete" value="Incomplete">Incomplete</div>
								            			</div>
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
								<!-- SET STATUS MODAL -->
								<!-- ATTENDANCE MODAL -->
								<div class="modal fade" id="attendanceModal<%=certParticipants %>" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="gridSystemModalLabel">Set Attendance</h4>
											</div>
										<form class="form-horizontal" action="../../dbcontrol" method="post">
								            <div class="modal-body">
								            	<input type="hidden" name="requestType" value="setAttendance"/>
								            	<input type="hidden" name="attendanceID" value="<%=rs2.getInt(1) %>"/>
								            	<!-- Time In -->
								            	<div class="form-group">
								            		<label for="Time In" class="col-sm-2 control-label">Time In</label>
								            		<div class="col-sm-10">
								            			<div class="bfh-timepicker" data-mode="12h" id="timeIn" data-name="timeIn" name="timeIn"></div>
								            		</div>
								            	</div>
								            	
								            	<!-- Time Out -->
								            	<div class="form-group">
								            		<label for="Time Out" class="col-sm-2 control-label">Time Out</label>
								            		<div class="col-sm-10">
								            			<div class="bfh-timepicker" data-mode="12h" id="timeOut" data-name="timeOut" name="timeOut"></div>
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
								<% 	
								certParticipants++;	}
								    } rs2.first(); rs2.previous();%>
							</tbody>
						</table>
  							
			 			<br>
			 			
			 			<h3>Uncertified Participants</h3>
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
							<tbody>
								<%
								 
								int uncertParticipants = certParticipants;
								int counter = 1;
									while(rs2.next())
									{
										if (rs2.getInt(7) == 0)
										{ System.out.println("U: " + uncertParticipants);
								%>
								<tr>
									<td><%= counter %></td>
									<td><%= rs2.getString(9) %>, <%= rs2.getString(10) %> <%=rs2.getString(11) %></td>
									<td><%= rs2.getString(12) %></td>
									<td><%= rs2.getTime(4) %></td>
									<td><%= rs2.getTime(5) %></td>
									<td><a href="#" data-toggle="modal" data-target="#setStatusModal<%=uncertParticipants%>">
			 							Incomplete
			 						</a></td>
									<td><a href="">Certify</a> - <a href="" data-toggle="modal" data-target="#attendanceModal<%= uncertParticipants %>">Set Attendance</a></td>			
								</tr>
								<!-- SET STATUS MODAL -->
								<div class="modal fade" id="setStatusModal<%= uncertParticipants %>" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="gridSystemModalLabel">Set Status</h4>
											</div>
										<form class="form-horizontal" action="../../dbcontrol" method="post">
								            <div class="modal-body">
								            	<input type="hidden" name="requestType" value="setStatus"/>
								            	<input type="hidden" name="attendanceID" value="<%=rs2.getInt(1) %>"/>
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
								        </div>
										</form>
									</div>
								</div>
								<!-- SET STATUS MODAL -->
								<!-- ATTENDANCE MODAL -->
								<div class="modal fade" id="attendanceModal<%= uncertParticipants %>" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="gridSystemModalLabel">Set Attendance</h4>
											</div>
										<form class="form-horizontal" action="../../dbcontrol" method="post">
								            <div class="modal-body">
								            	<input type="hidden" name="requestType" value="setAttendance"/>
								            	<input type="hidden" name="attendanceID" value="<%=rs2.getInt(1) %>"/>
								            	<!-- Time In -->
								            	<div class="form-group">
								            		<label for="Time In" class="col-sm-2 control-label">Time In</label>
								            		<div class="col-sm-10">
								            			<div class="bfh-timepicker" data-mode="12h" id="timeIn" data-name="timeIn" name="timeIn"></div>
								            		</div>
								            	</div>
								            	
								            	<!-- Time Out -->
								            	<div class="form-group">
								            		<label for="Time Out" class="col-sm-2 control-label">Time Out</label>
								            		<div class="col-sm-10">
								            			<div class="bfh-timepicker" data-mode="12h" id="timeOut" data-name="timeOut" name="timeOut"></div>
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
								<% 		
							    uncertParticipants++; counter++;}
								    } rs2.first(); rs2.previous();%>
							</tbody>
						</table>
			 		</div>
			 		<% } else { %>
			 		<!-- End of Content -->
			 		
					<br><br><br><br>
			 		
			 		<!-- For Ongoing/Unfinished Sessions -->
			 		<!-- Content -->
			 		<div class="content">
			 			<h3>Registered Participants</h3>
			 			<table class="table table-condensed table-striped table-hover ">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>College/Faculty/Institute</th>
									<th>Status</th>
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
									<td><a href="../../dbcontrol?requestType=cancelRegistration&attendanceID=<%= rs2.getInt(1) %>">Cancel Registration</a></td>			
								</tr>
							<% participants++; } rs2.first(); rs2.previous(); %>
							</tbody>
						</table>
						
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
					                    	<select class="participantLists hidden">
					                        	<option value="James Suarez"></option>
					                        	<option value="Marie Rosalado"></option>
					                        	<option value="Shiarra Go"></option>
					                        	<option value="Nil Carpio"></option>
					                        	<option value="Mark Cabe"></option>
					                        	<option value="Cedrick Cancio"></option>
					                        	<option value="Epsilon Sta. Ana"></option>
					                        	<option value="Gabriel Centeno"></option>
					                        	<option value="Lyn Frias"></option>
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
					        </div>
							</form>
						</div>
					</div>
			 		<!-- Modals -->
					<!-- End of Modals -->
					
			 	</div>
			</div>
		</div>
		<!-- End of Container -->
				
		<!-- Footer -->
		<%@ include file= "../footer.jsp" %>
		<!-- End of Footer -->
				
	</body>
</html>