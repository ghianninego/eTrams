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
		
		<title>UST eTrams - All Users</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "adminHeader.jsp" %>
		<!-- End of Header -->
				
		<!-- Container -->
		<div class="container">
			<div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header">Faculties/Colleges/Institutes</h1>
			 			
			 		<!-- Content -->
			 		<div class="content">
			 			<table class="table table-condensed table-striped table-hover ">
							<thead>
								<tr>
									<th>College ID #</th>
									<th>College/Faculty/Institute</th>
									<th>Coordinator</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>001</td>
									<td>College/Faculty/Institute</td>
									<td>Coordinator</td>
									<td><a href="#" data-toggle="modal" data-target="#editFacultyModal">Edit</a> - <a href="#" data-toggle='modal' data-target='#deleteModal'>Delete</a></td>
								</tr>
								<tr>
									<td>002</td>
									<td>College/Faculty/Institute</td>
									<td>Coordinator</td>
									<td><a href="#" data-toggle="modal" data-target="#editFacultyModal">Edit</a> - <a href="#" data-toggle='modal' data-target='#deleteModal'>Delete</a></td>
								</tr>
								<tr>
									<td>003</td>
									<td>College/Faculty/Institute</td>
									<td>Coordinator</td>
									<td><a href="#" data-toggle="modal" data-target="#editFacultyModal">Edit</a> - <a href="#" data-toggle='modal' data-target='#deleteModal'>Delete</a></td>
								</tr>
							</tbody>
						</table>
						
						<br>
						<div class="someButton">
  							<button type="button" class="btn btn-yellow" data-toggle="modal" data-target="#newFacultyModal">
  								<span class="glyphicon glyphicon-plus"></span> Add New College
  							</button>
  						</div>
  						
		 			</div>
		 			<!-- End of Content -->
		 			
		 			<!-- Modals -->
					<%@ include file= "../modals/othersModals.jsp" %>
					
					<!-- DELETE MODAL -->
					<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog modal-sm" role="document">
							<div class="modal-content">
								<div class="modal-body text-center">
									<p>Are you sure you want to delete this item?</p>
									<div class="someButton text-center">
										<button type="submit" class="btn btn-default">Yes</button>
										<button type="button" class="btn btn-gray" data-dismiss="modal">Cancel</button>
									</div>
								</div>
							</div>	
						</div>
					</div>
					<!-- DELETE MODAL -->
					<!-- End of Modals -->
					
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
		
	<script type="text/javascript" src="../../js/jquery.bootpag.min.js"></script>
	<script type="text/javascript" src="../../js/myscript.js"></script>
		
</html>