<jsp:useBean id="oneUser"  type="java.sql.ResultSet" scope="session"/>


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
		
		<script src="../../js/jquery.js"></script>
		<script src="../../js/bootstrap/bootstrap.js"></script>
		<script type="text/javascript" src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>
		
		<script type="text/javascript" src="../../js/jquery.bootpag.min.js"></script>
		<script type="text/javascript" src="../../js/myscript.js"></script>
		
		<title>UST eTrams - All Users</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "adminHeader.jsp" %>
		<!-- End of Header -->
				
		<!-- Container -->
			<div class="container">
			 	<div class="row">
			 		<div class="col-md-12">
			 			<h1 class="page-header">
			 				<small><a href="adminUsers.jsp">All Users</a> /</small>
			 				User's name
			 			</h1>
			 			
			 			<!-- Content -->
			 			<div class="content">
			 				 <!-- Nav tabs -->
			 				 <ul class="nav nav-tabs" role="tablist">
			 				 	<li role="presentation" class="active">
			 				 		<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a>
			 				 	</li>
			 				 	<li role="presentation">
			 				 		<a href="#attendance" aria-controls="attendance" role="tab" data-toggle="tab">Attendance History</a>
			 				 	</li>
			 				 </ul>
			 				 
			 				 <!-- Tab panes -->
			 				 <div class="tab-content">
			 				 	
			 				 	<!-- Profile Tab -->
			 				 	<div role="tabpanel" class="tab-pane fade in active" id="profile">
			 				 		<div class="row account">
			 							<div class="col-sm-8 accountLeft">
			 							<%oneUser.next(); %>
			 								<h4>Name</h4>
			 								<h4><span><%=oneUser.getString("firstName")%>   <%=oneUser.getString("middleName")%> <%=oneUser.getString("lastName")%></span></h4>
			 								<br>
			 								<h4>Email</h4>
											<h4><span><%=oneUser.getString("email")%></span></h4>
											<br>
											<h4>Faculty/College/Institute</h4>
											<h4><span><%=oneUser.getString("collegeName")%></span></h4>
											<br>
											<h4>Department</h4>
											<h4><span><%=oneUser.getString("departmentName")%></span></h4>
											<br>
											<h4>User Type</h4>
											<h4><span><%=oneUser.getString("roleName")%></span></h4>
			 							</div>
			 					
			 							<div class="col-sm-4 accountRight">
			 								<div class="someButton">
			 									<button class="btn btn-yellow" data-toggle="modal" data-target="#editProfileModal">
			 										Edit Information
			 									</button>
			 								</div>
			 								<div class="someButton">
			 									<a class="btn btn-yellow" data-toggle="modal" data-target="#editUserPasswordModal">
			 										Edit Password
			 									</a>
			 								</div>
			 								<div class="someButton">
			 								<form class="form-horizontal" action="../../dbcontrol" method="post">
			 								<input type="hidden" name="requestType" value="adminManageUserDelete">
											<input type="hidden" name="accountId" value="<%=oneUser.getInt("accountId")%>">
											<input type="hidden" name="userInfoId" value="<%=oneUser.getInt("userInfoId") %>">
											
			 								<input class="btn btn-yellow" type="submit" value="Delete">
			 								</form>
			 								</div>
			 							</div>
			 						</div>
			 				 	</div>
			 				 	<!-- End of Profile Tab -->
			 				 	
			 				 	<!-- Attendance Tab -->
			 				 	<div role="tabpanel" class="tab-pane fade" id="attendance">
			 				 		<br><br>
			 				 		<table class="table table-condensed table-striped table-hover ">
										<thead>
											<tr>
												<th>#</th>
												<th>Seminar</th>
												<th>Session</th>
												<th>Time Start</th>
												<th>Time End</th>
												<th>Date</th>
												<th>Status</th>
												<th>Certification</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>001</td>
												<td>Seminar Name</td>
												<td>Session Name</td>
												<td>00:00</td>
												<td>00:00</td>
												<td>mm/dd/yyyy</td>
												<td><a href="#" data-toggle="modal" data-target="#setStatusModal">
			 										Completed
			 									</a></td>
												<td>certified</td>
											</tr>
											<tr>
												<td>002</td>
												<td>Seminar Name</td>
												<td>Session Name</td>
												<td>00:00</td>
												<td>00:00</td>
												<td>mm/dd/yyyy</td>
												<td><a href="#" data-toggle="modal" data-target="#setStatusModal">
			 										Completed
			 									</a></td>
												<td><a href="#">certify?</a></td>
											</tr>
										</tbody>
									</table>
			 				 	</div>
			 				 	<!-- End of Attendance Tab -->
			 				 	
							</div>
			 			</div>
			 			<!-- End of Content -->
			 			
			 			<!-- Modals -->
					
					

<!-- EDIT PROFILE MODAL -->
<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit Profile</h4>
			</div>
		<form class="form-horizontal" action="../../dbcontrol" method="post">
			<div class="modal-body">
			
				<!-- Name-->
            	<div class="form-group">
            		<label for="Name" class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-3">
                    	<input type="text" class="form-control" name="firstName" id="name" value="<%=oneUser.getString("firstName")%>" placeholder="First name" required />
                    </div>
                    <div class="col-sm-3">
                    	<input type="text" class="form-control" name="middleName" id="name" value="<%=oneUser.getString("middleName")%>" placeholder="Middle name" required />
                    </div>
                    <div class="col-sm-3">	
                    	<input type="text" class="form-control" name="lastName" id="name" value="<%=oneUser.getString("lastName")%>" placeholder="Last name" required />
                    </div>
            	</div>
            	
            	<!-- Email -->
            	<div class="form-group">
            		<label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="email" name="email" value="<%=oneUser.getString("email")%>" required />
                    </div>
            	</div>
                 <input type="hidden" name="requestType" value="adminManageUserDone">
									<input type="hidden" name="accountId" value="<%=oneUser.getInt("accountId")%>">
									<input type="hidden" name="userInfoId" value="<%=oneUser.getInt("userInfoId")%>">
									
                <div class="modal-footer">
                    <button type="submit" class="btn btn-yellow pull-left">Save Changes</button>
                    <button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
                </div>
            </div>
		</form>
	</div>
</div>
</div>
<!-- EDIT PROFILE MODAL -->



<!-- EDIT OTHER USER'S PASSWORD MODAL -->
<div class="modal fade" id="editUserPasswordModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit Password</h4>
			</div>
		<form class="form-horizontal" action="../../dbcontrol" method="post">
			<div class="modal-body">
            	
            	<!-- New Password-->
            	<div class="form-group">
            		<label for="New Password1" class="col-sm-4 control-label">New Password</label>
                    <div class="col-sm-8">
                    	<input type="password" class="form-control" id="password" required />
                    </div>
            	</div>
            	
            	<!-- Re-enter New Password-->
            	<div class="form-group">
            		<label for="New Password2" class="col-sm-4 control-label">Re-enter New Password</label>
                    <div class="col-sm-8">
                    	<input type="password" class="form-control" id="password" name="password" required />
                    </div>
            	</div>
                       <input type="hidden" name="requestType" value="adminEditPassword">
									<input type="hidden" name="accountId" value="<%=oneUser.getInt("accountId")%>">
									<input type="hidden" name="userInfoId" value="<%=oneUser.getInt("userInfoId")%>">
                <div class="modal-footer">
                    <button type="submit" class="btn btn-yellow pull-left">Save Changes</button>
                    <button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
                </div>
            </div>
		</form>
	</div>
</div>
</div>
<!-- EDIT OTHER USER'S PASSWORD MODAL -->

					
					
					
						<%oneUser.first(); oneUser.previous(); %>
						<%@ include file= "../modals/SeminarsAndSessionsModals.jsp" %>
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