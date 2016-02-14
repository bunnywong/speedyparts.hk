<div class="box blogs container">
 <?php 
		$sliderFor = 2;
		$blogCount = sizeof($blogs); 
  ?> 
  <div class="row">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-product <?php if ($blogCount > $sliderFor){?> owl-carousel blogcarousel <?php }else{?>productbox-grid<?php }?>" id="<?php if ($blogCount >= $sliderFor){?>blog-carousel<?php }else{?>blog-grid<?php }?>">
    <?php foreach ($blogs as $blog) { ?>
    <div class="<?php if ($blogCount >= $sliderFor){?>blog-item<?php }else{?>product-items<?php }?>">
	<div class="product-block">
     <?php if ($blog['image']) { ?>
	  <div class="blog-left">
	  <div class="blog-image">
	  <img src="<?php echo $blog['image']; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" />
	  <div class="date-comment">
	  <div class="write-comment"> <a href="<?php echo $blog['href']; ?>"> <?php echo $blog['total_comments']; ?> <?php echo $entry_comment; ?></a> </div>
      <div class="date-time"> <i class="fa fa-calendar"></i>  <?php echo $blog['date_added']; ?></div>
	  </div>
	  <div class="post-image-hover"> </div>
<p class="post_hover"><a class="icon zoom" title="Click to view Full Image " href="<?php echo $blog['image']; ?>" data-lightbox="example-set"><i class="fa fa-search-plus"></i> </a><a class="icon readmore_link" title="Click to view Read More " href="<?php echo $blog['href']; ?>"><i class="fa fa-link"></i></a></p>
	  </div>
	  </div>
	 <?php } ?>	
	 <div class="blog-right">  
	  <h4><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a> </h4>
      <div class="blog-desc"> <?php echo $blog['description']; ?> </div> 
	  <div class="view-blog">
	  	
		<div class="read-more"> <a href="<?php echo $blog['href']; ?>"> <i class="fa fa-link"></i> <?php echo $text_read_more; ?></a> </div>
	  </div>
	  
	 
	 
	 </div> 
    </div>
	</div>
    <?php } ?>
   
  </div>
   <div class="buttons text-center">
      <button type="button" onclick="location='<?php echo $all_blogs; ?>';" class="btn btn-primary"><?php echo $button_all_blogs; ?></button>
    </div>
  </div>
 
</div>
</div>
<span class="blog_default_width" style="display:none; visibility:hidden"></span>

<script type="text/javascript"><!--

$(document).ready(function(){
$('.blogcarousel').owlCarousel({
		items: 4,
		singleItem: false,
		navigation: true,
		navigationText: ['<i class="fa prev"></i>', '<i class="fa next"></i>'],
		pagination: true,
		itemsDesktop : [1000,4],
		itemsDesktopSmall :	[979,3],
		itemsTablet :	[767,2]
	});
});	
--></script>