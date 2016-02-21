<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="../../css/bootstrap-formhelpers.css" rel="stylesheet" type="text/css" />
		<link type="text/css" rel="stylesheet" href="../../css/style.css" />
		<link type="text/css" rel="stylesheet" href="../../css/headerAndFooter.css" />
		
		<script src="../../js/jquery.js"></script>
		<script src="../../js/bootstrap/bootstrap.js"></script>
		<script type="text/javascript" src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>
		
		<script type="text/javascript" src="../../js/jquery.bootpag.min.js"></script>
		<script type="text/javascript" src="../../js/myscript.js"></script>
		
		<title>UST eTrams - My Account: Attendance History</title>
	</head>
	
	<body>
				
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
									<td>completed</td>
									<td>certified</td>
								</tr>
								<tr>
									<td>002</td>
									<td>Seminar Name</td>
									<td>Session Name</td>
									<td>00:00</td>
									<td>00:00</td>
									<td>mm/dd/yyyy</td>
									<td>completed</td>
									<td>certified</td>
								</tr>
							</tbody>
						</table>
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
</html>