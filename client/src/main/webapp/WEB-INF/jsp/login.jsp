<%@ include file="_header.jspf"%>
<%@ include file="_navigation.jspf"%>

<main class="container">
                         
<div class="d-flex justify-content-center">
	<div class="card card-shadow animated fadeIn col-xs-12 col-sm-10 col-md-6 col-lg-4">
		<div class="card-body">

			<h4 class="card-title">Login</h4>
            <small><a href="lost-password" class="text-muted" role="button">Lost Password</a> / <a href="resend-activation" class="text-muted" role="button">Resend Activation</a></small>

			<form action="" method="post" role="form">
				<div class="form-group mt-5">
					<input type="text" name="username" class="form-control form-control-border" placeholder="Username or Email Address" value="" aria-label="Username or Email Address" required="required" />
				</div>

				<div class="form-group mt-5">
					<input type="password" name="password" class="form-control form-control-border" placeholder="Password" aria-label="Password" required="required" />
				</div>

				<div class="form-check mt-5">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="rememberme">
						Remember me					</label>
				</div>


				<div class="form-group mt-5">
					<button type="submit" name="submit" class="btn btn-default btn-block my-1">Sign In</button>
				</div>

                <div class="row">
                    
                                    </div>

			</form>
		</div>
	</div>
</div>


</main>
        

<%@ include file="_footer.jspf"%>