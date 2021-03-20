<div id="banner">
<div id="banner<?php echo $module; ?>" class="banner">
  <ul>
   <?php foreach ($banners as $banner) { ?>
  <?php if ($banner['link']) { ?>
    <li>
      <div class="tit"><?php echo $banner['title']; ?></div>
      <div class="introd"><a href="?route=information/information&information_id=41"><?php echo $banner['descript']; ?></a></div>
      <div class="img"><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
      <?php } else { ?>
      <div class="img"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
    </li>
  <?php } ?>
  
  <?php } ?>
  </ul>
</div>
</div>
