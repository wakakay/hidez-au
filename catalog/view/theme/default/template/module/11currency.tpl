<?php if (count($currencies) > 1) { ?>
<div id="curre">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="eilcurrency">
  <div id="currency_tit"><span><?php echo $text_currency; ?></span></div>
  <div id="currency">
   <select class="einput" id="currency_code" name="currency_code">
 <?php foreach ($currencies as $currency) { ?>
    <?php if ($currency['code'] == $currency_code) { ?>
    <?php if ($currency['symbol_left']) { ?>
    <option value="<?php echo $currency['code']; ?>" selected><?php echo $currency['title']; ?></option>
    <?php } else { ?>
    <option value="<?php echo $currency['code']; ?>" selected><?php echo $currency['title']; ?></option>
    <?php } ?>
    <?php } else { ?>
    <?php if ($currency['symbol_left']) { ?>
    <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
    <?php } else { ?>
    <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
    <?php } ?>
    <?php } ?>
    <?php } ?>
    </select>
    </div>
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </div>
</form>
<?php } ?>

<script type="text/javascript"> 
$(document).ready(function(){
$("#currency_code").change(function(){
	$("#eilcurrency").submit();
}); 
	var oCurre = $("#curre").html();
	oCurre.replace("currency_code", "currency_code1");
	oCurre.replace("eilcurrency", "eilcurrency1");
	$("#curre1").html(oCurre);
});
</script>
