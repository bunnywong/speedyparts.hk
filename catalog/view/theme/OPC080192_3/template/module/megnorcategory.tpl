<div class="box megnorcategory">
<div class="box-heading box-category-heading"><?php echo $heading_title; ?></div>
<div class="box-content">
<ul id="nav-one" class="dropmenu">
  <?php $count = 0; ?>
  <?php foreach ($categories as $category) { ?>
  <?php $count++; ?>
  
  <?php
  	if(count($category['children'])>0){ 
	  $class="activ-cat";
	  }else{
	  $class="";
	}
  ?>
  
  <li class="menu_<?php echo $count; ?> <?php echo $class;?> topcat">
  <?php if(count($category['children'])>0){ ?>
	<a href="<?php echo $category['href']; ?>" class="activSub"><?php echo $category['name'];?></a> 
        <span class="active_menu"></span>					
  <?php } else { ?>				
	<a href="<?php echo $category['href']; ?>"><?php echo $category['name'];?></a> 	
  <?php } ?>
				
    <?php for ($i = 0; $i < count($category['children']); $i++) { ?>
	<div class="categorybg">
		 <ul>
		 	 <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
			 <?php for (; $i < count($category['children']); $i++) { ?>
             <?php if (isset($category['children'][$i])) { ?>	

	            <li class="categorycolumn">
				<?php if(count($category['children'][$i]['children_level2'])>0){ ?>
					<a href="<?php echo $category['children'][$i]['href']; ?>" class="activSub" <?php /*?>onmouseover='JavaScript:openSubMenu("<?php echo $category['children'][$i]['id']; ?>")'<?php */?>><?php echo $category['children'][$i]['name'];?></a> 					
				<?php } else { ?>				
					<a href="<?php echo $category['children'][$i]['href']; ?>" <?php /*?>onmouseover='JavaScript:closeSubMenu()'<?php */?> ><?php echo $category['children'][$i]['name']; ?></a>
				<?php } ?>

				<?php if ($category['children'][$i]['children_level2']) { ?>
				<?php /*?><div class="submenu" id="id_menu_<?php echo $category['children'][$i]['id']; ?>"><?php */?>
				<ul>
				<?php for ($wi = 0; $wi < count($category['children'][$i]['children_level2']); $wi++) { ?>
					<li><a href="<?php echo $category['children'][$i]['children_level2'][$wi]['href']; ?>"  ><?php echo $category['children'][$i]['children_level2'][$wi]['name']; ?></a></li>
				 <?php } ?>
				</ul>
				<?php /*?></div><?php */?>
			  <?php } ?>		  
			</li>		
          <?php } ?>
          <?php } ?>
		 </ul>
	</div>
	<?php } ?>

  </li>
  <?php } ?>
 </ul>
  </div>
</div>




