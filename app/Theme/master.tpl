<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">

    <!-- Page title + Description -->
    <title>Subench - Find your sub</title>
    <meta name="description" content="Sport is the best theme for sports clubs and centres">

    <!-- Favicons -->
    <link rel="apple-touch-icon" sizes="57x57" href="/Theme/favicons/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/Theme/favicons/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/Theme/favicons/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/Theme/favicons/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/Theme/favicons/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/Theme/favicons/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/Theme/favicons/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/Theme/favicons/apple-touch-icon-152x152.png">
    <link rel="icon" type="image/png" href="/Theme/favicons/favicon-196x196.png" sizes="196x196">
    <link rel="icon" type="image/png" href="/Theme/favicons/favicon-160x160.png" sizes="160x160">
    <link rel="icon" type="image/png" href="/Theme/favicons/favicon-96x96.png" sizes="96x96">
    <link rel="icon" type="image/png" href="/Theme/favicons/favicon-16x16.png" sizes="16x16">
    <link rel="icon" type="image/png" href="/Theme/favicons/favicon-32x32.png" sizes="32x32">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/Theme/favicons/mstile-144x144.png">


    <!-- Style Sheets -->
    <link rel="stylesheet" type="text/css" href="/Theme/css/normalize.min.css">
    <link rel="stylesheet" type="text/css" href="/Theme/css/styles.css">

    <link rel="stylesheet" type="text/css" href="/Theme/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/Theme/css/jquery.sidr.light.css">
    <link rel="stylesheet" type="text/css" href="/Theme/js/media/mediaelementplayer.min.css"/>
    <link rel="stylesheet" type="text/css" href="/Theme/js/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="/Theme/js/fancybox/jquery.fancybox.css?v=2.1.4"/>
    <link rel="stylesheet" type="text/css" href="/Theme/css/mosaic.css"/>
    <link rel="stylesheet" type="text/css" href="/Theme/css/responsive.css">
    <link rel="stylesheet" type="text/css" href="/Theme/css/rs-plugin.css">
    <link rel="stylesheet" type="text/css" href="/Theme/js/rs-plugin/css/settings.css"/>
    <link rel="stylesheet" type="text/css" href="/Theme/css/tooltipster.css">
    <link rel="stylesheet" type="text/css" href="/Theme/css/mega.css"/>

    <link rel="stylesheet" type="text/css" href="/Theme/css/skin1.css">
    <!-- change to skin2.css for other skin -->
    <link rel="stylesheet" type="text/css" href="/Theme/css/full.css">
    <!-- change to boxed.css for boxed style -->

    <!-- Custom Subench CSS: -->
    <link rel="stylesheet" type="text/css" href="/Theme/css/subench.css"/>
    <link rel="stylesheet" type="text/css" href="/Theme/css/overwrite.css"/>

    <!-- Scripts -->
    <script src="/Theme/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>
<body>


<!-- Start Outter Wrapper -->

{if $_hasHeader}
    <!-- Header Area -->
    <div class="outter-wrapper header-area header-style-5">
        <div class="wrapper clearfix logo-container with-menu">

            <!-- Start Mobile Menu Icon -->
            <div id="mobile-header" class="">
                <a id="responsive-menu-button" href="#sidr-main">
                    <em class="fa fa-bars"></em> Menu
                </a>
            </div>

            <header>
                <div id="navigation" class="clearfix">

                    <ul class="menuHideBtn">
                        <li><a id="closebtn" class="fa" href="#">&#xf00d;</a></li>
                    </ul>


                    <div class="main-header-left left adjust-left">
                        <a href="index.html">
                            <h1 class="subench_logo">Subench</h1>
                        </a>
                    </div>


                    <div class="main-header-right right adjust-right">
                        <nav class="megamenu_container">
                            <ul id="nav" class="right megamenu">

                                <li class="nav-parent">
                                    <a href="/">Home</a></li>

                                <li class="nav-parent">
                                    <a href="/search/team">Find Teams</a></li>

                                <li class="nav-parent">
                                    <a href="/search/player">Find Players</a>
                                </li>


                            </ul>
                        </nav>
                    </div>

                </div>
            </header>
        </div>
    </div>
{/if}



{include file="./$_viewTpl"}





<!-- Start Outter Wrapper -->
<div class="outter-wrapper base-wrapper">
    <div class="wrapper clearfix">
        <div class="left">© Copyright Subench 2014</div>

        <!-- Social Icons -->
        <ul class="social-links right">
            <li><a class="fa" title="Facebook" href="#">&#xf09a;</a></li>
            <li><a class="fa" title="Twitter" href="#">&#xf099;</a></li>
            <li><a class="fa" title="Google Plus" href="#">&#xf0d5;</a></li>
        </ul>
    </div>
</div>


<!-- Load jQuery -->
<script type="text/javascript" src="/Theme/js/vendor/jquery-1.8.3.min.js"></script>

<!-- Start Scripts -->
<script type="text/javascript" src="/Theme/js/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="/Theme/js/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="/Theme/js/jquery.sidr.js"></script>
<script type="text/javascript" src="/Theme/js/fancybox/jquery.fancybox.js?v=2.1.4"></script>
<script type="text/javascript" src="/Theme/js/cleantabs.jquery.js"></script>
<script type="text/javascript" src="/Theme/js/fitvids.min.js"></script>
<script type="text/javascript" src="/Theme/js/jquery.scrollUp.min.js"></script>
<script type="text/javascript" src="/Theme/js/media/mediaelement-and-player.min.js"></script>
<script type="text/javascript" src="/Theme/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="/Theme/js/selectivizr-min.js"></script>
<script type="text/javascript" src="/Theme/js/placeholder.js"></script>
<script type="text/javascript" src="/Theme/js/jquery.stellar.min.js"></script>
<script type="text/javascript" src="/Theme/js/mosaic.1.0.1.js"></script>
<script type="text/javascript" src="/Theme/js/jquery.isotope.js"></script>
<script type="text/javascript" src="/Theme/js/toggle.js"></script>
<script type="text/javascript" src="/Theme/js/jquery.tooltipster.js"></script>
<script type="text/javascript" src="/Theme/js/jquery.countdown.js"></script>
<script type="text/javascript" src="/Theme/js/jquery.sticky.js"></script>
<script type="text/javascript" src="/Theme/js/html5media.js"></script>

<script type="text/javascript" src="/Theme/js/slider-1.js"></script>
<script type="text/javascript" src="/Theme/js/main.js"></script>


</body>
</html>
