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
		
		<title>UST eTrams - Home</title>
	</head>
	
	<body>
				
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
			 						<h4 class="text-right"><%= session.getAttribute("countAllSeminars") %></h4>
			 					</div>
			 				</div>
			 				<div class="row">
			 					<div class="col-xs-5 col-xs-offset-2">
			 						<h4>Total Sessions:</h4>
			 					</div>
			 					<div class="col-xs-3">
			 						<h4 class="text-right"><%= session.getAttribute("countAllSessions") %></h4>
			 					</div>
			 				</div>
			 				<div class="row">
			 					<div class="col-xs-5 col-xs-offset-2">
			 						<h4>Total Attendees:</h4>
			 					</div>
			 					<div class="col-xs-3">
			 						<h4 class="text-right"><%= session.getAttribute("countAllAttendees") %></h4>
			 					</div>
			 				</div>
			 				<br>
			 				<div class="row">
			 					<div class="col-xs-10 col-xs-offset-1">
  									<a class="btn btn-yellow btn-block" href="../../dbcontrol?requestType=generateReport">Generate Full Report in Excel</a>
  								</div>
  							</div>
			 			</div>
			 		
			 		</div>
			 		<!-- End of Content -->
			 		
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
	<script type="text/javascript" src="../../js/bootstrap-table.js"></script>
</html>