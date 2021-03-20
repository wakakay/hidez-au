<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>

<div id="content">
  <div class="top"><?php echo $content_top; ?></div>
  <?php echo $column_left; ?><?php echo $column_right; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
    <span><a onclick="javascript:history.go(-1);return false;">back level</a></span>
  </div>
  
  <h1><?php echo $heading_title; ?></h1>
  <div class="login-content">
    <!--div class="left">
      <h2><?php echo $text_new_customer; ?></h2>
      <div class="content">
        <p><b><?php echo $text_register; ?></b></p>
        <p><?php echo $text_register_account; ?></p>
        <a href="<?php echo $register; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div-->
    <div class="right signup_forms">
      <!--h2><?php echo $text_returning_customer; ?></h2-->
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="content">
          <p><?php echo $text_i_am_returning_customer; ?></p>

          <div class="ui-item" flex="dir:left cross:center show:visible">
            <label><?php echo $entry_email; ?></label>
            <div class="ui-input">
            <input type="text" name="email" placeholder="<?php echo $entry_email; ?>" class="signup_name" />
            </div>
          </div>
          <div class="ui-item" flex="dir:left cross:center show:visible">
            <label><?php echo $entry_password; ?></label>
            <div class="ui-input">
              <input type="password" name="password" placeholder="<?php echo $entry_password; ?>" class="signup_password" />
              <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
            </div>
          </div>

          <div class="log_res" flex="main:justify cross:center">
            <input type="submit" name="submit" value="<?php echo $button_login; ?>" class="login-btn" title="<?php echo $button_login; ?>"/>
            <?php if ($redirect) { ?>
            <input type="hidden" name="submit" value="<?php echo $redirect; ?>"class="login-btn" title="<?php echo $button_login; ?>" />
            <?php } ?>
            <div class="res-btn"><a href="<?php echo $register; ?>">Registe</a>
            </div>
          </div>
        </div>
      </form>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>