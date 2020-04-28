<%@ include file="_header.jspf"%>
<%@ include file="_navigation.jspf"%>

<main class="container">
                    

        
<div class="row">
    <div class="col-md-8 mb-3 mb-md-0">

        <div class="card card-shadow">
            <div class="card-body">
                <h4>API Documentation</h4>
                <div>Here you can find how you can use the API for your unlocked reports.</div>

                <hr />

                <span class="text-muted">The API is used to get current information of a generated report that is available to your account.</span>

                <h5 class="mt-4">API Key</h5>
                <input type="text" class="form-control clickable" value="7f1e0a939745860c5889ca2a1078f040" onclick="this.select();">

                <h5 class="mt-4">API Url</h5>
                <input type="text" class="form-control clickable" value="https://instaanalyzer.com/api" onclick="this.select();">

                <h5 class="mt-4">URL Format</h5>
                <input type="text" class="form-control clickable" value="https://instaanalyzer.com/api?api_key={YOUR_API_KEY}&username={SOURCE_ACCOUNT_USERNAME}&source=instagram" onclick="this.select();">


                <h5 class="mt-4">Method</h5>
                <code>
                    GET
                </code>

                <h5 class="mt-4">URL Query Params</h5>
                <span class="text-muted">You are required to specify all these params in order to get a valid response.</span>

                <h6 class="mt-2">Required</h6>
                <ul>
                    <li>api_key={YOUR_API_KEY}</li>
                    <li>username={SOURCE_ACCOUNT_USERNAME}</li>
                    <li>source={SOURCE_NAME}</li>
                </ul>
                <span class="text-muted">The source parameter accepts the name of the source of details. (ex: instagram )</span>


                <h5 class="mt-4">Success Response</h5>
                <span class="text-muted">Here is how a sample request response should look like.</span>

                <ul>
                    <li><strong>Code:</strong> <code>200</code></li>
                    <li><strong>Content:</strong></li>
                </ul>

                <pre id="api_sample_response">
                    {"id":"1818","instagram_id":"25945306","username":"badgalriri","full_name":"badgalriri","description":"READ my cover story at @voguemagazine","website":"http:\/\/ri-hanna.io\/vogue","followers":"62212664","following":"1304","uploads":"4278","added_date":"2018-05-05 18:33:53","last_check_date":"2018-05-05 18:33:53","profile_picture_url":"https:\/\/instagram.fsbz1-1.fna.fbcdn.net\/vp\/667a62925a82cf1445a7e800239ff35b\/5B792186\/t51.2885-19\/11032926_1049846535031474_260957621_a.jpg","is_private":"0","is_verified":"1","average_engagement_rate":"3.35","details":{"total_likes":20654521,"total_comments":178430,"average_comments":"17,843.00","average_likes":"2,065,452.10","top_hashtags":{"SAVAGEX":1,"OnTheReg":1,"DAMN":1},"top_mentions":{"voguemagazine":3,"savagexfenty":2,"mertalas":2,"macpiggott":2,"fentybeauty":1,"redhotnails":1,"lisaeldridgemakeup":1,"yusefhairnyc":1,"tonnegood":1,"louboutinworld":1,"voguemagazine's":1,"jenniferfisherjewelry":1,"albertaferretti":1,"nnadibynature":1,"lynn_ban":1},"top_posts":{"BiSKCKiDFt7":"6.24","BiUCt-Cj1pL":"5.22","BiUJjkOjLkL":"4.59"}},"access":true}
                </pre>

                <h5 class="mt-4">Failed Response</h5>
                <span class="text-muted">Here is how a failed request response will look like.</span>

                <ul>
                    <li><strong>Code:</strong> <code>403</code></li>
                    <li><strong>Content:</strong></li>
                </ul>

                <pre id="api_sample_response">
{
    "access": false,
    "message": "Your api key is not authorized to make this request."
}                </pre>

                <h5 class="mt-4">PHP Simple Example</h5>
                <span class="text-muted">A super easy example on how you can implement this with PHP.</span>

                <pre class="mt-4">
$instagram_username = "badgirlriri";
$api_key = "7f1e0a939745860c5889ca2a1078f040";
$response = file_get_contents("https://instaanalyzer.com/api?api_key=$api_key&username=$instagram_username&source=instagram");
$data = json_decode($response);

print_r($data);
                </pre>

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
        
        <a href="account-settings" class="list-group-item list-group-item-action border-0 "><i class="fa fa-wrench"></i> Account Settings</a>
        <a href="api-documentation" class="list-group-item list-group-item-action border-0 active"><i class="fab fa-keycdn"></i> API Documentation</a>
        <a href="logout" class="list-group-item list-group-item-action border-0"><i class="fa fa-sign-out-alt"></i> Logout</a>
    </div>
</div>

    
    </div>
</div>

<script>
    $(document).ready(() => {

        let string = JSON.stringify(JSON.parse($('#api_sample_response').html().trim()), null, 4);

        $('#api_sample_response').html(string);

    })
</script>


                </main>
        
        
<%@ include file="_footer.jspf"%>