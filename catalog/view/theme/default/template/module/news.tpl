<div id="news">
  <div class="box">
      <div class="box-heading"><span><?php echo $heading_title; ?></span></div>
    <div class="box-content">
      <ul>
        <?php foreach ($all_news as $news) { ?>
          <li>
            <div class="tit" title="<?php echo $news['title']; ?>"><?php echo $news['title']; ?></div>
            <div class="module_bg"></div>
            <div class="news_img"><a href="<?php echo $news['view']; ?>"><img src="image/<?php echo $news['images']; ?>" width="100%" height="100%" /></a></div>
            <div class="newsIntr">
              <h4><?php echo $news['subtit']; ?></h4>
              <h5><?php echo $news['newsIntroduction']; ?></h5>
            </div>
          </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>