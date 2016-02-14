<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="css/style.css" />
		<link type="text/css" rel="stylesheet" href="css/buttons.css" />
		<link type="text/css" rel="stylesheet" href="css/headerAndFooter.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css">
		
		<script src="js/jquery-2.1.3.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/myscript.js"></script>
		
		<title>UST eTrams - Seminars & Sessions</title>
	</head>
	
	<body>
		<div class="wrapper">
				
			<!-- Header -->
			<%@ include file= "staffHeader.jsp" %>
			<!-- End of Header -->
				
			<!-- Container -->
			<div class="container">
			 	<div class="row">
			 		<div class="col-md-12">
			 			<h1 class="page-header"><small><a href="staffSeminars.jsp">Seminar Name</a> / </small> Sessions</h1>
			 			
			 			<!-- Content -->
			 			<div class="content">
			 				<div class="row">
  								<div class="col-sm-6 col-md-3">
  									<a href="#" class="thumbnail" id="complete" data-popover="true" data-html="true" 
  										data-content="<p>Session decription, date & venue, etc.</p><br>
  										<div class='someButton'>
  											<a class='btn btn-yellow btn-block' href='staffManageParticipants.jsp'>Manage Participants</a>
  										</div>
  									">
  										<div class="caption">
  											<h3>Session 1: Name</h3>
  											<p>Total no. of attendies</p>
  											<br><br>
  											<h4>COMPLETED</h4>
  										</div>
  									</a>
  								</div>
  								
  								<div class="col-sm-6 col-md-3">
  									<a href="#" class="thumbnail" data-popover="true" data-html="true" 
  										data-content="<p>Session decription, date & venue, etc.</p><br>
  										<div class='someButton'>
  											<a class='btn btn-yellow btn-block' href='staffManageParticipants.jsp'>Manage Participants</a>
  										</div>
  									">
  										<div class="caption">
  											<h3>Session 2: Name</h3>
  											<p>Total no. of attendies</p>
  										</div>
  									</a>
  								</div>
  								
  								<div class="col-sm-6 col-md-3">
  									<a href="#" class="thumbnail" data-popover="true" data-html="true" 
  										data-content="<p>Session decription, date & venue, etc.</p><br>
  										<div class='someButton'>
  											<a class='btn btn-yellow btn-block' href='staffManageParticipants.jsp'>Manage Participants</a>
  										</div>
  									">
  										<div class="caption">
  											<h3>Session 3: Name</h3>
  											<p>Total no. of attendies</p>
  										</div>
  									</a>
  								</div>
  								
  								<div class="col-sm-6 col-md-3">
  									<a href="#" class="thumbnail" data-popover="true" data-html="true" 
  										data-content="<p>Session decription, date & venue, etc.</p><br>
  										<div class='someButton'>
  											<a class='btn btn-yellow btn-block' href='staffManageParticipants.jsp'>Manage Participants</a>
  										</div>
  									">
  										<div class="caption">
  											<h3>Session 4: Name</h3>
  											<p>Total no. of attendies</p>
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
			<%@ include file= "footer.jsp" %>
			<!-- End of Footer -->
				
		</div>
	</body>
</html>