<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="../css/index.css" />
		<link rel="stylesheet" href="../css/bootstrap.min.css">
		
		<script src="../js/jquery.js"></script>
		<script src="../js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="../js/myscript.js"></script>
		
		<title>UST eTrams - Login Error</title>
	</head>
	
	<body>
		<div class="wrapper">
			
			<div class="outer">
				<div class="middle">
					<div class="inner">
					
						<!-- Error Message-->
						<div class="row">
							<div class="col-sm-8 col-sm-offset-2">
								<h3>The username and password you entered didn't match.</h3>
								<h3>Please try again.</h3>
							</div>
						</div>
						<!-- End of Error Message -->
						
						<!-- Login Form-->
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
								<form class="form login" action="dbcontrol" method="post">
									<input type="hidden" value="login" name="requestType">
									<div class="form-group">
										<input type="text" class="form-control" id="username" name="username" required="required" placeholder="Username">
									</div>
									<div class="form-group">
									<input type="password" class="form-control" id="password" name="password" required="required" placeholder="Password">
									</div>
									<button type="submit" class="btn btn-yellow">Login</button>
								</form>
								
								<div style="padding-top: 10px;">
									<p><em>Forgot your password? Contact us at: (contact numbers here)</em></p>
								</div>
							</div>
						</div>
						<!-- End of Login Form -->
						
						<!-- Footer -->
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3 indexFooter">
								<p>© 2016 University of Santo Tomas. All Rights Reserved.</p>
							</div>
						</div>
						<!-- End of Footer -->
						
					</div>
				</div>				
			</div>
			
		</div>
	</body>
</html>