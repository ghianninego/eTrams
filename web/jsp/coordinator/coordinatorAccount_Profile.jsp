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
		
		<title>UST eTrams - My Account: Profile</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "coordinatorHeader.jsp" %>
		<!-- End of Header -->
				
		<!-- Container -->
		<div class="container">
			<div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header"><small>My Account:</small> Profile</h1>
			 			
			 		<!-- Content -->
			 		<div class="content">
			 			<div class="row account">
			 				<div class="col-sm-8 accountLeft">
			 					<h4>Name</h4>
			 					<h4><span>Something S. Something</span></h4>
			 					<br>
			 					<h4>Email</h4>
								<h4><span>2013-xxxxxx@ust-ics.mygbiz.com</span></h4>
								<br>
								<h4>Faculty/College/Institute</h4>
								<h4><span>Institute of Information and Computing Sciences</span></h4>
								<br>
								<h4>Department</h4>
								<h4><span>Department</span></h4>
								<br>
								<h4>User Type</h4>
								<h4><span>Coordinator</span></h4>
			 				</div>
			 					
			 				<div class="col-sm-4 accountRight">
			 					<div class="someButton">
			 						<button class="btn btn-yellow" data-toggle="modal" data-target="#editProfileModal">
			 							Edit Information
			 						</button>
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
							<form class="form-horizontal" action="" method="">
								<div class="modal-body">
								
									<!-- New Password-->
									<div class="form-group">
										<label for="New Password1" class="col-sm-4 control-label">New Password</label>
										<div class="col-sm-8">
											<input type="password" class="form-control" id="password"  required />
										</div>
									</div>
									
									<!-- Re-enter New Password-->
									<div class="form-group">
										<label for="New Password2" class="col-sm-4 control-label">Re-enter New Password</label>
										<div class="col-sm-8">
											<input type="password" class="form-control" id="password" name="password" required />
										</div>
									</div>
								</div>
								
								<div class="modal-footer">
									<button type="submit" class="btn btn-yellow pull-left">Save Changes</button>
									<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
								</div>
							</div>
							</form>
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
							<form class="form-horizontal" action="" method="">
								<div class="modal-body">
								
									<!-- Name-->
									<div class="form-group">
										<label for="Name" class="col-sm-2 control-label">Name</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="firstName" id="name" value="${user.firstName }" placeholder="First name" required />
										</div>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="middleName" id="name" value="${user.middleName }" placeholder="Middle name" required />
										</div>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="lastName" id="name" value="${user.lastName }" placeholder="Last name" required />
										</div>
									</div>
									
									<!-- Email -->
									<div class="form-group">
										<label for="email" class="col-sm-2 control-label">Email</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="email" name="email" value="${user.email }" required />
										</div>
									</div>
								</div>
								
								<div class="modal-footer">
									<button type="submit" class="btn btn-yellow pull-left">Save Changes</button>
									<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
								</div>
							</div>
							</form>
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
		
</html>