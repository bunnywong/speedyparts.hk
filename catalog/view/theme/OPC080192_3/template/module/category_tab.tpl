<div id="Tab_Category_Slider" class="categorytab box">
<div class="container">
<div class="row">
<div class="categorytab-heading box-heading"><?php echo $heading_title; ?></div>

	<div class="tabs">
		<ul class="nav nav-tabs">
			<?php $cnt=0; foreach($categories as $category) { echo $category['category_tab']; } ?>
        </ul>
		<div class="tab-content">
			<?php foreach($categories as $category) { echo $category['category_div'];?>
			<?php if($category['category_id'] != $category['target_category_id']) { ?>
			<img src="catalog/view/theme/<?php echo $mytemplate; ?>/image/megnor/category_load.gif"/>
			<?php } else { ?>
			<div class="owl-carousel owl-demo-tabcate">
			<?php foreach ($products as $product) { ?>
				  <div class="item">
	  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="product-block product-thumb transition">
	  <div class="product-block-inner">
	  	
		<?php if ($product['thumb_swap']) { ?>
			<div class="image">
		<a href="<?php echo $product['href']; ?>">
		<img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive"/>
		<img class="img-responsive hover-image" src="<?php echo $product['thumb_swap']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>"/>
		</a>
		<?php if (!$product['special']) { ?>       
		<?php } else { ?>
		<span class="saleicon sale">Sale</span>         
		<?php } ?>
		<div class="button-group">
				<button type="button" class="addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
				<button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
				<button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
		</div>
		</div>
			<?php } else {?>
			<div class="image">
		<a href="<?php echo $product['href']; ?>">
		<img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive"/></a>
		<?php if (!$product['special']) { ?>       
		<?php } else { ?>
		<span class="saleicon sale">Sale</span>    
		<?php } ?>
		<div class="button-group prod_hover">
				<button type="button" class="addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
				<button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
				<button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
		</div>
		</div>
			<?php } ?>
      	 <div class="product-details">

		
		<div class="caption">
 			       	<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
			<?php /*?><p class="desc"><?php echo $product['description']; ?></p><?php */?>
			
			<?php if ($product['price']) { ?>
			<p class="price">
			  <?php if (!$product['special']) { ?>
			  <?php echo $product['price']; ?>
			  <?php } else { ?>
			   <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
			  <?php } ?>
			  <?php if ($product['tax']) { ?>
			  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
			  <?php } ?>
			</p>
			<?php } ?>
			
			<div class="rating">
			  <?php for ($i = 1; $i <= 5; $i++) { ?>
			  <?php if ($product['rating'] < $i) { ?>
			  <span class="fa fa-stack"><i class="fa fa-star off fa-stack-2x"></i></span>
			  <?php } else { ?>
			  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
			  <?php } ?>
			  <?php } ?>
			</div>
			
			<div class="button-group">
        	<button type="button" class="addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        	<button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        	<button class="compare"  type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
        </div>
			
        </div>
	  </div>
  	</div>
	</div>
	  </div>
	 </div>
	  		<?php } ?>
	  		</div>
			  <?php } ?>
 			</div>
			<?php } ?>
		</div>  
</div>
</div>
</div>
</div>

<script type="text/javascript"><!--
$(document).ready(function() { 
$('#Tab_Category_Slider .owl-demo-tabcate').owlCarousel({
	items: 5,
	navigation: true,
	navigationText: ['<span class="left"></span>', '<span class="right"></span>'],
	pagination: false,
	transitionStyle : "fade",
	itemsCustom : [
		[0, 1],
        [379, 2],
        [549, 3],
        [767, 3],
        [979, 3],
        [1201, 5]
      ]
});
});
function <?php echo $rand_str; ?>loadAjaxData(category_id) {
	var unavailabledates = <?php echo json_encode($setting); ?>;
	var dataToSend = {'category_id' : category_id, 'setting' : unavailabledates } ;
	$.ajax({
		type: 'POST',
		data: dataToSend,
		url: '<?php echo HTTP_SERVER;?>index.php?route=module/category_tab/ajaxloaddata',
		beforeSend: function() {
		  $("#<?php echo $rand_str;?>").html('<div style="text-align:center;min-height:350px;"></div>');
		  //http://www.bigtravelsghana.com/img/images/ajax-loader.gif
	   },
		success: function (data) {
			$('#Tab_Category_Slider').replaceWith(data);
			$('#Tab_Category_Slider .owl-demo-tabcate').owlCarousel({
				items: 5,
				navigation: true,
				navigationText: ['<span class="left"></span>', '<span class="right"></span>'],
				pagination: false,
				transitionStyle : "fade",
				itemsCustom : [
					[0, 1],
					[379, 2],
					[549, 3],
					[767, 3],
					[979, 3],
					[1201, 5]
				 ]
			});
		}
	});
}
--></script>