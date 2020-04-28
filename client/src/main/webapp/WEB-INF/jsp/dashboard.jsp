<%@ include file="_header.jspf"%>
<%@ include file="_navigation.jspf"%>

                <main class="container">
            
					<div class="alert alert-success animated fadeInDown">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong>Success!</strong> Welcome to our platform, we are grateful to have you here!
					</div>
				        

        
<div class="row">
    <div class="col-md-8 mb-3 mb-md-0">

        <div class="card card-shadow">
            <div class="card-body">
                <h4 class="card-title">Welcome to Insta Analyzer!</h4>

                <ul class="list-unstyled">
                    <li><i class="far fa-calendar mr-3"></i> Joined 2020-04-28</li>
                    <li><i class="far fa-credit-card mr-3"></i> Account Balance of <strong>10</strong> total points</li>
                    <li><i class="fa fa-heart mr-3"></i> Total favorites <strong>0</strong></li>
                    <li><i class="fa fa-copy mr-3"></i> Total unlocked reports <strong>0</strong></li>
                </ul>
            </div>
        </div>

        <div class="my-3"></div>

        <div>
            
<div class="search-container d-flex flex-column align-items-center justify-content-center">

    <h3 class="font-weight-bolder text-dark mb-5">Try it right now.</h3>
    <form class="form-inline d-inline-flex justify-content-center search_form" action="" method="GET">
                <div class="dropdown my-2 mr-2">
            <button class="btn btn-light index-source-button dropdown-toggle border-0" data-source="twitter" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fab fa-twitter"></i> Twitter</button>

            <div class="dropdown-menu">
                                    <a class="dropdown-item source-select-item" href="#" data-source="twitter"><i class="fab fa-twitter"></i> Twitter</a>
                                    <a class="dropdown-item source-select-item" href="#" data-source="instagram"><i class="fab fa-instagram"></i> Instagram</a>
                                    <a class="dropdown-item source-select-item" href="#" data-source="youtube"><i class="fab fa-youtube"></i> Youtube</a>
                                    <a class="dropdown-item source-select-item" href="#" data-source="facebook"><i class="fab fa-facebook"></i> Facebook</a>
                            </div>
        </div>
        
        <div class="my-2 index-input-div">
            <i class="fa fa-search text-black-50 index-search-input-icon"></i>
            <input class="form-control mr-2 index-search-input border-0 form-control-lg source_search_input" type="text" placeholder="Enter instagram username or profile link.." aria-label="Enter instagram username or profile link..">
        </div>

        <button type="submit" class="btn btn-twitter index-submit-button border-0 d-inline-block my-2">Search</button>
    </form>

</div>



<script defer>
    $(document).ready(() => {
                $('.source-select-item').on('click', (event) => {
            let $this = $(event.currentTarget);
            let source = $this.data('source');
            let source_content = $this.html();

            $this.closest('form').find('.index-source-button').html(source_content).attr('data-source', source);

            switch(source) {

                                                case 'twitter':
                        $this.closest('form').find('.source_search_input').attr('placeholder', 'Enter twitter username..');
                        break;
                                                                case 'instagram':
                        $this.closest('form').find('.source_search_input').attr('placeholder', 'Enter instagram username or profile link..');
                        break;
                                                                case 'youtube':
                        $this.closest('form').find('.source_search_input').attr('placeholder', 'Enter youtube username or channel id..');
                        break;
                                                                case 'facebook':
                        $this.closest('form').find('.source_search_input').attr('placeholder', 'Enter facebook page username..');
                        break;
                            
            }

        /* Change the class of the submit button */
        $this.closest('form').find('button[type="submit"]').removeClass('btn-facebook btn-youtube btn-twitter btn-instagram btn-twitch btn-pinterest').addClass(`btn-${source}`);

        event.preventDefault();
    });
    
        $('.search_form').on('submit', (event) => {

            let source = $(event.currentTarget).closest('form').find('.index-source-button').length ? $(event.currentTarget).closest('form').find('.index-source-button').attr('data-source') : "twitter";
            let search_input = $(event.currentTarget).find('.source_search_input').val();
            let username_array = [];
            let is_full_url = false;

            switch(source) {
                case 'instagram':
                    search_input.split('/').forEach((string) => {
                        if(string.trim() != '') {
                            username_array.push(string);

                            if(string.includes('instagram.com')) {
                                is_full_url = username_array.length - 1;
                            }
                        }
                    });
                    break;

                case 'facebook':
                    search_input.split('/').forEach((string) => {
                        if(string.trim() != '') {
                            username_array.push(string);

                            if(string.includes('facebook.com')) {
                                is_full_url = username_array.length - 1;
                            }
                        }
                    });
                    break;

                case 'youtube':
                    search_input.split('/').forEach((string) => {
                        if(string.trim() != '') {
                            username_array.push(string);
                        }
                    });
                    break;

                case 'twitter':
                    search_input.split('/').forEach((string) => {
                        if(string.trim() != '') {
                            username_array.push(string);

                            if(string.includes('twitter.com')) {
                                is_full_url = username_array.length - 1;
                            }
                        }
                    });
                    break;

                case 'twitch':
                    search_input.split('/').forEach((string) => {
                        if(string.trim() != '') {
                            username_array.push(string);

                            if(string.includes('twitch.tv')) {
                                is_full_url = username_array.length - 1;
                            }
                        }
                    });
                    break;

                case 'pinterest':
                    search_input.split('/').forEach((string) => {
                        if(string.trim() != '') {
                            username_array.push(string);

                            if(string.includes('pinterest.com')) {
                                is_full_url = username_array.length - 1;
                            }
                        }
                    });
                    break;

                case 'mixer':
                    search_input.split('/').forEach((string) => {
                        if(string.trim() != '') {
                            username_array.push(string);

                            if(string.includes('mixer.com')) {
                                is_full_url = username_array.length - 1;
                            }
                        }
                    });
                    break;
            }


            let username = is_full_url !== false ? username_array[is_full_url + 1] : username_array[username_array.length - 1];

            if(username.length > 0) {

                setTimeout(() => {
                    $('body').fadeOut(() => {
                        $('body').html('<div class="vw-100 vh-100 d-flex align-items-center"><div class="col-2 text-center mx-auto" style="width: 3rem; height: 3rem;"><div class="spinner-grow"><span class="sr-only">Loading...</span></div></div></div>').show();
                    });

                    setTimeout(() => window.location.href = `https://instaanalyzer.com/report/${username}/${source}`, 100)
                }, 0)

            }

            event.preventDefault();
        });
    })
</script>
        </div>

        <div class="my-3"></div>



    </div>

    <div class="col-md-4 my-3 my-md-0">
        
<div class="card card-shadow">
    <div class="card-body">
        <h4 class="card-title d-flex justify-content-between">
            Hey, bro 🔥        </h4>
        <p class="card-text text-muted">Here are some useful links below <i class="fa fa-arrow-down"></i></p>

    </div>
    <div class="list-group">
        <a href="store" class="list-group-item list-group-item-action border-0 "><i class="fa fa-credit-card"></i> Store</a>

        
        <a href="favorites" class="list-group-item list-group-item-action border-0"><i class="fa fa-heart"></i> Favorites</a>
        
        <a href="account-settings" class="list-group-item list-group-item-action border-0 "><i class="fa fa-wrench"></i> Account Settings</a>
        <a href="api-documentation" class="list-group-item list-group-item-action border-0 "><i class="fab fa-keycdn"></i> API Documentation</a>
        <a href="logout" class="list-group-item list-group-item-action border-0"><i class="fa fa-sign-out-alt"></i> Logout</a>
    </div>
</div>

    
    </div>
</div>


                </main>
        
 <%@ include file="_footer.jspf"%>