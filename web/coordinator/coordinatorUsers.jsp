<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link type="text/css" rel="stylesheet" href="../css/style.css" />
		<link type="text/css" rel="stylesheet" href="../css/headerAndFooter.css" />
		<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="../css/bootstrap-formhelpers.css" rel="stylesheet" type="text/css" />
		
		<script src="../js/jquery.js"></script>
		<script src="../js/bootstrap/bootstrap.js"></script>
		<script type="text/javascript" src="../js/bootstrap/bootstrap-formhelpers-min.js"></script>
		
		<script type="text/javascript" src="../js/jquery.bootpag.min.js"></script>
		<script type="text/javascript" src="../js/myscript.js"></script>
		
		<!-- FOR SEMINAR MODAL -->
		<script type="text/javascript" src="../js/dateModal.js"></script>
		<!-- FOR SESSION MODAL -->
		<script type="text/javascript" src="../js/sessionModal.js"></script>
		
		<title>UST eTrams - All Users</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "coordinatorHeader.jsp" %>
		<!-- End of Header -->
				
		<!-- Container -->
		<div class="container">
			<div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header">All Users</h1>
			 			
			 		<!-- Content -->
			 		<div class="content">
			 			<table class="table table-condensed table-striped table-hover ">
							<thead>
								<tr>
									<th>ID #</th>
									<th>Name</th>
									<th>College/Faculty/Institute</th>
									<th>Department</th>
									<th>Role</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>001</td>
									<td>User name</td>
									<td>College/Faculty/Institute</td>
									<td>Department</td>
									<td>Participant</td>
									<td><a href="usersInfo.jsp">Manage</a></td>
								</tr>
								<tr>
									<td>002</td>
									<td>User name</td>
									<td>College/Faculty/Institute</td>
									<td>Department</td>
									<td>Coordinator</td>
									<td><a href="usersInfo.jsp">Manage</a></td>
								</tr>
								<tr>
									<td>003</td>
									<td>User name</td>
									<td>College/Faculty/Institute</td>
									<td>Department</td>
									<td>Staff</td>
									<td><a href="usersInfo.jsp">Manage</a></td>
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