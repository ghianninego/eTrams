<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link type="text/css" rel="stylesheet" href="../../css/style.css" />
		<link type="text/css" rel="stylesheet" href="../../css/headerAndFooter.css" />
		<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="../../css/bootstrap-formhelpers.css" rel="stylesheet" type="text/css" />
		
		<title>UST eTrams - Seminars & Sessions - Front-Desk Interface</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "adminHeader.jsp" %>
		<!-- End of Header -->
		
		<!-- Container -->
		<div class="container">
			 <div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header">Front-Desk Interface</h1>
			 			
			 		<!-- Content -->
			 		<div class="content">
			 			<h3	class="text-center"><span style="font-size: 20px !important;">Seminar name:</span><br>Session name</h3>
			 			<br><br>
			 			
			 			<!-- Login -->
			 			<div class="row">
							<div class="col-sm-4 col-sm-offset-4">
								<form class="form" action="">
									<div class="form-group">
										<input type="text" class="form-control" id="username" name="username" required="required" placeholder="Username">
									</div>
									<div class="form-group">
									<input type="password" class="form-control" id="password" name="password" required="required" placeholder="Password">
									</div>
									
									<div class="btn-group btn-group-justified" role="group" aria-label="...">
										<div class="btn-group" role="group">
											<button type="submit" class="btn btn-yellow">Confirm Attendance</button>
										</div>
										<div class="btn-group" role="group">
											<a type="button" class="btn btn-gray" href="adminSessions.jsp">Cancel</a>
										</div>
									</div>
								</form>
							</div>
						</div>
			 			<!-- End of Login -->
			 	
  						<br><br>
			 			<h3>List of Confirmed Attendies</h3>
  						<table class="table table-condensed table-striped table-hover ">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>College/Faculty/Institute</th>
								</tr>
							</thead>
							<tbody id="someTable">
								<tr>
									<td>###</td>
									<td>Surname, fname mname</td>
									<td>IICS</td>
								</tr>
								<tr>
									<td>###</td>
									<td>Surname, fname mname</td>
									<td>IICS</td>
								</tr>
								<tr>
									<td>###</td>
									<td>Surname, fname mname</td>
									<td>IICS</td>
								</tr>
								<tr>
									<td>###</td>
									<td>Surname, fname mname</td>
									<td>IICS</td>
								</tr>
							</tbody>
						</table>
						
						<!-- Announcements pagination -->
						<p id="legend1"></p>
						<div class="holder text-center">
        				</div>
						<!-- End of Announcements pagination -->
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
	
	<script type="text/javascript" src="../../js/jPages.min.js"></script>
	<script type="text/javascript" src="../../js/pagination.js"></script>
	
</html>