<jsp:useBean id="allUser"  type="java.sql.ResultSet" scope="session"/>
<jsp:useBean id="college" type="java.sql.ResultSet" scope="session"/>
<jsp:useBean id="department" type="java.sql.ResultSet" scope="session"/>
<jsp:useBean id="role" type="java.sql.ResultSet" scope="session"/>
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
		<link href="../../css/bootstrap-table.css" rel="stylesheet" type="text/css" />
		
		<title>UST eTrams - All Users</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "coordinatorHeader.jsp" %>
		<!-- End of Header -->
				
		<!-- Container -->
		<div class="container">
		 	<div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header">All Users</h1>
						
			 		<!-- Content -->
			 		<div class="content">
			 			<div class="row options">
			 			
			 				<!-- Search -->
							<div class="col-sm-offset-9 col-sm-3">
								<form method="post" action="../../dbcontrol">
									<input type="hidden" name="requestType" value="searchName">
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
									<th data-field="userId">ID #</th>
									<th data-field="userName">Name</th>
									<th data-field="userCollege">College/Faculty/Institute</th>
									<th data-field="userDepartment">Department</th>
									<th data-field="userRole">Role</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<%while(allUser.next()){ %>
								<tr>
									<td><%=allUser.getString("accountID")%></td>
									<td><%=allUser.getString("firstName")%>   <%=allUser.getString("middleName")%> <%=allUser.getString("lastName")%></td>
									<td><%=allUser.getString("collegeName")%></td>
									<td><%=allUser.getString("departmentName")%></td>
									<td><%=allUser.getString("roleName")%></td>
									
									<td><form method="post" action="../../dbcontrol">
									<input type="hidden" name="requestType" value="coordinatorManageUser">
									<input type="hidden" name="accountId" value="<%=allUser.getString("accountID")%>">
									<input type="hidden" name="userInfoId" value="<%=allUser.getString("userInfoID")%>">
									
									<input class="btn btn-link" type="submit" value="Manage">
									</form></td>
								</tr>
								<%} allUser.first(); allUser.previous();%>
						
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