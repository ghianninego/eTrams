<jsp:useBean id="oneUser" type="java.sql.ResultSet" scope="session" />
<jsp:useBean id="history" type="java.sql.ResultSet" scope="session" />
<jsp:useBean id="role" type="java.sql.ResultSet" scope="session" />

<%@ page import = "java.text.SimpleDateFormat" %>
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
	<link href="../../css/bootstrap-table.css" rel="stylesheet" type="text/css" />

	<title>UST eTrams - All Users - Manage Users</title>
</head>

<body>

	<!-- Header -->
	<%@ include file="coordinatorHeader.jsp"%>
	<!-- End of Header -->

	<!-- Container -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<%
					oneUser.next();
				%>
				<h1 class="page-header">
					<small><a href="coordinatorUsers.jsp">All Users</a> /</small>
					<%=oneUser.getString("userName")%>
				</h1>

				<!-- Content -->
				<div class="content">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#profile"
							aria-controls="profile" role="tab" data-toggle="tab">Profile</a>
						</li>
						<li role="presentation"><a href="#attendance"
							aria-controls="attendance" role="tab" data-toggle="tab">Attendance
								History</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">

						<!-- Profile Tab -->
						<div role="tabpanel" class="tab-pane fade in active" id="profile">
							<div class="row account">
								<div class="col-sm-8">

									<h4>Name</h4>
									<h4>
										<span><%=oneUser.getString("firstName")%> <%=oneUser.getString("middleName")%>
											<%=oneUser.getString("lastName")%></span>
									</h4>
									<br>
									<h4>Username</h4>
									<h4>
										<span><%=oneUser.getString("userName")%></span>
									</h4>
									<br>
									<h4>Email</h4>
									<h4>
										<span><%=oneUser.getString("email")%></span>
									</h4>
									<br>
									<h4>Faculty/College/Institute</h4>
									<h4>
										<span><%=oneUser.getString("collegeName")%></span>
									</h4>
									<br>
									<h4>Department</h4>
									<h4>
										<span><%=oneUser.getString("departmentName")%></span>
									</h4>
									<br>
									<h4>User Type</h4>
									<h4>
										<span><%=oneUser.getString("roleName")%></span>
									</h4>
								</div>
							</div>
						</div>
						<!-- End of Profile Tab -->

						<!-- Attendance Tab -->
						<%if (oneUser.getString("roleName").equals("Admin") || oneUser.getString("roleName").equals("Staff")) { %>
			 				<div role="tabpanel" class="tab-pane fade" id="attendance">
			 					<br>
			 					<h4 style="padding-left: 35px;">There is no attendance history for this type of user.</h4>
			 				</div>
			 			
			 			<% } else { %>
			 			
							<div role="tabpanel" class="tab-pane fade" id="attendance">
								<br>
								<div class="row options">
			 						<!-- Search -->
									<div class="col-sm-offset-9 col-sm-3">
										<form method="post" action="../../dbcontrol">
											<input type="hidden" name="requestType" value="searchName">
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
			 				
								<table class="table table-condensed table-striped table-hover" data-toggle="table" data-pagination="true">
									<thead>
										<tr>
											<th>#</th>
											<th>Seminar</th>
											<th>Session</th>
											<th>Time Start</th>
											<th>Time End</th>
											<th>Date</th>
											<th data-field="status">Status</th>
											<th data-field="certification">Certification</th>
										</tr>
									</thead>
									<tbody>
									<%
										SimpleDateFormat timeFormat = new SimpleDateFormat("h:mm a");
										SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
										
										while (history.next()) {
											String timeIn = timeFormat.format(history.getTime("TimeIn"));
											String timeOut = timeFormat.format(history.getTime("TimeOut"));
									%>
										<tr>
											<td><%=history.getInt("attendanceID")%></td>
											<td><%=history.getString("seminarName")%></td>
											<td><%=history.getString("sessionName")%></td>
										<% if (history.getInt("completion") == 0) { %>
											<td>n/a</td>
											<td>n/a</td>
											<td>n/a</td>
											<td>n/a</td>
											<td>n/a</td>
										<% } else { %>
											<td><%=timeIn%></td>
											<td><%=timeOut%></td>
											<td><%=TimeDateConverterClass.convertToStringDate(history.getString("Date"))%></td>
											<td><%=history.getString("Status") %></td>
											<td>
												<% if(history.getInt("Certification") == 1) {%>
													Certified <% } else { %> Uncertified <% } %>
											</td>
										<% } %>
										</tr>
									<%
										}
										history.first();
										history.previous();
									%>
									</tbody>
								</table>
								
							</div>
						<% } %>
						<!-- End of Attendance Tab -->

					</div>
				</div>
				<!-- End of Content -->

			</div>
		</div>
	</div>
	<!-- End of Container -->

	<!-- Footer -->
	<%@ include file="../footer.jsp"%>
	<!-- End of Footer -->

</body>

<script src="../../js/jquery.js"></script>
<script src="../../js/bootstrap/bootstrap.js"></script>
<script type="text/javascript" src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>
<script type="text/javascript" src="../../js/bootstrap-table.js"></script>

</html>