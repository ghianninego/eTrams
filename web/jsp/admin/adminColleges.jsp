<%@ page import = "java.sql.ResultSet" %>
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
		
		<title>UST eTrams - Faculties/Colleges/Institutes</title>
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
									<th>Departments</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<% ResultSet rs = (ResultSet) session.getAttribute("colleges");
								while (rs.next()) {
							%>
								<tr>
									<td><%= rs.getInt(1) %></td>
									<td><%= rs.getString(2) %></td>
									<td><a href="../../dbcontrol?requestType=goToCollegeDepartments&collegeID=<%=rs.getInt(1)%>&collegeName=<%= rs.getString(2)%>">View/Manage</a></td>
									<td><a href="#" data-collegeid="<%=rs.getInt(1)%>"  data-collegename="<%=rs.getString(2)%>" data-toggle="modal" data-target="#editFacultyModal" >Edit</a> - <a href="#" data-toggle='modal' data-target='#deleteModal' data-collegeid="<%=rs.getInt(1)%>" >Delete</a></td>
								</tr>
							<% } rs.first(); rs.previous(); %>
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
							 			
					
					<!-- NEW FACULTY MODAL -->
					<div class="modal fade" id="newFacultyModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="gridSystemModalLabel">Create New College</h4>
								</div>
							<form class="form-horizontal" action="../../dbcontrol?requestType=adminCreateCollege" method="post">
					            <div class="modal-body">
					            	<!-- College Name-->
					            	<div class="form-group">
					            		<label for="college" class="col-sm-3 control-label">College Name</label>
					                    <div class="col-sm-9">
					                    	<input type="text" class="form-control" id="college" name="college" placeholder="Faculty/College/Institute" required />
					                    </div>
					            	</div>
					            </div>
					            
					            <div class="modal-footer">
					            	<button type="submit" class="btn btn-yellow pull-left">Submit</button>
					            	<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
					            </div>
					        </div>
							</form>
						</div>
					</div>
					<!-- NEW FACULTY MODAL -->
					<!-- EDIT FACULTY MODAL -->
					<div class="modal fade editFacultyModal" id="editFacultyModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content"> 
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="gridSystemModalLabel">Edit College</h4>
								</div>
							<form class="form-horizontal" action="../../dbcontrol" method="post">
					            <div class="modal-body">
					            	<!-- College Name-->
					            	<div class="form-group">
									<input type="hidden" id="collegeID" name="collegeID" value="" />
									<input type="hidden" name="requestType" value="adminEditCollege" />
					            		<label for="college" class="col-sm-3 control-label">College Name</label>
					                    <div class="col-sm-9">
					                    	<input type="text" class="form-control" id="college" name="college" value="" required />
					                    </div>
					            	</div>
					            </div>
					            
					            <div class="modal-footer">
					            	<button type="submit" class="btn btn-yellow pull-left">Submit</button>
					            	<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
					            </div>
					        </div>
							</form>
						</div>
					</div>
					<!-- EDIT FACULTY MODAL -->
					<!-- DELETE MODAL -->
					<div class="modal fade deleteModal" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog modal-sm" role="document">
							<div class="modal-content">
							<form action="../../dbcontrol" method="post">
								<input type="hidden" id="collegeID" name="collegeID" value="" />
									<input type="hidden" name="requestType" value="adminDeleteCollege" />
								<div class="modal-body text-center">
									<p>Are you sure you want to delete this item?</p>
									<div class="someButton text-center">
										<button type="submit" class="btn btn-default">Yes</button>
										<button type="button" class="btn btn-gray" data-dismiss="modal">Cancel</button>
									</div>
								</div>
								</form>
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
	<script type="text/javascript">
		$(".deleteModal").on(
				"show.bs.modal",
				function(event) {
					var url = $(event.relatedTarget);
					var collegeID = url.data("collegeid");
					
					var modal = $(this);
					modal.find("#collegeID").val(collegeID);
	
		});
		
		$(".editFacultyModal").on(
				"show.bs.modal",
				function(event) {
					var url = $(event.relatedTarget);
					var collegeID = url.data("collegeid");
					var collegeName = url.data("collegename");

					var modal = $(this);
					modal.find("#collegeID").val(collegeID);
					modal.find("#college").val(collegeName);
	
		});
		

	</script>
</html>