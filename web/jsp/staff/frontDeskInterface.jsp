<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
		
		<title>UST eTrams - Seminars & Sessions - Front-Desk Interface</title>
	</head>
	
	<body>
	<%if(request.getParameter("flag") == null){} 
		else if(request.getParameter("flag").equals("0")){ %>
		<div class="row" >
			<div class="alert alert-danger alert-dismissible fade in failedDeactivation" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<b><strong>The username and password you entered did not match.</strong></b>
			</div>
		</div>
	<% } else if(request.getParameter("flag").equals("1")){ %>
		<div class="row" id="successfulUpdate">
			<div class="alert alert-success alert-dismissible fade in" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<b><strong> Successfully Confirmed!</strong> </b>
			</div>
		</div>
	<%} %>
				
		<!-- Header -->
		<%@ include file= "staffHeader.jsp" %>
		<!-- End of Header -->
		
		<!-- Container -->
		<div class="container">
			 <div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header">Front-Desk Interface</h1>
			 			
			 		<!-- Content -->
			 		<div class="content">
			 			<h3	class="text-center"><span style="font-size: 20px !important;"><%= session.getAttribute("seminarName") %>:</span><br><%= session.getAttribute("sessionName") %></h3>
			 			<br><br>
			 			<% ResultSet rs = (ResultSet) session.getAttribute("sessionDetails");  
				 			ResultSet rs2 = (ResultSet) session.getAttribute("sessionParticipants");
				 			DateFormat format = new SimpleDateFormat( "h:mm a" );
	 						DateFormat df = new SimpleDateFormat("MM/dd/yyyy");	%>
			 			<!-- Login -->
			 			<div class="row">
			 			<% 
							rs.next();
							if ((int)session.getAttribute("registeredParticipantCount") < (int) session.getAttribute("participantCount"))
							{
						%>
							<div class="col-sm-4 col-sm-offset-4">	
								<form class="form" action="../../dbcontrol" method="post">
									<div class="form-group">
										<input type="text" class="form-control" id="username" name="username" required="required" placeholder="Username">
									</div>
									<div class="form-group">
									<input type="password" class="form-control" id="password" name="password" required="required" placeholder="Password">
									</div>
									<input type="hidden" name="requestType" value="register"/>
									<input type="hidden" name="sessionID" value="<%= rs.getInt(1) %>"/>
									<div class="btn-group btn-group-justified" role="group" aria-label="...">
										<div class="btn-group" role="group">
											<button type="submit" class="btn btn-yellow">Confirm Attendance</button>
										</div>
										<div class="btn-group" role="group">
											<a type="button" class="btn btn-gray" href="../../dbcontrol?requestType=goToStaffSession&seminarID=<%= session.getAttribute("seminarID")%>&seminarName=<%= session.getAttribute("seminarName")%>"">Return to Sessions</a>
										</div>
									</div>
								</form>
							</div>
						<% } else {%>
							<div class="col-sm-8 col-sm-offset-2">
								<h4 class="text-center">All Participants have been able to confirm their attendance for this session.</h4>
								<div class="text-center">
									<a type="button" class="btn btn-gray" href="../../dbcontrol?requestType=goToStaffSession&seminarID=<%= session.getAttribute("seminarID")%>&seminarName=<%= session.getAttribute("seminarName")%>"">Return to Sessions</a>
								</div>
							</div>
						<% } 
							rs.beforeFirst();
						%>
							
						</div>
			 			<!-- End of Login -->
			 	
  						<br><br>
			 			<h3>List of Confirmed Attendies</h3>
  						<table class="table table-condensed table-striped table-hover" data-toggle="table" data-pagination="true">
							<thead>
								<tr>
									<th>No.</th>
									<th>Name</th>
									<th>College/Faculty/Institute</th>
									<th>Time In</th>
								</tr>
							</thead>
							<tbody>
							<%  
								int attendees = 1;		
								while (rs2.next())
								{
									String timeIn = format.format(rs2.getTime(4));
									if (!timeIn.equals("12:00 AM"))
									{
							%>
									<tr>
										<td><%= attendees %></td>
										<td><%= rs2.getString(9) %>, <%= rs2.getString(10) %> <%=rs2.getString(11) %></td>
										<td><%= rs2.getString(12) %></td>
										<td><%= timeIn %></td>
									</tr>
							<% 		attendees++;
									}
								
								} rs2.first(); rs2.previous(); %>
							</tbody>
						</table>
						
						<!-- Announcements pagination -->
						<p id="legend1"></p>
						<div class="holder text-center">
        				</div>
						<!-- End of Announcements pagination -->
			 		</div>
			 		<!-- End of Content -->
					
			 	</div>
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
	<script type="text/javascript" src="../../js/bootstrap-table.js"></script>
	
</html>