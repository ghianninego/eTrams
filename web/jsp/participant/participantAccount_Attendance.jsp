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
		
		<title>UST eTrams - My Account: Attendance History</title>
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
			 		
			 			<h1 class="page-header"><small>My Account:</small> Attendance History</h1>
			 			
			 			<!-- Content -->
			 			<div class="content">
			 				<div class="someContainer">
  								<p>This is a table</p>
  							</div>
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