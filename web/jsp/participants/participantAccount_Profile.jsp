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
		
		<title>UST eTrams - My Account: Profile</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "participantHeader.jsp" %>
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
								<h4><span>Participant</span></h4>
			 				</div>
			 					
			 				<div class="col-sm-4 accountRight">
			 					<div class="someButton">
			 						<button class="btn btn-yellow" data-toggle="modal" data-target=".editProfileModal">
			 							Edit Information
			 						</button>
			 					</div>
			 					<div class="someButton">
			 						<a class="btn btn-yellow" data-toggle="modal" data-target=".editPasswordModal">
			 							Edit Password
			 						</a>
			 					</div>
			 				</div>
			 			</div>
			 		</div>
			 		<!-- End of Content -->
			 		
			 		<!-- Modals -->
					<%@ include file= "../modals/accountModals.jsp" %>
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