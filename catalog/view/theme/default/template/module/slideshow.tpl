<div id="wrapper" style="width:<?php echo $width; ?>px;">
  <div id="slider-wrapper">

      <div id="slider<?php echo $module; ?>" class="nivoSlider" style="width:<?php echo $width; ?>px; height:<?php echo $height; ?>px;">
          <?php foreach ($banners as $banner) { ?>
          <?php if ($banner['link']) { ?>
          <a href="<?php echo $banner['link']; ?>" target="_blank"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a>
          <?php } else { ?>
          <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
          <?php } ?>
          <?php } ?>
      </div>
      <div id="htmlcaption" class="nivo-html-caption"><?php echo $banner['title']; ?></div>

  </div>
</div>

<div class="fackbook-box">
	<h1>HIDEZ WORLD NEWS</h1>
    <div class="ui-active-box">
        <a href="?route=product/product&path=106_107&product_id=446" title="FUCHSIA HOOD WITH EARS" target="_blank"></a>
        <a href="?route=product/product&path=98_100&product_id=364" title="BW DREAM CATCHER" target="_blank"></a>
        <a href="?route=product/product&path=98_100&product_id=439" title="FLORAL MANDELA" target="_blank"></a>
        <a href="?route=product/product&path=106_107&product_id=448" title="BLUE HOOD WITH EARSMORE IMAGES
" target="_blank"></a>

        <a href="?route=product/product&path=98_99&product_id=334" title="EQUINE COMPRESSION HOOD GREY" target="_blank"></a>
        <a href="?route=product/product&path=98_100&product_id=439" title="FLORAL MANDELA" target="_blank"></a>
        <a href="?route=product/product&path=98_99&product_id=332" title="EQUINE COMPRESSION HOOD BLACK" target="_blank"></a>
        <a href="?route=product/product&path=98_99&product_id=333" title="EQUINE COMPRESSION HOOD BLUE" target="_blank"></a>

        <a href="?route=product/product&path=98_100&product_id=394" title="SACRED GEOMETRY" target="_blank"></a>
        <a href="?route=product/product&path=98_99&product_id=334" title="EQUINE COMPRESSION HOOD GREY" target="_blank"></a>
        <a href="?route=product/product&path=106_107&product_id=445" title="BLACK HOOD WITH EARS" target="_blank"></a>
        <a href="?route=product/product&path=106_107&product_id=452" title="RED HOOD WITH EARS" target="_blank"></a>

        <a href="?route=product/product&path=98_99&product_id=334" title="EQUINE COMPRESSION HOOD GREY" target="_blank"></a>
        <a href="?route=product/product&path=98_99&product_id=338" title="EQUINE COMPRESSION HOOD PURPLE" target="_blank"></a>
        <a href="?route=product/product&path=106_107&product_id=446" title="FUCHSIA HOOD WITH EARS" target="_blank"></a>
        <a href="?route=product/product&path=106_107&product_id=450" title="GREY HOOD WITH EARS" target="_blank"></a>
    </div>
  	<script>
  	    (function(d, s, id) {
    		var js, fjs = d.getElementsByTagName(s)[0];
    		if (d.getElementById(id)) return;
    		js = d.createElement(s); js.id = id;
    		js.src = 'https://connect.facebook.net/us/sdk.js#xfbml=1&version=v2.11';
    		fjs.parentNode.insertBefore(js, fjs);
    	}(document, 'script', 'facebook-jssdk'));
    </script>
	<div class="ui-facebook">
		<div class="fb-page" data-href="https://www.facebook.com/HidezSuits?locale=en_US" data-tabs="timeline" data-width="500" data-height="744" data-small-header="true" data-adapt-container-width="true" data-hide-cover="true" data-show-facepile="false"><blockquote cite="https://www.facebook.com/HidezSuits" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/HidezSuits?locale=en_US">Hidez Austraila</a></blockquote></div>
    </div>
</div>


<script type="text/javascript">
$(document).ready(function() {
	$('#slider<?php echo $module; ?>').nivoSlider();
	var oSlideW = $('#slider<?php echo $module; ?>').width();
	var oSlideH = $('#slider<?php echo $module; ?>').height();
	var oNivoW =$('#slider<?php echo $module; ?> .nivo-controlNav')
	var oAl = $('#slider<?php echo $module; ?> .nivo-controlNav a').length * $('#slider<?php echo $module; ?> .nivo-controlNav a').width()+3*$('#slider<?php echo $module; ?> .nivo-controlNav a').length;
	oNivoW.css('left',(oSlideW-oAl)/2);
});
</script>
