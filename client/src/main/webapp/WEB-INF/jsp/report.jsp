<%@ include file="_header.jspf"%>

<link href="resources/css/datepicker.min.css" rel="stylesheet"
	media="screen,print">
<script src="resources/js/datepicker.min.js"></script>
<script src="resources/js/i18n/datepicker.en.js"></script>
<script src="resources/js/Chart.bundle.min.js"></script>

<link rel="canonical"
	href="http://localhost:8011/report/${user.username}" />

<%@ include file="_navigation.jspf"%>

<div class="container">

	<div class="card card-shadow mt-5 mb-1 zoomer">
		<div class="card-body">
			<div class="d-flex flex-column flex-sm-row flex-wrap">

				<div class="col-sm-4 col-md-3 col-lg-2 d-flex justify-content-center justify-content-sm-start">
					<img src="${user.profile_pic_url}" class="img-fluid rounded-circle instagram-avatar" alt="${user.username}" />

					<span class="fa-stack fa-xs source-badge-position"
						style="vertical-align: top;"> <i
						class="fas fa-circle text-instagram fa-stack-2x"></i> <i
						class="fab fa-fab fa-instagram fa-stack-1x fa-inverse"></i>
					</span>
				</div>

				<div
					class="col-sm-8 col-md-9 col-lg-5 d-flex justify-content-center justify-content-sm-start">
					<div class="row d-flex flex-column">
						<p class="m-0">
							<a href="https://instagram.com/${user.username}" target="_blank"
								class="text-dark" rel="nofollow">@${user.username}</a>
						</p>

					<h1>
						${user.full_name}
	
						<c:if test="${user.is_verified()}">
							<span class="align-self-center ml-3" data-toggle="tooltip"
							 title="Instagram Verified"><i class="fa fa-check-circle user-verified-badge"></i>
							</span>
						</c:if>
	
	
						<c:if test="${user.is_business()}">
							<span class="align-self-center ml-3" data-toggle="tooltip"
								title="Bussiness Profile"><i
								class="fa fa-user-tie user-business-badge"></i>
							</span>
						</c:if>
	
						<a href="#" id="favorite" onclick="return favorite(event)"
							data-id="1819" data-source="instagram"
							class="align-self-center ml-3 card-link text-dark favorite-badge">
							<span data-toggle="tooltip" title="Add to favorites"><i
								class="far fa-heart"></i></span>
						</a>
					</h1>
					
					<small class="text-muted">${user.biography}</small>

					</div>
				</div>

				<div
					class="col-md-12 col-lg-5 d-flex justify-content-around align-items-center mt-4 mt-lg-0">
					<div class="col d-flex flex-column justify-content-center">
						Followers
						<p class="report-header-number">${user.follower_count}</p>
					</div>

					<div class="col d-flex flex-column justify-content-center">
						Followings
						<p class="report-header-number">${user.following_count}</p>
					</div>
					
					<div class="col d-flex flex-column justify-content-center">
						Uploads
						<p class="report-header-number">${user.media_count}</p>
					</div>

				</div>
			</div>
		</div>
	</div>


	<div class="row">
		<div class="col">
			<div class="card card-shadow mt-5 zoomer">
				<div class="card-body">
					Engagement
					<p class="report-header-number">0.00%</p>
				</div>
			</div>
		</div>
		
		<div class="col">
			<div class="card card-shadow mt-5 zoomer">
				<div class="card-body">
					Average Likes
					<p class="report-header-number">54321</p>
				</div>
			</div>
		</div>
		
		<div class="col">
			<div class="card card-shadow mt-5 zoomer">
				<div class="card-body">
					Average Comments
					<p class="report-header-number">4321</p>
				</div>
			</div>
		</div>
		
		<div class="col">
			<div class="card card-shadow mt-5 zoomer">
				<div class="card-body">
					More
					<p class="report-header-number">
						<span class="align-self-center" data-toggle="tooltip" title="${user.category}">
							<i class="fa fa-list-alt"></i></span>
						
						<c:if test="${not empty user.external_url}">
							 <a href="${user.external_url}"><i class="fas fa-link"></i></a>
						</c:if>
						
						<c:if test="${not empty user.latitude and not empty user.longitude}">
							 <a href="https://www.google.com/maps/place/${user.latitude},${user.longitude}"><i class="fas fa-map-marker-alt"></i></a>
						</c:if>
						
						<c:if test="${not empty user.public_email}">
							 <a href="mailto:${user.public_email}?subject=Hi"><i class="fas fa-at"></i></a>
						</c:if>
						 
					</p>
				</div>
			</div>
		</div>
	</div>
	


</div>




<div class="container mt-5">
	<div class="d-flex flex-column">
		<small class="text-muted">Last successful check date:
			2020-04-27 18:07:12</small> <small class="text-muted">Last check
			date: 2019-08-21 16:54:32</small> <small class="text-muted">Time
			Zone: Europe/London</small>
	</div>
</div>





<%@ include file="_footer.jspf"%>