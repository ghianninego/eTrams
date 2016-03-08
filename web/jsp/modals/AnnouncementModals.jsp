<!-- MODALS -->

<!-- NEW ANNOUNCEMENT MODAL -->
<div class="modal fade" id="createAnnouncementModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">New Announcement</h4>
			</div>
		<form class="form-horizontal" action="../../dbcontrol" method="post">
            <div class="modal-body">
            		
                    <!-- Announcement Title -->
                    <div class="form-group">
                        <label for="Title" class="col-sm-2 control-label">Title</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" id="announcementTitle" name="announcementTitle" placeholder="Title" required />
                        </div>
                    </div>

                    <!-- Announcement Content -->
                    <div class="form-group">
                        <label for="Content" class="col-sm-2 control-label">Content</label>
                        <div class="col-sm-10">
                        <textarea class="form-control" name="announcementContent" id="announcementContent" rows="5" required></textarea>
                        </div>
                    </div>
    
            </div>
                <div class="modal-footer">
                <input name="requestType" value="addAnnouncement" type="hidden"/>
                <input name="creatorID" value="<%=user.getAccountID() %>"  type="hidden"/>
                <input name="userInfoID" value="<%=user.getUserInfoID() %>"  type="hidden"/>
                    <button type="submit" class="btn btn-yellow pull-left">Submit</button>
                    <button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
                </div>
            </div>
		</form>
	</div>
</div>
<!-- NEW ANNOUNCEMENT_MODAL -->


<!-- VIEW ANNOUNCEMENT MODAL -->
<div class="modal fade" id="viewAnnouncementModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">"Announcement Title"</h4>
			</div>
			<div class="modal-body">
				<p>Content of the announcement goes here.<br> Blablablablablblablabla bakfbajkfb</p>
				<p><em>Date created: 12/12/2016 00:00</em></p>
			</div>
		</div>
	</div>
</div>
<!-- VIEW ANNOUNCEMENT MODAL -->


<!-- EDIT ANNOUNCEMENT MODAL -->
<div class="modal fade" id="editAnnouncementModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit Announcement</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            		
                    <!-- Announcement Title -->
                    <div class="form-group">
                        <label for="Title" class="col-sm-2 control-label">Title</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" id="announcementTitle" name="announcementTitle" value="Title" required />
                        </div>
                    </div>

                    <!-- Announcement Content -->
                    <div class="form-group">
                        <label for="Content" class="col-sm-2 control-label">Content</label>
                        <div class="col-sm-10">
                        <textarea class="form-control" name="announcementContent" id="announcementContent" rows="5" required>SomethingSomething</textarea>
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
<!-- EDIT ANNOUNCEMENT_MODAL -->