<?php echo $header; ?>
<div id="content"><?php echo $content_top; ?><?php echo $column_left; ?><?php echo $column_right; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
    <span><a onclick="javascript:history.go(-1);return false;">back level</a></span>
  </div>
  
  <div class="infonews"><h1><?php echo $heading_title; ?></h1><?php echo $description; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/jquery.magnify.css"/>
  <script type="text/javascript" src="catalog/view/javascript/jquery.magnify.min.js"></script>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>