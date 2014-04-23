<?php if ($products) { ?>

	<?php $this->language->load('module/fortuna'); ?>

	<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_related_carousel') != '') { ?>

		<div id="related-products" class="product-slider top-arrows" <?php if ($this->language->get('direction')=='rtl') echo 'style="direction:ltr;"'?>>

			<div class="box-heading"><?php echo $heading_title; ?></div>

			<div class="flexslider">

				<ul class="slides">

				<?php foreach ($products as $product) {  ?>
					
					<li>
						<div class="inner">

						<?php if ($product['price'] && $product['special']) { ?>
						<div class="onsale">
							<div class="ribbon"><?php echo $this->language->get('text_onsale'); ?></div>
							<div class="ribbonshadow"></div>
						</div>
						<?php } ?>

						<?php if ($product['thumb']) { ?>
						<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
						<?php } ?>

						<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>

						<?php if ($product['price']) { ?>
						<div class="price">
						<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
						<?php } else { ?>
							<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
						<?php } ?>
						</div>
						<?php } ?>

						<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>

						<?php if ($product['rating']) { ?>
						<div class="rating"><img src="catalog/view/theme/fortuna/images/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
						<?php } ?>

						</div> <!-- .inner -->
					</li>

				<?php } ?>

				</ul>

		  </div>

		</section> <!-- .product-slider -->

		<script type="text/javascript">

			$(document).ready(function() {
				$('#related-products .flexslider').flexslider({
					animation: "slide",
					animationLoop: true,
					itemWidth: 182,
					itemMargin: 3,
					minItems: 2,
					maxItems: 5,
					<?php if($this->config->get('fortuna_carousel_autoplay') == 0) echo "slideshow: false,"; ?>
					slideshowSpeed: 4600
				  });
			});

		</script>

	<?php } else { ?>

		<section id="related-products" class="box">

			<div class="box-heading"><?php echo $heading_title; ?></div>
			
			<div class="box-content">

				<div class="product-box">

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
							<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
							<?php } ?>

							<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>

							<?php if ($product['price']) { ?>
							<div class="price">
							<?php if (!$product['special']) { ?>
								<?php echo $product['price']; ?>
							<?php } else { ?>
								<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
							<?php } ?>
							</div>
							<?php } ?>

							<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>

							<?php if ($product['rating']) { ?>
							<div class="rating"><img src="catalog/view/theme/fortuna/images/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
							<?php } ?>

						</div><!-- .inner -->

					</div><!-- .grid-box -->

					<?php } ?>

				</div><!-- .product-box -->

			</div><!-- .box-content -->
		
		</section><!-- #related-products -->

	<?php } ?>

<?php } ?>