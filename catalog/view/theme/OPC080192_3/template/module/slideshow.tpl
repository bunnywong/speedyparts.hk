<div class="main-slider">
<div id="spinner"></div>
<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>" class="chmln"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="chmln_img" <?php /*?>class="img-responsive"<?php */?> /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="chmln_img" <?php /*?>class="img-responsive"<?php */?> />
    <?php } ?>
  </div>
  <?php } ?>
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 3,
	autoPlay: 5000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true,
	transitionStyle: 'fade'
});
});
</script>
<script type="text/javascript">
	// Can also be used with $(document).ready()
	$(window).load(function() {		
	  $("#spinner").fadeOut("slow");
	});	
	
	$(document).ready(function(){
	$('.main-slider .item').chameleon();
	});
</script>