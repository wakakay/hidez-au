<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="google-translate-customization" content="216d85518e3aca5f-57bb84d9538ce424-g67fb5e2328a611b7-10">
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>

    <meta name="keywords"
          content="hidez, hidez suits, hidez recovery suits, recovery suits, recovery sauits for horses, horse skins,"/>

    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon"/>
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css?<?php echo $_SERVER['REQUEST_TIME']; ?>"/>
    <?php foreach ($styles as $style) { ?>
    <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>"
          media="<?php echo $style['media']; ?>"/>
    <?php } ?>
    <link rel="stylesheet" type="text/css"
          href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css"/>
    <script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/header_menu.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/menu_superfish.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/common.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/css-child.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/news.js"></script>
    <?php foreach ($scripts as $script) { ?>
    <script type="text/javascript" src="<?php echo $script; ?>"></script>
    <?php } ?>
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css"/>
    <![endif]-->
    <!--[if lt IE 7]>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css"/>
    <script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('#logo img');
    </script>
    <![endif]-->
    <?php if ($stores) { ?>
    <script type="text/javascript"><!--
    $(document).ready(function() {
    <?php foreach ($stores as $store) { ?>
            $('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
        <?php } ?>
    });
    //--></script>
    <?php } ?>
    <?php echo $google_analytics; ?>
</head>
<!---->
<body>

<div id="container">
    <div id="google_translate_element"></div>

    <div id="header">
        <div class="ui-content">
            <div class="head_top_mid">
                <div class="loginres">
                    <?php if (!$logged) { ?>
                    <?php echo $text_welcome; ?>
                    <?php } else { ?>
                    <?php echo $text_logged; ?>
                    <?php } ?>
                </div>

                <div class="search">
                    <div class="button-search"><img src="catalog/view/theme/default/image/button-search.png"/></div>
                    <input type="text" name="search" value="<?php echo $search; ?>" placeholder="search"/>
                </div>
                <?php echo $currency; ?>

                <div class="ui-cart-box"><?php echo $cart; ?></div>
            </div>

            <div id="menu">
                <ul class="left">
                    <li><a href="<?php echo $home; ?>" class="top">Home</a></li>
                    <li><a href="?route=information/information&information_id=3" class="top">Why Hidez?</a>
                        <ul>
                            <li><a href="?route=information/information&information_id=4">History</a></li>
                            <li><a href="?route=information/information&information_id=5">Hidez Science</a></li>
                            <li><a href="?route=information/information&information_id=6">Compression Technology</a></li>
                            <li><a href="?route=information/information&information_id=48">Benefit Equine</a></li>
                            <li><a href="?route=information/information&information_id=49">Recommended Equine Use</a></li>
                            <li><a href="?route=information/information&information_id=50">Benefit Racing Greyhound</a></li>
                            <li><a href="?route=information/information&information_id=51">Recommended Racing Greyhound Use</a>
                            </li>
                            <li><a href="?route=information/information&information_id=52">Infrared Images</a></li>
                            <li><a href="?route=information/information&information_id=7" class="">Equine Faqs</a></li>
                            <li><a href="?route=information/information&information_id=33" class="">Canine Faqs</a></li>
                        </ul>
                    </li>
                    <li><a href="?route=product/allproducts" class="top">Categories</a>
                        <ul>
                            <?php foreach ($categories as $category) { ?>
                            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                                <?php if ($category['children']) { ?>
                                    <?php for ($i = 0; $i < count($category['children']);) { ?>
                                    <ul>
                                        <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                                        <?php for (; $i < $j; $i++) { ?>
                                        <?php if (isset($category['children'][$i])) { ?>
                                        <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
                                        <?php } ?>
                                        <?php } ?>
                                    </ul>
                                    <?php } ?>
                                <?php } ?>
                            </li>
                            <?php } ?>
                        </ul>
                    </li>
                    <li><a href="javascript:;" class="top">Fitting Instructions</a>
                        <ul>
                            <li><a href="?route=information/information&information_id=8">Equine Fitting Instructions</a></li>
                            <li><a href="?route=information/information&information_id=9">Equine How To Measure</a></li>
                            <li><a href="?route=information/information&information_id=10">Equine Size-Chart</a></li>
                            <li><a href="?route=information/information&information_id=45">Equine SOCKS Size-Chart</a></li>
                            <li><a href="?route=information/information&information_id=34">Canine Fitting Instructions</a></li>
                            <li><a href="?route=information/information&information_id=35">Canine How To Measure</a></li>
                            <li><a href="?route=information/information&information_id=36">Canine Size-Chart</a></li>
                        </ul>
                    </li>
                    <li><a href="javascript:void(0);" class="top">Testimonials</a>
                        <ul>
                            <li><a href="?route=information/information&information_id=11">Equine Expert Videos</a></li>
                            <li><a href="?route=information/information&information_id=12">Equine Testimonials</a></li>
                            <li><a href="?route=information/information&information_id=37">Canine Expert Videos</a></li>
                            <li><a href="?route=information/information&information_id=38">Canine Testimonials</a></li>
                        </ul>
                    </li>
                    <li><a href="javascript:void(0);" class="top">Gallery</a>
                        <ul>
                            <li><a href="?route=information/information&information_id=13">Equine Gallery</a></li>
                            <li><a href="?route=information/information&information_id=39">Canine Gallery</a></li>
                        </ul
                        >
                    </li>
                    <li><a href="?route=information/information&information_id=14" class="top">Contact Hidez</a>
                        <ul>
                            <li><a href="?route=information/information&information_id=28">Global Contact</a></li>
                            <li><a href="?route=information/information&information_id=29">Australian Contact</a></li>
                            <li><a href="?route=information/information&information_id=30">Sponsorship</a></li>
                            <!--<li><a href="?route=information/information&information_id=31">Warranty Claim Form</a></li>-->
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div id="notification"></div>
    <div class="ui-fixed-cart">
        <?php echo $cart; ?>
    </div>
    <script type="text/javascript" src="catalog/view/javascript/jquery/backTop.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".backToTop").goToTop();
            $(window).bind('scroll resize', function () {
                $(".backToTop").goToTop();
            });
        });
    </script>
