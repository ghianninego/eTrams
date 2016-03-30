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
  						<h3>Data List</h3>
						<table class="table table-striped table-condensed">
							<thead>
								<tr>
									<th>Placeholder A</th>
									<th>Placeholder B</th>
									<th>Placeholder C</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Placeholder A1</td>
									<td>Placeholder B1</td>
									<td>Placeholder C1</td>
								</tr>
								<tr>
									<td>Placeholder A2</td>
									<td>Placeholder B2</td>
									<td>Placeholder C2</td>
								</tr>
								<tr>
									<td>Placeholder A3</td>
									<td>Placeholder B3</td>
									<td>Placeholder C3</td>
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
		
</html>