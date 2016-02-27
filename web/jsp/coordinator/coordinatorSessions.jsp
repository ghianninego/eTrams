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
			 		<h1 class="page-header"><small><a href="coordinatorSeminars.jsp">Seminar Name</a> / </small> Sessions</h1>
			 			
			 		<!-- Content -->
			 		<div class="content">
			 			<div class="row">
  							<div class="col-sm-6 col-md-3">
  								<a href="#" class="thumbnail" data-toggle="popover" data-trigger="focus" data-html="true" data-placement="bottom"
  									data-content="
  									<p><strong>Time:</strong> 00:00 pm - 00:00 pm<br>
  										<strong>Date:</strong> asdfghjkl<br>
  										<strong>Venue:</strong> afghjkl<br>
  										<strong>Speaker:</strong> afghjkl
  									</p>
  									<div class='someButton'>
  										<a class='btn btn-yellow btn-block' href='coordinatorManageParticipants.jsp'>Manage Participants</a>
  									</div>
  								">
  									<div class="caption">
  										<div class="sessionTitle">
  											<h3>Session 1: This is the name<br>ajodj</h3>
  										</div>
  										<p><strong>Total no. of attendies:</strong> ###</p>
  										<p><strong>Capacity:</strong> ###</p>
  										<p><strong>Status:</strong> Completed</p>
  									</div>
  								</a>
  							</div>
  								
  							<div class="col-sm-6 col-md-3">
  								<a href="#" class="thumbnail" data-toggle="popover" data-trigger="focus" data-html="true" data-placement="bottom"
  									data-content="
  									<p><strong>Time:</strong> 00:00 pm - 00:00 pm<br>
  										<strong>Date:</strong> asdfghjkl<br>
  										<strong>Venue:</strong> afghjkl<br>
  										<strong>Speaker:</strong> afghjkl
  									</p>
  									<div class='someButton'>
  										<a class='btn btn-yellow btn-block' href='coordinatorManageParticipants.jsp'>Manage Participants</a>
  									</div>
  								">
  									<div class="caption">
  										<div class="sessionTitle">
  											<h3>Session 2: Session Name</h3>
  										</div>
  										<p><strong>Total no. of attendies:</strong> ###</p>
  										<p><strong>Capacity:</strong> ###</p>
  										<p><strong>Status:</strong> Ongoing</p>
  									</div>
  								</a>
  							</div>
  								
  							<div class="col-sm-6 col-md-3">
  								<a href="#" class="thumbnail" data-toggle="popover" data-trigger="focus" data-html="true" data-placement="bottom"
  									data-content="
  									<p><strong>Time:</strong> 00:00 pm - 00:00 pm<br>
  										<strong>Date:</strong> asdfghjkl<br>
  										<strong>Venue:</strong> afghjkl<br>
  										<strong>Speaker:</strong> afghjkl
  									</p>
  									<div class='someButton'>
  										<a class='btn btn-yellow btn-block' href='coordinatorManageParticipants.jsp'>Manage Participants</a>
  									</div>
  								">
  									<div class="caption">
  										<div class="sessionTitle">
  											<h3>Session 3: Name</h3>
  										</div>
  										<p><strong>Total no. of attendies:</strong> ###</p>
  										<p><strong>Capacity:</strong> ###</p>
  										<p><strong>Status:</strong> Ongoing</p>
  									</div>
  								</a>
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
</html>