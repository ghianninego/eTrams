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
		
		<title>UST eTrams - Venues</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "adminHeader.jsp" %>
		<!-- End of Header -->
				
		<!-- Container -->
		<div class="container">
			<div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header">Venues</h1>
			 			
			 		<!-- Content -->
			 		<div class="content">
			 			<table class="table table-condensed table-striped table-hover ">
							<thead>
								<tr>
									<th>Venue ID #</th>
									<th>Building</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>001</td>
									<td>Building Name</td>
									<td><a href="#" data-toggle="modal" data-target=".editVenueModal">Edit</a> - <a href="">Delete</a></td>
								</tr>
								<tr>
									<td>002</td>
									<td>Building Name</td>
									<td><a href="#" data-toggle="modal" data-target=".editVenueModal">Edit</a> - <a href="">Delete</a></td>
								</tr>
								<tr>
									<td>003</td>
									<td>Building Name</td>
									<td><a href="#" data-toggle="modal" data-target=".editVenueModal">Edit</a> - <a href="">Delete</a></td>
								</tr>
							</tbody>
						</table>
						
						<br>
						<div class="someButton">
  							<button type="button" class="btn btn-yellow" data-toggle="modal" data-target=".newVenueModal">
  								<span class="glyphicon glyphicon-plus"></span> Add New Venue
  							</button>
  						</div>
  						
		 			</div>
		 			<!-- End of Content -->
		 			
		 			<!-- Modals -->
					<%@ include file= "../modals/othersModals.jsp" %>
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