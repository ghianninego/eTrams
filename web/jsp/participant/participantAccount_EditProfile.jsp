<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="css/style.css" />
		<link type="text/css" rel="stylesheet" href="css/buttons.css" />
		<link type="text/css" rel="stylesheet" href="css/headerAndFooter.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css">
		
		<script src="js/jquery-2.1.3.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/myscript.js"></script>
		
		<title>UST eTrams - My Account: Edit Profile</title>
	</head>
	
	<body>
		<div class="wrapper">
				
			<!-- Header -->
			<%@ include file= "participantHeader.jsp" %>
			<!-- End of Header -->
				
			<!-- Container -->
			<div class="container">
			 	<div class="row">
			 		<div class="col-md-12">
			 			<h1 class="page-header"><small>My Account:</small> Edit Profile</h1>
			 			
			 			<!-- Content -->
			 			<div class="content">
			 			
			 				<!-- Form -->
			 				<form>
			 					<div class="row account">
			 						<div class="col-sm-8 accountLeft">
			 							
			 							<!-- Input Fields -->			 						
			 							<div class="form-group">
			 								<h4>Name</h4>
			 								<div class="editAccount">
			 									<input type="text" class="form-control" id="name"
			 										value="Something S. Something" />
			 								</div>
			 							</div>
			 							<div class="form-group">
			 								<h4>Email</h4>
			 								<div class="editAccount">
			 									<input type="email" class="form-control" id="name"
			 										value="2013-xxxxxx@ust-ics.mygbiz.com" />
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
			 								<a class="btn btn-yellow" href="participantAccount_Profile.jsp">Cancel</a>
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
				
		</div>
	</body>
</html>