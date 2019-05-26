<?php echo $header; ?>
<div id="content">
   <?php echo $content_top; ?><?php echo $column_left; ?><?php echo $column_right; ?>
   
   <div class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
         <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
      <?php } ?>
      <span><a onclick="javascript:history.go(-1);return false;">back level</a></span>
   </div>
   
   <h1><?php echo $heading_title; ?></h1>
   <div class="news_list">
      <!--table class="tab">
         <tr>
            <td><?php echo $text_title; ?></td>
            <td><?php echo $text_description; ?></td>
			<td><?php echo $text_date; ?></td>
            <td></td>
         </tr>
         <?php foreach ($all_news as $news) { ?>
            <tr>
               <td><a href="<?php echo $news['view']; ?>"><?php echo $news['title']; ?></a></td>
               <td><a href="<?php echo $news['view']; ?>"><?php echo $news['description']; ?></a></td>
			   <td ><?php echo $news['date_added']; ?></td>
               <td><a href="<?php echo $news['view']; ?>"><?php echo $text_view; ?></a></td>
            </tr>
         <?php } ?>
      </table-->
      <ul>
        <?php foreach ($all_news as $news) { ?>
        <li>
          <div class="tit"><a href="<?php echo $news['view']; ?>"><?php echo $news['title']; ?></a></div>
          <!--div class="descript"><a href="<?php echo $news['view']; ?>"><?php echo $news['description']; ?></a></div-->
          <div class="timer"><?php echo $news['date_added']; ?></div>
        </li>
        <?php } ?>
      </ul>
   </div>
   <div class="pagination"><?php echo $pagination; ?></div>    
   <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>