<!-- ACCOUNT MODALS -->

<!-- EDIT PROFILE MODAL -->
<div class="modal fade editProfileModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit Password</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
			<div class="modal-body">
			
				<!-- Name-->
            	<div class="form-group">
            		<label for="college" class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="name" name="name" value="Something S. Something" required />
                    </div>
            	</div>
            	
            	<!-- Email -->
            	<div class="form-group">
            		<label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="email" name="email" value="something@email.com" required />
                    </div>
            	</div>
                    
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


<!-- EDIT PASSWORD MODAL -->
<div class="modal fade editPasswordModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit Password</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
			<div class="modal-body">
			
				<!-- Old Password-->
            	<div class="form-group">
            		<label for="oldPassword" class="col-sm-3 control-label">Old Password</label>
                    <div class="col-sm-9">
                    	<input type="password" class="form-control" id="pasword" name="password" required />
                    </div>
            	</div>
            	
            	<!-- New Password-->
            	<div class="form-group">
            		<label for="newPassword1" class="col-sm-3 control-label">New Password</label>
                    <div class="col-sm-9">
                    	<input type="password" class="form-control" id="pasword" name="password" required />
                    </div>
            	</div>
            	
            	<!-- Re-enter New Password-->
            	<div class="form-group">
            		<label for="newPassword2" class="col-sm-3 control-label">Re-enter New Password</label>
                    <div class="col-sm-9">
                    	<input type="password" class="form-control" id="pasword" name="password" required />
                    </div>
            	</div>
                    
                <div class="modal-footer">
                    <button type="submit" class="btn btn-yellow pull-left">Save Changes</button>
                    <button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
                </div>
            </div>
		</form>
	</div>
</div>
</div>
<!-- EDIT PASSWORD MODAL -->


<!-- EDIT OTHER USER'S PASSWORD MODAL -->
<div class="modal fade editUserPasswordModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit Password</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
			<div class="modal-body">
            	
            	<!-- New Password-->
            	<div class="form-group">
            		<label for="newPassword1" class="col-sm-3 control-label">New Password</label>
                    <div class="col-sm-9">
                    	<input type="password" class="form-control" id="pasword" name="password" required />
                    </div>
            	</div>
            	
            	<!-- Re-enter New Password-->
            	<div class="form-group">
            		<label for="newPassword2" class="col-sm-3 control-label">Re-enter New Password</label>
                    <div class="col-sm-9">
                    	<input type="password" class="form-control" id="pasword" name="password" required />
                    </div>
            	</div>
                    
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