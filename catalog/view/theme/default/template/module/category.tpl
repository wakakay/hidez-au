<div id="category">
<div class="box">
  <div class="lates-heading">
  <a href="javascript:void(0)" style="display:block; width:100%; height:72px;"></a>
  <span class="cell-free-shipping"></span>
  </div>
  <div class="box-content">
  
    <div class="box-product lates">
      <?php foreach ($categories as $category) { ?>
      
        <?php if($category['category_id'] != 103){ ?>
          <div class="ui-item">
           <div class="image"><a href="<?php echo $category['href']; ?>" target="_blank"><img src="<?php echo $category['thumb']; ?>" /></a></div>
           <div class="name"><a href="<?php echo $category['href']; ?>" target="_blank"><?php echo $category['name']; ?></a></div>
          </div>
        <?php }else {?>
					<div class="image"><a href="javascript:;"><img src="<?php echo $category['thumb']; ?>" /></a></div>
					<div class="name"><a href="javascript:;"><?php echo $category['name']; ?></a></div>
      	<?php }?>
      
      <?php } ?>
    </div>
	
  </div>
</div>
</div>