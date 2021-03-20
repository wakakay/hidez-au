<div id="special">

 <div class="logo"><a href="index.php" title="Hidez">
      <embed src="catalog/view/theme/default/swf/hidezintoflash.swf" width="290" height="162" wmode="transparent"></embed>
 </a></div> 
    
<?php foreach ($products as $product) { ?>
 <!-- h1>Free Shipping<br>WORLDWIDE</h1 -->
 
 <?php if ($product['price']) { ?>
    <div class="price">
      <?php if (!$product['special']) { ?>
      <?php echo $product['price']; ?>
      <?php } else { ?>
      <h2><?php echo $product['price']; ?></h2>
      <?php } ?>
    </div>
  <?php } ?>
        
 <div id="curre1"></div>
 <!-- <h3>Express Courier <br>Direct To <br> Your Door</h3>  -->
 <?php } ?>
</div>
<script type="text/javascript"> 
$(document).ready(function() {
	var oCurre = $("#curre").html();
	oCurre = oCurre.replace('#eilcurrency', '#eilcurrency1');
	oCurre = oCurre.replace('eilcurrency', 'eilcurrency1');
	$("#curre1").html(oCurre);
$("#curre1 #currency_tit span").html("Currency");
}); 
</script>
