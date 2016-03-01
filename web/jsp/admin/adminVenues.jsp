<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
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
								<%
									ResultSet rs = (ResultSet) session.getAttribute("venue");
									int venues = 0;
									while(rs.next())
									{
										
								%>
								<tr>
									<td><%= rs.getInt(1) %></td>
									<td><%= rs.getString(2) %></td>
									<td><a href="#" data-toggle="modal" data-target="#editVenueModal<%= venues %>">Edit</a> - <a href="../../dbcontrol?requestType=deleteVenue&venueID=<%= rs.getInt(1) %>">Delete</a></td>
								</tr>
								<!-- EDIT VENUE MODAL -->
								<div class="modal fade" id="editVenueModal<%= venues %>" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="gridSystemModalLabel">Edit Venue</h4>
											</div>
										<form class="form-horizontal" action="../../dbcontrol" method="post">
								            <div class="modal-body">
								            
								            	<!-- Venue Name-->
								            	<div class="form-group">
								            		<label for="venue" class="col-sm-3 control-label">Venue Building</label>
								                    <div class="col-sm-9">
								                    	<input type="text" class="form-control" id="venue" name="venue" value="<%= rs.getString(2) %>" required />
								                    </div>
								            	</div>
								            	<br>
								            </div>
								            
								            <input type="hidden" name="venueID" value="<%= rs.getInt(1)%>"/>
								            <input type="hidden" name="requestType" value="editVenue"/>
								            	
								            <div class="modal-footer">
								            	<button type="submit" class="btn btn-yellow pull-left">Submit</button>
								            	<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
								            </div>
										</div>
										</form>
									</div>
								</div>
								<!-- EDIT VENUE MODAL -->
								<% venues++; } rs.first(); rs.previous(); %>
							</tbody>
						</table>
						
						<br>
						<div class="someButton">
  							<button type="button" class="btn btn-yellow" data-toggle="modal" data-target="#newVenueModal">
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