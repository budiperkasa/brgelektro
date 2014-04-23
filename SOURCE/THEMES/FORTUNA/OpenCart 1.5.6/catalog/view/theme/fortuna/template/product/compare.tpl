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

	<div class="row">

		<?php echo $column_left ?>
		
		<section id="maincontent" class="<?php echo $main; ?> comparison" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<header class="heading">
					<h1 class="page-header"><?php echo $heading_title; ?></h1>
				</header>

				<?php if ($products) { ?>

					<div class="contentset"><?php echo $text_product; ?></div>
					
					<div class="nav-container">

						<div class="button-group nav-compare">

							<button id="previous-column" class="button button-inverse button-small">
								<?php echo $this->language->get('text_prev'); ?>
							</button>
							
							<button id="next-column" class="button button-inverse button-small">
								<?php echo $this->language->get('text_next'); ?>
							</button>

						</div>

					</div>

					<div id="compare-wrapper">

						<table class="table table-stripped compare-info">
							
								<thead>
									<tr>
										<td><?php echo $text_name; ?></td>
									
										<?php foreach ($products as $product) { ?>
											<td class="name">
												<a href="<?php echo $products[$product['product_id']]['href']; ?>"><?php echo $products[$product['product_id']]['name']; ?></a>
											</td>
										<?php } ?>
									</tr>
								</thead>

							<tbody>
								<tr>
									<td class="title"><?php echo $text_image; ?></td>
									
									<?php foreach ($products as $product) { ?>
									<td>
										<?php if ($product['price'] && $product['special']) { ?>
											<div class="onsale">
												<div class="ribbon">
													<?php $this->language->load('module/fortuna');
													echo $this->language->get('text_onsale'); ?>
												</div>
												<div class="ribbonshadow"></div>
											</div>
										<?php } ?>
										<?php if ($products[$product['product_id']]['thumb']) { ?>
											<a href="<?php echo $products[$product['product_id']]['href']; ?>"><img src="<?php echo $products[$product['product_id']]['thumb']; ?>" alt="<?php echo $products[$product['product_id']]['name']; ?>" /></a>
										<?php } ?>
									</td>
									<?php } ?>
								</tr>

								<tr>
									<td class="title"><?php echo $text_price; ?></td>

									<?php foreach ($products as $product) { ?>

									<td class="price">
										<?php if ($products[$product['product_id']]['price']) { ?>
										
											<?php if (!$products[$product['product_id']]['special']) { ?>
												<?php echo $products[$product['product_id']]['price']; ?>
											<?php } else { ?>
												<span class="price-old"><?php echo $products[$product['product_id']]['price']; ?></span> 
												<span class="price-new"><?php echo $products[$product['product_id']]['special']; ?></span>
											<?php } ?>
										<?php } ?>
									</td>
									<?php } ?>
								</tr>

								<tr>
									<td class="title"><?php echo $text_model; ?></td>
									
									<?php foreach ($products as $product) { ?>
									<td><?php echo $products[$product['product_id']]['model']; ?></td>
									<?php } ?>
								</tr>
								<tr>
									<td class="title"><?php echo $text_manufacturer; ?></td>

									<?php foreach ($products as $product) { ?>
									<td><?php echo $products[$product['product_id']]['manufacturer']; ?></td>
									<?php } ?>
								</tr>
								<tr>
									<td class="title"><?php echo $text_availability; ?></td>
									<?php foreach ($products as $product) { ?>
									<td><?php echo $products[$product['product_id']]['availability']; ?></td>
									<?php } ?>
								</tr>
								<?php if ($review_status) { ?>
								<tr>
									<td class="title"><?php echo $text_rating; ?></td>
									<?php foreach ($products as $product) { ?>
										<td><img src="catalog/view/theme/fortuna/images/stars-<?php echo $products[$product['product_id']]['rating']; ?>.png" alt="<?php echo $products[$product['product_id']]['reviews']; ?>" /><br />
										<small><?php echo $products[$product['product_id']]['reviews']; ?></small></td>
									<?php } ?>
								</tr>
								<?php } ?>
								<tr>
									<td class="title"><?php echo $text_summary; ?></td>
									<?php foreach ($products as $product) { ?>
									<td class="description">
										<?php echo $products[$product['product_id']]['description']; ?>
									</td>
									<?php } ?>
								</tr>
								<tr>
									<td class="title"><?php echo $text_weight; ?></td>
									
									<?php foreach ($products as $product) { ?>
									<td><?php echo $products[$product['product_id']]['weight']; ?></td>
									<?php } ?>
								</tr>
								<tr>
									<td><?php echo $text_dimension; ?></td>
									<?php foreach ($products as $product) { ?>
									<td><?php echo $products[$product['product_id']]['length']; ?> x <?php echo $products[$product['product_id']]['width']; ?> x <?php echo $products[$product['product_id']]['height']; ?></td>
								<?php } ?>
								</tr>
							</tbody>
							<?php foreach ($attribute_groups as $attribute_group) { ?>
							<thead>
								<tr>
									<td class="compare-attribute" colspan="<?php echo count($products) + 1; ?>">
										<?php echo $attribute_group['name']; ?>
									</td>
								</tr>
							</thead>
							<tbody>
							<?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
							
								<tr>
								<td class="title"><?php echo $attribute['name']; ?></td>
								<?php foreach ($products as $product) { ?>
								<?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
								<td><?php echo $products[$product['product_id']]['attribute'][$key]; ?></td>
								<?php } else { ?>
								<td></td>
								<?php } ?>
								<?php } ?>
								</tr>
							
							<?php } ?>
							</tbody>
							<?php } ?>
							<tbody>
								<tr>
									<td></td>
									<?php foreach ($products as $product) { ?>
									<td><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button button-cart button-small" /></td>
									<?php } ?>
								</tr>
								<tr>
									<td></td>
									<?php foreach ($products as $product) { ?>
									<td class="remove"><a href="<?php echo $product['remove']; ?>" class=""> <i class="icon-remove-sign"></i>	<?php echo $button_remove; ?></a></td>
									<?php } ?>
								</tr>
							</tbody>
						</table>
					
					</div>

					<div class="buttons">
						<a href="<?php echo $continue; ?>" class="button button-default button-inverse"><span><?php echo $button_continue; ?></span></a>
					</div>

				<?php } else { ?>

					<div class="content empty">
						
						<?php echo $text_empty; ?>

						<div class="buttons">
							<a href="<?php echo $continue; ?>" class="button button-default button-inverse"><span><?php echo $button_continue; ?></span></a>
						</div>

					</div>
				
				<?php } ?>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<script type="text/javascript">

		$(document).ready(function() {
			$('#next-column').click(function(event) {
				event.preventDefault();
				$('#compare-wrapper').animate({scrollLeft:'+=95'}, 'medium');        
			});
			$('#previous-column').click(function(event) {
				event.preventDefault();
				$('#compare-wrapper').animate({scrollLeft:'-=95'}, 'medium');        
			});
		});

	</script>
	
<?php echo $footer; ?>