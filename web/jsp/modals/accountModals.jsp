
<!-- EDIT PROFILE MODAL -->
<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit Profile</h4>
			</div>
		<form class="form-horizontal" action="../../dbcontrol" method="post">
			<div class="modal-body">
			
				<!-- Name-->
            	<div class="form-group">
            		<label for="Name" class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-3">
                    	<input type="text" class="form-control" name="firstName" id="name" value="<%=oneUser.getString("firstName")%>" placeholder="First name" required />
                    </div>
                    <div class="col-sm-3">
                    	<input type="text" class="form-control" name="middleName" id="name" value="<%=oneUser.getString("middleName")%>" placeholder="Middle name" required />
                    </div>
                    <div class="col-sm-3">	
                    	<input type="text" class="form-control" name="lastName" id="name" value="<%=oneUser.getString("lastName")%>" placeholder="Last name" required />
                    </div>
            	</div>
            	
            	<!-- Email -->
            	<div class="form-group">
            		<label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="email" name="email" value="<%=oneUser.getString("email")%>" required />
                    </div>
            	</div>
                 <input type="hidden" name="requestType" value="adminManageUserDone">
									<input type="hidden" name="accountId" value="<%=oneUser.getInt("accountId")%>">
									<input type="hidden" name="userInfoId" value="<%=oneUser.getInt("userInfoId")%>">
									
                <div class="modal-footer">
                    <button type="submit" class="btn btn-yellow pull-left">Save Changes</button>
                    <button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
                </div>
            </div>
		</form>
	</div>
</div>
</div>
<!-- EDIT PROFILE MODAL -->





<!-- EDIT OTHER USER'S PASSWORD MODAL -->
<div class="modal fade" id="editUserPasswordModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit Password</h4>
			</div>
		<form class="form-horizontal" action="../../dbcontrol" method="post">
			<div class="modal-body">
            	
            	<!-- New Password-->
            	<div class="form-group">
            		<label for="New Password1" class="col-sm-4 control-label">New Password</label>
                    <div class="col-sm-8">
                    	<input type="password" class="form-control" id="password" required />
                    </div>
            	</div>
            	
            	<!-- Re-enter New Password-->
            	<div class="form-group">
            		<label for="New Password2" class="col-sm-4 control-label">Re-enter New Password</label>
                    <div class="col-sm-8">
                    	<input type="password" class="form-control" id="password" name="password" required />
                    </div>
            	</div>
                       <input type="hidden" name="requestType" value="adminEditPassword">
									<input type="hidden" name="accountId" value="<%=oneUser.getInt("accountId")%>">
									<input type="hidden" name="userInfoId" value="<%=oneUser.getInt("userInfoId")%>">
                <div class="modal-footer">
                    <button type="submit" class="btn btn-yellow pull-left">Save Changes</button>
                    <button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
                </div>
            </div>
		</form>
	</div>
</div>
</div>
<!-- EDIT OTHER USER'S PASSWORD MODAL -->