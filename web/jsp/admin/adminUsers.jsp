<jsp:useBean id="allUser"  type="java.sql.ResultSet" scope="session"/>

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
		
		<title>UST eTrams - All Users</title>
	</head>
	
	<body>
				
		<!-- Header -->
		<%@ include file= "adminHeader.jsp" %>
		<!-- End of Header -->
				
		<!-- Container -->
		<div class="container">
		 	<div class="row">
			 	<div class="col-md-12">
			 		<h1 class="page-header">All Users</h1>
						
			 		<!-- Content -->
			 		<div class="content">
			 			<table class="table table-condensed table-striped table-hover ">
							<thead>
								<tr>
									<th>ID #</th>
									<th>Name</th>
									<th>College/Faculty/Institute</th>
									<th>Department</th>
									<th>Role</th>
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
									<input type="hidden" name="requestType" value="adminManageUser">
									<input type="hidden" name="accountId" value="<%=allUser.getString("accountID")%>">
									<input type="hidden" name="userInfoId" value="<%=allUser.getString("userInfoID")%>">
									
									<input class="btn btn-gray" type="submit" value="Manage">
									</form></td>
								</tr>
								<%} allUser.first(); allUser.previous();%>
						
							</tbody>
						</table>
						
						<br>
						<div class="someButton">
  							<button type="button" class="btn btn-yellow" data-toggle="modal" data-target="#newAccountModal">
  								<span class="glyphicon glyphicon-plus"></span> Create Account
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