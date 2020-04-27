<%@ include file="_header.jspf" %>

<link href="resources/css/datepicker.min.css" rel="stylesheet" media="screen,print">
<script src="resources/js/datepicker.min.js"></script>
<script src="resources/js/i18n/datepicker.en.js"></script>
<script src="resources/js/Chart.bundle.min.js"></script>

<link rel="canonical" href="http://localhost:8011/report/${user.username}" />

<%@ include file="_navigation.jspf" %>



        
<div class="container">
    
    
<div class="d-flex flex-column flex-sm-row flex-wrap margin-bottom-6">
    <div class="col-sm-4 col-md-3 col-lg-2 pl-sm-0 d-flex justify-content-center justify-content-sm-start">
        <img src="${user.profile_pic_url}" class="img-responsive rounded-circle instagram-avatar" alt="${user.username}" />
        <span class="fa-stack fa-xs source-badge-position" style="vertical-align: top;">
            <i class="fas fa-circle text-instagram fa-stack-2x"></i>
            <i class="fab fa-instagram fa-stack-1x fa-inverse"></i>
        </span>
    </div>

    <div class="col-sm-8 col-md-9 col-lg-6 pl-sm-0 d-flex justify-content-center justify-content-sm-start">
        <div class="row d-flex flex-column">
            <p class="m-0">
                <a href="https://instagram.com/${user.username}" target="_blank" class="text-dark" rel="nofollow">@${user.username}</a>
            </p>

            <div class="d-flex flex-row">
                <h1>${user.full_name}</h1>

                
                                    <span class="align-self-center ml-3" data-toggle="tooltip" title="Instagram Verified"><i class="fa fa-check-circle user-verified-badge"></i></span>
                
                            </div>

            <small class="text-muted">${user.biography}</small>

        </div>
    </div>

    <div class="col-md-12 col-lg-4 d-flex justify-content-around align-items-center mt-4 mt-lg-0 pl-sm-0">
        <div class="col d-flex flex-column justify-content-center">
           Followers            <p class="report-header-number">${user.follower_count}</p>
        </div>

        <div class="col d-flex flex-column justify-content-center">
           Uploads            <p class="report-header-number">${user.media_count}</p>
        </div>

        <div class="col d-flex flex-column justify-content-center">
           Engagement            <p class="report-header-number">
                                    1.74%
                            </p>
        </div>
    </div>
</div>

    

    
        
    <div class="margin-bottom-6">
        <div class="row">
            <div class="col">
                <h5>Actions</h5>
            </div>

            <div class="col">
                <div class="btn-group" role="group">
                                        <a href="api?api_key=0&username=therock&source=instagram" class="btn btn-light" target="_blank"><i class="fab fa-keycdn text-muted"></i> API Link</a>
                    <button type="button" onclick="window.print()" class="btn btn-light"><i class="fa fa-file-pdf text-muted"></i> PDF Export</button>
                                        <a href="compare/instagram/therock" class="btn btn-light"><i class="fa fa-users text-muted"></i> Compare</a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <h5>
                    Engagement                    <span data-toggle="tooltip" title="The engagement rate is the number of active likes / comments on each post"><i class="fa fa-question-circle text-muted"></i></span>
                </h5>
            </div>

            <div class="col">
                <span class="report-content-number">1.74%</span>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <h5>
                    Average Likes                    <span data-toggle="tooltip" title="Average likes based on the last 10 posts"> <i class="fa fa-heart like-color"></i></span>
                </h5>
            </div>

            <div class="col">
                <span class="report-content-number">2,664,369</span>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <h5>
                    Average Comments                    <span data-toggle="tooltip" title="Average comments based on the last 10 posts"><i class="fa fa-comments text-muted"></i></span>
                </h5>
            </div>

            <div class="col">
                <span class="report-content-number">23,582</span>
            </div>
        </div>
    </div>

    
    <div class="margin-bottom-6">
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-baseline align-items-md-center">
            <h2>Statistics Summary</h2>

                            <div>
                    <form class="form-inline" id="datepicker_form">
                        <input type="hidden" id="base_url" value="https://instaanalyzer.com/report/therock/instagram" />

                        <div class="input-group input-group-datepicker">
                            <div class="input-group-prepend">
                                <div class="input-group-text"><i class="fa fa-calendar-alt"></i></div>
                            </div>

                            <input
                                type="text"
                                class="form-control"
                                id="datepicker_input"
                                data-range="true"
                                data-date-format="yyyy-mm-dd"
                                data-min="2018-05-07"
                                name="date_range"
                                value=""
                                placeholder="Select Range"
                                autocomplete="off"
                            >
                        </div>

                        <button type="submit" class="btn btn-default">Select Range</button>
                    </form>
                </div>
                    </div>

        <div class="chart-container">
            <canvas id="followers_chart"></canvas>
        </div>

        <div class="chart-container mt-3">
            <canvas id="following_chart"></canvas>
        </div>
    </div>


    <div class="margin-bottom-6">
        <div class="d-flex justify-content-between">
            <h2>Account Stats Summary</h2>

            <a href="data:application/csv;charset=utf-8,username%2Cfollowers%2Cfollowing%2Cuploads%2Caverage_engagement_rate%2Cdate%2C%0A%22therock%22%2C%22154489097%22%2C%22301%22%2C%224470%22%2C%221.74%22%2C%222019-08-21+16%3A54%3A32%22%2C%0A%22therock%22%2C%22154395467%22%2C%22300%22%2C%224470%22%2C%221.70%22%2C%222019-08-20+23%3A25%3A10%22%2C%0A%22therock%22%2C%22154076021%22%2C%22299%22%2C%224469%22%2C%221.20%22%2C%222019-08-19+13%3A37%3A16%22%2C%0A%22therock%22%2C%22154012198%22%2C%22299%22%2C%224467%22%2C%220.93%22%2C%222019-08-18+22%3A27%3A16%22%2C%0A%22therock%22%2C%22153878618%22%2C%22299%22%2C%224464%22%2C%221.10%22%2C%222019-08-17+20%3A26%3A12%22%2C%0A%22therock%22%2C%22153777570%22%2C%22300%22%2C%224464%22%2C%221.01%22%2C%222019-08-16+23%3A24%3A01%22%2C%0A%22therock%22%2C%22153660183%22%2C%22299%22%2C%224462%22%2C%221.08%22%2C%222019-08-15+23%3A58%3A09%22%2C%0A%22therock%22%2C%22153481889%22%2C%22299%22%2C%224460%22%2C%221.22%22%2C%222019-08-14+20%3A46%3A30%22%2C%0A%22therock%22%2C%22153367238%22%2C%22299%22%2C%224459%22%2C%221.22%22%2C%222019-08-13+23%3A31%3A17%22%2C%0A%22therock%22%2C%22153227419%22%2C%22299%22%2C%224457%22%2C%221.42%22%2C%222019-08-12+22%3A11%3A06%22%2C%0A%22therock%22%2C%22153071182%22%2C%22299%22%2C%224453%22%2C%221.29%22%2C%222019-08-11+18%3A16%3A30%22%2C%0A%22therock%22%2C%22152963495%22%2C%22299%22%2C%224451%22%2C%221.06%22%2C%222019-08-10+21%3A26%3A46%22%2C%0A%22therock%22%2C%22152802524%22%2C%22297%22%2C%224447%22%2C%220%22%2C%222019-08-09+18%3A03%3A03%22%2C%0A%22therock%22%2C%22152677703%22%2C%22297%22%2C%224439%22%2C%220.83%22%2C%222019-08-08+15%3A37%3A03%22%2C%0A%22therock%22%2C%22152601655%22%2C%22297%22%2C%224436%22%2C%220.92%22%2C%222019-08-07+22%3A18%3A15%22%2C" download="report.csv" target="_blank" class="align-self-start btn btn-light"><i class="fas fa-file-csv"></i> Export to csv</a>
        </div>
        <p class="text-muted">Showing last 15 entries.</p>

        <table class="table table-responsive-md">
            <thead class="thead-black bg-instagram">
            <tr>
                <th>
                    Date&nbsp;
                    <span data-toggle="tooltip" title="Format: Y-m-d"><i class="fa fa-question-circle text-muted"></i></span>
                </th>
                <th></th>
                <th>Followers</th>
                <th></th>
                <th>Following</th>
                <th></th>
                <th>Uploads</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
                            <tr>
                    <td>2019-08-21</td>
                    <td>Wed</td>
                    <td>154,489,097</td>
                    <td><span style="color: #28a745 !important;">+93,630</span></td>
                    <td>301</td>
                    <td><span style="color: #28a745 !important;">+1</span></td>
                    <td>4,470</td>
                    <td>-</td>
                </tr>
                            <tr>
                    <td>2019-08-20</td>
                    <td>Tue</td>
                    <td>154,395,467</td>
                    <td><span style="color: #28a745 !important;">+319,446</span></td>
                    <td>300</td>
                    <td><span style="color: #28a745 !important;">+1</span></td>
                    <td>4,470</td>
                    <td><span style="color: #28a745 !important;">+1</span></td>
                </tr>
                            <tr>
                    <td>2019-08-19</td>
                    <td>Mon</td>
                    <td>154,076,021</td>
                    <td><span style="color: #28a745 !important;">+63,823</span></td>
                    <td>299</td>
                    <td>-</td>
                    <td>4,469</td>
                    <td><span style="color: #28a745 !important;">+2</span></td>
                </tr>
                            <tr>
                    <td>2019-08-18</td>
                    <td>Sun</td>
                    <td>154,012,198</td>
                    <td><span style="color: #28a745 !important;">+133,580</span></td>
                    <td>299</td>
                    <td>-</td>
                    <td>4,467</td>
                    <td><span style="color: #28a745 !important;">+3</span></td>
                </tr>
                            <tr>
                    <td>2019-08-17</td>
                    <td>Sat</td>
                    <td>153,878,618</td>
                    <td><span style="color: #28a745 !important;">+101,048</span></td>
                    <td>299</td>
                    <td><span style="color: #dc3545 !important;">-1</span></td>
                    <td>4,464</td>
                    <td>-</td>
                </tr>
                            <tr>
                    <td>2019-08-16</td>
                    <td>Fri</td>
                    <td>153,777,570</td>
                    <td><span style="color: #28a745 !important;">+117,387</span></td>
                    <td>300</td>
                    <td><span style="color: #28a745 !important;">+1</span></td>
                    <td>4,464</td>
                    <td><span style="color: #28a745 !important;">+2</span></td>
                </tr>
                            <tr>
                    <td>2019-08-15</td>
                    <td>Thu</td>
                    <td>153,660,183</td>
                    <td><span style="color: #28a745 !important;">+178,294</span></td>
                    <td>299</td>
                    <td>-</td>
                    <td>4,462</td>
                    <td><span style="color: #28a745 !important;">+2</span></td>
                </tr>
                            <tr>
                    <td>2019-08-14</td>
                    <td>Wed</td>
                    <td>153,481,889</td>
                    <td><span style="color: #28a745 !important;">+114,651</span></td>
                    <td>299</td>
                    <td>-</td>
                    <td>4,460</td>
                    <td><span style="color: #28a745 !important;">+1</span></td>
                </tr>
                            <tr>
                    <td>2019-08-13</td>
                    <td>Tue</td>
                    <td>153,367,238</td>
                    <td><span style="color: #28a745 !important;">+139,819</span></td>
                    <td>299</td>
                    <td>-</td>
                    <td>4,459</td>
                    <td><span style="color: #28a745 !important;">+2</span></td>
                </tr>
                            <tr>
                    <td>2019-08-12</td>
                    <td>Mon</td>
                    <td>153,227,419</td>
                    <td><span style="color: #28a745 !important;">+156,237</span></td>
                    <td>299</td>
                    <td>-</td>
                    <td>4,457</td>
                    <td><span style="color: #28a745 !important;">+4</span></td>
                </tr>
                            <tr>
                    <td>2019-08-11</td>
                    <td>Sun</td>
                    <td>153,071,182</td>
                    <td><span style="color: #28a745 !important;">+107,687</span></td>
                    <td>299</td>
                    <td>-</td>
                    <td>4,453</td>
                    <td><span style="color: #28a745 !important;">+2</span></td>
                </tr>
                            <tr>
                    <td>2019-08-10</td>
                    <td>Sat</td>
                    <td>152,963,495</td>
                    <td><span style="color: #28a745 !important;">+160,971</span></td>
                    <td>299</td>
                    <td><span style="color: #28a745 !important;">+2</span></td>
                    <td>4,451</td>
                    <td><span style="color: #28a745 !important;">+4</span></td>
                </tr>
                            <tr>
                    <td>2019-08-09</td>
                    <td>Fri</td>
                    <td>152,802,524</td>
                    <td><span style="color: #28a745 !important;">+124,821</span></td>
                    <td>297</td>
                    <td>-</td>
                    <td>4,447</td>
                    <td><span style="color: #28a745 !important;">+8</span></td>
                </tr>
                            <tr>
                    <td>2019-08-08</td>
                    <td>Thu</td>
                    <td>152,677,703</td>
                    <td><span style="color: #28a745 !important;">+76,048</span></td>
                    <td>297</td>
                    <td>-</td>
                    <td>4,439</td>
                    <td><span style="color: #28a745 !important;">+3</span></td>
                </tr>
                            <tr>
                    <td>2019-08-07</td>
                    <td>Wed</td>
                    <td>152,601,655</td>
                    <td>-</td>
                    <td>297</td>
                    <td>-</td>
                    <td>4,436</td>
                    <td>-</td>
                </tr>
            
            <tr class="bg-light">
                <td colspan="2"><i class="fa fa-list-ol"></i> Total Summary</td>
                <td colspan="4"><span style="color: #28a745 !important;">+1,887,442</span></td>
                <td colspan="2"><span style="color: #28a745 !important;">+34</span></td>
            </tr>


            </tbody>
        </table>
    </div>

    <div class="margin-bottom-6">
        <h2>Average Engagement Rate Chart</h2>
        <p class="text-muted">Each value in this chart is equal to the Average Engagement Rate of the account in that specific day.</p>

        <div class="chart-container">
            <canvas id="average_engagement_rate_chart"></canvas>
        </div>

    </div>

    <div class="margin-bottom-6">
        <h2>Future Projections</h2>
        <p class="text-muted">Here you can see the approximated future projections based on your previous days averages</p>

        <table class="table table-responsive-md">
            <thead class="thead-black">
            <tr>
                <th>Time Until</th>
                <th>Date</th>
                <th>Followers</th>
                <th>Uploads</th>
            </tr>
            </thead>

            <tbody>
            <tr class="bg-light">
                <td>Current Stats</td>
                <td>2020-04-27</td>
                <td>154,489,097</td>
                <td>4,470</td>
            </tr>

                            <tr>
                    <td>30 days</td>
                    <td>2020-05-27</td>
                    <td>158,844,737</td>
                    <td>4,560</td>
                </tr>

                <tr>
                    <td>60 days</td>
                    <td>2020-06-26</td>
                    <td>163,200,377</td>
                    <td>4,650</td>
                </tr>

                <tr>
                    <td>3 months</td>
                    <td>2020-07-26</td>
                    <td>167,556,017</td>
                    <td>4,740</td>
                </tr>

                <tr>
                    <td>6 months</td>
                    <td>2020-10-24</td>
                    <td>180,622,937</td>
                    <td>5,010</td>
                </tr>

                <tr>
                    <td>9 months</td>
                    <td>2021-01-22</td>
                    <td>193,689,857</td>
                    <td>5,280</td>
                </tr>

                <tr>
                    <td>1 year</td>
                    <td>2021-04-27</td>
                    <td>207,482,717</td>
                    <td>5,565</td>
                </tr>

                <tr>
                    <td>1 year and half</td>
                    <td>2021-10-26</td>
                    <td>233,906,933</td>
                    <td>6,111</td>
                </tr>

                <tr>
                    <td>2 years</td>
                    <td>2022-04-27</td>
                    <td>260,476,337</td>
                    <td>6,660</td>
                </tr>

                <tr class="bg-light">
                    <td colspan="2"><i class="fa fa-calculator"></i> Based on an average of</td>
                    <td><span style="color: #28a745 !important;">+145,188</span> followers /day</td>
                    <td><span style="color: #28a745 !important;">+3</span> uploads /day</td>
                </tr>

                        </tbody>
        </table>
    </div>

        <div class="margin-bottom-6 d-print-none">

        <h2>Top Posts</h2>
        <p class="text-muted">Top posts from the last 10 posts</p>

        <div class="row mb-5">
            
                <div class="col-sm-12 col-md-6 col-lg-4">

                    <blockquote class="instagram-media" data-instgrm-permalink="https://www.instagram.com/p/B1V5m7WFfUy/?utm_source=ig_embed&amp;utm_campaign=loading" data-instgrm-version="12" style=" background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:450px; min-width:326px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);"><div style="padding:16px;"> <a href="https://www.instagram.com/p/B1V5m7WFfUy/?utm_source=ig_embed&amp;utm_campaign=loading" style=" background:#FFFFFF; line-height:0; padding:0 0; text-align:center; text-decoration:none; width:100%;" target="_blank"> <div style=" display: flex; flex-direction: row; align-items: center;"> <div style="background-color: #F4F4F4; border-radius: 50%; flex-grow: 0; height: 40px; margin-right: 14px; width: 40px;"></div> <div style="display: flex; flex-direction: column; flex-grow: 1; justify-content: center;"> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 100px;"></div> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; width: 60px;"></div></div></div><div style="padding: 19% 0;"></div> <div style="display:block; height:50px; margin:0 auto 12px; width:50px;"><svg width="50px" height="50px" viewBox="0 0 60 60" version="1.1" xmlns="https://www.w3.org/2000/svg" xmlns:xlink="https://www.w3.org/1999/xlink"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g transform="translate(-511.000000, -20.000000)" fill="#000000"><g><path d="M556.869,30.41 C554.814,30.41 553.148,32.076 553.148,34.131 C553.148,36.186 554.814,37.852 556.869,37.852 C558.924,37.852 560.59,36.186 560.59,34.131 C560.59,32.076 558.924,30.41 556.869,30.41 M541,60.657 C535.114,60.657 530.342,55.887 530.342,50 C530.342,44.114 535.114,39.342 541,39.342 C546.887,39.342 551.658,44.114 551.658,50 C551.658,55.887 546.887,60.657 541,60.657 M541,33.886 C532.1,33.886 524.886,41.1 524.886,50 C524.886,58.899 532.1,66.113 541,66.113 C549.9,66.113 557.115,58.899 557.115,50 C557.115,41.1 549.9,33.886 541,33.886 M565.378,62.101 C565.244,65.022 564.756,66.606 564.346,67.663 C563.803,69.06 563.154,70.057 562.106,71.106 C561.058,72.155 560.06,72.803 558.662,73.347 C557.607,73.757 556.021,74.244 553.102,74.378 C549.944,74.521 548.997,74.552 541,74.552 C533.003,74.552 532.056,74.521 528.898,74.378 C525.979,74.244 524.393,73.757 523.338,73.347 C521.94,72.803 520.942,72.155 519.894,71.106 C518.846,70.057 518.197,69.06 517.654,67.663 C517.244,66.606 516.755,65.022 516.623,62.101 C516.479,58.943 516.448,57.996 516.448,50 C516.448,42.003 516.479,41.056 516.623,37.899 C516.755,34.978 517.244,33.391 517.654,32.338 C518.197,30.938 518.846,29.942 519.894,28.894 C520.942,27.846 521.94,27.196 523.338,26.654 C524.393,26.244 525.979,25.756 528.898,25.623 C532.057,25.479 533.004,25.448 541,25.448 C548.997,25.448 549.943,25.479 553.102,25.623 C556.021,25.756 557.607,26.244 558.662,26.654 C560.06,27.196 561.058,27.846 562.106,28.894 C563.154,29.942 563.803,30.938 564.346,32.338 C564.756,33.391 565.244,34.978 565.378,37.899 C565.522,41.056 565.552,42.003 565.552,50 C565.552,57.996 565.522,58.943 565.378,62.101 M570.82,37.631 C570.674,34.438 570.167,32.258 569.425,30.349 C568.659,28.377 567.633,26.702 565.965,25.035 C564.297,23.368 562.623,22.342 560.652,21.575 C558.743,20.834 556.562,20.326 553.369,20.18 C550.169,20.033 549.148,20 541,20 C532.853,20 531.831,20.033 528.631,20.18 C525.438,20.326 523.257,20.834 521.349,21.575 C519.376,22.342 517.703,23.368 516.035,25.035 C514.368,26.702 513.342,28.377 512.574,30.349 C511.834,32.258 511.326,34.438 511.181,37.631 C511.035,40.831 511,41.851 511,50 C511,58.147 511.035,59.17 511.181,62.369 C511.326,65.562 511.834,67.743 512.574,69.651 C513.342,71.625 514.368,73.296 516.035,74.965 C517.703,76.634 519.376,77.658 521.349,78.425 C523.257,79.167 525.438,79.673 528.631,79.82 C531.831,79.965 532.853,80.001 541,80.001 C549.148,80.001 550.169,79.965 553.369,79.82 C556.562,79.673 558.743,79.167 560.652,78.425 C562.623,77.658 564.297,76.634 565.965,74.965 C567.633,73.296 568.659,71.625 569.425,69.651 C570.167,67.743 570.674,65.562 570.82,62.369 C570.966,59.17 571,58.147 571,50 C571,41.851 570.966,40.831 570.82,37.631"></path></g></g></g></svg></div><div style="padding-top: 8px;"> <div style=" color:#3897f0; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:550; line-height:18px;"> View this post on Instagram</div></div><div style="padding: 12.5% 0;"></div> <div style="display: flex; flex-direction: row; margin-bottom: 14px; align-items: center;"><div> <div style="background-color: #F4F4F4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(0px) translateY(7px);"></div> <div style="background-color: #F4F4F4; height: 12.5px; transform: rotate(-45deg) translateX(3px) translateY(1px); width: 12.5px; flex-grow: 0; margin-right: 14px; margin-left: 2px;"></div> <div style="background-color: #F4F4F4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(9px) translateY(-18px);"></div></div><div style="margin-left: 8px;"> <div style=" background-color: #F4F4F4; border-radius: 50%; flex-grow: 0; height: 20px; width: 20px;"></div> <div style=" width: 0; height: 0; border-top: 2px solid transparent; border-left: 6px solid #f4f4f4; border-bottom: 2px solid transparent; transform: translateX(16px) translateY(-4px) rotate(30deg)"></div></div><div style="margin-left: auto;"> <div style=" width: 0px; border-top: 8px solid #F4F4F4; border-right: 8px solid transparent; transform: translateY(16px);"></div> <div style=" background-color: #F4F4F4; flex-grow: 0; height: 12px; width: 16px; transform: translateY(-4px);"></div> <div style=" width: 0; height: 0; border-top: 8px solid #F4F4F4; border-left: 8px solid transparent; transform: translateY(-4px) translateX(8px);"></div></div></div> <div style="display: flex; flex-direction: column; flex-grow: 1; justify-content: center; margin-bottom: 24px;"> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 224px;"></div> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; width: 144px;"></div></div></a><p style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; line-height:17px; margin-bottom:0; margin-top:8px; overflow:hidden; padding:8px 0 7px; text-align:center; text-overflow:ellipsis; white-space:nowrap;"><a href="https://www.instagram.com/p/B1V5m7WFfUy/?utm_source=ig_embed&amp;utm_campaign=loading" style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:normal; line-height:17px; text-decoration:none;" target="_blank">A post shared by therock (@therock)</a> on <time style=" font-family:Arial,sans-serif; font-size:14px; line-height:17px;" datetime="2019-08-19T10:27:34+00:00">Aug 19, 2019 at 3:27am PDT</time></p></div></blockquote>
<script async src="//www.instagram.com/embed.js"></script>
                </div>


            
                <div class="col-sm-12 col-md-6 col-lg-4">

                    <blockquote class="instagram-media" data-instgrm-permalink="https://www.instagram.com/p/B1OIr7floj6/?utm_source=ig_embed&amp;utm_campaign=loading" data-instgrm-version="12" style=" background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:450px; min-width:326px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);"><div style="padding:16px;"> <a href="https://www.instagram.com/p/B1OIr7floj6/?utm_source=ig_embed&amp;utm_campaign=loading" style=" background:#FFFFFF; line-height:0; padding:0 0; text-align:center; text-decoration:none; width:100%;" target="_blank"> <div style=" display: flex; flex-direction: row; align-items: center;"> <div style="background-color: #F4F4F4; border-radius: 50%; flex-grow: 0; height: 40px; margin-right: 14px; width: 40px;"></div> <div style="display: flex; flex-direction: column; flex-grow: 1; justify-content: center;"> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 100px;"></div> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; width: 60px;"></div></div></div><div style="padding: 19% 0;"></div> <div style="display:block; height:50px; margin:0 auto 12px; width:50px;"><svg width="50px" height="50px" viewBox="0 0 60 60" version="1.1" xmlns="https://www.w3.org/2000/svg" xmlns:xlink="https://www.w3.org/1999/xlink"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g transform="translate(-511.000000, -20.000000)" fill="#000000"><g><path d="M556.869,30.41 C554.814,30.41 553.148,32.076 553.148,34.131 C553.148,36.186 554.814,37.852 556.869,37.852 C558.924,37.852 560.59,36.186 560.59,34.131 C560.59,32.076 558.924,30.41 556.869,30.41 M541,60.657 C535.114,60.657 530.342,55.887 530.342,50 C530.342,44.114 535.114,39.342 541,39.342 C546.887,39.342 551.658,44.114 551.658,50 C551.658,55.887 546.887,60.657 541,60.657 M541,33.886 C532.1,33.886 524.886,41.1 524.886,50 C524.886,58.899 532.1,66.113 541,66.113 C549.9,66.113 557.115,58.899 557.115,50 C557.115,41.1 549.9,33.886 541,33.886 M565.378,62.101 C565.244,65.022 564.756,66.606 564.346,67.663 C563.803,69.06 563.154,70.057 562.106,71.106 C561.058,72.155 560.06,72.803 558.662,73.347 C557.607,73.757 556.021,74.244 553.102,74.378 C549.944,74.521 548.997,74.552 541,74.552 C533.003,74.552 532.056,74.521 528.898,74.378 C525.979,74.244 524.393,73.757 523.338,73.347 C521.94,72.803 520.942,72.155 519.894,71.106 C518.846,70.057 518.197,69.06 517.654,67.663 C517.244,66.606 516.755,65.022 516.623,62.101 C516.479,58.943 516.448,57.996 516.448,50 C516.448,42.003 516.479,41.056 516.623,37.899 C516.755,34.978 517.244,33.391 517.654,32.338 C518.197,30.938 518.846,29.942 519.894,28.894 C520.942,27.846 521.94,27.196 523.338,26.654 C524.393,26.244 525.979,25.756 528.898,25.623 C532.057,25.479 533.004,25.448 541,25.448 C548.997,25.448 549.943,25.479 553.102,25.623 C556.021,25.756 557.607,26.244 558.662,26.654 C560.06,27.196 561.058,27.846 562.106,28.894 C563.154,29.942 563.803,30.938 564.346,32.338 C564.756,33.391 565.244,34.978 565.378,37.899 C565.522,41.056 565.552,42.003 565.552,50 C565.552,57.996 565.522,58.943 565.378,62.101 M570.82,37.631 C570.674,34.438 570.167,32.258 569.425,30.349 C568.659,28.377 567.633,26.702 565.965,25.035 C564.297,23.368 562.623,22.342 560.652,21.575 C558.743,20.834 556.562,20.326 553.369,20.18 C550.169,20.033 549.148,20 541,20 C532.853,20 531.831,20.033 528.631,20.18 C525.438,20.326 523.257,20.834 521.349,21.575 C519.376,22.342 517.703,23.368 516.035,25.035 C514.368,26.702 513.342,28.377 512.574,30.349 C511.834,32.258 511.326,34.438 511.181,37.631 C511.035,40.831 511,41.851 511,50 C511,58.147 511.035,59.17 511.181,62.369 C511.326,65.562 511.834,67.743 512.574,69.651 C513.342,71.625 514.368,73.296 516.035,74.965 C517.703,76.634 519.376,77.658 521.349,78.425 C523.257,79.167 525.438,79.673 528.631,79.82 C531.831,79.965 532.853,80.001 541,80.001 C549.148,80.001 550.169,79.965 553.369,79.82 C556.562,79.673 558.743,79.167 560.652,78.425 C562.623,77.658 564.297,76.634 565.965,74.965 C567.633,73.296 568.659,71.625 569.425,69.651 C570.167,67.743 570.674,65.562 570.82,62.369 C570.966,59.17 571,58.147 571,50 C571,41.851 570.966,40.831 570.82,37.631"></path></g></g></g></svg></div><div style="padding-top: 8px;"> <div style=" color:#3897f0; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:550; line-height:18px;"> View this post on Instagram</div></div><div style="padding: 12.5% 0;"></div> <div style="display: flex; flex-direction: row; margin-bottom: 14px; align-items: center;"><div> <div style="background-color: #F4F4F4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(0px) translateY(7px);"></div> <div style="background-color: #F4F4F4; height: 12.5px; transform: rotate(-45deg) translateX(3px) translateY(1px); width: 12.5px; flex-grow: 0; margin-right: 14px; margin-left: 2px;"></div> <div style="background-color: #F4F4F4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(9px) translateY(-18px);"></div></div><div style="margin-left: 8px;"> <div style=" background-color: #F4F4F4; border-radius: 50%; flex-grow: 0; height: 20px; width: 20px;"></div> <div style=" width: 0; height: 0; border-top: 2px solid transparent; border-left: 6px solid #f4f4f4; border-bottom: 2px solid transparent; transform: translateX(16px) translateY(-4px) rotate(30deg)"></div></div><div style="margin-left: auto;"> <div style=" width: 0px; border-top: 8px solid #F4F4F4; border-right: 8px solid transparent; transform: translateY(16px);"></div> <div style=" background-color: #F4F4F4; flex-grow: 0; height: 12px; width: 16px; transform: translateY(-4px);"></div> <div style=" width: 0; height: 0; border-top: 8px solid #F4F4F4; border-left: 8px solid transparent; transform: translateY(-4px) translateX(8px);"></div></div></div> <div style="display: flex; flex-direction: column; flex-grow: 1; justify-content: center; margin-bottom: 24px;"> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 224px;"></div> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; width: 144px;"></div></div></a><p style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; line-height:17px; margin-bottom:0; margin-top:8px; overflow:hidden; padding:8px 0 7px; text-align:center; text-overflow:ellipsis; white-space:nowrap;"><a href="https://www.instagram.com/p/B1OIr7floj6/?utm_source=ig_embed&amp;utm_campaign=loading" style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:normal; line-height:17px; text-decoration:none;" target="_blank">A post shared by therock (@therock)</a> on <time style=" font-family:Arial,sans-serif; font-size:14px; line-height:17px;" datetime="2019-08-16T10:05:24+00:00">Aug 16, 2019 at 3:05am PDT</time></p></div></blockquote>
<script async src="//www.instagram.com/embed.js"></script>
                </div>


            
                <div class="col-sm-12 col-md-6 col-lg-4">

                    <blockquote class="instagram-media" data-instgrm-permalink="https://www.instagram.com/p/B1TPyXgl_gs/?utm_source=ig_embed&amp;utm_campaign=loading" data-instgrm-version="12" style=" background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:450px; min-width:326px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);"><div style="padding:16px;"> <a href="https://www.instagram.com/p/B1TPyXgl_gs/?utm_source=ig_embed&amp;utm_campaign=loading" style=" background:#FFFFFF; line-height:0; padding:0 0; text-align:center; text-decoration:none; width:100%;" target="_blank"> <div style=" display: flex; flex-direction: row; align-items: center;"> <div style="background-color: #F4F4F4; border-radius: 50%; flex-grow: 0; height: 40px; margin-right: 14px; width: 40px;"></div> <div style="display: flex; flex-direction: column; flex-grow: 1; justify-content: center;"> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 100px;"></div> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; width: 60px;"></div></div></div><div style="padding: 19% 0;"></div> <div style="display:block; height:50px; margin:0 auto 12px; width:50px;"><svg width="50px" height="50px" viewBox="0 0 60 60" version="1.1" xmlns="https://www.w3.org/2000/svg" xmlns:xlink="https://www.w3.org/1999/xlink"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g transform="translate(-511.000000, -20.000000)" fill="#000000"><g><path d="M556.869,30.41 C554.814,30.41 553.148,32.076 553.148,34.131 C553.148,36.186 554.814,37.852 556.869,37.852 C558.924,37.852 560.59,36.186 560.59,34.131 C560.59,32.076 558.924,30.41 556.869,30.41 M541,60.657 C535.114,60.657 530.342,55.887 530.342,50 C530.342,44.114 535.114,39.342 541,39.342 C546.887,39.342 551.658,44.114 551.658,50 C551.658,55.887 546.887,60.657 541,60.657 M541,33.886 C532.1,33.886 524.886,41.1 524.886,50 C524.886,58.899 532.1,66.113 541,66.113 C549.9,66.113 557.115,58.899 557.115,50 C557.115,41.1 549.9,33.886 541,33.886 M565.378,62.101 C565.244,65.022 564.756,66.606 564.346,67.663 C563.803,69.06 563.154,70.057 562.106,71.106 C561.058,72.155 560.06,72.803 558.662,73.347 C557.607,73.757 556.021,74.244 553.102,74.378 C549.944,74.521 548.997,74.552 541,74.552 C533.003,74.552 532.056,74.521 528.898,74.378 C525.979,74.244 524.393,73.757 523.338,73.347 C521.94,72.803 520.942,72.155 519.894,71.106 C518.846,70.057 518.197,69.06 517.654,67.663 C517.244,66.606 516.755,65.022 516.623,62.101 C516.479,58.943 516.448,57.996 516.448,50 C516.448,42.003 516.479,41.056 516.623,37.899 C516.755,34.978 517.244,33.391 517.654,32.338 C518.197,30.938 518.846,29.942 519.894,28.894 C520.942,27.846 521.94,27.196 523.338,26.654 C524.393,26.244 525.979,25.756 528.898,25.623 C532.057,25.479 533.004,25.448 541,25.448 C548.997,25.448 549.943,25.479 553.102,25.623 C556.021,25.756 557.607,26.244 558.662,26.654 C560.06,27.196 561.058,27.846 562.106,28.894 C563.154,29.942 563.803,30.938 564.346,32.338 C564.756,33.391 565.244,34.978 565.378,37.899 C565.522,41.056 565.552,42.003 565.552,50 C565.552,57.996 565.522,58.943 565.378,62.101 M570.82,37.631 C570.674,34.438 570.167,32.258 569.425,30.349 C568.659,28.377 567.633,26.702 565.965,25.035 C564.297,23.368 562.623,22.342 560.652,21.575 C558.743,20.834 556.562,20.326 553.369,20.18 C550.169,20.033 549.148,20 541,20 C532.853,20 531.831,20.033 528.631,20.18 C525.438,20.326 523.257,20.834 521.349,21.575 C519.376,22.342 517.703,23.368 516.035,25.035 C514.368,26.702 513.342,28.377 512.574,30.349 C511.834,32.258 511.326,34.438 511.181,37.631 C511.035,40.831 511,41.851 511,50 C511,58.147 511.035,59.17 511.181,62.369 C511.326,65.562 511.834,67.743 512.574,69.651 C513.342,71.625 514.368,73.296 516.035,74.965 C517.703,76.634 519.376,77.658 521.349,78.425 C523.257,79.167 525.438,79.673 528.631,79.82 C531.831,79.965 532.853,80.001 541,80.001 C549.148,80.001 550.169,79.965 553.369,79.82 C556.562,79.673 558.743,79.167 560.652,78.425 C562.623,77.658 564.297,76.634 565.965,74.965 C567.633,73.296 568.659,71.625 569.425,69.651 C570.167,67.743 570.674,65.562 570.82,62.369 C570.966,59.17 571,58.147 571,50 C571,41.851 570.966,40.831 570.82,37.631"></path></g></g></g></svg></div><div style="padding-top: 8px;"> <div style=" color:#3897f0; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:550; line-height:18px;"> View this post on Instagram</div></div><div style="padding: 12.5% 0;"></div> <div style="display: flex; flex-direction: row; margin-bottom: 14px; align-items: center;"><div> <div style="background-color: #F4F4F4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(0px) translateY(7px);"></div> <div style="background-color: #F4F4F4; height: 12.5px; transform: rotate(-45deg) translateX(3px) translateY(1px); width: 12.5px; flex-grow: 0; margin-right: 14px; margin-left: 2px;"></div> <div style="background-color: #F4F4F4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(9px) translateY(-18px);"></div></div><div style="margin-left: 8px;"> <div style=" background-color: #F4F4F4; border-radius: 50%; flex-grow: 0; height: 20px; width: 20px;"></div> <div style=" width: 0; height: 0; border-top: 2px solid transparent; border-left: 6px solid #f4f4f4; border-bottom: 2px solid transparent; transform: translateX(16px) translateY(-4px) rotate(30deg)"></div></div><div style="margin-left: auto;"> <div style=" width: 0px; border-top: 8px solid #F4F4F4; border-right: 8px solid transparent; transform: translateY(16px);"></div> <div style=" background-color: #F4F4F4; flex-grow: 0; height: 12px; width: 16px; transform: translateY(-4px);"></div> <div style=" width: 0; height: 0; border-top: 8px solid #F4F4F4; border-left: 8px solid transparent; transform: translateY(-4px) translateX(8px);"></div></div></div> <div style="display: flex; flex-direction: column; flex-grow: 1; justify-content: center; margin-bottom: 24px;"> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 224px;"></div> <div style=" background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; width: 144px;"></div></div></a><p style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; line-height:17px; margin-bottom:0; margin-top:8px; overflow:hidden; padding:8px 0 7px; text-align:center; text-overflow:ellipsis; white-space:nowrap;"><a href="https://www.instagram.com/p/B1TPyXgl_gs/?utm_source=ig_embed&amp;utm_campaign=loading" style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:normal; line-height:17px; text-decoration:none;" target="_blank">A post shared by therock (@therock)</a> on <time style=" font-family:Arial,sans-serif; font-size:14px; line-height:17px;" datetime="2019-08-18T09:43:39+00:00">Aug 18, 2019 at 2:43am PDT</time></p></div></blockquote>
<script async src="//www.instagram.com/embed.js"></script>
                </div>


                    </div>
    </div>
    

        <div class="margin-bottom-6">
        <div class="row">
                            <div class="col">
                    <h2>Top @Mentions</h2>
                    <p class="text-muted">Top mentions from the last 10 posts</p>

                    <div class="d-flex flex-column">
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/sevenbucksprod" class="text-dark report-content-number-link" target="_blank">sevenbucksprod</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 3 out of 10 posts">3</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/hobbsandshaw" class="text-dark report-content-number-link" target="_blank">hobbsandshaw</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 2 out of 10 posts">2</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/hhgarcia41" class="text-dark report-content-number-link" target="_blank">hhgarcia41</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 2 out of 10 posts">2</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/laurenhashianofficial" class="text-dark report-content-number-link" target="_blank">laurenhashianofficial</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/WWE" class="text-dark report-content-number-link" target="_blank">WWE</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/steveaustinbsr" class="text-dark report-content-number-link" target="_blank">steveaustinbsr</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/madametussauds" class="text-dark report-content-number-link" target="_blank">madametussauds</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/usweekly" class="text-dark report-content-number-link" target="_blank">usweekly</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/tomhanks" class="text-dark report-content-number-link" target="_blank">tomhanks</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/variety" class="text-dark report-content-number-link" target="_blank">variety</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/arsenal_strength" class="text-dark report-content-number-link" target="_blank">arsenal_strength</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/flex_lewis" class="text-dark report-content-number-link" target="_blank">flex_lewis</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                            </div>
                </div>
            
                            <div class="col">
                    <h2>Top #Hashtags</h2>
                    <p class="text-muted">Top hashtags from the last 10 posts</p>


                    <div class="d-flex flex-column">
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/MadameTussaudsBeijing/" class="text-dark report-content-number-link" target="_blank">#MadameTussaudsBeijing</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 2 out of 10 posts">2</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/ironparadise/" class="text-dark report-content-number-link" target="_blank">#ironparadise</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 2 out of 10 posts">2</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/BillionDollarProducer/" class="text-dark report-content-number-link" target="_blank">#BillionDollarProducer</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 2 out of 10 posts">2</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/StraightUpSteveAustin/" class="text-dark report-content-number-link" target="_blank">#StraightUpSteveAustin</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/ifyasmell/" class="text-dark report-content-number-link" target="_blank">#ifyasmell</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/season5/" class="text-dark report-content-number-link" target="_blank">#season5</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/ballers/" class="text-dark report-content-number-link" target="_blank">#ballers</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/irontherapy/" class="text-dark report-content-number-link" target="_blank">#irontherapy</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/midnightoil/" class="text-dark report-content-number-link" target="_blank">#midnightoil</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/ricflairstrut/" class="text-dark report-content-number-link" target="_blank">#ricflairstrut</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/fargostrut/" class="text-dark report-content-number-link" target="_blank">#fargostrut</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/woo/" class="text-dark report-content-number-link" target="_blank">#woo</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/MadameTussaudsLondon/" class="text-dark report-content-number-link" target="_blank">#MadameTussaudsLondon</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/HardestWorkerInTheRoom/" class="text-dark report-content-number-link" target="_blank">#HardestWorkerInTheRoom</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                                    <div class="d-flex align-items-center">

                                <a href="https://www.instagram.com/explore/tags/SevenBucksProds/" class="text-dark report-content-number-link" target="_blank">#SevenBucksProds</a>

                                <span class="report-content-number" data-toggle="tooltip" title="Used in 1 out of 10 posts">1</span>
                            </div>
                                            </div>
                </div>
                    </div>
    </div>
    

    <div class="margin-bottom-6">
        <h2>Engagement Rates on Instagram</h2>
        <p class="text-muted">These are overall / average engagement rates found on Instagram. Statistics based on analysis of more than 1 million influencer profiles.</p>

        
        <table class="table table-responsive-md">
            <thead class="thead-black">
            <tr>
                <th>Followers</th>
                <th>Other Average Engagement</th>
                <th>Profile Engagement</th>
            </tr>
            </thead>

            <tbody>
            <tr >
                <td>< 1,000</td>
                <td>8%</td>
                <td>
                                    </td>
            </tr>

            <tr >
                <td>< 5,000</td>
                <td>5.7%</td>
                <td>
                                    </td>
            </tr>

            <tr >
                <td>< 10,000</td>
                <td>4%</td>
                <td>
                                    </td>
            </tr>

            <tr >
                <td>< 100,000</td>
                <td>2.4%</td>
                <td>
                                    </td>
            </tr>

            <tr class="bg-light">
                <td>100,000+</td>
                <td>1.7%</td>
                <td>
                    
                        <img src="https://scontent-ort2-1.cdninstagram.com/vp/96cf9923f1e76809975e3543546f4ef8/5E13B1FC/t51.2885-19/11850309_1674349799447611_206178162_a.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" class="img-responsive rounded-circle instagram-avatar-small" alt="therock" />&nbsp;<strong>1.74%</strong>
                                    </td>
            </tr>
            </tbody>
        </table>
    </div>

            <div class="margin-bottom-6">
            <h2>Media Stats Summary</h2>
            <p class="text-muted">Showing last 10 entries.</p>

            <table class="table table-responsive-md">
                <thead class="thead-black">
                <tr>
                    <th></th>
                    <th></th>
                    <th>Posted On</th>
                    <th>Caption</th>
                    <th>Likes</th>
                    <th>Comments</th>
                </tr>
                </thead>
                <tbody>
                                    <tr>
                        <td>
                            <a href="https://www.instagram.com/p/B1YKvuUFR5e" target="_blank" data-toggle="tooltip" title="Image">
                                <i class="fa fa-image"></i>                            </a>
                        </td>
                        <td><img src="https://scontent-ort2-1.cdninstagram.com/vp/d888aa928ff745e0be4b4042e5cc6514/5DD444F5/t51.2885-15/e35/s150x150/66464157_156237648769966_1787022435723294069_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" class="img-responsive rounded-circle instagram-avatar-small" /></td>
                        <td><span data-toggle="tooltip" title="2019-08-20 08:35:48">2019-08-20</span></td>
                        <td><span data-toggle="tooltip" title="Good 2nd week of box office business. $437M worldwide. 
Nice momentum as we roll into China this coming weekend. 
Thanks everyone for supporting our lil’ spin-off known as @hobbsandshaw. 
@sevenbucksprod">Good 2nd week of box of..</span></td>
                        <td>
                            <i class="fa fa-heart like-color"></i> 1,064,507                            <small><span style="color: #dc3545 !important;">-60%</span></small>
                        </td>
                        <td>
                            <i class="fa fa-comments"></i> 5,631                            <small><span style="color: #dc3545 !important;">-76%</span></small>
                        </td>
                    </tr>
                                    <tr>
                        <td>
                            <a href="https://www.instagram.com/p/B1V5m7WFfUy" target="_blank" data-toggle="tooltip" title="Carousel">
                                <i class="fa fa-images"></i>                            </a>
                        </td>
                        <td><img src="https://scontent-ort2-1.cdninstagram.com/vp/2b1dcefaf1899ecc0469d96ec153fe6b/5E114723/t51.2885-15/e35/c26.0.532.532a/s150x150/66835779_676277182877010_5367724258284800961_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" class="img-responsive rounded-circle instagram-avatar-small" /></td>
                        <td><span data-toggle="tooltip" title="2019-08-19 11:27:34">2019-08-19</span></td>
                        <td><span data-toggle="tooltip" title="We do. 
August 18th, 2019.
Hawaii.
Pōmaikaʻi (blessed) 
@laurenhashianofficial❤️
@hhgarcia41?">We do. 
August 18th..</span></td>
                        <td>
                            <i class="fa fa-heart like-color"></i> 14,345,303                            <small><span style="color: #28a745 !important;">+438%</span></small>
                        </td>
                        <td>
                            <i class="fa fa-comments"></i> 177,016                            <small><span style="color: #28a745 !important;">+651%</span></small>
                        </td>
                    </tr>
                                    <tr>
                        <td>
                            <a href="https://www.instagram.com/p/B1Uj-lenU2-" target="_blank" data-toggle="tooltip" title="Video">
                                <i class="fa fa-video"></i>                            </a>
                        </td>
                        <td><img src="https://scontent-ort2-1.cdninstagram.com/vp/0d8fbf8411da0727faca90389dd94323/5D600678/t51.2885-15/e35/s150x150/67074319_455177048399979_3898655953633965558_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" class="img-responsive rounded-circle instagram-avatar-small" /></td>
                        <td><span data-toggle="tooltip" title="2019-08-18 23:06:29">2019-08-18</span></td>
                        <td><span data-toggle="tooltip" title="Very kind words from my good buddy and all time greatest rivalry in @WWE, the Rattlesnake himself, @steveaustinbsr. 
We wrestled each other all over the world and I’m grateful for every bit of blood and sweat we dropped. 
If you watch him closely here, you can tell he was and still is a real student of the game. 
It’s why he’ll always be the GOAT. 
Good luck with your new show #StraightUpSteveAustin and as always, “thanks for the house” brother. 
#ifyasmell ?">Very kind words..</span></td>
                        <td>
                            <i class="fa fa-heart like-color"></i> 1,361,421                            <small><span style="color: #dc3545 !important;">-49%</span></small>
                        </td>
                        <td>
                            <i class="fa fa-comments"></i> 4,773                            <small><span style="color: #dc3545 !important;">-80%</span></small>
                        </td>
                    </tr>
                                    <tr>
                        <td>
                            <a href="https://www.instagram.com/p/B1UAR6DHWzC" target="_blank" data-toggle="tooltip" title="Video">
                                <i class="fa fa-video"></i>                            </a>
                        </td>
                        <td><img src="https://scontent-ort2-1.cdninstagram.com/vp/d7cf5c8b5c799c26da4318fe7ff81fe8/5D606011/t51.2885-15/e35/c157.0.405.405a/s150x150/62448033_135673647655923_8997357574399522124_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" class="img-responsive rounded-circle instagram-avatar-small" /></td>
                        <td><span data-toggle="tooltip" title="2019-08-18 17:50:10">2019-08-18</span></td>
                        <td><span data-toggle="tooltip" title="Ballers is back in ONE WEEK. 
Sunday. August 25th. HBO. 
#season5
#ballers 
@sevenbucksprod">Ballers is back in ONE WE..</span></td>
                        <td>
                            <i class="fa fa-heart like-color"></i> 878,553                            <small><span style="color: #dc3545 !important;">-67%</span></small>
                        </td>
                        <td>
                            <i class="fa fa-comments"></i> 5,541                            <small><span style="color: #dc3545 !important;">-77%</span></small>
                        </td>
                    </tr>
                                    <tr>
                        <td>
                            <a href="https://www.instagram.com/p/B1TPyXgl_gs" target="_blank" data-toggle="tooltip" title="Image">
                                <i class="fa fa-image"></i>                            </a>
                        </td>
                        <td><img src="https://scontent-ort2-1.cdninstagram.com/vp/3d66772a36eab19e32fd1348309ca0c6/5DD5F84E/t51.2885-15/e35/c180.0.1080.1080/s150x150/67013899_233018324325296_1024773769709798919_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" class="img-responsive rounded-circle instagram-avatar-small" /></td>
                        <td><span data-toggle="tooltip" title="2019-08-18 10:43:39">2019-08-18</span></td>
                        <td><span data-toggle="tooltip" title="Goin’ past midnight and gettin’ a late one in. 
Much needing some church tonight. 
Onward. Work. 
#irontherapy #ironparadise #midnightoil ?">Goin’ past midnight a..</span></td>
                        <td>
                            <i class="fa fa-heart like-color"></i> 1,733,833                            <small><span style="color: #dc3545 !important;">-35%</span></small>
                        </td>
                        <td>
                            <i class="fa fa-comments"></i> 6,335                            <small><span style="color: #dc3545 !important;">-73%</span></small>
                        </td>
                    </tr>
                                    <tr>
                        <td>
                            <a href="https://www.instagram.com/p/B1SpBf6FmXH" target="_blank" data-toggle="tooltip" title="Image">
                                <i class="fa fa-image"></i>                            </a>
                        </td>
                        <td><img src="https://scontent-ort2-1.cdninstagram.com/vp/e60fcda4771d3dae236ac20b51e1bbe3/5DD70C6B/t51.2885-15/e35/s150x150/67557275_375071400051447_5142767203758137358_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" class="img-responsive rounded-circle instagram-avatar-small" /></td>
                        <td><span data-toggle="tooltip" title="2019-08-18 05:04:56">2019-08-18</span></td>
                        <td><span data-toggle="tooltip" title="Thank you Korea for making @hobbsandshaw break another franchise record. 
Not too shabby for our second week of box office biz. 
The “Struts into Korea” had me chuckling. Funny visual ??
#ricflairstrut #fargostrut #woo">Thank you Korea for m..</span></td>
                        <td>
                            <i class="fa fa-heart like-color"></i> 1,368,256                            <small><span style="color: #dc3545 !important;">-49%</span></small>
                        </td>
                        <td>
                            <i class="fa fa-comments"></i> 5,937                            <small><span style="color: #dc3545 !important;">-75%</span></small>
                        </td>
                    </tr>
                                    <tr>
                        <td>
                            <a href="https://www.instagram.com/p/B1PE9WslV8G" target="_blank" data-toggle="tooltip" title="Video">
                                <i class="fa fa-video"></i>                            </a>
                        </td>
                        <td><img src="https://scontent-ort2-1.cdninstagram.com/vp/bee7b6df82c19c980201000c5fc9040d/5D5F9614/t51.2885-15/e35/c157.0.405.405a/s150x150/68911276_2984557565103281_3674150379253974573_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" class="img-responsive rounded-circle instagram-avatar-small" /></td>
                        <td><span data-toggle="tooltip" title="2019-08-16 20:05:45">2019-08-16</span></td>
                        <td><span data-toggle="tooltip" title="Cheers you sexy SOB ?
A very cool honor to have multiple Dwayne Johnsons have a presence at the world renowned @madametussauds. One sexy DJ will have full time residency in London, while the other sexy DJ will travel Asia and the world, starting at #MadameTussaudsBeijing. 
So I invite you all to come hang out with me, take some fun selfies, raise a glass and toast to hard work, gratitude and the words I NEVER hear when people meet me for the first time, I thought you’d be bigger, Rock!? ?
Thanks again, Madame Tussauds. 
Cool honor ?
#MadameTussaudsLondon
#MadameTussaudsBeijing 
#HardestWorkerInTheRoom">Cheers you sexy SOB ?
A..</span></td>
                        <td>
                            <i class="fa fa-heart like-color"></i> 1,569,604                            <small><span style="color: #dc3545 !important;">-41%</span></small>
                        </td>
                        <td>
                            <i class="fa fa-comments"></i> 10,559                            <small><span style="color: #dc3545 !important;">-55%</span></small>
                        </td>
                    </tr>
                                    <tr>
                        <td>
                            <a href="https://www.instagram.com/p/B1OIr7floj6" target="_blank" data-toggle="tooltip" title="Image">
                                <i class="fa fa-image"></i>                            </a>
                        </td>
                        <td><img src="https://scontent-ort2-1.cdninstagram.com/vp/5d5f225cdbac7154176849d0834811f6/5E0CDA1E/t51.2885-15/e35/c0.180.1440.1440/s150x150/67585452_653900935020331_1309339146336823195_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" class="img-responsive rounded-circle instagram-avatar-small" /></td>
                        <td><span data-toggle="tooltip" title="2019-08-16 11:05:24">2019-08-16</span></td>
                        <td><span data-toggle="tooltip" title="Cheers ? and thank you @usweekly for putting this kid on your cover. 
I’ve travelled a very long road from having $7bucks in my pocket to these pretty amazing headlines. 
I take nothing for granted and treat success as if it has to be earned every single day. 
And thanks for calling me, Hollywood’s nicest guy, BUT I give that crown to my good buddy @tomhanks - he’s much nicer and cusses much less ?
Truth is, it’s nice to be important, but it’s more important to be nice. 
Thanks again. DJ ?">Cheers ? and th..</span></td>
                        <td>
                            <i class="fa fa-heart like-color"></i> 1,911,098                            <small><span style="color: #dc3545 !important;">-28%</span></small>
                        </td>
                        <td>
                            <i class="fa fa-comments"></i> 12,107                            <small><span style="color: #dc3545 !important;">-49%</span></small>
                        </td>
                    </tr>
                                    <tr>
                        <td>
                            <a href="https://www.instagram.com/p/B1LebTkFTMO" target="_blank" data-toggle="tooltip" title="Image">
                                <i class="fa fa-image"></i>                            </a>
                        </td>
                        <td><img src="https://scontent-ort2-1.cdninstagram.com/vp/439c7151a341fa943463e147d848203f/5DF84314/t51.2885-15/e35/s150x150/66497853_1083811145143973_1135335368542191079_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" class="img-responsive rounded-circle instagram-avatar-small" /></td>
                        <td><span data-toggle="tooltip" title="2019-08-15 10:17:39">2019-08-15</span></td>
                        <td><span data-toggle="tooltip" title="A massive #BillionDollarProducer congrats to our President of @sevenbucksprod, @hhgarcia41 for this outstanding recognition from @variety. 
I’ve known Hiram since I was 18yrs old and he started off as my assistant when we first broke into Hollywood together, filming THE SCORPION KING. 
From that day, he’s never stopped working relentlessly hard, paying his dues to learn every facet of the business from the ground up and has helped shape the foundation, values and ethos of what’s now known as Seven Bucks Companies. 
He’s become a true force, outstanding company leader who’s universally respected and admired and TRULY embodies the Seven Bucks principle of always putting the audience first. 
Congrats H on this historic milestone. 
Still much work to be done - onward, brother ?
#BillionDollarProducer
#SevenBucksProds">A massive #Bill..</span></td>
                        <td>
                            <i class="fa fa-heart like-color"></i> 1,432,326                            <small><span style="color: #dc3545 !important;">-46%</span></small>
                        </td>
                        <td>
                            <i class="fa fa-comments"></i> 4,940                            <small><span style="color: #dc3545 !important;">-79%</span></small>
                        </td>
                    </tr>
                                    <tr>
                        <td>
                            <a href="https://www.instagram.com/p/B1KNaKJFAeP" target="_blank" data-toggle="tooltip" title="Image">
                                <i class="fa fa-image"></i>                            </a>
                        </td>
                        <td><img src="https://scontent-ort2-1.cdninstagram.com/vp/e56af960cf2a475822af6da05d21e1ed/5DE39C11/t51.2885-15/e35/c2.0.1435.1435/s150x150/66435063_133721074546303_4969252805160448554_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" class="img-responsive rounded-circle instagram-avatar-small" /></td>
                        <td><span data-toggle="tooltip" title="2019-08-14 22:29:42">2019-08-14</span></td>
                        <td><span data-toggle="tooltip" title="Bad ass surprise waiting for me in the traveling circus known as the IRON PARADISE this week. 
Custom @arsenal_strength bilateral leg press with my PROJECT ROCK BULL at the bottom by the handles. 
Big shout to my good friends - the GOAT @flex_lewis and his Arsenal Strength team for this one ☝??? Slowly but surely Arsenal equipment is taking over my 50,000+ lbs of iron and ego destroyer in my gym. 
Thanks again gents and with much blood, sweat & respect. 
#hardestworkerintheroom 
#ironparadise">Bad ass surprise waitin..</span></td>
                        <td>
                            <i class="fa fa-heart like-color"></i> 974,679                            <small><span style="color: #dc3545 !important;">-63%</span></small>
                        </td>
                        <td>
                            <i class="fa fa-comments"></i> 2,958                            <small><span style="color: #dc3545 !important;">-87%</span></small>
                        </td>
                    </tr>
                
                </tbody>
            </table>
        </div>

        <div class="margin-bottom-6">
            <h2>Media Stats Chart</h2>

            <div class="chart-container">
                <canvas id="media_chart"></canvas>
            </div>

        </div>
    
</div>


<script>
    /* Datepicker */
    $('#datepicker_input').datepicker({
        language: 'en',
        autoClose: true,
        timepicker: false,
        toggleSelected: false,
        minDate: new Date($('#datepicker_input').data('min')),
        maxDate: new Date()
    });

    $('#datepicker_form').on('submit', (event) => {
        let date = $("#datepicker_input").val();

        let [ date_start, date_end ] = date.split(',');

        if(typeof date_end == 'undefined') {
            date_end = date_start
        }

        let base_url = $("#base_url").val();

        /* Redirect */
        window.location.href = `${base_url}/${date_start}/${date_end}`;

        event.preventDefault();
    });

    Chart.defaults.global.elements.line.borderWidth = 4;
    Chart.defaults.global.elements.point.radius = 3;
    Chart.defaults.global.elements.point.borderWidth = 7;


    let followers_chart_context = document.getElementById('followers_chart').getContext('2d');

    let gradient = followers_chart_context.createLinearGradient(0, 0, 0, 250);
    gradient.addColorStop(0, 'rgba(43, 227, 155, 0.6)');
    gradient.addColorStop(1, 'rgba(43, 227, 155, 0.05)');

    new Chart(followers_chart_context, {
        type: 'line',
        data: {
            labels: ["2019-08-07", "2019-08-08", "2019-08-09", "2019-08-10", "2019-08-11", "2019-08-12", "2019-08-13", "2019-08-14", "2019-08-15", "2019-08-16", "2019-08-17", "2019-08-18", "2019-08-19", "2019-08-20", "2019-08-21"],
            datasets: [{
                label: "Followers",
                data: ["152601655", "152677703", "152802524", "152963495", "153071182", "153227419", "153367238", "153481889", "153660183", "153777570", "153878618", "154012198", "154076021", "154395467", "154489097"],
                backgroundColor: gradient,
                borderColor: '#2BE39B',
                fill: true
            }]
        },
        options: {
            tooltips: {
                mode: 'index',
                intersect: false
            },
            title: {
                text: "Followers evolution chart",
                display: true
            },
            legend: {
                display: false
            },
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        userCallback: (value, index, values) => {
                            if(Math.floor(value) === value) {
                                return number_format(value, 0, '.', ',');
                            }
                        }
                    }
                }],
                xAxes: [{
                    gridLines: {
                        display: false
                    }
                }]
            }
        }
    });


    let following_chart_context = document.getElementById('following_chart').getContext('2d');

    gradient = following_chart_context.createLinearGradient(0, 0, 0, 250);
    gradient.addColorStop(0, 'rgba(62, 193, 255, 0.6)');
    gradient.addColorStop(1, 'rgba(62, 193, 255, 0.05)');

    new Chart(following_chart_context, {
        type: 'line',
        data: {
            labels: ["2019-08-07", "2019-08-08", "2019-08-09", "2019-08-10", "2019-08-11", "2019-08-12", "2019-08-13", "2019-08-14", "2019-08-15", "2019-08-16", "2019-08-17", "2019-08-18", "2019-08-19", "2019-08-20", "2019-08-21"],
            datasets: [{
                label: "Following",
                data: ["297", "297", "297", "299", "299", "299", "299", "299", "299", "300", "299", "299", "299", "300", "301"],
                backgroundColor: gradient,
                borderColor: '#3ec1ff',
                fill: true
            }]
        },
        options: {
            tooltips: {
                mode: 'index',
                intersect: false
            },
            title: {
                text: "Following evolution chart",
                display: true
            },
            legend: {
                display: false
            },
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        userCallback: (value, index, values) => {
                            if(Math.floor(value) === value) {
                                return number_format(value, 0, '.', ',');
                            }
                        }
                    }
                }],
                xAxes: [{
                    gridLines: {
                        display: false
                    }
                }]
            }
        }
    });


    let average_engagement_rate_chart_context = document.getElementById('average_engagement_rate_chart').getContext('2d');

    gradient = average_engagement_rate_chart_context.createLinearGradient(0, 0, 0, 250);
    gradient.addColorStop(0, 'rgba(237, 73, 86, 0.4)');
    gradient.addColorStop(1, 'rgba(237, 73, 86, 0.05)');

    let average_engagement_rate_chart = new Chart(average_engagement_rate_chart_context, {
        type: 'line',
        data: {
            labels: ["2019-08-07", "2019-08-08", "2019-08-09", "2019-08-10", "2019-08-11", "2019-08-12", "2019-08-13", "2019-08-14", "2019-08-15", "2019-08-16", "2019-08-17", "2019-08-18", "2019-08-19", "2019-08-20", "2019-08-21"],
            datasets: [{
                data: ["0.92", "0.83", "0", "1.06", "1.29", "1.42", "1.22", "1.22", "1.08", "1.01", "1.10", "0.93", "1.20", "1.70", "1.74"],
                backgroundColor: gradient,
                borderColor: '#ED4956',
                fill: true
            }]
        },
        options: {
            tooltips: {
                mode: 'index',
                intersect: false
            },
            title: {
                text: "Average Engagement Rate",
                display: true
            },
            legend: {
                display: false
            },
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        userCallback: (value, index, values) => {
                            if(Math.floor(value) === value) {
                                return number_format(value, 0, '.', ',');
                            }
                        }
                    }
                }],
                xAxes: [{
                    gridLines: {
                        display: false
                    }
                }]
            }
        }
    });


    new Chart(document.getElementById('media_chart').getContext('2d'), {
        type: 'line',
        data: {
            labels: ["2019-08-14", "2019-08-15", "2019-08-16", "2019-08-16", "2019-08-18", "2019-08-18", "2019-08-18", "2019-08-18", "2019-08-19", "2019-08-20"],
            datasets: [{
                label: "Likes",
                data: ["974679", "1432326", "1911098", "1569604", "1368256", "1733833", "878553", "1361421", "14345303", "1064507"],
                backgroundColor: '#ED4956',
                borderColor: '#ED4956',
                fill: false
            },
                {
                    label: "Comments",
                    data: ["2958", "4940", "12107", "10559", "5937", "6335", "5541", "4773", "177016", "5631"],
                    backgroundColor: '#2caff7',
                    borderColor: '#2caff7',
                    fill: false
                },
                {
                    label: "Caption Word Count",
                    data: ["82", "130", "95", "99", "33", "19", "13", "84", "11", "30"],
                    backgroundColor: '#25f7b1',
                    borderColor: '#25f7b1',
                    fill: false
                }]
        },
        options: {
            tooltips: {
                mode: 'index',
                intersect: false
            },
            title: {
                display: false
            },
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        userCallback: (value, index, values) => {
                            if(Math.floor(value) === value) {
                                return number_format(value, 0, '.', ',');
                            }
                        }
                    }
                }],
                xAxes: [{
                    gridLines: {
                        display: false
                    }
                }]
            }
        }
    }); 

</script>

        <div class="container">
            <div class="d-flex flex-column">
                <small class="text-muted">Last successful check date: 2020-04-27 18:07:12</small>
                <small class="text-muted">Last check date: 2019-08-21 16:54:32</small>
                <small class="text-muted">Time Zone: Europe/London</small>
            </div>
        </div>





<%@ include file="_footer.jspf" %>