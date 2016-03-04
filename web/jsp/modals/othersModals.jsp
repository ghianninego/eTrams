<!-- For Adding Modals -->
<jsp:useBean id="college" type="java.sql.ResultSet" scope="session"/>
<jsp:useBean id="department" type="java.sql.ResultSet" scope="session"/>
<jsp:useBean id="role" type="java.sql.ResultSet" scope="session"/>
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
            		<label for="User Name" class="col-sm-2 control-label">Name</label>
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
            	<!-- Email -->
            	<div class="form-group">
            		<label for="" class="col-sm-2 control-label">username</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="" name="username" placeholder="username" required />
                    </div>
            	</div>
            	<!-- Email -->
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
            			<div class="bfh-selectbox" data-name="collegeID" id="college"  data-value="--" data-filter="true">
            				<div data-value="--">--</div>
            				<%while(college.next()){ %>
            				<div data-value="<%=college.getString("collegeID") %>"><%=college.getString("collegeName") %> </div>
            				<%} %>
            			</div>
            		</div>
            	</div>
            	
            	<!-- Department -->
            	<div class="form-group">
            		<label for="Department" class="col-sm-2 control-label">Department</label>
            		<div class="col-sm-9">
            			<div class="bfh-selectbox" data-name="departmentID" id="department" data-value="--" data-filter="true">
            				<div data-value="--">--</div>
            				<%while(department.next()){ %>
            				<div data-value="<%=department.getString("departmentID") %>"><%=department.getString("departmentName") %> </div>
            				<%} %>
            			</div>
            		</div>
            	</div>
            	
            	<!-- User Type -->
            	<div class="form-group">
            		<label for="Role" class="col-sm-2 control-label">User Type</label>
            		<div class="col-sm-9">
            			<div class="bfh-selectbox" data-name="roleID" id="role" data-value="--">
            				<div data-value="--">--</div>
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


<!-- NEW FACULTY MODAL -->
<div class="modal fade" id="newFacultyModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Create New College</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            	<!-- College Name-->
            	<div class="form-group">
            		<label for="college" class="col-sm-3 control-label">College Name</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="college" name="college" placeholder="Faculty/College/Institute" required />
                    </div>
            	</div>
            	
            	<!-- Coordinator -->
            	<div class="form-group">
            		<label for="coordinator" class="col-sm-3 control-label">Coordinator</label>
            		<div class="col-sm-9">
            			<div class="bfh-selectbox" data-name="coordinator" id="coordinator" data-value="--" data-filter="true">
            				<div data-value="--">--</div>
            				<div data-value="1">Coordinator 1</div>
            				<div data-value="2">Coordinator 2</div>
            				<div data-value="3">Coordinator 3</div>
            			</div>
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
<div class="modal fade" id="editFacultyModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit College</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            	<!-- College Name-->
            	<div class="form-group">
            		<label for="college" class="col-sm-3 control-label">College Name</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="college" name="college" value="Faculty/College/Institute" required />
                    </div>
            	</div>
            	
            	<!-- Coordinator -->
            	<div class="form-group">
            		<label for="coordinator" class="col-sm-3 control-label">Coordinator</label>
            		<div class="col-sm-9">
            			<div class="bfh-selectbox" data-name="coordinator" id="coordinator" data-value="1" data-filter="true">
            				<div data-value="1">Coordinator 1</div>
            				<div data-value="2">Coordinator 2</div>
            				<div data-value="3">Coordinator 3</div>
            			</div>
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


<!-- NEW VENUE MODAL -->
<div class="modal fade" id="newVenueModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Create New Venue</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            
            	<!-- Venue Name-->
            	<div class="form-group">
            		<label for="venue" class="col-sm-3 control-label">Venue Building</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="venue" name="venue" placeholder="Venue Name" required />
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
<!-- NEW VENUE MODAL -->


<!-- EDIT VENUE MODAL -->
<div class="modal fade" id="editVenueModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit Venue</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            
            	<!-- Venue Name-->
            	<div class="form-group">
            		<label for="venue" class="col-sm-3 control-label">Venue Building</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="venue" name="venue" value="Venue Name" required />
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
<!-- EDIT VENUE MODAL -->