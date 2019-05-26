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
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css"/>
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
    $(document).ready(function () {
    <
            ? php foreach($stores as $store)
        {
                ?
        >
            $('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
        <
                ? php
        }
            ?
    >
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
            <?php echo $cart; ?>
        </div>

        <div class="bg"><?php echo $currency; ?></div>
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
            <li><a href="?route=product/allproducts" class="top">Shop Now</a>
                <ul>
                    <li><a href="?route=product/category&path=68">EQUINE TRAVEL & RECOVERY SUIT</a>
                        <ul>
                            <li><a href="?route=product/category&path=59">EQUINE TRAVEL & RECOVERY SUIT ORIGINAL</a>
                            </li>
                            <li><a href="?route=product/category&path=60">EQUINE TRAVEL & RECOVERY SUIT PRINTED</a></li>
                            <li><a href="?route=product/category&path=67">EQUINE TRAVEL & RECOVERY SUIT CUSTOM</a></li>
                        </ul>
                    </li>
                    <li><a href="?route=product/category&path=69">EQUINE ACTIVE SUIT</a>
                        <ul>
                            <li><a href="?route=product/category&path=69_77">EQUINE ACTIVE SUIT ORIGINAL</a></li>
                            <li><a href="?route=product/category&path=69_78">EQUINE ACTIVE SUIT PRINTED</a></li>
                            <li><a href="?route=product/category&path=69_79">EQUINE ACTIVE SUIT CUSTOM</a></li>
                        </ul>
                    </li>
                    <li><a href="?route=product/category&path=70">RACING GREYHOUND SUIT</a>
                        <ul>
                            <li><a href="?route=product/category&path=70_64">RACING GREYHOUND SUIT ORIGINAL</a></li>
                            <li><a href="?route=product/category&path=70_62">RACING GREYHOUND SUIT PRINTED</a></li>
                            <li><a href="?route=product/category&path=70_66">RACING GREYHOUND SUIT CUSTOM</a></li>
                        </ul>
                    </li>
                    <li><a href="?route=product/category&path=71">EQUINE COMPRESSION SOCK</a>
                        <ul>
                            <li><a href="?route=product/category&path=71_80">EQUINE COMPRESSION SOCK ORIGINAL</a></li>
                            <li><a href="?route=product/category&path=71_81">EQUINE COMPRESSION SOCK PRINTED</a></li>
                            <li><a href="?route=product/category&path=71_82">EQUINE COMPRESSION SOCK CUSTOM</a></li>
                        </ul>
                    </li>
                    <li><a href="?route=product/category&path=72">EQUINE ICE COMPRESSION SOCK</a>
                        <ul>
                            <li><a href="?route=product/category&path=72_83">EQUINE ICE COMPRESSION SOCK ORIGINAL</a></li>
                            <li><a href="?route=product/category&path=71_84">EQUINE ICE COMPRESSION SOCK PRINTED</a></li>
                        </ul>
                    </li>
                    <li><a href="?route=product/category&path=98">EQUINE COMPRESSION HOOD</a>
                        <ul>
                            <li><a href="?route=product/category&path=78_99">EQUINE COMPRESSION HOOD ORIGINAL</a></li>
                            <li><a href="?route=product/category&path=71_100">EQUINE COMPRESSION HOOD PRINTED</a></li>
                            <li><a href="?route=product/category&path=71_101">EQUINE COMPRESSION HOOD CUSTOM</a></li>
                        </ul>
                    </li>
                    <li><a href="?route=product/category&path=106">EQUINE COMPRESSION HOOD WITH EARS</a>
                        <ul>
                            <li><a href="?route=product/category&path=106_107">EQUINE COMPRESSION HOOD ORIGINAL</a></li>
                            <li><a href="?route=product/category&path=106_108">EQUINE COMPRESSION HOOD PRINTED</a></li>
                            <li><a href="?route=product/category&path=106_109">EQUINE COMPRESSION HOOD CUSTOM</a></li>
                        </ul>
                    </li>
                    <li><a href="?route=product/category&path=74">EQUINE NECK</a>
                        <ul>
                            <li><a href="?route=product/category&path=74_89">EQUINE NECK ORIGINAL</a></li>
                            <li><a href="?route=product/category&path=74_90">EQUINE NECK PRINTED</a></li>
                            <li><a href="?route=product/category&path=74_91">EQUINE NECK CUSTOM</a></li>
                        </ul>
                    </li>
                    <li><a href="?route=product/category&path=73">CANINE ICE COMPRESSION SUIT</a></li>
                    <li><a href="?route=product/category&path=75">CANINE ANXIETY SUIT</a>
                        <ul>
                            <li><a href="?route=product/category&path=75_92">CANINE ANXIETY SUIT ORIGINAL</a></li>
                            <li><a href="?route=product/category&path=75_93">CANINE ANXIETY SUIT PRINTED</a></li>
                            <li><a href="?route=product/category&path=75_94">CANINE ANXIETY SUIT CUSTOM</a></li>
                        </ul>
                    </li>
                    <!--li><a href="?route=product/category&path=76">RACING CAMEL SUIT</a>
                        <ul>
                          <li><a href="?route=product/category&path=76_95">RACING CAMEL SUIT ORIGINAL</a></li>
                        <li><a href="?route=product/category&path=76_96">RACING CAMEL SUIT PRINTED</a></li>
                        <li><a href="?route=product/category&path=76_97">RACING CAMEL SUIT CUSTOM</a></li>
                      </ul>
                    </li-->
                </ul>
            </li>
            <li><a href="javascript:void(0);" class="top">Fitting Instructions</a>
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
                    <li><a href="?route=information/information&information_id=31">Warranty Claim Form</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div id="notification"></div>
    <script type="text/javascript" src="catalog/view/javascript/jquery/backTop.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".backToTop").goToTop();
            $(window).bind('scroll resize', function () {
                $(".backToTop").goToTop();
            });
        });
    </script>
