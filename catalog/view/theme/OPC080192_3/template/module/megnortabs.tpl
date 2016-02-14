<div class="hometab <?php /*?><!--box--><?php */?>">
<div class="container">
<div class="row">
<div class="hometab-heading box-heading"><?php echo $heading_title; ?></div>
<div id="tabs" class="htabs">
  <ul class='etabs'>
	
	<li class='tab'>
		<?php if($latestproducts){ ?>
			<a href="#tab-latest"><?php echo $tab_latest; ?></a>
		<?php } ?>
	</li>
	<li class='tab'>
		<?php if($bestsellersproducts){ ?>
		<a href="#tab-bestseller"><?php echo $tab_bestseller; ?></a>
		<?php } ?>
	</li>
	<li class='tab'>
		<?php if($specialproducts){ ?>
			<a href="#tab-special"><?php echo $tab_special; ?></a>
		<?php } ?>
	</li>
	</ul>
 </div>

<?php if($latestproducts){ ?>
<div id="tab-latest" class="tab-content">
	<div class="box">
				<div class="box-content">
					<?php 
						$sliderFor = 6;
						$productCount = sizeof($latestproducts); 
					?>
						<?php if ($productCount >= $sliderFor): ?>
						<div class="customNavigation">
							<a class="fa prev"></a>
							<a class="fa next"></a>
						</div>	
					<?php endif; ?>	
					<div class="box-product <?php if ($productCount >= $sliderFor){?>product-carousel<?php }else{?>productbox-grid<?php }?>" id="<?php if ($productCount >= $sliderFor){?>tablatest-carousel<?php }else{?>tablatest-grid<?php }?>">
						<?php foreach ($latestproducts as $product) { ?>
										<div class="<?php if ($productCount >= $sliderFor){?>slider-item<?php }else{?>product-items<?php }?>">
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
										<div class="button-group">
										<button type="button" class="addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
										<button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
										<button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
										</div>
										</div>
										<?php } ?>
										
										<?php /*?><div class="image">
											<a href="<?php echo $product['href']; ?>">
												<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
											<?php if (!$product['special']) { ?>       
											<?php } else { ?>
												<span class="saleicon sale">Sale</span>         
											<?php } ?>	
											<div class="button-group">
											<button type="button" class="addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
											<button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
											<button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
										</div>
										</div><?php */?>
										
										<div class="product-details">
										<div class="caption">
											<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
											
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
											
											<?php /*?><?php if ($product['rating']) { ?><?php */?>
												<div class="rating">
													<?php for ($i = 1; $i <= 5; $i++) { ?>
														<?php if ($product['rating'] < $i) { ?>
															<span class="fa fa-stack"><i class="fa fa-star off fa-stack-2x"></i></span>
														<?php } else { ?>
														<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
														<?php } ?>
													<?php } ?>
												</div>
											<?php /*?><?php } ?><?php */?>
											
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
						<?php } ?>
					</div>
				</div>
			 </div>
			  <span class="tablatest_default_width" style="display:none; visibility:hidden"></span>
 </div>
<?php } ?>
<?php if($bestsellersproducts){ ?>
 <div id="tab-bestseller" class="tab-content">
    	  <div class="box">
				<div class="box-content">
					<?php 
						$sliderFor = 6;
						$productCount = sizeof($bestsellersproducts); 
					?>
					<?php if ($productCount >= $sliderFor): ?>
						<div class="customNavigation">
							<a class="fa prev"></a>
							<a class="fa next"></a>
						</div>	
					<?php endif; ?>	
					
					<div class="box-product <?php if ($productCount >= $sliderFor){?>product-carousel<?php }else{?>productbox-grid<?php }?>" id="<?php if ($productCount >= $sliderFor){?>tabbestseller-carousel<?php }else{?>tabbestseller-grid<?php }?>">
						<?php foreach ($bestsellersproducts as $product) { ?>
							<div class="<?php if ($productCount >= $sliderFor){?>slider-item<?php }else{?>product-items<?php }?>">
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
										<div class="button-group">
										<button type="button" class="addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
										<button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
										<button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
										</div>
										</div>
										<?php } ?>
										
										<?php /*?><div class="image">
											<a href="<?php echo $product['href']; ?>">
												<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
											<?php if (!$product['special']) { ?>       
											<?php } else { ?>
												<span class="saleicon sale">Sale</span>         
											<?php } ?>	
											<div class="button-group">
											<button type="button" class="addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
											<button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
											<button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
										</div>
										</div><?php */?>
				
										<div class="product-details">
										<div class="caption">
											<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
											
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
											
											<?php /*?><?php if ($product['rating']) { ?><?php */?>
												<div class="rating">
													<?php for ($i = 1; $i <= 5; $i++) { ?>
														<?php if ($product['rating'] < $i) { ?>
															<span class="fa fa-stack"><i class="fa fa-star off fa-stack-2x"></i></span>
														<?php } else { ?>
															<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
														<?php } ?>
													<?php } ?>
												</div>
											<?php /*?><?php } ?><?php */?>
											
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
						<?php } ?>
					</div>
				</div>
			 </div>
		 <span class="tabbestseller_default_width" style="display:none; visibility:hidden"></span> 
 </div>
<?php } ?>

<?php if($specialproducts){ ?>
 <div id="tab-special" class="tab-content">
    	 <div class="box">
				<div class="box-content">
					<?php 
						$sliderFor = 6;
						$productCount = sizeof($specialproducts); 
					?>
					<?php if ($productCount >= $sliderFor): ?>
						<div class="customNavigation">
							<a class="fa prev"></a>
							<a class="fa next"></a>
						</div>	
					<?php endif; ?>	
					<div class="box-product <?php if ($productCount >= $sliderFor){?>product-carousel<?php }else{?>productbox-grid<?php }?>" id="<?php if ($productCount >= $sliderFor){?>tabspecial-carousel<?php }else{?>tabspecial-grid<?php }?>">
						<?php foreach ($specialproducts as $product) { ?>
							<div class="<?php if ($productCount >= $sliderFor){?>slider-item<?php }else{?>product-items<?php }?>">
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
										<div class="button-group">
										<button type="button" class="addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
										<button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
										<button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
										</div>
										</div>
										<?php } ?>
									
										<?php /*?><div class="image">
											<a href="<?php echo $product['href']; ?>">
												<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />	</a>
											<?php if (!$product['special']) { ?>       
											<?php } else { ?>
												<span class="saleicon sale">Sale</span>         
											<?php } ?>	
											<div class="button-group">
											<button type="button" class="addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
											<button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
											<button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
										</div>
										</div><?php */?>
										
										<div class="product-details">
											<div class="caption">
											<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
											
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
											
											<?php /*?><?php if ($product['rating']) { ?><?php */?>
												<div class="rating">
													<?php for ($i = 1; $i <= 5; $i++) { ?>
														<?php if ($product['rating'] < $i) { ?>
															<span class="fa fa-stack"><i class="fa fa-star off fa-stack-2x"></i></span>
														<?php } else { ?>
															<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
														<?php } ?>
													<?php } ?>
												</div>
											<?php /*?><?php } ?><?php */?>
											
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
						<?php } ?>
					</div>
				</div>
			 </div>
		 <span class="tabspecial_default_width" style="display:none; visibility:hidden"></span> 
 </div>
<?php } ?>
</div>
</div>
</div>
<script type="text/javascript">
$('#tabs a').tabs();
</script> 