<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error) { ?>
  <div class="warning"><?php echo $error; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/feed.png" alt="" /> <?php echo $heading_title; ?></h1>
	  <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_submit; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
	 <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<div id="language" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#tab-language-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
        </div>
		<?php foreach ($languages as $language) { ?>
          <div id="tab-language-<?php echo $language['language_id']; ?>">
			<table class="form">
				<tr>
					<td class="left"><?php echo $text_title; ?></td>
					<td><input type="text" name="news[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($news[$language['language_id']]) ? $news[$language['language_id']]['title'] : ''; ?>" /></td>
				</tr>
                <tr>
					<td class="left"><?php echo $text_subtit; ?></td>
					<td><input type="text" name="news[<?php echo $language['language_id']; ?>][subtit]" value="<?php echo isset($news[$language['language_id']]) ? $news[$language['language_id']]['subtit'] : ''; ?>" /></td>
				</tr>
                <tr>
					<td class="left"><?php echo $text_newsIntroduction; ?></td>
					<td><input type="text" name="news[<?php echo $language['language_id']; ?>][newsIntroduction]" value="<?php echo isset($news[$language['language_id']]) ? $news[$language['language_id']]['newsIntroduction'] : ''; ?>" /></td>
				</tr>
					<tr>
					<td class="left">Category</td>
					<td><select id="category" name="news[<?php echo $language['language_id']; ?>][category]">
                        <option value="1">Horse Racing</option>
                        <option value="2">Harness Racing</option>
                        <option value="3">Showjumping</option>
                        <option value="4">Dressage</option>
                        <option value="5">Cross Country</option>
                        <option value="6">Endurance</option>
                        <option value="7">Polo-Polocrosse</option>
                        <option value="8">Show Breeds-Hacks</option>
                        <option value="9">Interschool-Pony Club</option>
                        <option value="10">Cart Horse</option>
                        <option value="11">Working Horse</option>
                        <option value="12">Western Rodeo</option>
                        <option value="13">How to fit Hidez</option>
                        <option value="14">Video</option>
                        </select>
					</td>
				</tr>
					<tr>
					<td class="left">Images</td>
					<td>

<div class="image"><img src="../image/cache/no_image-100x100.jpg"  alt="" id="thumb" /><br />
                  <input type="hidden" name="news[<?php echo $language['language_id']; ?>][images]" value="<?php echo isset($news[$language['language_id']]) ? $news[$language['language_id']]['images'] : ''; ?>" id="images" />
                  <a onclick="image_upload('images', 'thumb');">browse</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '../image/cache/no_image-100x100.jpg'); $('#images').attr('value', '')">clear</a></div>

		  <?php if(isset($news[$language['language_id']])){if($news[$language['language_id']]['images']){?>
					<script type="text/javascript">
					  $('#thumb').attr('src', '../image/<? echo $news[$language['language_id']]['images'];?>'); 
					  $('#image').attr('value', '<? echo $news[$language['language_id']]['images'];?>');
					</script>
					<?}}?>
</td>
				</tr>
				<tr>
					<td><?php echo $text_description; ?></td>
					<td><textarea name="news[<?php echo $language['language_id']; ?>][description]" id="description-<?php echo $language['language_id']; ?>"><?php echo isset($news[$language['language_id']]) ? $news[$language['language_id']]['description'] : ''; ?></textarea></td>
				</tr>
			</table>
		  </div>
		<?php } ?>
			<table class="form">
				<tr>
					<td><?php echo $text_keyword; ?></td>
					<td><input type="text" value="<?php echo $keyword; ?>" name="keyword" /></td>
				</tr>
				<tr>
					<td><?php echo $text_status; ?></td>
					<td><select name="status">
						<option <?php if ($status == '1') { ?>selected="selected" <?php } ?>value="1"><?php echo $text_enabled; ?></option>
						<option <?php if ($status == '0') { ?>selected="selected" <?php } ?>value="0"><?php echo $text_disabled; ?></option>
					</select></td>
				</tr>
			</table>
	 </form>
    </div>
  </div>
</div>

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description-<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
$('#language a').tabs();
//--></script> 

<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: 'image_manager',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 

<script type="text/javascript"><!--
var image_row = 1;

function addImage() {
    html  = '<tbody id="image-row' + image_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');">clear</a></div></td>';
	html += '    <td class="right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" size="2" /></td>';
	html += '    <td class="left"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#images tfoot').before(html);
	
	image_row++;
}

$("#category").val("<?php echo isset($news[$language['language_id']]) ? $news[$language['language_id']]['category'] : ''; ?>");
//--></script> 

<?php echo $footer; ?>