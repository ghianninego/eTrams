<jsp:useBean id="user" class="eTrams.model.FinalUserBean"  scope="session"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "eTrams.security.Security" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link type="text/css" rel="stylesheet" href="../../css/style.css" />
		<link type="text/css" rel="stylesheet" href="../../css/headerAndFooter.css" />
		<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="../../css/bootstrap-formhelpers.css" rel="stylesheet" type="text/css" />
		
		<title>UST eTrams - My Account</title>
	</head>
	
	<body>
		<%if(request.getParameter("flag") == null){} 
			else if(request.getParameter("flag").equals("0")){ %>
		<div class="row" >
			<div class="alert alert-danger alert-dismissible fade in failedDeactivation" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<b><strong>Password Mismatch!</strong> </b>
			</div>
		</div>
		<% } else if(request.getParameter("flag").equals("1")){ %>
		<div class="row" id="successfulUpdate">
			<div class="alert alert-success alert-dismissible fade in" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<b><strong>Password Successfully Changed</strong> </b>
			</div>
		</div>
		<%} else if(request.getParameter("flag").equals("2")){ %>
		<div class="row" id="successfulUpdate">
			<div class="alert alert-success alert-dismissible fade in" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<b><strong>Information Successfully Changed</strong> </b>
			</div>
		</div>
		<%} %>
		
		<!-- Header -->
		<%@ include file= "adminHeader.jsp" %>
		<!-- End of Header -->
				
		<!-- Container -->
		<div class="container">
			<div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header">My Account</h1>
			 		
			 		<!-- Content -->
			 		<div class="content">
			 			<div class="row account">
			 				<div class="col-sm-8 accountLeft">
			 					<h4>Name</h4>
			 					<h4><span>${user.firstName }  ${user.middleName } ${user.lastName }</span></h4>
			 					<br>
			 					<h4>Username</h4>
			 					<h4><span><%= Security.decrypt(user.getUsername()) %></span></h4>
			 					<br>
			 					<h4>Email</h4>
								<h4><span>${user.email}</span></h4>
								<br>
								<h4>Faculty/College/Institute</h4>
								<h4><span>${user.collegeName}</span></h4>
								<br>
								<h4>Department</h4>
								<h4><span>${user.departmentName}</span></h4>
								<br>
								<h4>User Type</h4>
								<h4><span>${user.roleName}</span></h4>
			 				</div>
			 				
			 				<div class="col-sm-4 accountRight">
			 					<div class="someButton">
			 						<a class="btn btn-yellow" data-toggle="modal" data-target="#editProfileModal">
			 							Edit Information
			 						</a>
			 					</div>
			 					<div class="someButton">
			 						<a class="btn btn-yellow" data-toggle="modal" data-target="#editPasswordModal">
			 							Edit Password
			 						</a>
			 					</div>
			 				</div>
			 			</div>
			 		</div>
			 		<!-- End of Content -->
			 		
			 		<!-- Modals -->
					<!-- EDIT PASSWORD MODAL -->
					<div class="modal fade" id="editPasswordModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="gridSystemModalLabel">Edit Password</h4>
								</div>
							<form class="form-horizontal" action="../../dbcontrol" method="post" data-toggle="validator">
								<div class="modal-body">
									
									<!-- Old Password-->
									<div class="form-group">
										<label for="New Password1" class="col-sm-4 control-label">Old Password</label>
										<div class="col-sm-8">
											<input type="password" class="form-control" name="oldPassword" id="oldPassword" placeholder="minimum of 6 characters" pattern=".{6,}" required />
										</div>
									</div>
									
									<!-- New Password-->
									<div class="form-group has-feedback">
										<label for="New Password1" class="col-sm-4 control-label">New Password</label>
										<div class="col-sm-8">
											<input type="password" class="form-control" id="newPassword1" placeholder="minimum of 6 characters" pattern=".{6,}" required />
										</div>
										
									</div>
									
									<!-- Re-enter New Password-->
									<div class="form-group has-feedback">
										<label for="New Password2" class="col-sm-4 control-label">Re-enter New Password</label>
										<div class="col-sm-8">
											<input type="password" class="form-control" id="newPassword2" name="password" placeholder="minimum of 6 characters" pattern=".{6,}" 
												data-match="#newPassword1" data-match-error="These passwords don't match." required />
											<div class="help-block with-errors"></div>
										</div>
									</div>
									
									<input type="hidden" name="requestType" value="editSelfPassword">
									<input type="hidden" name="accountId" value="<%=user.getAccountID()%>">
									<input type="hidden" name="userInfoId" value="<%=user.getUserInfoID()%>">
								</div>
								
								<div class="modal-footer">
									<button type="submit" class="btn btn-yellow pull-left">Save Changes</button>
									<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
								</div>
							</form>
							</div>
						</div>
					</div>
					<!-- EDIT PASSWORD MODAL -->
					
					<!-- EDIT PROFILE MODAL -->
					<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="gridSystemModalLabel">Edit Profile</h4>
								</div>
							<form class="form-horizontal" action="../../dbcontrol" method="post" data-toggle="validator">
								<div class="modal-body">
								
									<!-- Name-->
									<div class="form-group">
										<label for="Name" class="col-sm-2 control-label">Name</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="firstName" id="name" value="${user.firstName }" placeholder="First name" pattern="[a-zA-Z- ]+" required />
										</div>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="middleName" id="name" value="${user.middleName }" placeholder="Middle name" pattern="[a-zA-Z- ]+" />
										</div>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="lastName" id="name" value="${user.lastName }" placeholder="Last name" pattern="[a-zA-Z- ]+" required />
										</div>
									</div>
									
									<!-- Email -->
									<div class="form-group">
										<label for="email" class="col-sm-2 control-label">Email</label>
										<div class="col-sm-9">
											<input type="email" class="form-control" id="email" name="email" value="${user.email }" required />
										</div>
									</div>
									
									<input type="hidden" name="requestType" value="editSelfInfo">
									<input type="hidden" name="accountId" value="<%=user.getAccountID()%>">
									<input type="hidden" name="userInfoId" value="<%=user.getUserInfoID()%>">
								</div>
								
								<div class="modal-footer">
									<button type="submit" class="btn btn-yellow pull-left">Save Changes</button>
									<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
								</div>
							</form>
							</div>
						</div>
					</div>
					<!-- EDIT PROFILE MODAL -->
					
					<!-- End of Modals -->
					
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
	<script type="text/javascript" src="../../js/validator.js"></script>
	
	<script type="text/javascript" src="../../js/myscript.js"></script>
	
</html>