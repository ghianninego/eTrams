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
		<link href="../../css/bootstrap-table.css" rel="stylesheet" type="text/css" />
		
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
			 			<div class="row options">
			 				
			 				<!-- Search -->
							<div class="col-sm-offset-9 col-sm-3">
								<form method="post" action="../../dbcontrol">
									<input type="hidden" name="requestType" value="searchName">
									<div class="input-group">
										<input name="search" type="text" class="form-control" placeholder="Search">
										<span class="input-group-btn">
											<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
										</span>
									</div>
								</form>
							</div>
							<!-- End of Search -->
	 					
	 					</div>
			 			<br>
			 			
			 			<table class="table table-condensed table-striped table-hover" data-toggle="table" data-pagination="true">
							<thead>
								<tr>
									<th data-sortable="true">#</th>
									<th data-sortable="true">Seminar</th>
									<th data-sortable="true">Session</th>
									<th data-sortable="true">Time Start</th>
									<th data-sortable="true">Time End</th>
									<th data-sortable="true">Date</th>
									<th data-sortable="true">Status</th>
									<th data-sortable="true">Certification</th>
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
	
	<script src="../../js/jquery.js"></script>
	<script src="../../js/bootstrap/bootstrap.js"></script>
	<script type="text/javascript" src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>
	<script type="text/javascript" src="../../js/bootstrap-table.js"></script>
		
</html>