<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.ResultSet" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link type="text/css" rel="stylesheet" href="../../css/style.css" />
		<link type="text/css" rel="stylesheet" href="../../css/headerAndFooter.css" />
		<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="../../css/bootstrap-formhelpers.css" rel="stylesheet" type="text/css" />
		
		<title>UST eTrams - Faculties/Colleges/Institutes - Departments</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "adminHeader.jsp" %>
		<!-- End of Header -->
				
		<!-- Container -->
		<div class="container">
			<div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header"><small><a href="../../dbcontrol?requestType=goToAdminColleges"><%= session.getAttribute("collegeName") %></a> /</small>
			 			Departments
			 		</h1>
			 		
			 			
			 		<!-- Content -->
			 		<div class="content">
			 			<h3>College Name</h3>
			 			<table class="table table-condensed table-striped table-hover ">
							<thead>
								<tr>
									<th>Department ID #</th>
									<th>Department</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="someTable">
								<% ResultSet rs = (ResultSet) session.getAttribute("departments");
									while(rs.next()) {%>
								<tr>
									<td><%= rs.getInt(1) %></td>
									<td><%= rs.getString(2) %></td>
									<td><a href="#" data-toggle="modal" data-target="#editDepartmentModal" data-deptid="<%= rs.getInt(1) %>" data-deptname="<%= rs.getString(2)%>">Edit</a> - <a href="#" data-toggle='modal' data-target='#deleteModal' data-deptid="<%= rs.getInt(1) %>">Delete</a></td>
								</tr>
								<% } rs.first(); rs.previous(); %>
							</tbody>
						</table>
						
						<!-- pagination -->
						<p id="legend1"></p>
						<div class="holder text-center">
        				</div>
						<!-- End of pagination -->
						
						<br>
						<div class="someButton">
  							<button type="button" class="btn btn-yellow" data-toggle="modal" data-target="#newDepartmentModal">
  								<span class="glyphicon glyphicon-plus"></span> Add New Department
  							</button>
  						</div>
  						
		 			</div>
		 			<!-- End of Content -->
		 			
		 			<!-- Modals -->
					
					<!-- DELETE MODAL -->
					<div class="modal fade deleteModal" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog modal-sm" role="document">
							<div class="modal-content">
							<form action="../../dbcontrol" method="post">
								<input type="hidden" name="requestType" value="adminDeleteDepartment" />
								<input type="hidden" id="deptID" name="deptID" value="" />
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
					
					<!-- NEW DEPARTMENT MODAL -->
					<div class="modal fade" id="newDepartmentModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
							<form class="form-horizontal" method="post" action="../../dbcontrol">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="gridSystemModalLabel">Create New Department</h4>
								</div>
								<div class="modal-body">
								
								<input type="hidden" name="requestType" value="adminCreateDepartment" />
								<input type="hidden" name="collegeID" value="<%= session.getAttribute("collegeID") %>" />
									<!-- Department Name-->
									<div class="form-group">
										<label for="college" class="col-sm-3 control-label">Dept. Name</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="deptName" name="deptName" placeholder="Department Name" pattern="[a-zA-Z- ]+" required />
										</div>
									</div>
								</div>
								
								<div class="modal-footer">
									<button type="submit" class="btn btn-yellow pull-left">Submit</button>
									<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
								</div>
								</form>
							</div>
						</div>
					</div>
					<!-- NEW DEPARTMENT MODAL -->
					
					<!-- EDIT DEPARTMENT MODAL -->
					<div class="modal fade editDepartmentModal" id="editDepartmentModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
							<form class="form-horizontal" action="../../dbcontrol" method="post">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="gridSystemModalLabel">Edit Department</h4>
								</div>
								
								<div class="modal-body">
								
								<input type="hidden" name="requestType" value="adminEditDepartment" />
									<!-- Department Name-->
									<div class="form-group">
										<label for="college" class="col-sm-3 control-label">Dept. Name</label>
										<div class="col-sm-9">
										    <input type="hidden" id="deptID" name="deptID" value="" />
											<input type="text" class="form-control" id="deptName" name="deptName" value="" pattern="[a-zA-Z- ]+" required />
										</div>
									</div>
								</div>
								
								<div class="modal-footer">
									<button type="submit" class="btn btn-yellow pull-left">Submit</button>
									<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
								</div>
								</form>
							</div>
						</div>
					</div>
					<!-- EDIT DEPARTMENT MODAL -->
					
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
		
	<script type="text/javascript" src="../../js/jPages.min.js"></script>
	<script type="text/javascript" src="../../js/pagination.js"></script>
	
	<script type="text/javascript">
		$(".deleteModal").on(
				"show.bs.modal",
				function(event) {
					var url = $(event.relatedTarget);
					var deptID = url.data("deptid");
					
					var modal = $(this);
					modal.find("#deptID").val(deptID);
	
		});
		
		$(".editDepartmentModal").on(
				"show.bs.modal",
				function(event) {
					var url = $(event.relatedTarget);
					var deptID = url.data("deptid");
					var deptName = url.data("deptname");

					var modal = $(this);
					modal.find("#deptID").val(deptID);
					modal.find("#deptName").val(deptName);
	
		});
		

	</script>	
</html>