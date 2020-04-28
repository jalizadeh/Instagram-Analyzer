<%@ include file="_header.jspf"%>
<%@ include file="_navigation.jspf"%>

<main class="container">
                    

        
<div class="row">
    <div class="col-md-8 mb-3 mb-md-0">

        
            
<div class="text-white no-underline card bg-instagram bg-instagram-favorites mb-3">
    <div class="card-body d-flex justify-content-between">
        <div>
            <i class="fab fa-instagram"></i> Your favorite Instagram accounts        </div>

        <div class="">1</div>
    </div>
</div>

<table class="table table-responsive-md">
    <thead class="thead-black">
    <tr>
        <th>Username</th>
        <th>Followers</th>
        <th>Following</th>
        <th>Uploads</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
            <tr>
            <td><a href="report/therock/instagram">therock</a></td>
            <td>154,489,097</td>
            <td>301</td>
            <td>4,470</td>
            <td>
                <a href="#" id="favorite" onclick="return favorite(event)" data-id="1819" data-source="instagram" class="text-dark">
                    <span data-toggle="tooltip" title="Remove from favorites"><i class="fa fa-heart text-danger"></i></span>                </a>
            </td>
        </tr>
        </tbody>
</table>

        

    </div>

    <div class="col-md-4">
        
<div class="card card-shadow">
    <div class="card-body">
        <h4 class="card-title d-flex justify-content-between">
            Hey, bro 🔥        </h4>
        <p class="card-text text-muted">Here are some useful links below <i class="fa fa-arrow-down"></i></p>

    </div>
    <div class="list-group">
        <a href="store" class="list-group-item list-group-item-action border-0 "><i class="fa fa-credit-card"></i> Store</a>

        
        <a href="favorites" class="list-group-item list-group-item-action border-0"><i class="fa fa-heart"></i> Favorites</a>
                                                        <a href="favorites/twitter" class="list-group-item list-group-item-action border-0 "><i class="fa fa-caret-right mr-3"></i> <i class="fab fa-twitter"></i> Twitter</a>
                                                                <a href="favorites/instagram" class="list-group-item list-group-item-action border-0 active"><i class="fa fa-caret-right mr-3"></i> <i class="fab fa-instagram"></i> Instagram</a>
                                                                <a href="favorites/youtube" class="list-group-item list-group-item-action border-0 "><i class="fa fa-caret-right mr-3"></i> <i class="fab fa-youtube"></i> YouTube</a>
                                                                <a href="favorites/facebook" class="list-group-item list-group-item-action border-0 "><i class="fa fa-caret-right mr-3"></i> <i class="fab fa-facebook"></i> Facebook</a>
                                    
        <a href="account-settings" class="list-group-item list-group-item-action border-0 "><i class="fa fa-wrench"></i> Account Settings</a>
        <a href="api-documentation" class="list-group-item list-group-item-action border-0 "><i class="fab fa-keycdn"></i> API Documentation</a>
        <a href="logout" class="list-group-item list-group-item-action border-0"><i class="fa fa-sign-out-alt"></i> Logout</a>
    </div>
</div>

    </div>
</div>

</main>
        
        
<%@ include file="_footer.jspf"%>