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
		<link href="../../css/jquery_ui/jquery-ui.css" rel="stylesheet" type="text/css" />
		<link href="../../css/jquery_ui/jquery-ui.structure.css" rel="stylesheet" type="text/css" />
		
		<title>UST eTrams - Seminars & Sessions</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "coordinatorHeader.jsp" %>
		<!-- End of Header -->
				
		<!-- Container -->
		<div class="container">
			 <div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header"><small><a href="coordinatorSeminars.jsp">Seminars</a> / 
			 			<a href="coordinatorSessions.jsp">Session Name</a> /</small> Manage Participants</h1>
			 			
			 		<!-- For Completed Sessions -->
			 		<!-- Content -->
			 		<div class="content">
			 			<h4><em>// For completed sessions</em></h4>
			 			<h3>Certified Participants</h3>
  						<table class="table table-condensed table-striped table-hover ">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>College/Faculty/Institute</th>
									<th>Time In</th>
									<th>Time Out</th>
									<th>Status</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>001</td>
									<td>Participant Name</td>
									<td>College/Faculty/Institute</td>
									<td>00:00</td>
									<td>00:00</td>
									<td><a href="#" data-toggle="modal" data-target="#setStatusModal">
			 							Completed
			 						</a></td>
									<td><a href="">Cancel certification</a> - <a href="" data-toggle="modal" data-target="#attendanceModal">Set attendance</a></td>			
								</tr>
								<tr>
									<td>002</td>
									<td>Participant Name</td>
									<td>College/Faculty/Institute</td>
									<td>00:00</td>
									<td>00:00</td>
									<td><a href="#" data-toggle="modal" data-target="#setStatusModal">
			 							Incomplete
			 						</a></td>
									<td><a href="">Cancel certification</a> - <a href="" data-toggle="modal" data-target="#attendanceModal">Set attendance</a></td>			
								</tr>
							</tbody>
						</table>
  							
			 			<br>
			 				
			 			<h3>Uncertified Participants</h3>
			 			<table class="table table-condensed table-striped table-hover ">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>College/Faculty/Institute</th>
									<th>Time In</th>
									<th>Time Out</th>
									<th>Status</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>001</td>
									<td>Participant Name</td>
									<td>College/Faculty/Institute</td>
									<td>00:00</td>
									<td>00:00</td>
									<td><a href="#" data-toggle="modal" data-target="#setStatusModal">
			 							Completed
			 						</a></td>
									<td><a href="">Certify</a> - <a href="" data-toggle="modal" data-target="#attendanceModal">Set attendance</a></td>			
								</tr>
								<tr>
									<td>002</td>
									<td>Participant Name</td>
									<td>College/Faculty/Institute</td>
									<td>00:00</td>
									<td>00:00</td>
									<td><a href="#" data-toggle="modal" data-target="#setStatusModal">
			 							Incomplete
			 						</a></td>
									<td><a href="">Certify</a> - <a href="" data-toggle="modal" data-target="#attendanceModal">Set attendance</a></td>			
								</tr>
							</tbody>
						</table>
		 			</div>
		 			<!-- End of Content -->
		 			
			 		<br><br><br><br>
						
		 			<!-- For Ongoing/Unfinished Sessions -->
			 		<!-- Content -->
					<div class="content">
		 				<h4><em>// For Ongoing/Unfinished sessions</em></h4>
		 				<h3>Registered Participants</h3>
			 			<table class="table table-condensed table-striped table-hover ">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>College/Faculty/Institute</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>001</td>
									<td>Participant Name</td>
									<td>College/Faculty/Institute</td>
									<td><a href="">Cancel Registration</a></td>	
								</tr>
								<tr>
									<td>002</td>
									<td>Participant Name</td>
									<td>College/Faculty/Institute</td>
									<td><a href="">Cancel Registration</a></td>	
								</tr>
								<tr>
									<td>003</td>
									<td>Participant Name</td>
									<td>College/Faculty/Institute</td>
									<td><a href="">Cancel Registration</a></td>
								</tr>
							</tbody>
						</table>
						
						<div class="someButton">
  							<button type="button" class="btn btn-yellow" data-toggle="modal" data-target="#addParticipantsModal">
  							<span class="glyphicon glyphicon-plus"></span> Add Participants</button>
  						</div>
  						
			 		</div>
			 		<!-- End of Content -->
			 			
			 		<!-- Modals -->
					<%@ include file= "../modals/SeminarsAndSessionsModals.jsp" %>
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
		
	<!-- FOR ADD PARTICIPANT MODAL -->
	<script type="text/javascript" src="../../js/jquery_ui/jquery-ui.js"></script>
	<script type="text/javascript" src="../../js/addParticipantModal.js"></script>
		
</html>