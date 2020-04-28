<%@ include file="_header.jspf"%>
<%@ include file="_navigation.jspf"%>

<main class="container">
<div class="d-flex justify-content-center">
	<div class="card card-shadow animated fadeIn col-xs-12 col-sm-10 col-md-6 col-lg-4">
		<div class="card-body">

			<h4 class="card-title">Register</h4>
            <small><a href="login" class="text-muted" role="button">Already have an account?</a></small>

			<form action="register" method="post" role="form">
				<div class="form-group mt-5">
					<input type="text" name="username" class="form-control form-control-border" value="" placeholder="Username" aria-label="Username" required="required" />
				</div>

				<div class="form-group mt-5">
					<input type="text" name="name" class="form-control form-control-border" value="" placeholder="Name" aria-label="Name" required="required" />
				</div>

				<div class="form-group mt-5">
					<input type="text" name="email" class="form-control form-control-border" value="" placeholder="Email" aria-label="Email" required="required" />
				</div>

				<div class="form-group mt-5">
					<input type="password" name="password" class="form-control form-control-border" placeholder="Password" aria-label="Password" required="required" />
				</div>

				<div class="form-group mt-5">
					  <img src="get-captcha" id="captcha" alt="Captcha" /><input type="text" name="captcha" class="form-control form-control-border" aria-label="Captcha Field" required="required" />				</div>

				<div class="form-group mt-5">
					<button type="submit" name="submit" class="btn btn-default btn-block">Submit</button>
				</div>

			</form>
		</div>
	</div>
</div>


</main>

<%@ include file="_footer.jspf"%>