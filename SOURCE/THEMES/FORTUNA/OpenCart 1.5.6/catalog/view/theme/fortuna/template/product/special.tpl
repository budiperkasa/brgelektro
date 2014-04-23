<?php echo $header; ?>

	<?php echo $content_top; ?>

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>

	<div id="notification"></div>

	<?php 

	$this->language->load('module/fortuna');
	
	if ($column_left || $column_right) { 
		$main = "col-sm-9"; 
		if($column_left) $main.=" sideleft"; else $main.= " sideright";
	}
	else { 	$main = "col-sm-12"; } 

	?>

	<div class="row special">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?> specials" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<header class="heading">
					<h1 class="page-header"><?php echo $heading_title; ?></h1>
				</header>

				<!-- Products -->

				<?php if ($products) { ?>

					<!-- Grid/Lis view, filters -->

					<div class="product-filter">

						<div class="button-group display" data-toggle="buttons">
							<label title="<?php echo $text_grid; ?>" class="button button-default button-sm active" onclick="display('grid');"><input type="radio" name="options" id="grid" ><i class="icon-th"></i></label>
							<label title="<?php echo $text_list; ?>" class="button button-default button-sm" onclick="display('list');"><input type="radio" name="options" id="list" ><i class="icon-th-list"></i></label>
						</div>

						<span class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></span>
						
						<div class="list-options"> 

							<div class="sort">

								<?php echo $text_sort; ?>

								<select onchange="location = this.value;" class="form-control input-sm">
									<?php foreach ($sorts as $sorts) { ?>
									<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
									<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>

							</div>

							<div class="limit">

								<?php echo $text_limit; ?>

								<select onchange="location = this.value;" class="form-control input-sm">
									
									<?php foreach ($limits as $limits) { ?>

										<?php if ($limits['value'] == $limit) { ?>

											<option value="<?php echo $limits['href']; ?>" selected="selected">
												<?php echo $limits['text']; ?>
											</option>

										<?php } else { ?>

											<option value="<?php echo $limits['href']; ?>">
												<?php echo $limits['text']; ?>
											</option>

										<?php } ?>

									<?php } ?>

								</select>

							</div>

						</div>

					</div>
				
					<!-- Product list (Default to Grid)  -->

					<?php if($this->config->get('fortuna_product_columns') == '4') $productcols = 'cols-4'; 
						else $productcols = 'cols-3'; ?>

					<div class="product-listing">

						<div class="product-grid row <?php echo $productcols; ?>">

							<?php foreach ($products as $product) { ?>

							<div class="grid-box">

								<div class="inner">

									<?php if ($product['price'] && $product['special']) { ?>
										<div class="onsale">
											<div class="ribbon"><?php echo $this->language->get('text_onsale'); ?></div>
											<div class="ribbonshadow"></div>
										</div>
									<?php } ?>

									<?php if ($product['thumb']) { ?>
										<div class="image">
											<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
										</div>
									<?php } ?>

									<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>

									<div class="description"><?php echo $product['description']; ?></div>

									<?php if ($product['price']) { ?>

										<div class="price">
											
											<?php if (!$product['special']) { ?>
												<?php echo $product['price']; ?>
											<?php } else { ?>
												<span class="price-old"><?php echo $product['price']; ?></span>
												<span class="price-new"><?php echo $product['special']; ?></span>
											<?php } ?>

											<?php if ($product['tax']) { ?>
												<br />
												<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
											<?php } ?>

										</div>

									<?php } ?>

									<?php if ($product['rating']) { ?>
										<div class="rating"><img src="catalog/view/theme/fortuna/images/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
									<?php } ?>

									<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
																	
									<div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="tooltp" rel="tooltip" title="<?php echo $button_wishlist; ?>"><i class="icon-heart"></i></a></div>

									<div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="tooltp" rel="tooltip" title="<?php echo $button_compare; ?>"><i class="icon-plus"></i></a></div>

								</div>

							</div>

							<?php } ?>

						</div> <!-- .produc-grid -->

					</div> <!-- .product-listing -->

					<div class="pagination"><?php echo $pagination; ?></div>
				
				<?php } else { ?>

					<div class="content empty white">

						<div class="warning"><?php echo $text_empty; ?></div>

					</div>

				<?php } ?>

			</div>

		</section><!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>