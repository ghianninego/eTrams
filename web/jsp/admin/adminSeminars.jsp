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
		
		<!-- FOR SEMINAR MODAL -->
		<script type="text/javascript" src="../../js/dateModal.js"></script>
		<!-- FOR SESSION MODAL -->
		<script type="text/javascript" src="../../js/sessionModal.js"></script>
		
		<title>UST eTrams - Seminars & Sessions</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "adminHeader.jsp" %>
		<!-- End of Header -->
				
		<!-- Container -->
		<div class="container">
			 <div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header">Seminars</h1>
			 			
			 		<!-- Content -->
			 		<div class="content">
			 			<div class="row">
  							<div class="col-sm-6 col-md-3">
  								<a href="#" class="thumbnail" data-popover="true" data-html="true" 
  									data-content="<p>Seminar decription, date & venue, etc.</p><br>
  									<div class='btn-group btn-group-justified' role='group' aria-label='...'>
  										<a type='button' class='btn btn-gray' data-toggle='modal' data-target='.seminarModal'>Edit</a>
  										<a type='button' class='btn btn-gray'>Delete</a>
									</div>
  									<div class='someButton'>
  										<a class='btn btn-yellow btn-block' href='adminSessions.jsp'>View Sessions</a>
  									</div>
  								">
  									<div class="caption">
  										<h3>Seminar Name</h3>
  										<p>Number of Sessions</p>
  										<p>Total no. of attendies</p>
  									</div>
  								</a>
  							</div>
  								
  							<div class="col-sm-6 col-md-3">
  								<a href="#" class="thumbnail" data-popover="true" data-html="true" 
  									data-content="<p>Seminar decription, date & venue, etc.</p><br>
  									<div class='btn-group btn-group-justified' role='group' aria-label='...'>
  										<a class='btn btn-gray'>Edit</a>
  										<a class='btn btn-gray'>Delete</a>
									</div>
  									<div class='someButton'>
  										<a class='btn btn-yellow btn-block' href='adminSessions.jsp'>View Sessions</a>
  									</div>
  								">
  									<div class="caption">
  										<h3>Seminar Name</h3>
  										<p>Number of Sessions</p>
  										<p>Total no. of attendies</p>
  									</div>
  								</a>
  							</div>
  								
  							<div class="col-sm-6 col-md-3">
  								<a href="#" class="thumbnail" data-popover="true" data-html="true" 
  									data-content="<p>Seminar decription, date & venue, etc.</p><br>
  									<div class='btn-group btn-group-justified' role='group' aria-label='...'>
  										<a class='btn btn-gray'>Edit</a>
  										<a class='btn btn-gray'>Delete</a>
									</div>
  									<div class='someButton'>
  										<a class='btn btn-yellow btn-block' href='adminSessions.jsp'>View Sessions</a>
  									</div>
  								">
  									<div class="caption">
  										<h3>Seminar Name</h3>
  										<p>Number of Sessions</p>
  										<p>Total no. of attendies</p>
  									</div>
  								</a>
  							</div>
  							
  							<div class="col-sm-6 col-md-3">
  								<a href="#" class="thumbnail" data-popover="true" data-html="true" 
  									data-content="<p>Seminar decription, date & venue, etc.</p><br>
  									<div class='btn-group btn-group-justified' role='group' aria-label='...'>
  										<a class='btn btn-gray'>Edit</a>
  										<a class='btn btn-gray'>Delete</a>
									</div>
  									<div class='someButton'>
  										<a class='btn btn-yellow btn-block' href='adminSessions.jsp'>View Sessions</a>
  									</div>
  								">
  									<div class="caption">
  										<h3>Seminar Name</h3>
  										<p>Number of Sessions</p>
  										<p>Total no. of attendies</p>
  									</div>
  								</a>
  							</div>
  							
  						</div>
  							
  						<br>
  						<div class="someButton">
  							<button type="button" class="btn btn-yellow" data-toggle="modal" data-target=".seminarModal">
  								<span class="glyphicon glyphicon-plus"></span> New seminar
  							</button>
  						</div>
			 		</div>
			 		<!-- End of Content -->
						
			 		<!-- Modals -->
					<%@ include file= "../modals/modals.jsp" %>
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