<?php echo $header; ?>
<div id="content" class="product">
    <?php echo $content_top; ?><?php echo $column_left; ?><?php echo $column_right; ?>
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a
            href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
        <span><a onclick="javascript:history.go(-1);return false;">back level</a></span>
    </div>

    <h1><?php echo $heading_title; ?></h1>

    <div class="product-info">
        <?php if ($thumb || $images) { ?>
        <div class="left">
            <?php if ($thumb) { ?>
            <div class="image">
        <span class='zoom' id='images'>
          <a href="<?php echo $popup; ?>"><img src="<?php echo $thumb; ?>"
                                               title="<?php echo $heading_title; ?>"
                                               alt="<?php echo $heading_title; ?>"
                                               width="400" height="310"/></a>
        </span>
            </div>

            <?php } ?>
            <?php if ($images) { ?>
            <div class="image-additional">
                <?php foreach ($images as $image) { ?>
                <a title="<?php echo $heading_title; ?>" data-tooptionname="<?php echo $image['to_option_name']; ?>">
                    <img src="<?php echo $image['thumb']; ?>"
                         alt="<?php echo $heading_title; ?>" width="70"
                         height="54"/></a>
                <?php } ?>
            </div>
            <?php } ?>
        </div>
        <?php } ?>

        <div class="right">
            <div class="description">
                <?php if ($manufacturer) { ?>
                <span><?php echo $text_manufacturer; ?></span> <a
                    href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br/>
                <?php } ?>
                <span><?php echo $text_model; ?></span> <?php echo $model; ?><br/>
                <?php if ($reward) { ?>
                <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br/>
                <?php } ?>
                <span><?php echo $text_stock; ?></span> <?php echo $stock; ?>

                <div class="share" flex="cross:center dir:right">
                    <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a>
                        <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a
                                class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
                    <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script>
                </div>
            </div>
            <?php if ($price) { ?>
            <div class="price">
                <div class="total-price"><span><?php echo $text_price; ?></span>
                    <div class="cell-free-shopping"></div>
                    <?php if (!$special) { ?>
                    <?php echo $price; ?>
                    <?php } else { ?>
                    <span class="price-old"><?php echo $price; ?></span> <span
                            class="price-new"><?php echo $special; ?></span><span class="ui-img-sale"></span>
                    <?php } ?></div>

                <?php if ($tax) { ?>
                <span class="price-tax"><!--?php echo $text_tax; ?> <?php echo $tax; ?></span><br /-->
                    <?php } ?>
                    <?php if ($points) { ?>
                    <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br/>
                    <?php } ?>
                    <?php if ($discounts) { ?>
                    <!--<br />
                    <div class="discount">
                      <?php foreach ($discounts as $discount) { ?>
                      <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
                      <?php } ?>
                    </div>-->
          <span class="ui-gift"></span>
                    <?php } ?>
            </div>
            <?php } ?>
            <?php if ($options) { ?>
            <div class="options">
                <h2><?php echo $text_option; ?></h2>

                <?php foreach ($options as $option) { ?>
                <?php if ($option['type'] == 'radio') { ?>
                <div id="option-<?php echo $option['product_option_id']; ?>"
                     class="option-item <?php echo $option['classname'];?>">

                    <h4>
                        <?php if ($option['required']) { ?><b
                            class="required">*</b><?php } ?><?php echo $option['name']; ?>:
                        <?php if ($option['explainhref']) { ?><a href="javascript:;"
                                                                 data-href="<?php echo $option['explainhref']; ?>"><i></i><?php echo $option['explainname']; ?>
                    </a><?php } ?>
                    </h4>

                    <?php if(count($option['option_parents'])){ ?>

                    <?php foreach ($option['option_parents'] as $v) {?>
                    <ul
                    <?php echo "data-parent='".$v."'"; ?>>
                    <?php foreach ($option['option_value'] as $key=>$option_value) {
                    if($v == $option_value['option_parent']){
                    ?>
                    <li>
                        <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
                            <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                   value="<?php echo $option_value['product_option_value_id']; ?>"
                                   id="option-value-<?php echo $option_value['product_option_value_id']; ?>"/>
                            <span><?php echo $option_value['name']!="-"?$option_value['name']:""; ?></span>

                            <?php if ($option_value['price']){
                          if ($option_value['name']=="-"){
                            echo '<strong>'.$option_value['price'].'</strong>';
                            }else{
                            echo '<strong>(<b class="prefix">'.$option_value['price_prefix'].'</b>'.$option_value['price'].')</strong>';
                            }
                            }?>
                        </label>
                    </li>
                    <?php }} ?>
                    </ul>
                    <?php } ?>
                    <?php }else{ ?>

                    <ul>
                        <?php foreach ($option['option_value'] as $key=>$option_value) {?>
                        <li class="<?php echo count($option['option_value']) === 1 ? 'active' : ''; ?>">
                            <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
                                <input type="radio"
                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                       value="<?php echo $option_value['product_option_value_id']; ?>"
                                       id="option-value-<?php echo $option_value['product_option_value_id']; ?>"
                                <?php echo count($option['option_value']) === 1 ? 'checked="checked"' : ''; ?>/>
                                <span><?php echo $option_value['name']!="-"?trim($option_value['name']):""; ?></span>

                                <?php if ($option_value['price']){
                        if ($option_value['name']=="-"){
                          echo '<strong>'.$option_value['price'].'</strong>';
                                }else{
                                echo '<strong>(<b class="prefix">'.$option_value['price_prefix'].'</b>'.$option_value['price'].')</strong>';
                                }
                                }?>
                            </label>
                        </li>
                        <?php } ?>
                    </ul>

                    <?php } ?>
                </div>
                <?php } ?>


                <?php if ($option['type'] == 'textarea') { ?>
                <div id="option-<?php echo $option['product_option_id']; ?>"
                     class="option-item <?php echo $option['classname'];?>">
                    <h4 style="color:#f00;">
                        <?php if ($option['required']) { ?><b
                            class="required">*</b><?php } ?><?php echo $option['name']; ?>:
                    </h4>
                    <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40"
                              rows="2"><?php echo $option['option_value']; ?></textarea>
                </div>
                <?php } ?>
                <?php } ?>
                <script type="text/javascript"
                        src="catalog/view/javascript/jquery/amplification/jquery.zoombie.js"></script>
                <script type="text/javascript">
                  $(document).ready(function () {
                    $('#images').zoombie(); //fang da
                    var imagesList = $('.image-additional a')
                    var toOptionNameMap = {}
                    imagesList.each((index, item) => {
                      var name = item.attributes[1].nodeValue
                      toOptionNameMap[name] = index
                    });

                    /*small pic*/
                    imagesList.click(function () {
                      var big = $(this).find('img').attr('src')
                      big = big. replace(/[^\-]+(?=\.\w+$)/,"1200x930")
                      $(this).addClass('redBor').siblings().removeClass('redBor');
                      big && $('.product-info .image').find('img').attr('src', big);
                    });

                    var $optionItem = $(".product-info .option-item"),
                      $optionItemLi = $(".product-info .option-item li");
                    var $scope = $(".product-info .total-price .scope");
                    var $totalPrice = $(".product-info .total-price .money");
                    var defaultPriceArray = [];

                    $totalPrice.each(function (index, item) {
                      var number = item.innerHTML.replace(',', '');
                      defaultPriceArray.push(number);
                    });

                    var $totalPrice = $(".product-info .total-price .money"),
                      defaultPrice = parseFloat($totalPrice.html());
                    var addPrice = function () {
                      var reTotal = 0;
                      $optionItemLi.each(function () {
                        var $this = $(this);
                        if ($this.hasClass("active") && $this.find("input").attr("checked") == "checked" && $this.find(".money").length > 0) {

                          if ($this.find(".prefix").html() == "-") {
                            reTotal -= parseFloat($this.find(".money").html());
                          } else if ($this.find(".prefix").html() == "+") {
                            reTotal += parseFloat($this.find(".money").html());
                          }

                        }
                      });

                      $totalPrice.each(function (index, item) {
                        var number = Number(defaultPriceArray[index]) + reTotal;
                        $totalPrice[index].innerHTML = number.toFixed(2)
                      });
                    }
                    var equineType = ''; // equine类型
                    $optionItemLi.on("click", function () {
                      var $this = $(this);
                      if ($scope.length) {
                        $scope.remove();
                      }
                      var parents = $this.parents(".option-item")
                      parents.find("li").removeClass("active");
                      $this.addClass("active");
                      addPrice();

                      var index = toOptionNameMap[$(this).find('span').text()]
                      index >= 0 && imagesList[index].click()

                      var T = $.trim($this.find("span").text());
                      $optionItem.find("ul").each(function () {
                        if ($(this).attr("data-parent") === T) {
                          $(this).show().siblings("ul").hide();
                          $(this).parent(".option-item").find("li").removeClass("active");
                          $(this).parent(".option-item").find("input").attr("checked", false);
                          return false;
                        }
                      })

                      if (parents[0].className.indexOf('product-type') !== -1) {
                        equineType = T.replace(/\s*/g, '').toLowerCase();
                      }
                    });

                    var linkItem = $(".product-info .option-item h4 a");
                    linkItem.on("click", function () {
                      if (!equineType) {
                        return
                      }
                      var url = $(this).attr('data-href') + '&equineType=' + equineType
                      window.open(url)
                    })

                    // 马服类型默认选中最后一个
                    var productType = $(".product-info .option-item.product-type ul li");
                    if (productType.length) {
                      productType.eq(productType.length - 1).click().find("input").attr("checked", true);
                      addPrice();
                    }
                  });
                </script>
            </div>
            <?php } ?>
            <div class="clearboth"></div>
            <div class="cart">
                <div><?php echo $text_qty; ?>
                    <input type="text" name="quantity" size="2" value="<?php echo $minimum; ?>"/>
                    <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>"/>
                    &nbsp;
                    <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button"/>
                    <span>&nbsp;&nbsp;<?php echo $text_or; ?>&nbsp;&nbsp;</span>
                    <span class="links"><a
                            onclick="addToWishList('<?php echo $product_id; ?>');"><?php echo $button_wishlist; ?></a><br/>
            <a onclick="addToCompare('<?php echo $product_id; ?>');"><?php echo $button_compare; ?></a></span>
                </div>
                <?php if ($minimum > 1) { ?>
                <div class="minimum"><?php echo $text_minimum; ?></div>
                <?php } ?>
            </div>
            <?php if ($review_status) { ?>
            <!--<div class="review">
              <div><img src="catalog/view/theme/default/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a></div>
              <div class="share">&lt;!&ndash; AddThis Button BEGIN &ndash;&gt;
                <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
                <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script>
                &lt;!&ndash; AddThis Button END &ndash;&gt;
              </div>
            </div>
            <?php } ?>-->
            <div class="ui-made-box">
                All Hidez products are Hand Made in Sydney Australia
            </div>
        </div>
    </div>

    <div id="moduleTabs" class="ui-tabs-title">
        <?php if (!!$size_and_measure) { ?>
        <a data-tab="tab-size-and-measure"><?php echo $tab_size_and_measure; ?></a>
        <?php } ?>
        <?php if (!!$identify_your_horse) { ?>
        <a data-tab="tab-identify-your-horse"><?php echo $tab_identify_your_horse; ?></a>
        <?php } ?>
        <a data-tab="tab-benefit"><?php echo $tab_benefit; ?></a>
        <a data-tab="tab-fitting-chart"><?php echo $tab_fitting_chart; ?></a>
        <a data-tab="tab-testimonial"><?php echo $tab_testimonial; ?></a>
        <a data-tab="tab-description"><?php echo $tab_description; ?></a>
        <!--<?php if ($attribute_groups) { ?>
        <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
        <?php } ?>
        <?php if ($review_status) { ?>
        <a href="#tab-review"><?php echo $tab_review; ?></a>
        <?php } ?>
        <?php if ($products) { ?>
        <a href="#tab-related"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</a>
        <?php } ?>-->
    </div>
    <div class="ui-tabs-content">
        <?php if (!!$size_and_measure) { ?>
        <div id="tab-size-and-measure" class="tab-content"><?php echo $size_and_measure; ?></div>
        <?php } ?>
        <?php if (!!$identify_your_horse) { ?>
        <div id="tab-identify-your-horse" class="tab-content"><?php echo $identify_your_horse; ?></div>
        <?php } ?>
        <div id="tab-benefit" class="tab-content"><?php echo $benefit; ?></div>
        <div id="tab-fitting-chart" class="tab-content"><?php echo $fitting_chart; ?></div>
        <div id="tab-testimonial" class="tab-content"><?php echo $testimonial; ?></div>
        <div id="tab-description" class="tab-content"><?php echo $description; ?><?php echo $video; ?></div>
    </div>

    <?php if ($attribute_groups) { ?>
    <div id="tab-attribute" class="tab-content">
        <table class="attribute">
            <?php foreach ($attribute_groups as $attribute_group) { ?>
            <thead>
            <tr>
                <td colspan="2"><?php echo $attribute_group['name']; ?></td>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
            <tr>
                <td><?php echo $attribute['name']; ?></td>
                <td><?php echo $attribute['text']; ?></td>
            </tr>
            <?php } ?>
            </tbody>
            <?php } ?>
        </table>
    </div>
    <?php } ?>
    <?php if ($review_status) { ?>
    <div id="tab-review" class="tab-content">
        <div id="review"></div>
        <h2 id="review-title"><?php echo $text_write; ?></h2>

        <div class="yn"><label><?php echo $entry_name; ?></label> <input type="text" name="name" value=""/></div>

        <b><?php echo $entry_review; ?></b>
        <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
        <span style="font-size: 11px;"><?php echo $text_note; ?></span><br/>
        <br/>
        <div style="padding:5px 0; overflow:hidden; clear:both;">
            <b><?php echo $entry_rating; ?></b> <!--span><?php echo $entry_bad; ?></span-->
            <input type="radio" name="rating" value="1" id="veryGood "/><label for="veryGood ">very good </label>

            <input type="radio" name="rating" value="2" id="better"/><label for="better">better</label>

            <input type="radio" name="rating" value="3" id="general"/><label for="general">general</label>

            <input type="radio" name="rating" value="4" id="MoreBad"/><label for="MoreBad">More bad</label>

            <input type="radio" name="rating" value="5" id="VeryPoor"/><label for="VeryPoor">Very poor</label>

            <!--span><?php echo $entry_good; ?></span--></div>
        <br/>
        <br/>
        <b><?php echo $entry_captcha; ?></b><br>
        <p style="clear:both; overflow:hidden;"><input type="text" name="captcha" value=""
                                                       style="width:150px; padding:3px 0; color:#ddd;"/></p>

        <p><img src="index.php?route=product/product/captcha" alt="" id="captcha"/></p>

        <div class="buttons">
            <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
        </div>
    </div>
    <?php } ?>
    <?php if ($products) { ?>
    <div id="tab-related" class="tab-content">
        <div class="box-product">
            <?php foreach ($products as $product) { ?>
            <div>
                <?php if ($product['thumb']) { ?>
                <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                                                  alt="<?php echo $product['name']; ?>"/></a>
                </div>
                <?php } ?>
                <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                <?php if ($product['price']) { ?>
                <div class="price">
                    <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?>
                    <?php } else { ?>
                    <span class="price-old"><?php echo $product['price']; ?></span> <span
                        class="price-new"><?php echo $product['special']; ?></span>
                    <?php } ?>
                </div>
                <?php } ?>
                <?php if ($product['rating']) { ?>
                <div class="rating"><img
                        src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png"
                        alt="<?php echo $product['reviews']; ?>"/></div>
                <?php } ?>
                <a onclick="addToCart('<?php echo $product['product_id']; ?>');"
                   class="button"><?php echo $button_cart; ?></a></div>
            <?php } ?>
        </div>
    </div>
    <?php } ?>
    <?php if ($tags) { ?>
    <div class="tags"><b><?php echo $text_tags; ?></b>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
    </div>
    <?php } ?>
    <?php echo $content_bottom; ?></div>

<script type="text/javascript">
  $('#button-cart').bind('click', function () {
    $.ajax({
      url: 'index.php?route=checkout/cart/add',
      type: 'post',
      data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
      dataType: 'json',
      success: function (json) {
        console.log(json)
        $('.success, .warning, .attention, information, .error').remove();

        if (json['error']) {
          if (json['error']['option']) {
            for (i in json['error']['option']) {
              $('#option-' + i).append('<span class="error">' + json['error']['option'][i] + '</span>');
            }
          }
        }

        if (json['success']) {
          $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
          $('.success').fadeIn('slow');
          $('.cart-total-content').html(json['total'] + json['totalItem']);
          $('html, body').animate({scrollTop: 0}, 'slow');
        }
      }
    });
  });
</script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['
product_option_id
']; ?>', {
  action: 'index.php?route=product/product/upload',
  name: 'file',
  autoSubmit: true,
  responseType: 'json',
  onSubmit: function (file, extension) {
    $('#button-option-<?php echo $option['
    product_option_id
    ']; ?>'
  ).
    after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
    $('#button-option-<?php echo $option['
    product_option_id
    ']; ?>'
  ).
    attr('disabled', true);
  },
  onComplete: function (file, json) {
    $('#button-option-<?php echo $option['
    product_option_id
    ']; ?>'
  ).
    attr('disabled', false);

    $('.error').remove();

    if (json['success']) {
      alert(json['success']);

      $('input[name=\'option[<?php echo $option['
      product_option_id
      ']; ?>]\']'
    ).
      attr('value', json['file']);
    }

    if (json['error']) {
      $('#option-<?php echo $option['
      product_option_id
      ']; ?>'
    ).
      append('<span class="error">' + json['error'] + '</span>');
    }

    $('.loading').remove();
  }
}
)
;
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript">
  $('#review .pagination a').live('click', function () {
    $('#review').fadeOut('slow').load(this.href).fadeIn('slow');
    return false;
  });
  $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

  $('#button-review').bind('click', function () {
    $.ajax({
      url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
      type: 'post',
      dataType: 'json',
      data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
      beforeSend: function () {
        $('.success, .warning').remove();
        $('#button-review').attr('disabled', true);
        $('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
      },
      complete: function () {
        $('#button-review').attr('disabled', false);
        $('.attention').remove();
      },
      success: function (data) {
        if (data['error']) {
          $('#review-title').after('<div class="warning">' + data['error'] + '</div>');
        }

        if (data['success']) {
          $('#review-title').after('<div class="success">' + data['success'] + '</div>');

          $('input[name=\'name\']').val('');
          $('textarea[name=\'text\']').val('');
          $('input[name=\'rating\']:checked').attr('checked', '');
          $('input[name=\'captcha\']').val('');
        }
      }
    });
  });

  $(".ui-tabs-title a").eq(0).addClass('is-selected');
  $(".ui-tabs-title a").on('hover', function () {
    $(this).addClass('is-selected').siblings().removeClass('is-selected')
    $('.ui-tabs-content .tab-content').hide().eq($(this).index()).show()
  })
</script>
<?php echo $footer; ?>