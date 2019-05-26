<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
<div id="wrapper" style="width:<?php echo $width; ?>px;">
  <div id="slider-wrapper">

      <div id="slider<?php echo $module; ?>" class="nivoSlider" style="width:<?php echo $width; ?>px; height:<?php echo $height; ?>px;">
          <?php foreach ($banners as $banner) { ?>
          <?php if ($banner['link']) { ?>
          <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a>
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
        <a href="?route=product/product&path=106_107&product_id=446" title="EQUINE COMPRESSION HOOD WITH EARS FUCHSIA" target="_blank"></a>

        <a href="?route=product/product&path=106_107&product_id=445" title="EQUINE COMPRESSION HOOD WITH EARS BLACK" target="_blank"></a>
        <a href="?route=product/product&path=106_107&product_id=445" title="EQUINE COMPRESSION HOOD WITH EARS BLACK" target="_blank"></a>

        <a href="?route=product/product&path=71_80&product_id=246" title="EQUINE COMPRESSION SOCK RED" target="_blank"></a>
        <a href="?route=product/product&path=71_80&product_id=245" title="EQUINE COMPRESSION SOCK BLUE" target="_blank"></a>

        <a href="?route=product/product&path=68_59&product_id=79" title="EQUINE TRAVEL & RECOVERY SUIT BLACK" target="_blank"></a>
        <a href="?route=product/product&path=70_64&product_id=251" title="RACING GREYHOUND SUIT BLUE" target="_blank"></a>

        <a href="?route=product/product&path=106_107&product_id=445" title="EQUINE COMPRESSION HOOD WITH EARS BLACK" target="_blank"></a>
        <a href="?route=product/product&path=106_107&product_id=446" title="EQUINE COMPRESSION HOOD WITH EARS FUCHSIA" target="_blank"></a>
    </div>
    <!--<div class="ui-introduct">
    	<h3>About Hidez International Australia</h3>

        <div class="embed">
			<embed src="catalog/view/theme/default/swf/logo.swf" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" width="100%" height="300" volume="0"></embed>
        </div>

				<div class="ui-map">
          <div class="figure">
              <iframe src="http://www.map-generator.org/d27da1b6-cc2a-462c-b34c-e1ab9287c930/iframe-map.aspx" scrolling="no" width="250px" height="350px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>

              <div class="figcaption">
                  &lt;!&ndash;h4>A brief description:</h4>
                  <p>Cutting Edge Performance suits for animal athletes. Using Graduated Compression technology, to assist during Travel and Recovery.</p&ndash;&gt;
                  <h4>ADDRESS:</h4>
                  <p>ADDRESS:  2/22 Windsor Street, Richmond, New South Wales 2753</p>
                  <h4>TEL:</h4>
                  <p>TEL: +61 2 4577 8550</p>
                  <h4>Email:</h4>
                  <p>Email: sales@hidez.com.au</p>
              </div>
          </div>
        </div>
    </div>-->
  	<script>
  	    (function(d, s, id) {
    		var js, fjs = d.getElementsByTagName(s)[0];
    		if (d.getElementById(id)) return;
    		js = d.createElement(s); js.id = id;
    		js.src = 'https://connect.facebook.net/zh_CN/sdk.js#xfbml=1&version=v2.11';
    		fjs.parentNode.insertBefore(js, fjs);
    	}(document, 'script', 'facebook-jssdk'));
    </script>
	<div class="ui-facebook">
		<div class="fb-page" data-href="https://www.facebook.com/HidezSuits" data-tabs="timeline" data-width="500" data-height="744" data-small-header="true" data-adapt-container-width="true" data-hide-cover="true" data-show-facepile="false"><blockquote cite="https://www.facebook.com/HidezSuits" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/HidezSuits">Hidez Austraila</a></blockquote></div>
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
swfobject.registerObject("FlashID");
</script>
