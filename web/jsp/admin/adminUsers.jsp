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
		<%@ include file= "adminHeader.jsp" %>
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
									<th data-field="userId" data-sortable="true">ID #</th>
									<th data-field="userName" data-sortable="true">Name</th>
									<th data-field="userCollege" data-sortable="true">College/Faculty/Institute</th>
									<th data-field="userDepartment" data-sortable="true">Department</th>
									<th data-field="userRole" data-sortable="true">Role</th>
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
									
									<input class="btn btn-link" type="submit" value="Manage">
									</form></td>
								</tr>
								<%} allUser.first(); allUser.previous();%>
						
							</tbody>
						</table>
						
						<div class="someButton">
  							<button type="button" class="btn btn-yellow" data-toggle="modal" data-target="#newAccountModal">
  								<span class="glyphicon glyphicon-plus"></span> Create Account
  							</button>
  						</div>
  							
					</div>
		 			<!-- End of Content -->
			 		
			 		<!-- Modals -->
<!-- For Adding Modals -->

<!-- NEW USER MODAL -->
<div class="modal fade" id="newAccountModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Create New Account</h4>
			</div>
		<form class="form-horizontal" action="../../dbcontrol" method="post">
            <div class="modal-body">
            	<!-- Name -->
            	<div class="form-group">
            		<label for="Name" class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-3">
                    	<input type="text" class="form-control" id="username" name="firstName" placeholder="First Name" required />
                    </div>
                    <div class="col-sm-3">
                    	<input type="text" class="form-control" id="username" name="middleName" placeholder="Middle Name" required />
                    </div>
                    <div class="col-sm-3">
                    	<input type="text" class="form-control" id="username" name="lastName" placeholder="Last Name" required />
                    </div>
            	</div>
            	<!-- Username -->
            	<div class="form-group">
            		<label for="User Name" class="col-sm-2 control-label">username</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="" name="username" placeholder="username" required />
                    </div>
            	</div>
            	<!-- Password -->
            	<div class="form-group">
            		<label for="Email" class="col-sm-2 control-label">password</label>
                    <div class="col-sm-9">
                    	<input type="password" class="form-control" id="" name="password" placeholder="password" required />
                    </div>
            	</div>
            	<!-- Email -->
            	<div class="form-group">
            		<label for="Email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-9">
                    	<input type="email" class="form-control" id="email" name="email" placeholder="Email" required />
                    </div>
            	</div>
            	
            	<!-- College -->
            	<div class="form-group">
            		<label for="College" class="col-sm-2 control-label">College</label>
            		<div class="col-sm-9">
            			<select class="form-control" id="college" name="collegeID" required>
            				<option class="hidden" disabled selected> -- select an option -- </option>
            				<%while(college.next()){ %>
            				<option value="<%=college.getString("collegeID") %>"><%=college.getString("collegeName") %> </option>
            				<%} %>
            			</select>
            		</div>
            	</div>
            	
            	<!-- Department -->
            	<div class="form-group">
            		<label for="Department" class="col-sm-2 control-label">Department</label>
            		<div class="col-sm-9">
            			<select class="form-control" id="department" name="departmentID" disabled required>
            				<option class="hidden" disabled selected></option>
            				<%while(department.next()){ %>
            				<option id="<%=department.getString("collegeID") %>" value="<%=department.getString("departmentID") %>"><%=department.getString("departmentName") %> </option>
            				<%} %>
            			</select>
            		</div>
            	</div>
            	
            	<!-- User Type -->
            	<div class="form-group">
            		<label for="Role" class="col-sm-2 control-label">User Type</label>
            		<div class="col-sm-9">
            			<div class="bfh-selectbox" data-name="roleID" id="role" data-value="--">
            				<%while(role.next()){ %>
            				<div data-value="<%=role.getString("roleID") %>"><%=role.getString("roleName") %> </div>
            				<%} %>
            			</div>
            		</div>
            	</div>
            </div>
                    
            <div class="modal-footer">
            <input type="hidden" name="requestType" value="adminAddUser">
            	<button type="submit" class="btn btn-yellow pull-left">Submit</button>
            	<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
            </div>
        </div>
		</form>
	</div>
</div>
<!-- NEW USER MODAL -->

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
	<script type="text/javascript" src="../../js/bootstrap-table.js"></script>
		<script type="text/javascript" src="../../js/addUsers.js"></script>
	
</html>