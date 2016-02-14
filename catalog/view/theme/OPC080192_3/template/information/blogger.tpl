<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> single-blog"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($blogs['image']) { ?>
	  		<div class="blog-img">
	  			<img src="<?php echo $blogs['image']; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" />
				<div class="blog-date"> <?php echo $date; ?> <i class="fa fa-file-image-o"></i> </div>
	  		</div>
	  <?php } ?>
	  
	  <div class="blog-desc"> <?php echo $description; ?> </div>
      <?php if ($success) { ?>
      <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>
      <?php } ?>
      <?php if ($blog_comments) { ?>
      <h4><?php echo $text_your_comments; ?></h4>
      <?php foreach ($blog_comments as $blog_comment) { ?>
      <div class="view-comment">
	  <div class="panel panel-default">
         <div class="row">
          <div class="col-sm-3">
		  <div class="user_icon"><i class="fa fa-user"></i></div>
		  <div class="comment-info">
            <?php /*?><label class="col-sm-3 author-text"><?php echo $entry_author; ?></label><?php */?>
            <div class="name"><?php echo $blog_comment['author']; ?></div>
            <?php /*?><label class="col-sm-3 date-text"><?php echo $text_date_added; ?></label><?php */?>
            <div class="date"><?php echo $blog_comment['date_added']; ?></div>
			<?php /*?><label class="col-sm-3 comment-text"><?php echo $entry_comment; ?></label><?php */?>
            <div class="comment-text"><?php echo $blog_comment['comment']; ?></div>
			</div>
          </div>
        </div>
        <div class="row">
          <div class="form-group">
            
          </div>
        </div>
      </div>
	  </div>
      <?php } ?>
      <?php } ?>
      <?php if ($allow_comments) { ?>
	  <div class="block-title"><h3><?php echo $button_comment_add; ?></h3></div>
      <div class="panel panel-default" id="add-comment" style="margin-bottom: 10px; padding: 0px;">
        <?php if ($login_required && !$is_logged) { ?>
        <h4 class="text-center"><?php echo $text_login_required; ?></h4>
        <?php } else { ?>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
          <div class="form-group required" style="margin-top: 10px;">
            <label class="col-sm-3 control-label" for="input-author"><?php echo $entry_author; ?></label>
            <div class="col-sm-9">
              <input type="text" name="author" value="<?php echo $author; ?>" id="input-author" placeholder="<?php echo $entry_author; ?>" class="form-control" />
              <?php if ($error_author) { ?>
              <div class="text-danger"><?php echo $error_author; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required" style="margin-top: 10px;">
            <label class="col-sm-3 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-9">
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" placeholder="<?php echo $entry_email; ?>" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group" style="margin-top: 10px;">
            <label class="col-sm-3 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
            <div class="col-sm-9">
              <textarea name="comment" rows="10" id="input-comment" class="form-control" /><?php echo $comment; ?></textarea>
              <?php if ($error_comment) { ?>
              <div class="text-danger"><?php echo $error_comment; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php echo $captcha; ?>
          <input type="hidden" name="auto_approve" value="<?php echo $auto_approve; ?>" />
          
		  <div class="form-group">
		  <div class="col-sm-10 buttons text-center"><input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" title="<?php echo $button_submit; ?>" /></div>
          </div>
		</form>
        <?php } ?>
      </div>
      <?php /*?><div class="buttons text-right"><button type="button" onclick="$('#add-comment').slideToggle();" class="btn btn-primary"><?php echo $button_comment_add; ?></button></div><?php */?>
      <?php } ?>
    <?php echo $content_bottom; ?></div>
  <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>