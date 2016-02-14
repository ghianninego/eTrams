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
		
		<title>UST eTrams - Home</title>
	</head>
	
	<body>
		<div class="wrapper">
				
			<!-- Header -->
			<%@ include file= "adminHeader.jsp" %>
			<!-- End of Header -->
				
			<!-- Container -->
			<div class="container">
			 	<div class="row">
			 		<div class="col-md-12">
			 			<h1 class="page-header">Reports</h1>
			 			
			 			<!-- Content -->
			 			<div class="content">
			 				<div class="reports">
			 					<div class="row">
			 						<div class="col-xs-5 col-xs-offset-2">
			 							<h4>Total Seminars:</h4>
			 						</div>
			 						<div class="col-xs-3">
			 							<h4 class="text-right">#####</h4>
			 						</div>
			 					</div>
			 					<div class="row">
			 						<div class="col-xs-5 col-xs-offset-2">
			 							<h4>Total Sessions:</h4>
			 						</div>
			 						<div class="col-xs-3">
			 							<h4 class="text-right">#####</h4>
			 						</div>
			 					</div>
			 					<div class="row">
			 						<div class="col-xs-5 col-xs-offset-2">
			 							<h4>Total Attendies:</h4>
			 						</div>
			 						<div class="col-xs-3">
			 							<h4 class="text-right">#####</h4>
			 						</div>
			 					</div>
			 					<br>
			 					<div class="row">
			 						<div class="col-xs-10 col-xs-offset-1">
  										<a class="btn btn-yellow btn-block" href="">Generate Report in Excel</a>
  									</div>
  								</div>
			 				</div>
			 				
			 				<br>
			 				<div class="someContainer">
  								<p>Data table is here</p>
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