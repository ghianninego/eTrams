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
		<%@ include file= "participantHeader.jsp" %>
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
  								<button class="thumbnail" data-toggle="popover" data-trigger="focus" data-html="true" data-placement="bottom"
  									data-content="
  									<p>Seminar decription blbalablba.</p><br>
  									<div class='someButton'>
  										<a class='btn btn-yellow btn-block' href='participantSessions.jsp'>View Sessions</a>
  									</div>
  								">
  									<div class="caption">
  										<div class="seminarTitle">
  											<h3>Seminar Name</h3>
  										</div>
  										<p><strong>Number of Sessions:</strong> ##</p>
  										<p><strong>Date Start:</strong> 00/00/0000</p>
  										<p><strong>Date End:</strong> 00/00/0000</p>
  									</div>
  								</button>
  							</div>
  								
  							<div class="col-sm-6 col-md-3">
  								<button class="thumbnail" data-toggle="popover" data-trigger="focus" data-html="true" data-placement="bottom"
  									data-content="
  									<p>Seminar decription blbalablba.</p><br>
  									<div class='someButton'>
  										<a class='btn btn-yellow btn-block'>View Sessions</a>
  									</div>
  								">
  									<div class="caption">
  										<div class="seminarTitle">
  											<h3>Seminar Name</h3>
  										</div>
  										<p><strong>Number of Sessions:</strong> ##</p>
  										<p><strong>Date Start:</strong> 00/00/0000</p>
  										<p><strong>Date End:</strong> 00/00/0000</p>
  									</div>
  								</button>
  							</div>
  							
  							<div class="col-sm-6 col-md-3">
  								<button class="thumbnail" data-toggle="popover" data-trigger="focus" data-html="true" data-placement="bottom"
  									data-content="
  									<p>Seminar decription blbalablba.</p><br>
  									<div class='someButton'>
  										<a class='btn btn-yellow btn-block'>View Sessions</a>
  									</div>
  								">
  									<div class="caption">
  										<div class="seminarTitle">
  											<h3>Seminar Name</h3>
  										</div>
  										<p><strong>Number of Sessions:</strong> ##</p>
  										<p><strong>Date Start:</strong> 00/00/0000</p>
  										<p><strong>Date End:</strong> 00/00/0000</p>
  									</div>
  								</button>
  							</div>
  							
  							<div class="col-sm-6 col-md-3">
  								<button class="thumbnail" data-toggle="popover" data-trigger="focus" data-html="true" data-placement="bottom"
  									data-content="
  									<p>Seminar decription blbalablba.</p><br>
  									<div class='someButton'>
  										<a class='btn btn-yellow btn-block'>View Sessions</a>
  									</div>
  								">
  									<div class="caption">
  										<div class="seminarTitle">
  											<h3>Seminar Name</h3>
  										</div>
  										<p><strong>Number of Sessions:</strong> ##</p>
  										<p><strong>Date Start:</strong> 00/00/0000</p>
  										<p><strong>Date End:</strong> 00/00/0000</p>
  									</div>
  								</button>
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