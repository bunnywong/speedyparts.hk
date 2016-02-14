<?php echo $header; ?>
<div class="content-top">
<!--<div class="container">-->
<!--<div class="row">-->
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
	<div class="container"><div class="row"><?php echo $column_left; ?></div></div>
    <div id="content-top" class="<?php echo $class; ?>"><div class="wrapper"><?php echo $content_top; ?></div></div>
    <?php echo $column_right; ?>
<!--</div>-->
<!--</div>-->
</div>

<div class="content-bottom">
<div class="container">
<div class="row">
<div id="content">
<?php echo $content_bottom; ?>
</div>
</div>
</div>
</div>

<?php echo $footer; ?>