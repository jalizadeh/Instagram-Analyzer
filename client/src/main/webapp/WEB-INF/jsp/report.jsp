<%@ include file="_header.jspf"%>

<link href="resources/css/datepicker.min.css" rel="stylesheet" media="screen,print">
<script src="resources/js/datepicker.min.js"></script>
<script src="resources/js/i18n/datepicker.en.js"></script>
<script src="resources/js/Chart.bundle.min.js"></script>

<link rel="canonical" href="http://localhost:8011/report/${user.username}" />

<script src="resources/Highchart-8.0.4/highcharts.js"></script>
<script src="resources/Highchart-8.0.4/modules/series-label.js"></script>
<script src="resources/Highchart-8.0.4/modules/exporting.js"></script>
<script src="resources/Highchart-8.0.4/modules/data.js"></script>
<script src="resources/Highchart-8.0.4/modules/drilldown.js"></script>
<script src="resources/Highchart-8.0.4/modules/export-data.js"></script>
<script src="resources/Highchart-8.0.4/modules/accessibility.js"></script>
<script src="resources/Highchart-8.0.4/modules/annotations.js"></script>
<script src="resources/Highchart-8.0.4/modules/streamgraph.js"></script>

<style type="text/css">
	.highcharts-figure, .highcharts-data-table table {
	    min-width: 360px; 
	    max-width: 800px;
	    margin: 1em auto;
	}
	
	.highcharts-data-table table {
		font-family: Verdana, sans-serif;
		border-collapse: collapse;
		border: 1px solid #EBEBEB;
		margin: 10px auto;
		text-align: center;
		width: 100%;
		max-width: 500px;
	}
	.highcharts-data-table caption {
	    padding: 1em 0;
	    font-size: 1.2em;
	    color: #555;
	}
	.highcharts-data-table th {
		font-weight: 600;
	    padding: 0.5em;
	}
	.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
	    padding: 0.5em;
	}
	.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
	    background: #f8f8f8;
	}
	.highcharts-data-table tr:hover {
	    background: #f1f7ff;
	}
</style>

<%@ include file="_navigation.jspf"%>

<div class="container">

	<div class="card card-shadow mt-5 mb-1 zoomer">
		<div class="card-body">
			<div class="d-flex flex-column flex-sm-row flex-wrap">

				<div class="col-sm-4 col-md-3 col-lg-2 d-flex justify-content-center justify-content-sm-start">
					<img src="${user.profilePicUrl}" class="img-fluid rounded-circle instagram-avatar" alt="${user.username}" />

					<a class="fa-stack fa-xs source-badge-position"
						style="vertical-align: top;"
						href="${user.hdProfilePicUrl}"> <i
						class="fas fa-circle text-instagram fa-stack-2x"></i> <i
						class="fab fa-fab fa-instagram fa-stack-1x fa-inverse"></i>
					</a>
				</div>

				<div
					class="col-sm-8 col-md-9 col-lg-5 d-flex justify-content-center justify-content-sm-start">
					<div class="row d-flex flex-column">
						<p class="m-0">
							<a href="https://instagram.com/${user.username}" target="_blank"
								class="text-dark" rel="nofollow">@${user.username}</a>
						</p>

					<h1>
						${user.fullName}
	
						<c:if test="${user.isVerified()}">
							<span class="align-self-center ml-3" data-toggle="tooltip"
							 title="Instagram Verified"><i class="fa fa-check-circle user-verified-badge"></i>
							</span>
						</c:if>
	
	
						<c:if test="${user.isBusiness()}">
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
						<p class="report-header-number">${user.followers}</p>
					</div>

					<div class="col d-flex flex-column justify-content-center">
						Followings
						<p class="report-header-number">${user.followings}</p>
					</div>
					
					<div class="col d-flex flex-column justify-content-center">
						Uploads
						<p class="report-header-number">${user.uploads}</p>
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
						
						<c:if test="${not empty user.externalUrl}">
							 <a href="${user.externalUrl}"><i class="fas fa-link"></i></a>
						</c:if>
						
						<c:if test="${not empty user.latitude and not empty user.longitude}">
							 <a href="https://www.google.com/maps/place/${user.latitude},${user.longitude}"><i class="fas fa-map-marker-alt"></i></a>
						</c:if>
						
						<c:if test="${not empty user.email}">
							 <a href="mailto:${user.email}?subject=Hi"><i class="fas fa-at"></i></a>
						</c:if>
						 
					</p>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="row my-5">
		<div class="col">
			<div id="chartFollower"></div>
		</div>
		
		<div class="col">
			<div id="chartFollowing"></div>
		</div>
	</div>
	
	<div class="row my-5">
		<div class="col">
			<div id="chartLCV"></div>
		</div>
	</div>
	
	<div class="row my-5">
		<div class="col">
			<div id="chartLCVCompound"></div>
		</div>
	</div>
	
	<div class="row my-5">
		<div class="col">
			<div id="chartDrilldownCountDOW"></div>
		</div>
		
		<div class="col">
			<div id="chartCountDOW"></div>
		</div>
	</div>
	
</div>

<script type="text/javascript">
	Highcharts.chart('chartFollower', {
		chart: { type: 'line' },
	    title: { text: 'Followers' },
	    yAxis: { title: {  text: '' }  },
	    xAxis: { categories: [
		        	<c:forEach items="${logs}" var="log">
						'<fmt:formatDate value="${log.lastCheckDate}" pattern="yyyy-MM-dd" />',
					</c:forEach>
	        ]},
	    legend: {  enabled: false },
	    plotOptions: { series: {  label: { connectorAllowed: false } }  },
	    series: [{
	        name: 'Followers',
	        data: [ <c:forEach items="${logs}" var="log"> ${log.followers}, </c:forEach> ]
	    }],
	    responsive: {
	        rules: [{
	            condition: {  maxWidth: 500 },
	            chartOptions: { legend: { layout: 'horizontal', align: 'center',  verticalAlign: 'bottom' }}
	        }]
	    }
	});
</script>

<script type="text/javascript">
	Highcharts.chart('chartFollowing', {
		chart: { type: 'line' },
	    title: { text: 'Followings' },
	    yAxis: { title: {  text: '' }  },
	    xAxis: { categories: [
		        	<c:forEach items="${logs}" var="log">
						'<fmt:formatDate value="${log.lastCheckDate}" pattern="yyyy-MM-dd" />',
					</c:forEach>
	        ]},
	    legend: {  enabled: false },
	    plotOptions: { series: {  label: { connectorAllowed: false } }  },
	    series: [{
	        name: 'Followings',
	        data: [
				<c:forEach items="${logs}" var="log">
					${log.followings},
				</c:forEach>
			]
	    }],
	    responsive: {
	        rules: [{
	            condition: {  maxWidth: 500 },
	            chartOptions: { legend: { layout: 'horizontal', align: 'center',  verticalAlign: 'bottom' }}
	        }]
	    }
	});
</script>

<script type="text/javascript">
    Highcharts.chart('chartLCV', {
        chart: { zoomType: 'x' },
        title: { text: 'Like, Comment & View' },
        subtitle: { text: 'Click & Drag to Zoom / Click on dates to visit post' },
        xAxis: { categories: [
                <c:forEach items="${feedList}" var="feed">
                	'<a href="http://www.instagram.com/p/${feed.code}"><fmt:formatDate value="${feed.takenAt}" pattern="yyyy-MM-dd" /></a>',
                </c:forEach>
            ]},
        yAxis: { title: { text: '' } },
        legend: { align: 'left', verticalAlign: 'top', borderWidth: 0 },
        tooltip: { shared: true, crosshairs: true },
        plotOptions: {
            area: {
                fillColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                    stops: [
                        [0, Highcharts.getOptions().colors[0]],
                        [1, Highcharts.color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                    ]
                },
                marker: { radius: 2 },
                lineWidth: 1,
                states: { hover: { lineWidth: 1 } },
                threshold: null
            }
        },
        series: [
            {
                name: 'Like',
                data: [ <c:forEach items="${feedList}" var="feed"> ${feed.likeCount}, </c:forEach> ]
            },
            {
                name: 'Comments',
                data: [ <c:forEach items="${feedList}" var="feed"> ${feed.commentCount}, </c:forEach> ]
            },
            {
                name: 'Views',
                data: [ <c:forEach items="${feedList}" var="feed"> ${feed.viewCount}, </c:forEach> ]
            }
        ]
    });
</script>

<script type="text/javascript">
	var colors = Highcharts.getOptions().colors;
	Highcharts.chart('chartLCVCompound', {
	    chart: { type: 'streamgraph', marginBottom: 30, zoomType: 'x' },
	    colors: [ colors[0], colors[1], colors[2], colors[3], colors[4], colors[5],],
	    title: { floating: true, align: 'left', text: 'Compound Volume of Likes, Comments & Views'},
	    subtitle: { floating: true, align: 'left', y: 30, text: 'Click & Drag to Zoom / Click on dates to visit post'},
	    xAxis: {
	        maxPadding: 0, type: 'category', crosshair: true,
	        labels: { align: 'left', reserveSpace: false, rotation: 270 }, lineWidth: 0, margin: 20, tickWidth: 0,
	        categories: [
	            '',
	            <c:forEach items="${feedList}" var="feed">
                    '<a href="http://www.instagram.com/p/${feed.code}"><fmt:formatDate value="${feed.takenAt}" pattern="yyyy-MM-dd" /></a>',
                </c:forEach>
	        ]
	    },
	    yAxis: { visible: false, startOnTick: false, endOnTick: false },
	    legend: {layout: 'vertical', align: 'left', verticalAlign: 'middle', borderWidth: 0 },
	    plotOptions: { series: { label: { minFontSize: 5, maxFontSize: 15, style: { color: 'rgba(255,255,255,0.75)'  } } } },
	    series: [
            {
                name: 'Likes',
                data: [ 0, <c:forEach items="${feedList}" var="feed"> ${feed.likeCount},   </c:forEach> ]
            },
            {
                name: 'Comments',
                data: [	0, <c:forEach items="${feedList}" var="feed"> ${feed.commentCount},    </c:forEach> ]
            },
            {
                name: 'Views',
                data: [ 0, <c:forEach items="${feedList}" var="feed"> ${feed.viewCount},   </c:forEach> ]
            },
        ],
	    exporting: { sourceWidth: 800, sourceHeight: 600 }
	});

</script>

<script type="text/javascript">
	Highcharts.chart('chartDrilldownCountDOW', {
	    chart: { type: 'column' },
	    title: { text: 'Distribution of publishing hours over week days' },
	    subtitle: { text: 'Click the columns to view more details' },
	    xAxis: { type: 'category' },
	    yAxis: { title: { text: '' },  allowDecimals: false },
	    legend: { enabled: false },
	    plotOptions: { series: { borderWidth: 0, dataLabels: { enabled: true, format: '{point.y}' } } },
	    tooltip: {
	        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
	        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b> post(s)<br/>'
	    },
	    series: [
	        {
	            name: "Days of Week",
	            colorByPoint: true,
	            data: [
	                {
	                 	<c:set var="mon" value="${postCountByWeekday[0]}"/>
	                    name: "Monday", y: <c:out value = "${mon}"/>,
	                    <c:choose>
						    <c:when test="${mon > 0}"> drilldown: "Monday" </c:when>
						    <c:otherwise> drilldown: null </c:otherwise>
						</c:choose>
	                },
	                {
	                    <c:set var="tue" value="${postCountByWeekday[1]}"/>
	                    name: "Tuesday", y: <c:out value = "${tue}"/>,
	                    <c:choose>
						    <c:when test="${tue > 0}"> drilldown: "Tuesday" </c:when>
						    <c:otherwise> drilldown: null </c:otherwise>
						</c:choose>
	                },
	                {
	                    <c:set var="wed" value="${postCountByWeekday[2]}"/>
	                    name: "Wednesday", y: <c:out value = "${wed}"/>,
	                    <c:choose>
						    <c:when test="${wed > 0}"> drilldown: "Wednesday" </c:when>
						    <c:otherwise> drilldown: null </c:otherwise>
						</c:choose>
	                },
	                {
	                    <c:set var="thu" value="${postCountByWeekday[3]}"/>
	                    name: "Thursday", y: <c:out value = "${thu}"/>,
	                    <c:choose>
						    <c:when test="${thu > 0}"> drilldown: "Thursday" </c:when>
						    <c:otherwise> drilldown: null </c:otherwise>
						</c:choose>
	                },
	                {
	                    <c:set var="fri" value="${postCountByWeekday[4]}"/>
	                    name: "Friday", y: <c:out value = "${fri}"/>,
	                    <c:choose>
						    <c:when test="${fri > 0}"> drilldown: "Friday" </c:when>
						    <c:otherwise> drilldown: null </c:otherwise>
						</c:choose>
	                },
	                {
	                    <c:set var="sat" value="${postCountByWeekday[5]}"/>
	                    name: "Saturday", y: <c:out value = "${sat}"/>,
	                    <c:choose>
						    <c:when test="${sat > 0}"> drilldown: "Saturday" </c:when>
						    <c:otherwise> drilldown: null </c:otherwise>
						</c:choose>
	                },
	                {
	                    <c:set var="sun" value="${postCountByWeekday[6]}"/>
	                    name: "Sunday", y: <c:out value = "${sun}"/>,
	                    <c:choose>
						    <c:when test="${sun > 0}"> drilldown: "Sunday" </c:when>
						    <c:otherwise> drilldown: null </c:otherwise>
						</c:choose>
	                }
	            ]
	        }
	    ],
	    
	    drilldown: {
	        series: [
	            <c:if test="${mon > 0}">
			    	{ name: "Monday", id: "Monday",
		               data: [ <c:forEach items="${postCountByHour[0]}" var="m"> ['${m.key}', ${m.value}], </c:forEach> ]
		             }
			    </c:if>
	            <c:if test="${tue > 0}">
			    	,{ name: "Tuesday", id: "Tuesday",
		               data: [ <c:forEach items="${postCountByHour[1]}" var="m"> ['${m.key}', ${m.value}], </c:forEach> ]
		             }
			    </c:if>
	            <c:if test="${wed > 0}">
			    	,{ name: "Wednesday", id: "Wednesday",
		               data: [ <c:forEach items="${postCountByHour[2]}" var="m"> ['${m.key}', ${m.value}], </c:forEach> ]
		             }
			    </c:if>
	            <c:if test="${thu > 0}">
			    	,{ name: "Thursday", id: "Thursday",
		               data: [ <c:forEach items="${postCountByHour[3]}" var="m"> ['${m.key}', ${m.value}], </c:forEach> ]
		             }
			    </c:if>
	            <c:if test="${fri > 0}">
			    	,{ name: "Friday", id: "Friday",
		               data: [ <c:forEach items="${postCountByHour[4]}" var="m"> ['${m.key}', ${m.value}], </c:forEach> ]
		             }
			    </c:if>
	            <c:if test="${sat > 0}">
			    	,{ name: "Saturday", id: "Saturday",
		               data: [ <c:forEach items="${postCountByHour[5]}" var="m"> ['${m.key}', ${m.value}], </c:forEach> ]
		             }
			    </c:if>
			    <c:if test="${sun > 0}">
			    	,{ name: "Sunday", id: "Sunday",
		               data: [ <c:forEach items="${postCountByHour[6]}" var="m"> ['${m.key}', ${m.value}], </c:forEach> ]
		             }
			    </c:if>
	        ]
	    }
	});
</script>

<script type="text/javascript">
	Highcharts.chart('chartCountDOW', {
	    chart: { type: 'column' },
	    title: {  text: 'Daily Post Count' },
	    xAxis: { categories: [ 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun' ]},
	    yAxis: { min: 0, title: { text: '' },  allowDecimals: false },
	    legend: {  enabled: false },
	    tooltip: {
	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	            '<td style="padding:0"><b>{point.y}</b></td></tr>',
	        footerFormat: '</table>', shared: true, useHTML: true
	    },
	    plotOptions: { column: { pointPadding: 0.2, borderWidth: 0 } },
	    series: [{ 
	    	name: 'Daily',
	        data: [ <c:forEach items="${postCountByWeekday}" var="day"> ${day},  </c:forEach> ]
	    }]
	});
</script>

<div class="container mt-5">
	<div class="d-flex flex-column">
		<small class="text-muted">Last check date: ${user.lastCheckDate}</small>
	</div>
</div>

<%@ include file="_footer.jspf"%>