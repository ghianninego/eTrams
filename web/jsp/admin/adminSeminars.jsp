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
			 			<%
			 				ResultSet rs = (ResultSet)session.getAttribute("seminars");
			 				int seminars = 0;
			 				while (rs.next())
			 				{
			 			%>
  							<div class="col-sm-6 col-md-3">
  								<button class="thumbnail" data-toggle="popover" data-trigger="focus" data-html="true" data-placement="auto"
  									data-content="
  									<p><%= rs.getString(4) %></p><br>
  									<div class='btn-group btn-group-justified' role='group' aria-label='...'>
  										<a class='btn btn-gray' data-toggle='modal' data-target='#editSeminarModal'>Edit</a>
  										<a class='btn btn-gray' data-toggle='modal' data-target='#deleteModal'>Delete</a>
									</div>
  									<div class='someButton'>
  										<a class='btn btn-yellow btn-block' href='../../dbcontrol?requestType=goToAdminSession&seminarID=<%=rs.getInt(1)%>&seminarName=<%=rs.getString(3)%>'>View Sessions</a>
  									</div>
  								">
  									<div class="caption">
  										<div class="seminarTitle">
  											<h3><%= rs.getString(3) %></h3>
  										</div>
  										<p><strong>Date Created:</strong> <%= rs.getDate(5) %></p>
  										<p><strong>Completed:</strong> <%if (rs.getInt(6) == 1) out.print("Completed"); else out.print("Ongoing"); %></p>
  									</div>
  								</button>
  							</div>
  							
  							
  					</div>
			 		<!-- End of Content -->
					
			 		<!-- Modals -->
			 		<%@ include file= "../modals/SeminarsAndSessionsModals.jsp" %>
					<!--INCREMENT DITO -->
					<!-- End of Modals -->
	
			 	</div>
			</div>
		</div>
		<!-- End of Container -->		
				
		<!-- Footer -->
		<%@ include file= "../footer.jsp" %>
		<!-- End of Footer -->
							<!-- EDIT SEMINAR  -->
							<div class="modal fade" id="editSeminarModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
  								<div class="modal-dialog modal-lg" role="document">
  									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="gridSystemModalLabel">Edit Seminar</h4>
										</div>
								<form class="form-horizontal" action="../../dbcontrol" method="post">
						            	<div class="modal-body">
						            
						            		<!-- Seminar Name -->
						                    <div class="form-group">
						                        <label for="Seminar Name" class="col-sm-2 control-label">Seminar Name</label>
						                        <div class="col-sm-10">
						                        <input type="text" class="form-control" id="seminarName" name="seminarName" value="<%= rs.getString(3) %>" required />
						                        </div>
						                    </div>
						                    
						                    <!-- Seminar Topic -->
						                    <div class="form-group">
						                        <label for="Topic" class="col-sm-2 control-label">Seminar Topic</label>
						                        <div class="col-sm-10">
						                        <textarea class="form-control" name="seminarTopic" id="seminarTopic" rows="5" required><%= rs.getString(4) %></textarea>
						                        </div>
						                    </div>
						            	</div>
						                <div class="modal-footer">
						                    <button type="submit" class="btn btn-yellow pull-left">Save Changes</button>
						                    <button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
						                </div>
									</div>
									<input type="hidden" name="seminarID" value="<%= rs.getInt(1) %>" />
									<input type="hidden" name="requestType" value="editSeminar" />
								</form>
								</div>
							</div>
							<!--  EDIT SEMINAR -->
							<!-- DELETE MODAL -->
							<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
								<div class="modal-dialog modal-sm" role="document">
								<form action="../../dbcontrol" method="post">
									<div class="modal-content">
										<div class="modal-body text-center">
											<p>Are you sure you want to delete this item?</p>
											<div class="someButton text-center">
												<input type="hidden" name="seminarID" value="<%= rs.getInt(1) %>"/>
												<input type="hidden" name="requestType" value="deleteSeminar"/>
												<button type="submit" class="btn btn-default">Yes</button>
												<button type="button" class="btn btn-gray" data-dismiss="modal">Cancel</button>
											</div>
										</div>
									</div>
								</form>
								</div>
							</div>
							<!-- DELETE MODAL -->
							
 						<% seminars++;
			 			} rs.first(); rs.previous();%>	
			 			</div>
  						<br>
  						<div class="someButton">
  							<button type="button" class="btn btn-yellow" data-toggle="modal" data-target="#seminarModal">
  								<span class="glyphicon glyphicon-plus"></span> New Seminar</button>
  						</div>	
	</body>
	
	<script src="../../js/jquery.js"></script>
	<script src="../../js/bootstrap/bootstrap.js"></script>
	<script type="text/javascript" src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>
		
	<script type="text/javascript" src="../../js/jquery.bootpag.min.js"></script>
	<script type="text/javascript" src="../../js/myscript.js"></script>
		
	<!-- FOR SESSION MODAL -->
	<script type="text/javascript" src="../../js/sessionModal.js"></script>
		
</html>