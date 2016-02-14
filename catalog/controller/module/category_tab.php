<?php
class ControllerModuleCategoryTab extends Controller { 
	public function index($setting) {
		$this->load->language('module/category_tab');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');
		
		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.transitions.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
 
		$data['products'] = array();
		$data['rand_str'] = $this->generateRandomString(10);

		//$result_module = $setting; //$this->config->get('category_tab_product_slider_module');
		//echo "<pre>"; print_r($setting); exit;
		$data['heading_title'] = $setting['heading'];
		
		$categories_id = $setting['product_category'];
		$categories_id = array_slice($categories_id, 0, $setting['category_limit']);
		$data['categories'] = array();
		$data['products'] = array();
		$cnt = 0;
		foreach($categories_id as $category_id)
		{
			$category_info = $this->model_catalog_category->getCategory($category_id);			
			$category_name = $category_info['name'];
			//echo "<pre>"; print_r($category_info); exit;
			$tab_active = ($cnt == 0) ? 'class="active"' : '';
			$div_active = ($cnt == 0) ? ' active' : '';
			$data['categories'][] = array(
				'category_info' 	=> $category_info,
				'category_tab' 	=> '<li '. $tab_active .'><a onclick="'.$data['rand_str'].'loadAjaxData('."'".$category_id."'".')" href="#'.$category_name.'" data-toggle="tab">'.$category_name.'</a></li>',
				'category_div' 	=> '<div class="tab-pane'.$div_active.'" id="'.$category_name.'">',
				'category_id'  		=> $category_id,
				'target_category_id'  => $category_id,						
				'category_name' 	=> $category_name,
			);
			$cnt++;
 		}
		$data['category_href'] = $this->url->link('product/category', 'path=' . $categories_id[0]);
		//Products from category
		$products = array();
		$filter_data = array(
			'filter_category_id' => $categories_id[0],
			'sort'               => 'p.sort_order',
			'order'              => 'ASC',
			'start'              => 0 * $setting['product_limit'],
			'limit'              => $setting['product_limit']
		);
 		$results = $this->model_catalog_product->getProducts($filter_data);
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
			}
			
			//added for image swap
				
					$images = $this->model_catalog_product->getProductImages($result['product_id']);
	
					if(isset($images[0]['image']) && !empty($images)){
					 $images = $images[0]['image']; 
					   }else
					   {
					   $images = $image;
					   }
						
					//

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}

			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}

			if ($this->config->get('config_tax')) {
				$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
			} else {
				$tax = false;
			}

			if ($this->config->get('config_review_status')) {
				$rating = (int)$result['rating'];
			} else {
				$rating = false;
			}

			$data['products'][] = array(
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
				'thumb_swap'  => $this->model_tool_image->resize($images , $setting['width'], $setting['height']),
				'name'        => $result['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
				'price'       => $price,
				'special'     => $special,
				'tax'         => $tax,
				'rating'      => $result['rating'],
				'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] )
			);
		}
 		//echo "<pre>"; print_r($data['categories']); exit;		 
		
		$data['setting'] = $setting;

		if ($data['categories']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category_tab.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/category_tab.tpl', $data);
			} else {
				return $this->load->view('default/template/module/category_tab.tpl', $data);
			}
		}
	}
	
	public function ajaxloaddata() {
		$this->load->language('module/category_tab');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');
 
		$data['products'] = array();
		$data['rand_str'] = $this->generateRandomString(10);
		$data['mytemplate'] = $this->config->get('config_template');
		
		if(isset($this->request->post['setting'])){
			$setting = $this->request->post['setting'];
		}
		if(isset($this->request->post['category_id'])){
			$target_category_id = $this->request->post['category_id'];
		}
		//echo "<pre>"; print_r($target_category_id);exit;
 
		//$result_module = $setting; //$this->config->get('category_tab_product_slider_module');
		//echo "<pre>"; print_r($setting); exit;
		$data['heading_title'] = $setting['heading'];
		$categories_id = $setting['product_category'];
		$categories_id = array_slice($categories_id, 0, $setting['category_limit']);
		$data['categories'] = array();
		$data['products'] = array();
		$cnt = 0;
		foreach($categories_id as $category_id)
		{
			$category_info = $this->model_catalog_category->getCategory($category_id);			
			$category_name = $category_info['name'];
			//echo "<pre>"; print_r($category_info); exit;
			$tab_active = ($target_category_id == $category_id) ? 'class="active"' : '';
			$div_active = ($target_category_id == $category_id) ? ' active' : '';
			$data['categories'][] = array(
				'category_info' 	=> $category_info,
				'category_tab' 	=> '<li '. $tab_active .'><a  onclick="'.$data['rand_str'].'loadAjaxData('."'".$category_id."'".')"  href="#'.$category_name.'" data-toggle="tab">'.$category_name.'</a></li>',
				'category_div' 	=> '<div class="tab-pane'.$div_active.'" id="'.$category_name.'">',
				'category_id'  		=> $category_id,
				'target_category_id' => $target_category_id,			
				'category_name' 	=> $category_name,
				'category_href'        => $this->url->link('product/category', 'path=' . $category_id),
 			);			
			$cnt++;
  		}
		$data['category_href'] = $this->url->link('product/category', 'path=' . $target_category_id);
		//Products from category
		$products = array();
		$filter_data = array(
			'filter_category_id' => $target_category_id,
			'sort'               => 'p.sort_order',
			'order'              => 'ASC',
			'start'              => 0 * $setting['product_limit'],
			'limit'              => $setting['product_limit']
		);
		
		$data['setting'] = $setting;
		
 		$results = $this->model_catalog_product->getProducts($filter_data);
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
			}
			
			//added for image swap
				
					$images = $this->model_catalog_product->getProductImages($result['product_id']);
	
					if(isset($images[0]['image']) && !empty($images)){
					 $images = $images[0]['image']; 
					   }else
					   {
					   $images = $image;
					   }
						
					//


			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}

			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}

			if ($this->config->get('config_tax')) {
				$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
			} else {
				$tax = false;
			}

			if ($this->config->get('config_review_status')) {
				$rating = (int)$result['rating'];
			} else {
				$rating = false;
			}

			$data['products'][] = array(
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
				'thumb_swap'  => $this->model_tool_image->resize($images , $setting['width'], $setting['height']),
				'name'        => $result['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
				'price'       => $price,
				'special'     => $special,
				'tax'         => $tax,
				'rating'      => $result['rating'],
				'href'        => $this->url->link('product/product', '&product_id=' . $result['product_id'] )
			);
		}
 		//echo "<pre>"; print_r($data['categories']); exit;		 

		if ($data['categories']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category_tab.tpl')) {
				echo $this->load->view($this->config->get('config_template') . '/template/module/category_tab.tpl', $data);
			} else {
				echo $this->load->view('default/template/module/category_tab.tpl', $data);
			}
		}
	}
	public function generateRandomString($length = 10) {
		return substr(str_shuffle(implode(array_merge(range('a', 'z')))), 0, $length);
	}
}