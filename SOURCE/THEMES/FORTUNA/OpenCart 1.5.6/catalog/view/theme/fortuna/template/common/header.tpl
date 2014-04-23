<!DOCTYPE html>

<!--[if IE 7]>                  <html class="ie7 no-js" lang="<?php echo $lang; ?>" dir="<?php echo $direction; ?>">     <![endif]-->
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="<?php echo $lang; ?>" dir="<?php echo $direction; ?>">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="<?php echo $lang; ?>" dir="<?php echo $direction; ?>">  <!--<![endif]-->

<head>

	<base href="<?php echo $base; ?>" />

	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<?php 
	$layout = $this->config->get('fortuna_main_layout');
	$fortuna_status = $this->config->get('fortuna_status'); 
	($layout=='large') ? $layout_extra=' responsive-large' : $layout_extra=''; 

	if(($fortuna_status == 1 && $layout!='fixed') || ($fortuna_status)!= 1) {

		$base_class = 'responsive'.$layout_extra; ?>
		<meta name="viewport" content="width=device-width, initial-scale=1">

	<?php } else { 

		$base_class = "fixed"; 

	} ?>

	<title><?php echo $title; ?></title>

	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	
	<?php if ($keywords) { ?>
	<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>

	<?php if ($icon) { ?>
	<link rel="shortcut icon" href="<?php echo $icon; ?>" />
	<?php } else { ?>
	<link rel="shortcut icon" href="catalog/view/theme/fortuna/favicon.ico" />
	<?php } ?>

	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" /> 
	<?php } ?>

	<?php foreach ($styles as $style) { ?>
	<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>
	

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/bootstrap.min.css"/>

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/stylesheet.css" media="screen"/>

	<?php if(($fortuna_status == 1 && $layout!='fixed') || ($fortuna_status)!= 1) { ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/stylesheet-responsive.css" media="screen"/>
	<?php } else if ($fortuna_status == 1 && $layout=='fixed') {  ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/stylesheet-fixed.css" media="screen"/>
	<?php } ?>

	<?php if($direction=='rtl'){?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/stylesheet.rtl.css" media="screen"/>
	<?php }?>

	<?php if ($this->config->get('fortuna_slider') == 'camera') { ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/camera.css" media="screen"/>
	<?php } ?>

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/font-awesome.min.css" media="screen"/>

	<!--[if lte IE 7]>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/font-awesome-ie7.min.css" media="screen"/>
	<![endif]-->

	<!-- css3-mediaqueries.js for IE less than 9 -->
	 <!--[if lt IE 9]>
	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->

	<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>

	<script type="text/javascript" src="catalog/view/theme/fortuna/js/modernizr.full.min.js"></script>
		
	<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>

	<?php if($this->config->get('slider_general_status') == '1') { ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/rev_settings.css" media="screen"/>
	<script type="text/javascript" src="catalog/view/theme/fortuna/js/jquery.themepunch.plugins.min.js"></script>
	<script type="text/javascript" src="catalog/view/theme/fortuna/js/jquery.themepunch.revolution.min.js"></script>
	<?php } ?>

	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />

	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
	<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
	<script type="text/javascript" src="catalog/view/theme/fortuna/js/jquery.cycle.js"></script>

	<?php foreach ($scripts as $script) { ?>
	<script type="text/javascript" src="<?php echo $script; ?>"></script>
	<?php } ?>

	<?php

	// If fortuna module is enabled

	if($this->config->get('fortuna_status')== 1) {

		if($this->config->get('fortuna_skins')!='') { 

			$base_class .= $this->config->get('fortuna_skins') . "_skin "; ?>

			<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/<?php echo $this->config->get('fortuna_skins') ?>.css" media="screen"/>
		
		<?php }
		
		$regfonts = array('Arial', 'Verdana', 'Helvetica', 'Lucida+Grande', 'Trebuchet+MS', 'Times+New+Roman', 'Tahoma', 'Georgia' );		
			
		// Titles font
		if (($this->config->get('fortuna_title_font')!='') && (in_array($this->config->get('fortuna_title_font'), $regfonts)==false)) { 
			?><link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('fortuna_title_font') ?>&amp;v1' rel='stylesheet' type='text/css'>
		<?php } 
		// Body font
		if (($this->config->get('fortuna_body_font')!='') && (in_array($this->config->get('fortuna_body_font'), $regfonts)==false)) { 
			?><link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('fortuna_body_font') ?>&amp;v1' rel='stylesheet' type='text/css'>
		<?php } 
		// Small text font
		if (($this->config->get('fortuna_small_font')!='') && (in_array($this->config->get('fortuna_small_font'), $regfonts)==false)) { 
			?><link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('fortuna_small_font') ?>&amp;v1' rel='stylesheet' type='text/css'>
		<?php } ?>

		<style type="text/css">

			#header {
				<?php 

				if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
					$path_image = $this->config->get('config_ssl') . 'image/';
				} else {
					$path_image = $this->config->get('config_url') . 'image/';
				}

				if($this->config->get('fortuna_custom_image')!='') { ?>
					background-image: url("<?php echo $path_image . $this->config->get('fortuna_custom_image') ?>"); ?>;
					background-position: top center;
					background-repeat: no-repeat;
				<?php } else if($this->config->get('fortuna_custom_pattern')!='') { ?>
					background-image: url("<?php echo $path_image . $this->config->get('fortuna_custom_pattern') ?>"); ?>;
				<?php } else if($this->config->get('fortuna_pattern_overlay')!='none') { ?>
					background-image: url("catalog/view/theme/fortuna/images/patterns/<?php echo $this->config->get('fortuna_pattern_overlay'); ?>.png");
				<?php } else { ?>
					background-image: none;
				<?php } ?>
			}

			<?php if(($fortuna_status == 1 && $layout=='normal') || ($fortuna_status)!= 1) { ?>
			body.responsive .container { max-width: 960px !important; }
			<?php } ?>

			<?php if($this->config->get('fortuna_custom_colors')!='') { ?>

				body {
					background-color: <?php echo $this->config->get('fortuna_body_background_color'); ?>;
				}

				#header {
					background-color: <?php echo $this->config->get('fortuna_header_background_color'); ?>;
				}

				#topbar {
				<?php if($this->config->get('fortuna_skins')=='light') { ?>
					border-top-color:<?php echo $this->config->get('fortuna_topbar_background'); ?>;
				<?php } else { ?>
					background: <?php echo $this->config->get('fortuna_topbar_background'); ?>;
				<?php } ?>
				}

				#welcome, #wrapselector {
					color: <?php echo $this->config->get('fortuna_topbar_text_color'); ?>;
				}

				#wrapselector a, #welcome a {
					color: <?php echo $this->config->get('fortuna_topbar_links'); ?>;
				}
				
				#wrapselector b {
					background: <?php echo $this->config->get('fortuna_topbar_text_color'); ?>;
				}

				#header .info {
					color: <?php echo $this->config->get('fortuna_header_text_color'); ?>;
				}

				.cart-total a {
					color: <?php echo $this->config->get('fortuna_cart_total_color'); ?>;
				}
				.cart-total a:hover {
					color: <?php echo $this->config->get('fortuna_cart_total_hover'); ?>;
				}

				.navbar .nav > li > a {
					color: <?php echo $this->config->get('fortuna_menu_color'); ?>;
					border-left-color: <?php echo $this->config->get('fortuna_menu_separator'); ?>;
				}
				.navbar .nav > li:hover > a, .navbar .nav > li > a:hover {
					color: <?php echo $this->config->get('fortuna_menu_hover'); ?>;
				}

				.dropdown-menu li > a {
					color: <?php echo $this->config->get('fortuna_dropdown_color'); ?>;
				}

				.dropdown-menu li > a:hover, .dropdown-menu li > a:focus, .dropdown-submenu:hover > a {
					background: <?php echo $this->config->get('fortuna_dropdown_hover'); ?>;
				}

				h1.page-header {
					color: <?php echo $this->config->get('fortuna_title_color'); ?>;
				}
				.mainborder a {
					color: <?php echo $this->config->get('fortuna_content_links_color'); ?>;	
				}
				.mainborder, .mainborder .nav-tabs > li > a, .category-list a, .product-info, #continue-shopping {
					color: <?php echo $this->config->get('fortuna_bodytext_color'); ?>;
				}
				.breadcrumb, .breadcrumb a, .paginate .results, .product-info .price-tax, .product-info .price .reward {
					color: <?php echo $this->config->get('fortuna_lighttext_color'); ?>;
				}
				#footer, #footer h3 {
					color: <?php echo $this->config->get('fortuna_footer_text_color'); ?>;
				}
				#footer a, #footer a:link, #footer a:visited {
					color: <?php echo $this->config->get('fortuna_footer_links_color'); ?>;
				}
				
				<?php 
			
				$btncarttop = $this->config->get('fortuna_button_top_color');
				$btncartbot = $this->config->get('fortuna_button_bottom_color');
				?>
				.payment .button, .cart .button, .button-cart, #button-confirm {
					border-color: <?php echo $this->config->get('fortuna_button_border_color'); ?>;
					color: <?php echo $this->config->get('fortuna_button_text_color'); ?> !important;

					background-color: <?php echo $btncarttop; ?>;
					background-image: -moz-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: -ms-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: -webkit-gradient(linear, 0 0, 0 100%, from(<?php echo $btncarttop; ?>), to(<?php echo $btncartbot; ?>));
					background-image: -webkit-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: -o-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-repeat: repeat-x;
					filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='<?php echo $btncarttop; ?>', endColorstr='<?php echo $btncartbot; ?>', GradientType=0);
				}
				.payment .button:hover, .payment .button:active, .cart .button:hover, .cart .button:active, .button-cart:hover, .button-cart:active {
					background-color: <?php echo $btncartbot; ?>;
				}

				<?php 
			
				$btninversetop = $this->config->get('fortuna_2button_top_color');
				$btninversebot = $this->config->get('fortuna_2button_bottom_color');
				?>
				.button-inverse,
				a.button-inverse {
					border-color: <?php echo $this->config->get('fortuna_2button_border_color'); ?>;
					color: <?php echo $this->config->get('fortuna_2button_text_color'); ?> !important;

					background-color: <?php echo $this->config->get('fortuna_2button_top_color'); ?>;
					background-image: -moz-linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-image: -ms-linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-image: -webkit-gradient(linear, 0 0, 0 100%, from(<?php echo $btninversetop; ?>), to(<?php echo $btninversebot; ?>));
					background-image: -webkit-linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-image: -o-linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-image: linear-gradient(top, <?php echo $btninversetop; ?>, <?php echo $btninversebot; ?>);
					background-repeat: repeat-x;
					filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='<?php echo $btninversetop; ?>', endColorstr='<?php echo $btninversebot; ?>', GradientType=0);

				}
				.button-inverse:hover, .button-inverse:active, .button-inverse.active, .button-inverse.disabled, .button-inverse[disabled] {
					background-color: <?php echo $btninversebot; ?>;
					border-color: <?php echo $this->config->get('fortuna_2button_border_color'); ?>;
					background-position: 0 -15px;
					-webkit-transition: background-position 0.1s linear;
					-moz-transition: background-position 0.1s linear;
					-o-transition: background-position 0.1s linear;
					transition: background-position 0.1s linear;				}
				
				.grid-box .name a, .product-list .name a, .es-carousel .name a  {
					color: <?php echo $this->config->get('fortuna_product_name_color'); ?>;	
				}
				.grid-box .price, .product-list .price, .es-carousel .price, .product-info .price-normal {
					color: <?php echo $this->config->get('fortuna_normal_price_color'); ?>;	
				}
				.price-old {
					color: <?php echo $this->config->get('fortuna_old_price_color'); ?>;	
				}
				.price-new {
					color: <?php echo $this->config->get('fortuna_new_price_color'); ?>;	
				}
				.onsale .ribbon, .onsale .ribbonshadow {
					background-color: <?php echo $this->config->get('fortuna_onsale_background_color'); ?>;
					color: <?php echo $this->config->get('fortuna_onsale_text_color'); ?>;
				}
				.box-category > ul > li > a {
					color: <?php echo $this->config->get('fortuna_categories_menu_color'); ?>;
				}
				.box-category a {
					color: <?php echo $this->config->get('fortuna_categories_sub_color'); ?>;		
				}
				.box-category > ul > li a.active {
					color: <?php echo $this->config->get('fortuna_categories_active_color'); ?>;
				}
				

				@media (max-width: 767px) {
					.nav-collapse .nav > li > a:hover, .nav-collapse .dropdown-menu a:hover {
						background-color: <?php echo $this->config->get('fortuna_menu_color'); ?>;
					}
					#welcome a {
						color: <?php echo $this->config->get('fortuna_content_links_color'); ?>;
					<?php if($this->config->get('fortuna_skins')=='') { ?>
						color:<?php echo $this->config->get('fortuna_topbar_background'); ?>;
					<?php } ?>
					}
				}
			
			<?php } /* fortuna_custom_colors END */

			if ($layout=='fixed') { ?>
				/*#header { min-width: 940px; }*/
			<?php }

			if ($this->config->get('fortuna_zoom_position') == 'inside') { ?>
				.cloud-zoom-big { left:0 !important; }
			<?php }

			if ($this->config->get('fortuna_display_cart_button') ==1) { ?>
				.product-box .grid-box .cart .button,
				.product-grid .grid-box .cart .button,
				.product-slider ul li .cart .button {
					margin-left: 0 !important;
				}
			<?php }

			if ($this->config->get('fortuna_toggle_sidebar') != 1) { ?>
				#toggle_sidebar { display:none !important; }
			<?php }

			if ($this->config->get('fortuna_show_wishlist') != 1) { ?>
				.wishlist, .wishlist-link { display:none !important; }
			<?php }

			if ($this->config->get('fortuna_show_compare') != 1) { ?>
				.compare, .product-compare { display:none !important; }
			<?php }

			if ($this->config->get('fortuna_show_sale_ribbon') != 1) { ?>
				.onsale { display:none !important; }
			<?php }

			if ($this->config->get('fortuna_products_shadows') != 1) { ?>
				.product-slider ul li:hover .inner,
				.grid-box:hover .inner {
					-webkit-box-shadow: none !important;
					-moz-box-shadow: none !important;
					box-shadow: none !important;
				}
			<?php }

			

			if ($this->config->get('fortuna_subcat_status') == 1) { 
				$thumb_width = $this->config->get('fortuna_subcat_thumb_width') + 3;;
				?>
				.subcat_thumb a { width: <?php echo $thumb_width; ?>px; }
			<?php }

			if ($this->config->get('fortuna_body_font') != '' ) {
				$fontpre =  $this->config->get('fortuna_body_font');
				$font = str_replace("+", " ", $fontpre);
				?>
				body, p { 
					font-family:<?php echo $font ?>;
					font-size: <?php echo $this->config->get('fortuna_body_font_size'); ?>px;
				}
			<?php } 
			
			if($this->config->get('fortuna_title_font')!='') {
				$fontpre =  $this->config->get('fortuna_title_font');
				$font = str_replace("+", " ", $fontpre);
				?>
				h1 {
					font-family:<?php echo $font ?>;
					font-size: <?php echo $this->config->get('fortuna_title_font_size'); ?>px;
				}
			<?php }

			if ($this->config->get('fortuna_small_font') != '') {
				$fontpre =  $this->config->get('fortuna_small_font');
				$font = str_replace("+", " ", $fontpre);
				?>
				small, .wishlist a, .compare a, .remove a, .product-compare, #topbar, #wrapselector a, #wrapselector b, .product-filter .display li, .product-list .price-tax, .product-info .price-tax, .product-info .price .reward, span.error, #copy, #footer .info, .paginate .results, #welcome, .help {
					font-family:<?php echo $font ?>;
					font-size: <?php echo $this->config->get('fortuna_small_font_size'); ?>px;
				}
			<?php }

			if ($this->config->get('fortuna_custom_css') != '') { 
				echo htmlspecialchars_decode( $this->config->get('fortuna_custom_css'), ENT_QUOTES );
			} ?>

		</style>

		<?php if ($this->config->get('fortuna_custom_stylesheet') != '') { ?>
			<link rel="stylesheet" type="text/css" href="catalog/view/theme/fortuna/stylesheet/custom.css" />
		<?php } ?>

	<?php } ?> <!-- fortuna_status END -->

	<?php if ($stores) { ?>
		<script type="text/javascript"><!--
		$(document).ready(function() {
		<?php foreach ($stores as $store) { ?>
		$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
		<?php } ?>
		});
		//--></script>
	<?php } ?>

	<?php echo $google_analytics; ?>

</head>

<body class="<?php echo $base_class; ?>">

	<header id="header">

		<div id="topbar">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div id="wel1" class="welcome hidden-xs">
							<?php if (!$logged) { ?>
							<?php echo $text_welcome; ?>
							<?php } else { ?>
							<?php echo $text_logged; ?>
							<?php } ?>
						</div>
					</div>
					<div class="col-sm-6 rightbox">
						<div id="outercart"><?php echo $cart; ?></div>
						<div id="wrapselector">
							<?php echo $language; ?>
			  				<?php echo $currency; ?>
		  				</div>
						
					</div>
				</div>
			</div>
		</div>

		<div class="container elements">

			<div class="row">

				<?php if($this->config->get('fortuna_logo_position') == 'center') { ?>

					<div class="col-sm-4 left">
						<?php if($this->config->get('fortuna_header_info_text') != '') { ?>
							<div class="info">
								<?php echo html_entity_decode($this->config->get('fortuna_header_info_text'), ENT_QUOTES, 'UTF-8');?>
							</div>
						<?php } ?>
					</div>

					<div id="logo" class="col-sm-4 centered">
						<?php if ($logo) { ?>
							<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } else { ?>
							<a href="<?php echo $home; ?>"><img src="catalog/view/theme/fortuna/images/logo.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } ?>
					</div> <!-- #logo -->

				<?php } else { ?>

					<div id="logo" class="col-sm-4">
						<?php if ($logo) { ?>
							<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } else { ?>
							<a href="<?php echo $home; ?>"><img src="catalog/view/theme/fortuna/images/logo.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } ?>
					</div> <!-- #logo -->

					<div class="col-sm-4">
						<?php if($this->config->get('fortuna_header_info_text') != '') { ?>
							<div class="info">
								<?php echo html_entity_decode($this->config->get('fortuna_header_info_text'), ENT_QUOTES, 'UTF-8');?>
							</div>
						<?php } ?>
					</div>

				<?php } ?>

				<div class="rightbox2 col-sm-4">

					<div id="wel2" class="welcome visible-xs">
						<?php if (!$logged) { ?>
						<?php echo $text_welcome; ?>
						<?php } else { ?>
						<?php echo $text_logged; ?>
						<?php } ?>
					</div>
					
					<?php if(($this->config->get('fortuna_searchbox') == 1 || $this->config->get('fortuna_status') != 1 )) { ?>
						<div class="searchbox">
							<input type="search" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control" />
							<button class="button button-default button-search" type="button"><i class="icon-search"></i></button>
						</div>
					<?php } ?>					

				</div>
					
				</div>

			</div>  <!-- .row -->

		</div>

		<div id="outernav">

			<div class="container">

			<?php if ($categories) { ?>
		
				<nav id="mainnav" class="navbar navbar-default <?php if($this->config->get('fortuna_select_mobile_menu') == 'selectbox') { ?>hidden-xs<?php } ?>" role="navigation">

					<div class="navbar-header">
						<button type="button" class="navbar-toggle <?php if($this->config->get('fortuna_select_mobile_menu') == 'selectbox') { ?>hidden-xs<?php } ?>" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>

					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li><a href="<?php echo $home; ?>" title="<?php echo $text_home; ?>"><?php echo $text_home; ?></a></li>

							<?php $linkidcount=0; ?>

							<?php foreach ($categories as $category) { ?>
								<li id="m<?php echo $linkidcount; ?>" <?php if ($category['children']) { ?> class="dropdown"<?php } ?>><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>

								<?php if ($category['children']) { ?>
									<ul class="dropdown-menu">
									<?php for ($i = 0; $i < count($category['children']);) { ?>
									<?php if ($category['column'] > 1) { ?>
										<li class="column-menu">
											<ul>
									<?php } ?>
									<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
									<?php for (; $i < $j; $i++) { ?>
										<?php if (isset($category['children'][$i])) { ?>
											<li id="m<?php echo $linkidcount.$i; ?>"><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
										<?php } ?>
									<?php } ?>
									<?php if ($category['column'] > 1) { ?>
											</ul>
										</li>
									<?php } ?>
									<?php } ?>
									</ul>
								<?php } ?>
								</li>
								<?php $linkidcount++; ?>
							<?php } ?>
						</ul>
					</div>
				</nav><!-- #navbar -->

				<?php if($this->config->get('fortuna_select_mobile_menu') == 'selectbox') { ?>

				<div id="mobileMenuWrap">
					<select name="mobileMenu" id="mobileMenu">
						<option value="">&nbsp;<?php $this->language->load('module/fortuna');
								echo $this->language->get('text_mobile_menu'); ?></option>
						<?php foreach ($categories as $category) { ?>
							<option value="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></option>
							<?php if ($category['children']) { ?>
								<?php for ($i = 0; $i < count($category['children']); $i++) { ?>
									<?php if (isset($category['children'][$i])) { ?>
										<option value="<?php echo $category['children'][$i]['href']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category['children'][$i]['name']; ?></option>
									<?php } ?>
								<?php } ?>
							<?php } ?>
						<?php } ?>
					</select>
				</div>

				<?php } ?>

			<?php } ?>
		
			</div>

		</div>

	</header> <!-- #header -->

	<section id="content-wrapper">

		<div class="container">