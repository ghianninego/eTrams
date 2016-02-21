<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link type="text/css" rel="stylesheet" href="css/style.css" />
		<link type="text/css" rel="stylesheet" href="css/headerAndFooter.css" />
		<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="css/bootstrap-formhelpers.css" rel="stylesheet" type="text/css" />
		
		<script src="js/jquery.js"></script>
		<script src="js/bootstrap/bootstrap.js"></script>
		<script type="text/javascript" src="js/bootstrap/bootstrap-formhelpers-min.js"></script>
		
		<script type="text/javascript" src="js/jquery.bootpag.min.js"></script>
		<script type="text/javascript" src="js/myscript.js"></script>
		
		<!-- FOR SEMINAR MODAL -->
		<script type="text/javascript" src="js/dateModal.js"></script>
		<!-- FOR SESSION MODAL -->
		<script type="text/javascript" src="js/sessionModal.js"></script>
		
		<title>UST eTrams - My Account: Edit Password</title>
	</head>
	
	<body>
				
		<!-- Header -->
			<!-- INCLUDE FILE HEADER HERE -->
			<h4>//HEADER</h4>
		<!-- End of Header -->
				
		<!-- Container -->
		<div class="container">
		 	<div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header"><small>My Account:</small> Edit Password</h1>
			 			
			 		<!-- Content -->
			 		<div class="content">
			 		
			 			<!-- Form -->
			 			<form>
			 				<div class="row account">
			 					<div class="col-sm-8 accountLeft">
			 							
			 						<!-- Input Fields -->			 						
			 						<div class="form-group">
			 							<h4>Enter Old Password</h4>
			 							<div class="editAccount">
			 								<input type="password" class="form-control" id="password" />
			 							</div>
			 						</div>
			 						<div class="form-group">
			 							<h4>Enter New Password</h4>
			 							<div class="editAccount">
			 								<input type="password" class="form-control" id="password" />
			 							</div>
			 						</div>
			 						<div class="form-group">
			 							<h4>Re-enter New Password</h4>
			 							<div class="editAccount">
			 								<input type="password" class="form-control" id="password" />
			 							</div>
			 						</div>
			 						<!-- End of Input Fields -->
			 						
			 					</div>
			 					
			 					<div class="col-sm-4 accountRight">
			 						
			 						<!-- Buttons -->
			 						<div class="someButton">
			 							<a class="btn btn-yellow">Save Changes</a><br>
			 						</div>
			 						<div class="someButton">
			 							<a class="btn btn-yellow" href="">Cancel</a>
			 						</div>
			 						<!-- End of Buttons -->
			 							
			 					</div>
			 				</div>
			 			</form>
	 					<!-- End of Form -->
	 						
			 		</div>
			 		<!-- End of Content -->
			 			
			 	</div>
			 </div>
		</div>
		<!-- End of Container -->
				
		<!-- Footer -->
		<%@ include file= "footer.jsp" %>
		<!-- End of Footer -->
				
	</body>
</html>