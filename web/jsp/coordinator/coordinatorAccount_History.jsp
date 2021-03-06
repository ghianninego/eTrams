<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean id="myHistory" type="java.sql.ResultSet"  scope="session"/>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="../../css/bootstrap-formhelpers.css" rel="stylesheet" type="text/css" />
		<link type="text/css" rel="stylesheet" href="../../css/style.css" />
		<link type="text/css" rel="stylesheet" href="../../css/headerAndFooter.css" />
		<link href="../../css/bootstrap-table.css" rel="stylesheet" type="text/css" />
		
		<title>UST eTrams - My Account: Attendance History</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "coordinatorHeader.jsp" %>
		<!-- End of Header -->
				
		<!-- Container -->
		<div class="container">
			 <div class="row">
			 	<div class="col-md-12">
			 		
			 		<h1 class="page-header"><small>My Account:</small> Attendance History</h1>
			 			
			 		<!-- Content -->
			 		<div class="content">
			 			<div class="row options">
			 				
			 				<!-- Search -->
							<div class="col-sm-offset-9 col-sm-3">
								<form method="post" action="../../dbcontrol">
									<input type="hidden" name="requestType" value="searchMyHistory">
									<div class="input-group">
										<input name="search" type="text" class="form-control" placeholder="Search">
										<span class="input-group-btn">
											<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
										</span>
									</div>
								</form>
							</div>
							<!-- End of Search -->
	 					
	 					</div>
			 			<br>
			 			
			 			<table class="table table-condensed table-striped table-hover" data-toggle="table" data-pagination="true">
							<thead>
								<tr>
									<th>#</th>
									<th>Seminar</th>
									<th>Session</th>
									<th>Date</th>
								</tr>
							</thead>
							<tbody>
							
							<%boolean IsNotEmpty = myHistory.next();
						
							if(!IsNotEmpty){
								System.out.println("bam!");	
							}
							else{
							while(IsNotEmpty){ %>
								<tr>
									<td><%=myHistory.getInt("attendanceID") %></td>
									<td><%=myHistory.getString("seminarName") %></td>
									<td><%=myHistory.getString("sessionName") %></td>
									<td><%=myHistory.getString("date") %></td>
								</tr>
								
								<%IsNotEmpty =  myHistory.next();
							}myHistory.first();myHistory.previous();
							
							} %>
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
	<script type="text/javascript" src="../../js/bootstrap-table.js"></script>
		
</html>