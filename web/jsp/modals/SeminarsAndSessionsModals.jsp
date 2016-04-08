<!-- SEMINAR_MODAL -->
<div class="modal fade" id="seminarModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">New Seminar</h4>
			</div>
		<form class="form-horizontal" action="../../dbcontrol" method="post">
            <div class="modal-body">
            
            	<!-- Seminar Name -->
            	<div class="form-group">
            		<label for="Seminar Name" class="col-sm-2 control-label">Seminar Name</label>
            		<div class="col-sm-10">
            			<input type="text" class="form-control" id="seminarName" name="seminarName" placeholder="Seminar Name" required /> <!-- SEMINAR PLACEHOLDER HERE (put ${bean.seminarName} in the placeholder -->
            		</div>
            	</div>
            	
            	<!-- Seminar Topic -->
            	<div class="form-group">
            		<label for="Topic" class="col-sm-2 control-label">Seminar Topic</label>
            		<div class="col-sm-10">
            			<textarea class="form-control" name="seminarTopic" id="seminarTopic" rows="5" required></textarea> <!-- SEMINAR PLACEHOLDER HERE (put ${bean.seminarDescription} in the placeholder -->
            		</div>
            	</div>
            </div>
            <div class="modal-footer">
				<!-- <text type="hidden" name="seminarID" value="${bean.seminarID}" -->
            	<button type="submit" class="btn btn-yellow pull-left">Submit</button>
            	<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
            </div>
            <input type="hidden" name="requestType" value="createSeminar" />
        </div>
		</form>
	</div>
</div>
<!-- SEMINAR_MODAL -->


<!-- ATTENDANCE MODAL -->
<div class="modal fade" id="attendanceModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Set Attendance</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            
            	<!-- Time In -->
            	<div class="form-group">
            		<label for="Time In" class="col-sm-2 control-label">Time In</label>
            		<div class="col-sm-10">
            			<div class="bfh-timepicker" data-mode="12h" id="timeIn" data-name="timeIn"></div>
            		</div>
            	</div>
            	
            	<!-- Time Out -->
            	<div class="form-group">
            		<label for="Time Out" class="col-sm-2 control-label">Time Out</label>
            		<div class="col-sm-10">
            			<div class="bfh-timepicker" data-mode="12h" id="timeOut" data-name="timeOut"></div>
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
<!-- ATTENDANCE MODAL -->


<!-- SET STATUS MODAL -->
<div class="modal fade setStatusModal" id="setStatusModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Set Status</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
			<div class="modal-body">
				<input type="hidden" name="requestType" value="setStatus"/>
				<input type="hidden" id="attendanceID" name="attendanceID" value="" />
				
				<!-- Status -->
				<div class="form-group">`
					<label for="status" class="col-sm-3 control-label">Status</label>
					<div class="col-sm-8">
						<div class="bfh-selectbox" data-name="status" id="status">
							<div data-value="Complete">Complete</div>
							<div data-value="Incomplete">Incomplete</div>
						</div>
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
<!-- SET STATUS MODAL -->
