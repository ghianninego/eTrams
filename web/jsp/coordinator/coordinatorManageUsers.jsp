<%@ page import = "java.text.DateFormat" %>
<%@ page import = "java.text.SimpleDateFormat" %>

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
				<h1 class="page-header">
					<small><a href="coordinatorUsers.jsp">All Users</a> /</small>
					User Name
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
								<div class="col-sm-8 accountLeft">

									<h4>Name</h4>
									<h4>
										<span>id=firstName id=middleName id=lastName</span>
									</h4>
									<br>
									<h4>Username</h4>
									<h4>
										<span>id=username</span>
									</h4>
									<br>
									<h4>Email</h4>
									<h4>
										<span>id=email</span>
									</h4>
									<br>
									<h4>Faculty/College/Institute</h4>
									<h4>
										<span>id=collegeName</span>
									</h4>
									<br>
									<h4>Department</h4>
									<h4>
										<span>id=departmentName</span>
									</h4>
									<br>
									<h4>User Type</h4>
									<h4>
										<span>id=roleName</span>
									</h4>
								</div>

							</div>
						</div>
						<!-- End of Profile Tab -->

						<!-- Attendance Tab -->
					<!--
						if (oneUser.getString("roleName").equals("Admin") || oneUser.getString("roleName").equals("Staff")) {
			 				<div role="tabpanel" class="tab-pane fade" id="attendance">
			 					<br>
			 					<h4 style="padding-left: 35px;">There is no attendance history for this type of user.</h4>
			 				</div>
			 			
			 			} else {
			 			
					 -->
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
											<th data-sortable="true">#</th>
											<th data-sortable="true">Seminar</th>
											<th data-sortable="true">Session</th>
											<th data-sortable="true">Time Start</th>
											<th data-sortable="true">Time End</th>
											<th data-sortable="true">Date</th>
											<th data-field="status" data-sortable="true">Status</th>
											<th data-field="certification" data-sortable="true">Certification</th>
										</tr>
									</thead>
									<tbody id="someTable">
									<%
										DateFormat timeFormat = new SimpleDateFormat("h:mm a");
										DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
										
										//while (history.next()) {
											//String timeIn = timeFormat.format(history.getTime("TimeIn"));
											//String timeOut = timeFormat.format(history.getTime("TimeOut"));
									%>
										<tr>
											<td><%//=history.getInt("attendanceID")%></td>
											<td><%//=history.getString("seminarName")%></td>
											<td><%//=history.getString("sessionName")%></td>
											<td><%//=timeIn%></td>
											<td><%//=timeOut%></td>
											<td><%//=history.getString("Date")%></td>
											<td><a href="#" data-toggle="modal" data-target="#setStatusModal"
												data-attendanceid="<%//=history.getInt("attendanceID")%>" data-status="<%//=history.getString("Status")%>">
												<%//=history.getString("Status") %>
											</a></td>
											<td>
												<% //if(history.getInt("Certification") == 1)  { %>
													Certified
												<% //} else { %>
													<a href="#" data-toggle="modal" data-target="#certificationModal">Uncertified</a>
												<%// } %>
											</td>
										</tr>
									<!--  
										}
										history.first();
										history.previous();
									-->
									</tbody>
								</table>
								
							</div>
					<!-- } -->
						<!-- End of Attendance Tab -->

					</div>
				</div>
				<!-- End of Content -->

				<!-- Modals -->
				<!-- EDIT PROFILE MODAL -->
				<div class="modal fade editProfileModal" id="editProfileModal"
					tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="gridSystemModalLabel">Edit
									Profile</h4>
							</div>
							<form class="form-horizontal" action="../../dbcontrol"
								method="post">
								<div class="modal-body">

									<!-- Name-->
									<div class="form-group">
										<label for="Name" class="col-sm-2 control-label">Name</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="firstName"
												id="firstName" value="" placeholder="First name"
												required />
										</div>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="middleName"
												id="middleName" value="" placeholder="Middle name"
												required />
										</div>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="lastName"
												id="lastName" value="" placeholder="Last name" required />
										</div>
									</div>

									<!-- Email -->
									<div class="form-group">
										<label for="email" class="col-sm-2 control-label">Email</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="email"
												name="email" value="" required />
										</div>
									</div>

									<input type="hidden" name="requestType"
										value="adminManageUserDone"> <input type="hidden"
										name="accountId" id="accountId" value=""> <input
										type="hidden" name="userInfoId" id="userInfoId" value="">
								</div>

								<div class="modal-footer">
									<button type="submit" class="btn btn-yellow pull-left">Save
										Changes</button>
									<button type="button" class="btn btn-gray pull-left"
										data-dismiss="modal">Cancel</button>
								</div>

							</form>
						</div>
					</div>
				</div>
				<!-- EDIT PROFILE MODAL -->

				<!-- EDIT OTHER USER'S PASSWORD MODAL -->
				<div class="modal fade editUserPasswordModal"
					id="editUserPasswordModal" tabindex="-1" role="dialog"
					aria-labelledby="gridSystemModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="gridSystemModalLabel">Edit
									Password</h4>
							</div>
							<form class="form-horizontal" action="../../dbcontrol"
								method="post">
								<div class="modal-body">

									<!-- New Password-->
									<div class="form-group">
										<label for="New Password1" class="col-sm-4 control-label">New
											Password</label>
										<div class="col-sm-8">
											<input type="password" class="form-control" id="password"
												required />
										</div>
									</div>

									<!-- Re-enter New Password-->
									<div class="form-group">
										<label for="New Password2" class="col-sm-4 control-label">Re-enter
											New Password</label>
										<div class="col-sm-8">
											<input type="password" class="form-control" id="password"
												name="password_confirm" required />
										</div>
									</div>

									<input type="hidden" name="requestType"
										value="adminEditPassword"> <input type="hidden"
										name="accountId" id="accountId"
										value="<%//=oneUser.getInt("accountId")%>"> <input
										type="hidden" name="userInfoId" id="userInfoId"
										value="<%//=oneUser.getInt("userInfoId")%>">
								</div>

								<div class="modal-footer">
									<button type="submit" class="btn btn-yellow pull-left">Save
										Changes</button>
									<button type="button" class="btn btn-gray pull-left"
										data-dismiss="modal">Cancel</button>
								</div>

							</form>
						</div>
					</div>
				</div>
				<!-- EDIT OTHER USER'S PASSWORD MODAL -->

				<!-- DELETE MODAL -->
				<div class="modal fade deleteModal" id="deleteModal" tabindex="-1"
					role="dialog" aria-labelledby="gridSystemModalLabel">
					<div class="modal-dialog modal-sm" role="document">
						<div class="modal-content">
							<form class="form-horizontal" action="../../dbcontrol"
								method="post">
								<div class="modal-body text-center">
									<p>Are you sure you want to delete this account?</p>

									<input type="hidden" name="requestType"
										value="adminManageUserDelete"> <input type="hidden"
										name="accountId" id="accountId"
										value="<%//=oneUser.getInt("accountId")%>"> <input
										type="hidden" name="userInfoId" id="userInfoId"
										value="<%//=oneUser.getInt("userInfoId")%>">

									<div class="someButton text-center">
										<button type="submit" class="btn btn-default">Yes</button>
										<button type="button" class="btn btn-gray"
											data-dismiss="modal">Cancel</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- DELETE MODAL -->

				<!-- CERTIFY MODAL -->
				<div class="modal fade" id="certifyModal" tabindex="-1"
					role="dialog" aria-labelledby="gridSystemModalLabel">
					<div class="modal-dialog modal-sm" role="document">
						<form>
							<div class="modal-content">
								<div class="modal-body text-center">
									<p>Are you sure you want to certify this participant?</p>
									<div class="someButton text-center">
										<button type="submit" class="btn btn-default">Yes</button>
										<button type="button" class="btn btn-gray"
											data-dismiss="modal">Cancel</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- CERTIFY MODAL -->

				<%@ include file="../modals/SeminarsAndSessionsModals.jsp"%>
				<!-- End of Modals -->

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
	
<script type="text/javascript">
	$(".editProfileModal").on("show.bs.modal", function(event) {
		var url = $(event.relatedTarget);
		var fName = url.data("fname");
		var mName = url.data("mname");
		var lName = url.data("lname");
		var accountID = url.data("accountid");
		var userID = url.data("userid");
		var email = url.data("email");

		var modal = $(this);
		modal.find("#firstName").val(fName);
		modal.find("#middleName").val(mName);
		modal.find("#lastName").val(lName);
		modal.find("#accountId").val(accountID);
		modal.find("#userInfoId").val(userID);
		modal.find("#email").val(email);

	});

	$(".editUserPasswordModal").on("show.bs.modal", function(event) {
		var url = $(event.relatedTarget);
		var accountID = url.data("accountid");
		var userID = url.data("userid");

		var modal = $(this);
		modal.find("#accountId").val(accountID);
		modal.find("#userInfoId").val(userID);

	});

	$(".setStatusModal").on("show.bs.modal", function(event) {
		var url = $(event.relatedTarget);
		var attendanceID = url.data("attendanceid");
		var status = url.data("status");

		var modal = $(this);
		modal.find("#attendanceID").val(attendanceID);
		modal.find("#status").val(status);

	})
	
	$(".certifyModal").on("show.bs.modal", function(event) {
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
	
	$(".deleteModal").on("show.bs.modal", function(event) {
		var url = $(event.relatedTarget);
		var accountID = url.data("accountid");
		var userID = url.data("userid");

		var modal = $(this);
		modal.find("#accountId").val(accountID);
		modal.find("#userInfoId").val(userID);

	});
</script>
</html>