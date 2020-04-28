<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en-US" class="ltr" dir="ltr">
    
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Home - Instagram Analyzer</title>
	<base href="http://localhost:8011/client/">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="shortcut icon" type="image/png" href="resources/img/favicon.png"/>
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

    <meta name="description" content="Generate a free report of your Instagram handle or popular celebrities from Hollywood, Sports and Instagram Sensations photos, filters, and hashtags, and all of your interactions with followers on Free Instagram analyzer tool." />
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen,print">
    <link href="resources/css/custom.css" rel="stylesheet" media="screen,print">
    <link href="resources/css/fa-svg-with-js.css" rel="stylesheet" media="screen,print">
    <link href="resources/css/animate.min.css" rel="stylesheet" media="screen,print">
    <link href="resources/css/aos.min.css" rel="stylesheet" media="screen">
    
    <script src="resources/js/jquery-3.2.1.min.js"></script>
    <script src="resources/js/popper.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/main.js"></script>
    <script src="resources/js/functions.js"></script>
    <script src="resources/js/fontawesome-all.min.js"></script>
</head>

<body class="index-body">
        
	<nav class="navbar navbar-main navbar-expand-lg navbar-light navbar-main-index ">
	    <div class="container">
	        <a class="navbar-brand" href="/">
	                            <img src="resources/img/logo.png" class="img-fluid navbar-logo" alt="Website Logo" />
	                    </a>
	
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_navbar" aria-controls="main_navbar" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	
	        <div class="collapse navbar-collapse justify-content-end" id="main_navbar">
	            <ul class="navbar-nav ">
	                                <li class="nav-item"><a class="nav-link" href="directory"> Directory</a></li>
	                
	                
	                    <li class="nav-item active"><a class="nav-link" href="login"><i class="fa fa-sm fa-sign-in-alt mr-1"></i> Login</a></li>
	                    <li class="nav-item active"><a class="nav-link" href="register"><i class="fa fa-sm fa-plus mr-1"></i> Register</a></li>
	
	                
	            </ul>
	        </div>
	    </div>
	</nav>



        
<div class="index-container">
    <div class="container">

        <div class="row index-row">
            <div class="col-12 col-lg-7">

                <h1 class="index-heading" data-aos="fade-down">Instagram Analyzer</h1>

                <p class="index-subheading text-muted pt-1" data-aos="fade-down" data-aos-delay="150">Analyze and track your social media accounts</p>

                
                <div class="index-search" data-aos="fade-down" data-aos-delay="300">
                    <form class="form-inline d-inline-flex search_form" action="report" method="POST">
                        <div class="index-input-div">
                            <i class="fa fa-search index-search-input-icon"></i>
                            <input class="form-control index-search-input border-0 form-control-lg source_search_input" 
                            	name="username" type="text" placeholder="Enter instagram username or profile link.."
                            	aria-label="Enter twitter username..">
                        </div>

                        <button type="submit" class="btn index-submit-button border-0 d-inline-block btn-instagram">Search</button>
                    </form>
                </div>

            </div>

            <div class="d-none d-lg-flex col justify-content-center">
                <img src="resources/img/illustration.svg" class="img-fluid align-self-end index-landing-image" data-aos="fade" data-aos-delay="150" />
            </div>
        </div>
    </div>

            <div class="container my-3">
            
            </div>
    
    </div>
</div>

<div class="animated fadeIn">

    <div class="container index-container-margin-top-big">
        <h2>Example reports</h2>
        <span class="text-muted">Check out some of our demo analytics reports.</span>

        

    <div class="card card-shadow mt-5 mb-1 zoomer">
        <div class="card-body">
            <div class="d-flex flex-column flex-sm-row flex-wrap">

                <div class="col-sm-4 col-md-3 col-lg-2 d-flex justify-content-center justify-content-sm-start">
                                            <img src="https://scontent-ort2-1.cdninstagram.com/vp/96cf9923f1e76809975e3543546f4ef8/5E13B1FC/t51.2885-19/11850309_1674349799447611_206178162_a.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" onerror="$(this).attr('src', ($(this).data('failover')))" data-failover="https://instaanalyzer.com/assets/images/default_avatar.png" class="img-fluid rounded-circle instagram-avatar" alt="therock" />
                    
                    <span class="fa-stack fa-xs source-badge-position" style="vertical-align: top;">
                        <i class="fas fa-circle text-instagram fa-stack-2x"></i>
                        <i class="fab fa-fab fa-instagram fa-stack-1x fa-inverse"></i>
                    </span>
                </div>

                <div class="col-sm-8 col-md-9 col-lg-5 d-flex justify-content-center justify-content-sm-start">
                    <div class="row d-flex flex-column">
                        <p class="m-0">
                            <a href="https://instagram.com/therock" target="_blank" class="text-dark" rel="nofollow">@therock</a>
                        </p>

                        <h1>
                            <a class="text-dark" href="report/therock">therock</a>

                            
                                                            <span data-toggle="tooltip" title="Instagram Verified"><i class="fa fa-check-circle user-verified-badge"></i></span>
                                                    </h1>

                        <small class="text-muted">mana. gratitude. tequila ?</small>

                    </div>
                </div>

                <div class="col-md-12 col-lg-5 d-flex justify-content-around align-items-center mt-4 mt-lg-0">
                    <div class="col d-flex flex-column justify-content-center">
                        Followers                        <p class="report-header-number">154M</p>
                    </div>

                    <div class="col d-flex flex-column justify-content-center">
                        Uploads                        <p class="report-header-number">4K</p>
                    </div>

                    <div class="col d-flex flex-column justify-content-center">
                        Engagement                        <p class="report-header-number">
                                                            1.74%
                                                    </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="card card-shadow mt-5 mb-1 zoomer">
        <div class="card-body">
            <div class="d-flex flex-column flex-sm-row flex-wrap">

                <div class="col-sm-4 col-md-3 col-lg-2 d-flex justify-content-center justify-content-sm-start">
                                            <img src="https://scontent-ort2-1.cdninstagram.com/vp/3f516da3d65b81e02983b80c57013db6/5DFA282D/t51.2885-19/s150x150/67310557_649773548849427_4130659181743046656_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" onerror="$(this).attr('src', ($(this).data('failover')))" data-failover="https://instaanalyzer.com/assets/images/default_avatar.png" class="img-fluid rounded-circle instagram-avatar" alt="Cristiano Ronaldo" />
                    
                    <span class="fa-stack fa-xs source-badge-position" style="vertical-align: top;">
                        <i class="fas fa-circle text-instagram fa-stack-2x"></i>
                        <i class="fab fa-fab fa-instagram fa-stack-1x fa-inverse"></i>
                    </span>
                </div>

                <div class="col-sm-8 col-md-9 col-lg-5 d-flex justify-content-center justify-content-sm-start">
                    <div class="row d-flex flex-column">
                        <p class="m-0">
                            <a href="https://instagram.com/cristiano" target="_blank" class="text-dark" rel="nofollow">@cristiano</a>
                        </p>

                        <h1>
                            <a class="text-dark" href="report/cristiano">Cristiano Ronaldo</a>

                            
                                                            <span data-toggle="tooltip" title="Instagram Verified"><i class="fa fa-check-circle user-verified-badge"></i></span>
                                                    </h1>

                        <small class="text-muted"></small>

                    </div>
                </div>

                <div class="col-md-12 col-lg-5 d-flex justify-content-around align-items-center mt-4 mt-lg-0">
                    <div class="col d-flex flex-column justify-content-center">
                        Followers                        <p class="report-header-number">180M</p>
                    </div>

                    <div class="col d-flex flex-column justify-content-center">
                        Uploads                        <p class="report-header-number">2K</p>
                    </div>

                    <div class="col d-flex flex-column justify-content-center">
                        Engagement                        <p class="report-header-number">
                                                            2.69%
                                                    </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card card-shadow mt-5 mb-1 zoomer">
        <div class="card-body">
            <div class="d-flex flex-column flex-sm-row flex-wrap">

                <div class="col-sm-4 col-md-3 col-lg-2 d-flex justify-content-center justify-content-sm-start">
                                            <img src="https://scontent-ort2-1.cdninstagram.com/vp/ef7f8a7ec6e52600312bc1f2ba573336/5DDC3265/t51.2885-19/s150x150/66510947_638381409990212_7768244753421828096_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" onerror="$(this).attr('src', ($(this).data('failover')))" data-failover="https://instaanalyzer.com/assets/images/default_avatar.png" class="img-fluid rounded-circle instagram-avatar" alt="Taylor Swift" />
                    
                    <span class="fa-stack fa-xs source-badge-position" style="vertical-align: top;">
                        <i class="fas fa-circle text-instagram fa-stack-2x"></i>
                        <i class="fab fa-fab fa-instagram fa-stack-1x fa-inverse"></i>
                    </span>
                </div>

                <div class="col-sm-8 col-md-9 col-lg-5 d-flex justify-content-center justify-content-sm-start">
                    <div class="row d-flex flex-column">
                        <p class="m-0">
                            <a href="https://instagram.com/taylorswift" target="_blank" class="text-dark" rel="nofollow">@taylorswift</a>
                        </p>

                        <h1>
                            <a class="text-dark" href="report/taylorswift">Taylor Swift</a>

                            
                                                            <span data-toggle="tooltip" title="Instagram Verified"><i class="fa fa-check-circle user-verified-badge"></i></span>
                                                    </h1>

                        <small class="text-muted">New album Lover out 8/23</small>

                    </div>
                </div>

                <div class="col-md-12 col-lg-5 d-flex justify-content-around align-items-center mt-4 mt-lg-0">
                    <div class="col d-flex flex-column justify-content-center">
                        Followers                        <p class="report-header-number">120M</p>
                    </div>

                    <div class="col d-flex flex-column justify-content-center">
                        Uploads                        <p class="report-header-number">355</p>
                    </div>

                    <div class="col d-flex flex-column justify-content-center">
                        Engagement                        <p class="report-header-number">
                                                            0.94%
                                                    </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card card-shadow mt-5 mb-1 zoomer">
        <div class="card-body">
            <div class="d-flex flex-column flex-sm-row flex-wrap">

                <div class="col-sm-4 col-md-3 col-lg-2 d-flex justify-content-center justify-content-sm-start">
                                            <img src="https://scontent-ort2-1.cdninstagram.com/vp/5762d498e98524c7a39de1c3e7516cb1/5DDF72F6/t51.2885-19/s150x150/43818140_2116018831763532_3803033961098117120_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" onerror="$(this).attr('src', ($(this).data('failover')))" data-failover="https://instaanalyzer.com/assets/images/default_avatar.png" class="img-fluid rounded-circle instagram-avatar" alt="Leo Messi" />
                    
                    <span class="fa-stack fa-xs source-badge-position" style="vertical-align: top;">
                        <i class="fas fa-circle text-instagram fa-stack-2x"></i>
                        <i class="fab fa-fab fa-instagram fa-stack-1x fa-inverse"></i>
                    </span>
                </div>

                <div class="col-sm-8 col-md-9 col-lg-5 d-flex justify-content-center justify-content-sm-start">
                    <div class="row d-flex flex-column">
                        <p class="m-0">
                            <a href="https://instagram.com/leomessi" target="_blank" class="text-dark" rel="nofollow">@leomessi</a>
                        </p>

                        <h1>
                            <a class="text-dark" href="report/leomessi">Leo Messi</a>

                            
                                                            <span data-toggle="tooltip" title="Instagram Verified"><i class="fa fa-check-circle user-verified-badge"></i></span>
                                                    </h1>

                        <small class="text-muted">Bienvenidos a la cuenta oficial de Instagram de Leo Messi / Welcome to the official Leo Messi Instagram account</small>

                    </div>
                </div>

                <div class="col-md-12 col-lg-5 d-flex justify-content-around align-items-center mt-4 mt-lg-0">
                    <div class="col d-flex flex-column justify-content-center">
                        Followers                        <p class="report-header-number">128M</p>
                    </div>

                    <div class="col d-flex flex-column justify-content-center">
                        Uploads                        <p class="report-header-number">492</p>
                    </div>

                    <div class="col d-flex flex-column justify-content-center">
                        Engagement                        <p class="report-header-number">
                                                            4.10%
                                                    </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <div class="card card-shadow mt-5 mb-1 zoomer">
        <div class="card-body">
            <div class="d-flex flex-column flex-sm-row flex-wrap">

                <div class="col-sm-4 col-md-3 col-lg-2 d-flex justify-content-center justify-content-sm-start">
                                            <img src="https://scontent-ort2-1.cdninstagram.com/vp/dcd4fc8ba8696cb384fd5ed61269fa80/5CC2CB2C/t51.2885-19/s150x150/41326196_329788961105496_8866535953355767808_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" onerror="$(this).attr('src', ($(this).data('failover')))" data-failover="https://instaanalyzer.com/assets/images/default_avatar.png" class="img-fluid rounded-circle instagram-avatar" alt="Kim Kardashian West" />
                    
                    <span class="fa-stack fa-xs source-badge-position" style="vertical-align: top;">
                        <i class="fas fa-circle text-instagram fa-stack-2x"></i>
                        <i class="fab fa-fab fa-instagram fa-stack-1x fa-inverse"></i>
                    </span>
                </div>

                <div class="col-sm-8 col-md-9 col-lg-5 d-flex justify-content-center justify-content-sm-start">
                    <div class="row d-flex flex-column">
                        <p class="m-0">
                            <a href="https://instagram.com/kimkardashian" target="_blank" class="text-dark" rel="nofollow">@kimkardashian</a>
                        </p>

                        <h1>
                            <a class="text-dark" href="report/kimkardashian">Kim Kardashian West</a>

                            
                                                            <span data-toggle="tooltip" title="Instagram Verified"><i class="fa fa-check-circle user-verified-badge"></i></span>
                                                    </h1>

                        <small class="text-muted">KKWBEAUTY.COM</small>

                    </div>
                </div>

                <div class="col-md-12 col-lg-5 d-flex justify-content-around align-items-center mt-4 mt-lg-0">
                    <div class="col d-flex flex-column justify-content-center">
                        Followers                        <p class="report-header-number">124M</p>
                    </div>

                    <div class="col d-flex flex-column justify-content-center">
                        Uploads                        <p class="report-header-number">4K</p>
                    </div>

                    <div class="col d-flex flex-column justify-content-center">
                        Engagement                        <p class="report-header-number">
                                                            2.87%
                                                    </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card card-shadow mt-5 mb-1 zoomer">
        <div class="card-body">
            <div class="d-flex flex-column flex-sm-row flex-wrap">

                <div class="col-sm-4 col-md-3 col-lg-2 d-flex justify-content-center justify-content-sm-start">
                                            <img src="https://scontent-ort2-1.cdninstagram.com/vp/768f85b41f8950b688f66fa134ababc6/5DFAFFFE/t51.2885-19/s150x150/18645376_238828349933616_4925847981183205376_a.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" onerror="$(this).attr('src', ($(this).data('failover')))" data-failover="https://instaanalyzer.com/assets/images/default_avatar.png" class="img-fluid rounded-circle instagram-avatar" alt="9GAG: Go Fun The World" />
                    
                    <span class="fa-stack fa-xs source-badge-position" style="vertical-align: top;">
                        <i class="fas fa-circle text-instagram fa-stack-2x"></i>
                        <i class="fab fa-fab fa-instagram fa-stack-1x fa-inverse"></i>
                    </span>
                </div>

                <div class="col-sm-8 col-md-9 col-lg-5 d-flex justify-content-center justify-content-sm-start">
                    <div class="row d-flex flex-column">
                        <p class="m-0">
                            <a href="https://instagram.com/9gag" target="_blank" class="text-dark" rel="nofollow">@9gag</a>
                        </p>

                        <h1>
                            <a class="text-dark" href="report/9gag">9GAG: Go Fun The World</a>

                            
                                                            <span data-toggle="tooltip" title="Instagram Verified"><i class="fa fa-check-circle user-verified-badge"></i></span>
                                                    </h1>

                        <small class="text-muted">? Get our app ??@9gagmobile for the latest MEMES, GIFS and VIDEOS.</small>

                    </div>
                </div>

                <div class="col-md-12 col-lg-5 d-flex justify-content-around align-items-center mt-4 mt-lg-0">
                    <div class="col d-flex flex-column justify-content-center">
                        Followers                        <p class="report-header-number">50M</p>
                    </div>

                    <div class="col d-flex flex-column justify-content-center">
                        Uploads                        <p class="report-header-number">20K</p>
                    </div>

                    <div class="col d-flex flex-column justify-content-center">
                        Engagement                        <p class="report-header-number">
                                                            0.82%
                                                    </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card card-shadow mt-5 mb-1 zoomer">
        <div class="card-body">
            <div class="d-flex flex-column flex-sm-row flex-wrap">

                <div class="col-sm-4 col-md-3 col-lg-2 d-flex justify-content-center justify-content-sm-start">
                                            <img src="https://scontent-ort2-1.cdninstagram.com/vp/2bf696dbcf765a4ff75f7ff4ed0ba69b/5DFA727F/t51.2885-19/s150x150/67503014_1183002448573945_7092523054890221568_n.jpg?_nc_ht=scontent-ort2-1.cdninstagram.com" onerror="$(this).attr('src', ($(this).data('failover')))" data-failover="https://instaanalyzer.com/assets/images/default_avatar.png" class="img-fluid rounded-circle instagram-avatar" alt="KATY PERRY" />
                    
                    <span class="fa-stack fa-xs source-badge-position" style="vertical-align: top;">
                        <i class="fas fa-circle text-instagram fa-stack-2x"></i>
                        <i class="fab fa-fab fa-instagram fa-stack-1x fa-inverse"></i>
                    </span>
                </div>

                <div class="col-sm-8 col-md-9 col-lg-5 d-flex justify-content-center justify-content-sm-start">
                    <div class="row d-flex flex-column">
                        <p class="m-0">
                            <a href="https://instagram.com/katyperry" target="_blank" class="text-dark" rel="nofollow">@katyperry</a>
                        </p>

                        <h1>
                            <a class="text-dark" href="report/katyperry">KATY PERRY</a>

                            
                                                            <span data-toggle="tooltip" title="Instagram Verified"><i class="fa fa-check-circle user-verified-badge"></i></span>
                                                    </h1>

                        <small class="text-muted">✨light worker✨</small>

                    </div>
                </div>

                <div class="col-md-12 col-lg-5 d-flex justify-content-around align-items-center mt-4 mt-lg-0">
                    <div class="col d-flex flex-column justify-content-center">
                        Followers                        <p class="report-header-number">84M</p>
                    </div>

                    <div class="col d-flex flex-column justify-content-center">
                        Uploads                        <p class="report-header-number">1K</p>
                    </div>

                    <div class="col d-flex flex-column justify-content-center">
                        Engagement                        <p class="report-header-number">
                                                            0.34%
                                                    </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    


    </div>



    <div class="container margin-top-6">
        <h2>Your Social Media Analytics Tool</h2>
        <span class="text-muted">Track evolution of your social media accounts with beautiful statistics and charts.</span>

        <div class="row align-items-center margin-top-6">
            <div class="col-md-6">
                <img src="https://instaanalyzer.com/assets/images/index/one.jpg" data-aos="fade" class="lozad img-fluid index-presentation-image" alt="Image containing growth statistics chart" title="Growth Statistics" />
            </div>

            <div class="col-md-6" data-aos="fade-left">

                <h3>Growth Statistics</h3>
                <p class="text-muted">Track progress of any Instagram Account with day by day analytics of Followers, Following, Uploads, Engagement Rate and much more.</p>

            </div>
        </div>

        <div class="row align-items-center margin-top-6">
            <div class="col-md-6" data-aos="fade-right">

                <h3>Past, present, future</h3>
                <p class="text-muted">We're giving you access to all the day by day analytics and generate accurate and free stats of any account that we have in our database.</p>

            </div>

            <div class="col-md-6">
                <img src="https://instaanalyzer.com/assets/images/index/two.jpg" data-aos="fade" class="lozad img-fluid index-presentation-image" alt="Image containing account statistics from different time frames" title="Past, present and future growth" />
            </div>
        </div>

        <div class="row align-items-center margin-top-6">
            <div class="col-md-6">
                <img src="https://instaanalyzer.com/assets/images/index/three.jpg" data-aos="fade" class="lozad img-fluid index-presentation-image" alt="Image containing a demo of an email report" title="Email Reports" />
            </div>

            <div class="col-md-6" data-aos="fade-left">

                <h3>Weekly Email Reports</h3>
                <p class="text-muted">We are even sending you notifications of your tracked social media accounts progress by email.</p>

            </div>
        </div>
    </div>


    <div class="container index-container-margin-top-big">
        <div class="row mt-5 d-flex">
            <div class="col-12 col-sm-6 col-md-4 mb-3 mb-md-5 ">
                <div data-aos="fade-down" class="card border-0 index-card h-100 h-100">
                    <div class="card-body d-flex flex-column justify-content-center align-items-center text-center">
                        <i class="fa fa-file-pdf index-big-icon"></i>
                        <h5 class="font-weight-bolder mt-5">PDF EXPORTS</h5>
                        <span class="text-muted mt-1">Easy to use and always ready PDF exports of the generated report.</span>
                    </div>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-md-4 mb-3 mb-md-5">
                <div data-aos="fade-down" class="card border-0 index-card h-100">
                    <div class="card-body d-flex flex-column justify-content-center align-items-center text-center">
                        <i class="fa fa-users index-big-icon"></i>
                        <h5 class="font-weight-bolder mt-5">COMPARISON TOOL</h5>
                        <span class="text-muted mt-1">Compare your statistics with your competitors and see who wins.</span>
                    </div>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-md-4 mb-3 mb-md-5">
                <div data-aos="fade-down" class="card border-0 index-card h-100">
                    <div class="card-body d-flex flex-column justify-content-center align-items-center text-center">
                        <i class="fa fa-chart-line index-big-icon"></i>
                        <h5 class="font-weight-bolder mt-5">FUTURE PROJECTIONS</h5>
                        <span class="text-muted mt-1">Based on statistics generated by the accounts growth.</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


<%@ include file="_footer.jspf" %>