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
		
		<title>UST eTrams - Seminars & Sessions - Manage Certification</title>
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
			 			<a href="adminSessions.jsp"><%= (String) session.getAttribute("sessionName") %></a> /</small> Manage Certifications</h1>
			 			
			 		<!-- Content -->
			 		<div class="content">
			 		<% ResultSet rs = (ResultSet) session.getAttribute("sessionDetails"); 
			 		DateFormat format = new SimpleDateFormat( "h:mm a" );
	 				DateFormat df = new SimpleDateFormat("MM/dd/yyyy");	
					rs.next();
					if (rs.getInt(11) == 1) 
					{
					%>
			 			<div class="row options">
			 			
			 				<!-- Filter Data -->
							<div class="col-sm-2">
								<div class="input-group">
										<div class="bfh-selectbox" data-name="filterData" data-value="All" id="filterData">
											<div data-value="All">All</div>
											<div data-value="Certified">Certified</div>
											<div data-value="Uncertified">Uncertified</div>
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
									<th data-sortable="true">#</th>
									<th data-sortable="true">Name</th>
									<th data-sortable="true">College/Faculty/Institute</th>
									<th data-sortable="true">Time In</th>
									<th data-sortable="true">Time Out</th>
									<th data-sortable="true">Certification</th>
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
									<td><% if (rs2.getInt(7) == 1) { %> Certified <% } else { %> Uncertified <% } %> </td>
			 						<td><% if (rs2.getInt(7) == 1) { %> <a href="#" data-toggle="modal" data-target="#certifyModal" data-attendanceid="<%=rs2.getInt(1)%>" data-certification="0">Cancel Certification</a> <% } else { %> <a href="#" data-toggle="modal" data-target="#certifyModal" data-attendanceid="<%=rs2.getInt(1)%>" data-certification="1">Approve Certification</a> <% } %></td>			
								</tr>
								
								<% 	
								certParticipants++;	} rs2.first(); rs2.previous(); 
								    } 
								else {
								%>
								<tr> <td>This session is not yet completed. Certification isn't available until session completion</td> </tr>
								<% } %>
							</tbody>
						</table>
						
						<!-- Announcements pagination -->
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
								
								<!-- CERTIFY MODAL -->
								<div class="modal fade certifyModal" id="certifyModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
									<div class="modal-dialog modal-sm" role="document">
									<form action="../../dbcontrol" method="post">
										<div class="modal-content">
											<div class="modal-body text-center">
												<p id="certText">Are you sure you want to certify this participant?</p>
												<div class="someButton text-center">
													<input type="hidden" name="requestType" value="certify" />
													<input type="hidden" id="certification" name="certification" value="" />
													<input type="hidden" id="attendanceID" name="attendanceID" value="" />
												
													<button type="submit" class="btn btn-default">Yes</button>
													<button type="button" class="btn btn-gray" data-dismiss="modal">Cancel</button>
												</div>
											</div>
										</div>
									</form>
									</div>
								</div>
								<!-- CERTIFY MODAL -->
								
	</body>

	<script src="../../js/jquery.js"></script>
	<script src="../../js/bootstrap/bootstrap.js"></script>
	<script type="text/javascript" src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>
	<script type="text/javascript" src="../../js/bootstrap/bootstrap-formhelper.js"></script>
	<script type="text/javascript" src="../../js/bootstrap-table.js"></script>
	<script type="text/javascript" src="../../js/datacontrol_2.js"></script>
	
	<!-- FOR ADD PARTICIPANT MODAL -->
	<script type="text/javascript" src="../../js/jquery_ui/jquery-ui.js"></script>
	<script type="text/javascript" src="../../js/addParticipantModal.js"></script>
	
	<script type="text/javascript">
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
	</script>
	
</html>