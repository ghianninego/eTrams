<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
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
				
		<!-- Header -->
		<%@ include file= "adminHeader.jsp" %>
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
				 			ResultSet rs2 = (ResultSet) session.getAttribute("sessionParticipants");%>
			 			<!-- Login -->
			 			<div class="row">
							<div class="col-sm-4 col-sm-offset-4">
								<% 
								rs.next();
								if ((int)session.getAttribute("participantCount") < rs.getInt(6))
								{	%>
								<form class="form" action="../../dbcontrol?requestType=register" method="post">
									<div class="form-group">
										<input type="text" class="form-control" id="username" name="username" required="required" placeholder="Username">
									</div>
									<div class="form-group">
									<input type="password" class="form-control" id="password" name="password" required="required" placeholder="Password">
									</div>
									
									<div class="btn-group btn-group-justified" role="group" aria-label="...">
										<div class="btn-group" role="group">
											<button type="submit" class="btn btn-yellow">Confirm Attendance</button>
										</div>
										<div class="btn-group" role="group">
											<a type="button" class="btn btn-gray" href="../../dbcontrol?requestType=goToAdminSessions">Return to Sessions</a>
										</div>
									</div>
								</form>
								<% } else {%>
								<!--  put the message here -->
								<% } 
									rs.beforeFirst();
								%>
							</div>
						</div>
			 			<!-- End of Login -->
			 	
  						<br><br>
			 			<h3>List of Confirmed Attendies</h3>
  						<table class="table table-condensed table-striped table-hover" data-toggle="table" data-pagination="true">
							<thead>
								<tr>
									<th data-sortable="true">No.</th>
									<th data-sortable="true">Name</th>
									<th data-sortable="true">College/Faculty/Institute</th>
								</tr>
							</thead>
							<tbody>
							<%  
								int attendees = 1;		
								while (rs2.next())
								{
							%>
								<tr>
									<td><%= attendees %></td>
									<td><%= rs2.getString(9) %>, <%= rs2.getString(10) %> <%=rs2.getString(11) %></td>
									<td><%= rs2.getString(12) %></td>
								</tr>
							<% attendees++; } rs2.first(); rs2.previous(); %>
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