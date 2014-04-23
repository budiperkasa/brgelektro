			</div>

		</section> <!-- #content_wrapper -->

		<footer id="footer">

			<div class="container">

				<div class="row-fluid">

					<div class="column span2">
						<h3 class="header"><?php echo $text_information; ?></h3>
						<ul class="content">
							<?php $i=1; foreach ($informations as $information) { ?>
							<li id="inf<?php echo $i;?>"><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
							<?php $i++; } ?>
						</ul>
					</div>

					<div class="column span2">
						<h3 class="header"><?php echo $text_service; ?></h3>
						<ul class="content">
							<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
							<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
							<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
						</ul>
					</div>

					<div class="column span2">
						<h3 class="header"><?php echo $text_extra; ?></h3>
							<ul class="content">
								<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
								<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
								<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
								<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
							</ul>
					</div>

					<div class="column span2">
						<h3 class="header"><?php echo $text_account; ?></h3>
							<ul class="content">
								<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
								<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
								<li class="wishlist-link"><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
								<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
							</ul>
					</div>

					<div class="span4 follow-us">

						<?php if($this->config->get('fortuna_social_pics') != '') { ?>
							<?php echo html_entity_decode($this->config->get('fortuna_social_pics'), ENT_QUOTES, 'UTF-8'); ?>
						<?php } else { ?>
							<img src="image/data/favicon/Logo-BusanaCom.png" />
						<?php } ?>

					</div>

				</div> <!-- .row -->

				<?php 	if($this->config->get('fortuna_status')== 1) { ?>

				<div class="row-fluid bottom-row">
					<div class="span3 payment">
						<?php if($this->config->get('fortuna_payment_logos') != '') { ?>
							<?php echo html_entity_decode($this->config->get('fortuna_payment_logos'), ENT_QUOTES, 'UTF-8'); ?>
						<?php } else { ?>
							<img src="catalog/view/theme/fortuna/images/payment_methods.png" />
						<?php } ?>
					</div>
					<div class="span6 info">
						<?php if($this->config->get('fortuna_footer_info_text') != '') { ?>
							<?php echo html_entity_decode($this->config->get('fortuna_footer_info_text'), ENT_QUOTES, 'UTF-8');?>
						<?php } ?>
					</div>
					<div class="span3">
						<div class="social">
							<?php if(($this->config->get('fortuna_facebook_page') != '') && ($this->config->get('fortuna_facebook_icon') == 1)) { ?>
									<a rel="nofollow" href="https://facebook.com/<?php echo $this->config->get('fortuna_facebook_page'); ?>" target="_blank">
									<img src="catalog/view/theme/fortuna/images/icons/facebook.png" alt="Facebook" title="Facebook"></a>
								<?php } ?>
							<?php if($this->config->get('fortuna_twitter_username') != '') { ?>
								<a rel="nofollow" href="https://twitter.com/#!/<?php echo $this->config->get('fortuna_twitter_username'); ?>" target="_blank" title="Twitter" class="tooltp" rel="tooltip" >
								<img src="catalog/view/theme/fortuna/images/icons/twitter.png" alt="Twitter" ></a>
							<?php } ?>
							<?php if($this->config->get('fortuna_youtube_username') != '') { ?>
								<a rel="nofollow" href="https://youtube.com/user/<?php echo $this->config->get('fortuna_youtube_username'); ?>" target="_blank" title="YouTube" class="tooltp" rel="tooltip" >
								<img src="catalog/view/theme/fortuna/images/icons/youtube.png" alt="YouTube" ></a>
							<?php } ?>
							<?php if($this->config->get('fortuna_gplus_id') != '') { ?>
								<a rel="nofollow" href="https://plus.google.com/u/0/<?php echo $this->config->get('fortuna_gplus_id'); ?>" target="_blank" title="Google+" class="tooltp" rel="tooltip" >
								<img src="catalog/view/theme/fortuna/images/icons/gplus.png" alt="Google+" ></a>
							<?php } ?>
							<?php if($this->config->get('fortuna_pinterest_id') != '') { ?>
								<a rel="nofollow" href="https://pinterest.com/<?php echo $this->config->get('fortuna_pinterest_id'); ?>" target="_blank" title="Pinterest" class="tooltp" rel="tooltip" >
								<img src="catalog/view/theme/fortuna/images/icons/pinterest.png" alt="Pinterest" ></a>
							<?php } ?>
							<?php if($this->config->get('fortuna_instagram_username') != '') { ?>
								<a rel="nofollow" href="https://instagram.com/<?php echo $this->config->get('fortuna_instagram_username'); ?>" target="_blank" title="Instagram" class="tooltp" rel="tooltip" >
								<img src="catalog/view/theme/fortuna/images/icons/instagram.png" alt="Instagram" ></a>
							<?php } ?>
							<?php if($this->config->get('fortuna_tumblr_username') != '') { ?>
								<a rel="nofollow" href="http://<?php echo $this->config->get('fortuna_tumblr_username'); ?>.tumblr.com" target="_blank" title="Tumblr" class="tooltp" rel="tooltip" >
								<img src="catalog/view/theme/fortuna/images/icons/tumblr.png" alt="Tumblr" ></a>
							<?php } ?>
							<?php if($this->config->get('fortuna_skype_username') != '') { ?>
								<a rel="nofollow" href="skype:<?php echo $this->config->get('fortuna_skype_username'); ?>?call" target="_blank" title="Skype Me!" class="tooltp" rel="tooltip" >
								<img src="catalog/view/theme/fortuna/images/icons/skype.png" alt="Skype Me!" ></a>
							<?php } ?>
						</div>
					</div>
				</div>

				<?php } ?>

			</div>

		</footer> <!-- #footer -->

		<footer id="footend">

			<div class="container">

				<div class="row">

				<?php if($this->config->get('fortuna_status')== 1) { ?>
					<?php if($this->config->get('fortuna_copyright') != '') { ?>
						<div id="copy"><?php echo html_entity_decode($this->config->get('fortuna_copyright'), ENT_QUOTES, 'UTF-8'); ?></div>
					<?php } else { ?>
						<div id="copy"><?php echo $this->config->get('config_name'); ?> &copy;2012. Powered by <a class="blue" href="http://www.opencart.com">OpenCart</a>.</div>
					<?php } ?>
				<?php } else { ?>
					<div id="copy"><?php echo $this->config->get('config_name'); ?> &copy;2012. Powered by <a class="blue" href="http://www.opencart.com">OpenCart</a><br /><a href="http://www.everthemes.com">fortuna</a> by <a href="http://www.everthemes.com">EVERTHEMES.COM</a>.</div>
				<?php } ?>

				</div>

			</div>

		</footer> <!-- #footend -->

		<?php $js_path="http://static.busana.com/js"; ?>

		<script type="text/javascript" src="<?php echo $js_path; ?>/bootstrap.min.js"></script>
		<!--[if lt IE 9]> <script type="text/javascript" src="<?php echo $js_path; ?>/selectivizr.min.js"></script> <![endif]-->
		<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.total-storage.min.js"></script>

		<script type="text/javascript" src="<?php echo $js_path; ?>/respond.min.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/jquery.validate.min.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/jquery.easing-1.3.min.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/jquery.flexslider.min.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/cloud-zoom.1.0.3-min.js"></script>
		<?php if ($this->config->get('fortuna_slider') == 'camera') { ?>
		<script type="text/javascript" src="<?php echo $js_path; ?>/jquery.mobile.customized.min.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/camera.min.js"></script>
		<?php } ?>
		<script type="text/javascript" src="<?php echo $js_path; ?>/jquery.ui.totop.js"></script>
		<script type="text/javascript" src="<?php echo $js_path; ?>/custom.js"></script>

		<?php if ($this->config->get('fortuna_custom_js') != '') { 
			echo htmlspecialchars_decode( $this->config->get('fortuna_custom_js'), ENT_QUOTES );
		} ?>

		<script type="text/javascript">
		<?php if ($this->config->get('fortuna_category_style') == 'list') { ?>
			if (view) {	display(view);	} 
			else { display('list'); }
		<?php } else { ?>
			if (view=='list') {	display(view);	} 
		<?php } ?>
		</script>

	</body>

</html>