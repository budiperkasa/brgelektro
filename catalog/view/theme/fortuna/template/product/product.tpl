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
		$main = "span9"; 
		if($column_left) $main.=" sideleft"; else $main.= " sideright";
	} 
	else { 	$main = "span12"; } 

	?>

	<div class="row-fluid">

		<?php echo $column_left ?>

		<section id="maincontent" class="product-info <?php echo $main; ?> " role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<!-- PREVNEXT BUTTONS PLACEHOLDER -->

				<div class="row-fluid">

					<div class="span5">

						<?php if ($thumb || $images) { ?>

							<?php if ($thumb) { ?>

								<div class="image">

								<?php if ($price && $special) { ?>
								<div class="onsale">
									<div class="ribbon">
										<?php $this->language->load('module/fortuna');
										echo $this->language->get('text_onsale'); ?>
									</div>
									<div class="ribbonshadow"></div>
								</div>
								<?php } ?>

								<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_cloud_zoom')!='') { ?>

									<!-- image zoom  -->

									<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" id='image' rel="adjustX: 10, adjustY:-4, tint:false,tintOpacity:0.2, zoomWidth:360, position:'<?php echo $this->config->get('fortuna_zoom_position'); ?>', showTitle:false"><img src="<?php echo $thumb; ?>" title=" <?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a><a href="<?php echo $popup; ?>"id="zoom-image" title=" <?php echo $heading_title; ?>" class="colorbox tooltp" rel="colorbox"><span><i class="icon-zoomin"></i> <?php echo $this->language->get('text_zoom'); ?></span></a>

								<?php } else { ?>

									<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>

								<?php } ?>

								</div>

							<?php } ?>

							<?php if ($images) { ?>

								<div class="image-additional">

									<ul>
										<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_cloud_zoom')!='') { ?>

										<li><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'image', smallImage: '<?php echo $thumb; ?>' "><img src="<?php echo $small; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>

										<?php } ?>

									<?php foreach ($images as $image) { ?>

										<?php if($this->config->get('fortuna_status')== 1 && $this->config->get('fortuna_cloud_zoom')!='') { ?>

											<li><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'image', smallImage: '<?php echo $image['thumb']; ?>' "><img src="<?php echo $image['small']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a><a href="<?php echo $image['popup']; ?>" class="colorbox" style="display:none" rel="colorbox"></a></li>

										<?php } else { 

											if($image['small']) { ?>

												<li><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $image['small']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>

											<?php } else { ?>

												<li><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>

											<?php } ?>

										<?php } ?>

									<?php } ?>

									</ul>

								</div>

							<?php } ?>

						<?php } ?>

					</div> <!-- .span6 LEFT BOX-->

					<div class="span7">

						<div class="details">

							<header class="heading">

								<h1 class="page-header"><?php echo $heading_title; ?></h1>

							</header>

							<div class="row-fluid price-cart">

								<div class="price span6">

									<?php if ($price) { ?>
									
									<?php echo $text_price; ?>

									<?php if (!$special) { ?>
										<span class="price-normal"><?php echo $price; ?></span>
									<?php } else { ?>
										<span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
									<?php } ?>

									<?php if ($tax) { ?>
										<div class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></div>
									<?php } ?>

									<?php if ($points) { ?>
										<div class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></div>
									<?php } ?>

									<?php if ($discounts) { ?>
									<div class="discount">
										<ul>
										<?php foreach ($discounts as $discount) { ?>
											<li><?php echo sprintf($text_discount, $discount['quantity'], "<span>".$discount['price']."</span>"); ?></li>
										<?php } ?>
										</ul>
									</div>
									<?php } ?>
									
									<?php } ?>

								</div> <!-- .price -->

								<div class="cart span6">

									<div class="add-cart">

										<input type="text" name="quantity" value="<?php echo $minimum; ?>" class="input-mini" />
										<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

										<input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button" />

										<?php if ($minimum > 1) { ?>
											<small class="minimum"><?php echo $text_minimum; ?></small>
										<?php } ?>

									</div> <!-- .add-cart -->

								</div> <!-- .cart -->

							</div>

							<div class="row-fluid">

								<div class="span6">

									<div class="description">

										<?php if ($manufacturer) { ?>
											<span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
										<?php } ?>
										
										<span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
										<?php if ($reward) { ?>
										<span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
										<?php } ?>
										<span><?php echo $text_stock; ?></span> <?php echo $stock; ?>

									</div> <!-- .description -->

									<?php if ($options) { ?>
									
										<div class="options">
											
											<div class="contentset"><?php echo $text_option; ?></div>

											<?php foreach ($options as $option) { ?>

												<!-- Select -->
											
												<?php if ($option['type'] == 'select') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">
														
														<label for="option[<?php echo $option['product_option_id']; ?>]">
															
															<?php if ($option['required']) { ?>
																<span class="required">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<div class="controls">
															<select name="option[<?php echo $option['product_option_id']; ?>]" class="span10">
																<option value=""><?php echo $text_select; ?></option>
																
																<?php foreach ($option['option_value'] as $option_value) { ?>
																	
																	<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
																	
																	<?php if ($option_value['price']) { ?>
																		(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
																	<?php } ?>

																	</option>

																<?php } ?>
															</select>
														</div>

													</div>

												<?php } ?>

												<!-- Radio -->

												<?php if ($option['type'] == 'radio') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label class="control-label">

															<?php if ($option['required']) { ?>
																<span class="required">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<?php foreach ($option['option_value'] as $option_value) { ?>						
															
															<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="radio">
																
																<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />

																<?php echo $option_value['name']; ?>

																<?php if ($option_value['price']) { ?>
																	(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
																<?php } ?>

															</label>

														<?php } ?>

													</div>

												<?php } ?>

												<!-- Checkbox -->

												<?php if ($option['type'] == 'checkbox') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label class="control-label">
															
															<?php if ($option['required']) { ?>
																<span class="required">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<?php foreach ($option['option_value'] as $option_value) { ?>
														
															<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="checkbox">
																<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
														
																<?php echo $option_value['name']; ?>
														
																<?php if ($option_value['price']) { ?>
																	(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
																<?php } ?>
														
															</label>
														
														<?php } ?>
													
													</div>

												<?php } ?>

												<!-- Image -->

												<?php if ($option['type'] == 'image') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label class="control-label">

															<?php if ($option['required']) { ?>
																<span class="required">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<?php foreach ($option['option_value'] as $option_value) { ?>						
															
															<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="radio option-image">
																
																<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />

																<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />
																
																<?php echo $option_value['name']; ?>

																<?php if ($option_value['price']) { ?>
																	(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
																<?php } ?>

															</label>

														<?php } ?>

													</div>

												<?php } ?>

												<!-- Text field -->

												<?php if ($option['type'] == 'text') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">
															
															<?php if ($option['required']) { ?>
																<span class="required">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<div class="controls">
															<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>"  class="span10" />
														</div>

													</div>

												<?php } ?>

												<!-- Textarea -->

												<?php if ($option['type'] == 'textarea') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">
															
															<?php if ($option['required']) { ?>
																<span class="required">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<div class="controls">
															<textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"  class="span10"><?php echo $option['option_value']; ?></textarea>
														</div>

													</div>

												<?php } ?>

												<!-- File -->

												<?php if ($option['type'] == 'file') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">

															<?php if ($option['required']) { ?>
																<span class="required">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<div class="controls">
															<a id="button-option-<?php echo $option['product_option_id']; ?>" class="button button-success button-small"><i class="icon-upload icon-white"></i> <?php echo $button_upload; ?></a>
															<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
														</div>

													</div>

												<?php } ?>

												<!-- Date -->

												<?php if ($option['type'] == 'date') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label for="option[<?php echo $option['product_option_id']; ?>]" class="contro-label">

															<?php if ($option['required']) { ?>
																<span class="required">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<div class="controls">
															<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date span5" />
														</div>

													</div>

												<?php } ?>

												<!-- Date time -->

												<?php if ($option['type'] == 'datetime') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">

															<?php if ($option['required']) { ?>
																<span class="required">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<div class="controls">
															<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime span7" />
														</div>

													</div>

												<?php } ?>

												<!-- Time -->

												<?php if ($option['type'] == 'time') { ?>

													<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

														<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">
															
															<?php if ($option['required']) { ?>
																<span class="required">*</span>
															<?php } ?>

															<b><?php echo $option['name']; ?>:</b>

														</label>

														<div class="controls">
															<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time span5" />
														</div>

													</div>

												<?php } ?>

											<?php } ?>

										</div> <!-- .options -->

									<?php } ?>

								</div>

								<div class="span6">

									<div class="tools">

									<span class="wishlist"><a onclick="addToWishList('<?php echo $product_id; ?>');" rel="tooltip" title="<?php echo $button_wishlist; ?>" class="tooltp"><i class="icon-wishlist"></i></a></span>

									<span class="compare"><a onclick="addToCompare('<?php echo $product_id; ?>');" rel="tooltip" title="<?php echo $button_compare; ?>" class="tooltp"><i class="icon-compare"></i></a></span>
							
									<?php if ($review_status) { ?>

										<span class="review">

											<a onclick="$('a[href=\'#tab-review\']').trigger('click'); $('html, body').animate({scrollTop: $('#tabs').offset().top}, 800);" rel="tooltip"title="<?php echo $text_write; ?>" class="tooltp"><img src="catalog/view/theme/fortuna/images/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" /> <?php echo $reviews; ?></a>

										</span>

									<?php } ?>
									</div>

									<?php if ($tags) { ?>

										<div class="tags">
											<b><?php echo $text_tags; ?></b>
											
											<?php foreach ($tags as $tag) { ?>
												<a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>
											<?php } ?>
										
										</div>

									<?php } ?>

									<div class="share">

										<!-- AddThis button BEGIN -->

										<div class="addthis_default_style">
											<a class="addthis_button_compact"><?php echo $text_share; ?></a>
											<a class="addthis_button_email"></a>
											<a class="addthis_button_twitter"></a>
											<a class="addthis_button_pinterest_share"></a>
											<a class="addthis_button_google_plusone"></a>
											<a class="addthis_button_facebook_like"></a> 
										</div>
										<script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
										
										<!-- AddThis button END --> 

									</div>

									

								</div>

							</div>

							<section id="full-info">

								<?php if($this->config->get('fortuna_product_details_layout') == 'accordion') { ?>
								<div class="accordion" id="product-details">
								  <div class="accordion-group">
								    <div class="accordion-heading">
								      <a class="accordion-toggle" data-toggle="collapse" data-parent="#product-details" href="#tab-description">
								        <?php echo $tab_description; ?> <span class="expand"></span>
								      </a>
								    </div>
								    <div id="tab-description" class="accordion-body collapse in">
								      <div class="accordion-inner">
								        <div class="row-fluid">

											<div class="span12"><?php echo $description; ?></div>

											</div>
								      </div>
								    </div>
								  </div>

								  <?php if ($attribute_groups) { ?>
								  <div class="accordion-group">
								    <div class="accordion-heading">
								      <a class="accordion-toggle" data-toggle="collapse" data-parent="#product-details" href="#tab-attribute">
								        <?php echo $tab_attribute; ?> <span class="expand"></span>
								      </a>
								    </div>
								    <div id="tab-attribute" class="accordion-body collapse">
								      <div class="accordion-inner">
								        <table class="table table-bordered attribute">

											<?php foreach ($attribute_groups as $attribute_group) { ?>

											<thead>
												<tr>
													<td colspan="2"><?php echo $attribute_group['name']; ?></td>
												</tr>
											</thead>

											<tbody>
												<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
												<tr>
													<th><?php echo $attribute['name']; ?></th>
													<td><?php echo $attribute['text']; ?></td>
												</tr>
												<?php } ?>
											</tbody>

											<?php } ?>

										</table>
								      </div>
								    </div>
								  </div>
								  <?php } ?>


								  <?php if ($review_status) { ?>
								  <div class="accordion-group">
								    <div class="accordion-heading">
								      <a class="accordion-toggle" data-toggle="collapse" data-parent="#product-details" href="#tab-review">
								        <?php echo $tab_review; ?> <span class="expand"></span>
								      </a>
								    </div>
								    <div id="tab-review" class="accordion-body collapse">
								      <div class="accordion-inner">
								       
								       		<section id="list-reviews">
												<div id="review"></div>
											</section>
											
											<section id="add-review">

												<div id="review-form">

													<div class="contentset" id="review-title">
														<?php echo $text_write; ?>
													</div>

													<div class="control-group">
														
														<label class="label-group"><span class="required">*</span> <b><?php echo $entry_name; ?></b></label>

														<div class="controls">
															<input type="text" name="name" value="" class="span12" required />
														</div>

													</div>

													<div class="control-group">

														<label class="label-group"><span class="required">*</span> <b><?php echo $entry_review; ?></b></label>

														<div class="controls"><textarea name="text" cols="40" rows="8" class="span12" required ></textarea>
														</div>

														<small><?php echo $text_note; ?></small>

													</div>

													<div class="control-group">

														<label class="label-group"><span class="required">*</span> <b><?php echo $entry_rating; ?></b></label> 
															
														<div class="controls">
															
															<span><?php echo $entry_bad; ?></span>
															
															<input type="radio" name="rating" value="1" />
															<input type="radio" name="rating" value="2" />
															<input type="radio" name="rating" value="3" />
															<input type="radio" name="rating" value="4" />
															<input type="radio" name="rating" value="5" />
															
															<span><?php echo $entry_good; ?></span>
														
														</div>

													</div>

													<div class="control-group">

														<label for="captcha" class="control-label"><b><?php echo $entry_captcha; ?></b></label>

														<div class="controls">
															<input type="text" name="captcha" id="captcha" value="" class="span4" />
														</div>

													</div>

													<img src="index.php?route=product/product/captcha" alt="" />
													
													<div class="form-actions">
														<a id="button-review" class="button button-inverse"><span><?php echo $button_continue; ?></span></a>
													</div>

												</div> <!-- #review-form -->

											</section> <!-- #add-review -->

								      </div>
								    </div>
								  </div>
								  <?php } ?>

								</div>

								<?php } else { ?>

								<div id="tabs" class="htabs">
									<a href="#tab-description"><?php echo $tab_description; ?></a>
									<?php if ($attribute_groups) { ?>
									<a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
									<?php } ?>
									<?php if ($review_status) { ?>
									<a href="#tab-review"><?php echo $tab_review; ?></a>
									<?php } ?>
								</div>
								<div id="tab-description" class="tab-content"><?php echo $description; ?></div> <!-- #tab-description -->
								<?php if ($attribute_groups) { ?>
									<div id="tab-attribute" class="tab-content">
										<section class="product-atrributes">
																
											<table class="table table-striped attribute">

												<?php foreach ($attribute_groups as $attribute_group) { ?>

												<thead>
													<tr>
														<td colspan="2"><?php echo $attribute_group['name']; ?></td>
													</tr>
												</thead>

												<tbody>
													<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
													<tr>
														<th><?php echo $attribute['name']; ?></th>
														<td><?php echo $attribute['text']; ?></td>
													</tr>
													<?php } ?>
												</tbody>

												<?php } ?>

											</table>

										</section>
									</div> <!-- #tab-attribute -->
								<?php } ?>
								<?php if ($review_status) { ?>
									<div id="tab-review" class="tab-content">
										<div class="row-fluid">
																	
											<section id="review" class="span12"></section>
											
											<section id="add-review" class="span11">

												<div class="contentset" id="review-title">
													<?php echo $text_write; ?>
												</div>

												<div id="review-form">

													<div class="control-group">
														
														<label class="label-group"><span class="required">*</span> <b><?php echo $entry_name; ?></b></label>

														<div class="controls">
															<input type="text" name="name" value="" class="span12" required />
														</div>

													</div>

													<div class="control-group">

														<label class="label-group"><span class="required">*</span> <b><?php echo $entry_review; ?></b></label>

														<div class="controls"><textarea name="text" cols="60" rows="8" class="span12" required ></textarea>
														</div>

														<small><?php echo $text_note; ?></small>

													</div>

													<div class="control-group">

														<label class="label-group"><span class="required">*</span> <b><?php echo $entry_rating; ?></b></label> 
															
														<div class="controls">
															
															<span><?php echo $entry_bad; ?></span>
															
															<input type="radio" name="rating" value="1" />
															<input type="radio" name="rating" value="2" />
															<input type="radio" name="rating" value="3" />
															<input type="radio" name="rating" value="4" />
															<input type="radio" name="rating" value="5" />
															
															<span><?php echo $entry_good; ?></span>
														
														</div>

													</div>

													<div class="control-group">

														<label for="captcha" class="control-label"><b><?php echo $entry_captcha; ?></b></label>

														<div class="controls">
															<input type="text" name="captcha" id="captcha" value="" class="span3" />
														</div>

													</div>

													<img src="index.php?route=product/product/captcha" alt="" />
													
													<div class="form-actions">
														<a id="button-review" class="button button-inverse"><span><?php echo $button_continue; ?></span></a>
													</div>

												</div>

											</section>

										</div>
									</div> <!-- #tab-review -->
								<?php } ?>

								<?php } ?>
								
							</section> <!-- #full-info -->

						</div>			

					</div> <!-- .span6 RIGHT BOX-->

				</div>

			</div>

		</section>

		<?php echo $column_right; ?>

	</div>


	<?php echo $content_bottom; ?>

	<script type="text/javascript"><!--
	$(document).ready(function() {
		$('.colorbox').colorbox({
			overlayClose: true,
			opacity: 0.5,
			maxHeight: 760,
			maxWidth: 760,
			width:'100%',
			slideshow: true,
			slideshowAuto: false
		});
	});
	//--></script> 

	<script type="text/javascript">

		$('#button-cart').bind('click', function() {
			$.ajax({
				url: 'index.php?route=checkout/cart/add',
				type: 'post',
				data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
				dataType: 'json',
				success: function(json) {
					$('.success, .warning, .attention, information, .error').remove();
					
					if (json['error']) {
						if (json['error']['option']) {
							for (i in json['error']['option']) {
								$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
							}
						}
					} 
					
					if (json['success']) {
						$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/fortuna/images/close.png" alt="" class="close" /></div>');
							
						$('.success').fadeIn('slow');
							
						$('#cart-total').html(json['total']);
						
						$('html, body').animate({ scrollTop: 0 }, 'slow'); 
					}	
				}
			});
		});

	</script>


	<?php if ($options) { ?>

		<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>

		<?php foreach ($options as $option) { ?>

			<?php if ($option['type'] == 'file') { ?>

				<script type="text/javascript">

					new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
						action: 'index.php?route=product/product/upload',
						name: 'file',
						autoSubmit: true,
						responseType: 'json',
						onSubmit: function(file, extension) {
							$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/fortuna/images/loading.gif" class="loading" style="padding-left: 5px;" />');
						},
						onComplete: function(file, json) {
							$('.error').remove();
							
							if (json.success) {
								alert(json.success);
								
								$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json.file);
							}
							
							if (json.error) {
								$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json.error + '</span>');
							}
							
							$('.loading').remove();	
						}
					});

				</script>

			<?php } ?>

		<?php } ?>

	<?php } ?>


	<script type="text/javascript">

		$('#review .pagination a').live('click', function() {
			$('#review').fadeOut('slow');
				
			$('#review').load(this.href);
			
			$('#review').fadeIn('slow');
			
			return false;
		});			

		$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

		$('#button-review').bind('click', function() {
			$.ajax({
				url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
				type: 'post',
				dataType: 'json',
				data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
				beforeSend: function() {
					$('.success, .warning').remove();
					$('#button-review').attr('disabled', true);
					$('#review-title').after('<div class="attention"><img src="catalog/view/theme/fortuna/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
				},
				complete: function() {
					$('#button-review').attr('disabled', false);
					$('.attention').remove();
				},
				success: function(data) {
					if (data['error']) {
						$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
					}
					
					if (data['success']) {
						$('#review-title').after('<div class="success">' + data['success'] + '</div>');
										
						$('input[name=\'name\']').val('');
						$('textarea[name=\'text\']').val('');
						$('input[name=\'rating\']:checked').attr('checked', '');
						$('input[name=\'captcha\']').val('');
					}
				}
			});
		});

	</script> 

	<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>

	<script type="text/javascript">

	$(document).ready(function() {
		
		if ($.browser.msie && $.browser.version == 6) {
			$('.date, .datetime, .time').bgIframe();
		}

		$('.date').datepicker({dateFormat: 'yy-mm-dd'});
		$('.datetime').datetimepicker({
			dateFormat: 'yy-mm-dd',
			timeFormat: 'h:m'
		});
		$('.time').timepicker({timeFormat: 'h:m'});

	});
	
	</script> 


<?php echo $footer; ?>