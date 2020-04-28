<%@ include file="_header.jspf"%>
<%@ include file="_navigation.jspf"%>

<main class="container">
                    
<div class="row">
    <div class="col-md-8 mb-3 mb-md-0">

        <div class="card card-shadow">
            <div class="card-body">

                <div class="d-flex justify-content-between">
                    <h4>Account Settings</h4>

                    <small class="text-muted">Last active:  2020-04-28 17:35:34</small>
                </div>

                <form action="" method="post" role="form">
                    <input type="hidden" name="form_token" value="35c453a6b6e6cdd924a2aeefb6e1d1d9" />

                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" class="form-control" value="bro" />
                    </div>

                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" id="name" name="name" class="form-control" value="bro" />
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" id="email" name="email" class="form-control" value="bro@telegmail.com" />
                    </div>

                    
                    <hr class="my-4"/>

                    <h5>Change Password</h5>
                    <small class="text-muted">If you do not want to change your password, do not fill any of those fields below.</small>

                    <div class="form-group">
                        <label for="old_password">Current Password</label>
                        <input type="password" id="old_password" name="old_password" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="new_password">New Password</label>
                        <input type="password" id="new_password" name="new_password" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="repeat_password">Repeat Password</label>
                        <input type="password" id="repeat_password" name="repeat_password" class="form-control" />
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" name="submit" class="btn btn-primary">Submit</button>
                    </div>

                </form>


            </div>
        </div>


        <div class="card card-shadow mt-3">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h5>Delete Account</h5>
                        <p class="text-muted">By deleting the account, all of your stored data will be deleted. This action is irreversible once done.</p>
                    </div>

                    <a href="account_settings/delete/d1265bcdcd2211dc8732dd2a23a5be60" class="btn btn-danger" data-confirm="Are you sure you want to delete this ?">Delete</a>
                </div>
            </div>
        </div>

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
        
        <a href="account-settings" class="list-group-item list-group-item-action border-0 active"><i class="fa fa-wrench"></i> Account Settings</a>
        <a href="api-documentation" class="list-group-item list-group-item-action border-0 "><i class="fab fa-keycdn"></i> API Documentation</a>
        <a href="logout" class="list-group-item list-group-item-action border-0"><i class="fa fa-sign-out-alt"></i> Logout</a>
    </div>
</div>

    
    </div>
</div>

</main>
        
 
<%@ include file="_footer.jspf"%>
