/*  
Theme Name: Fortuna
Version: 1.4.0
*/

$(document).ready(function(){

	/*	Forms Validation
	---------------------------------------------------------------------- */

		jQuery.validator.setDefaults({
			errorClass: "error",  
			validClass: "",  
			errorElement: "span",  
			highlight: function(element, errorClass, validClass) {	
				if (element.type === 'radio') { 
					this.findByName(element.name).parent("div").parent("div").removeClass(validClass).addClass(errorClass);	
				} else { $(element).parent("div").parent("div").removeClass(validClass).addClass(errorClass);	}  
			},  
			unhighlight: function(element, errorClass, validClass) { 
				if (element.type === 'radio') { this.findByName(element.name).parent("div").parent("div").removeClass(errorClass).addClass(validClass);	
				} else { $(element).parent("div").parent("div").removeClass(errorClass).addClass(validClass);	}  
			},
			errorPlacement: function(error, element) {
				error.insertAfter(element);
			}
		});

		$("#contact-form").validate({
		  rules: {
			enquiry: {
				required: true,
				minlength: 10
			}
		  }
		});

		$("#register-form, #password-form").validate({
		  rules: {
			password: {
				required: true, minlength: 3
			},
			confirm: {
				required: function(element) {
					var str = $("#password").val();

					return str.length > 0;
				},
				equalTo: "#password",
				minlength: 3
			}
		  }
		});

		$("#edit-account, #voucher, #address, #return, #login, #forgotten").validate();
	

	/*	Search
	---------------------------------------------------------------------- */

		$('.button-search').bind('click', function() {
			url = $('base').attr('href') + 'index.php?route=product/search';
					 
			var search = $('input[name=\'search\']').attr('value');
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		});
		
		$('#header input[name=\'search\']').bind('keydown', function(e) {
			if (e.keyCode == 13) {
				url = $('base').attr('href') + 'index.php?route=product/search';
			 
				var search = $('input[name=\'search\']').attr('value');
				
				if (search) {
					url += '&search=' + encodeURIComponent(search);
				}
				
				location = url;
			}
		});

	 
	/*	Opacity animation on hover
	---------------------------------------------------------------------- */
		
		if ($.browser.msie && ($.browser.version == 8 || $.browser.version == 7 || $.browser.version == 6)) {

		} else {
		 
			$(".image-additional > a").hover(function() { 
				$(this).siblings().stop().animate({ opacity: .65 }, 500)}, function () {
					$(this).siblings().stop().animate({ opacity: 1 }, 300) }
			);

			$("#toggle_sidebar").hover(function() {
				$(".sidebar").stop().animate({ opacity: .55 }, 300)}, function () {
					$(".sidebar").stop().animate({ opacity: 1 }, 300)}
			);
		}


	/*	Ajax Minicart
	---------------------------------------------------------------------- */

		$('#cart .arrow').live('mouseover', function() {

			$('#cart').addClass('active');
			
			$('#cart').load('index.php?route=module/cart #cart > *');

			$('#cart > .content').slideToggle('fast');
			
			$('#cart').live('mouseleave', function() {
				$(this).removeClass('active');
			});
			
		});

	/*	Footer menu
	---------------------------------------------------------------------- */

		$(".column .header").click(function () {

			$screensize = $(window).width();

			if ($screensize < 767) {
				$(this).toggleClass("active");  
				$(this).parent().find(".content").slideToggle('medium');
			}

		});

	
	/*	Scroll to top
	---------------------------------------------------------------------- */
	
		$().UItoTop({ 
			easingType: 'easeOutQuart',
			scrollSpeed: 1200
		});


	/*	Toggle sidebar
	---------------------------------------------------------------------- */
		
		$("#toggle_sidebar").click(function () {

			$(this).toggleClass("collapse");

			$(".sidebar").toggleClass("close");

			$("#maincontent").toggleClass('col-sm-9 col-sm-12');

		});


	/*	Tooltips
	---------------------------------------------------------------------- */

		$('.tooltp').tooltip();


	/*	Mobile menu
	---------------------------------------------------------------------- */
		$('#mobileMenu').change(function(){
			if($(this).val() !== null){document.location.href = $(this).val()}
		});


	/*	Accordion
	---------------------------------------------------------------------- */

		$('.accordion-group:first-child .accordion-toggle').addClass('active');

	    $('.accordion').on('show', function (e) {
	         $(e.target).prev('.accordion-heading').find('.accordion-toggle').addClass('active');
	    });

	    $('.accordion').on('hide', function (e) {
	        $(this).find('.accordion-toggle').not($(e.target)).removeClass('active');
	    });
	    

	/*	Tabs
	---------------------------------------------------------------------- */

		$('.htabs a').tabs();


	/*	Banners
	---------------------------------------------------------------------- */

		var banner = function() {
			$('.banner').cycle({
				before: function(current, next) {
					$(next).parent().height($(next).outerHeight());
				}
			});
		}

		setTimeout(banner, 2000);

	
	/*	Alert boxes
	---------------------------------------------------------------------- */

		$('.success img, .warning img, .attention img, .information img').live('click', function() {
			$(this).parent().fadeOut('slow', function() {
				$(this).remove();
			});
		});	


});

	
	/*	Same height for all grid boxes
	---------------------------------------------------------------------- */

		// Adjust boxes height when the page is completely loaded
		$(window).load(function(){
			
			doAdjust = true;
			previousWidth = 0;
			adjustBoxHeights();
		
			// Raise doAdjust flag every time the window width changes

			$(window).resize(function() {
				var currentWidth = $(window).width();
				if (previousWidth != currentWidth) {
					doAdjust = true;
				}
				previousWidth = currentWidth;
			})

			// Run every half second

			$(function() {
				setInterval('maybeAdjust()', 500);
			});

		});

		
		// Check the doAdjust flag

		function maybeAdjust() {
			if (doAdjust) {
				adjustBoxHeights();
				doAdjust = false;
			}
		}

		// Loop through the DIVs and find the height of the tallest one, then loop again and set them all to that height

		function adjustBoxHeights() {
			var maxHeight = 0;
			$('.product-grid > div, .content-top .product-box > div, .content-bottom .product-box > div').each(function(){
				$(this).height('auto');
				if (maxHeight < $(this).height()) {maxHeight = $(this).height()}
			});
			$('.product-grid > div, .content-top .product-box > div, .content-bottom .product-box > div').each(function(){
				$(this).height(maxHeight);
			});

			var thumbs_maxHeight = 0;
			$('.category-list > li').each(function(){
				$(this).height('auto');
				if (thumbs_maxHeight < $(this).height()) {thumbs_maxHeight = $(this).height()}
			});
			$('.category-list > li').each(function(){
				$(this).height(thumbs_maxHeight);
			});
		}
		

	function getURLVar(urlVarName) {
		var urlHalves = String(document.location).toLowerCase().split('?');
		var urlVarValue = '';
		
		if (urlHalves[1]) {
			var urlVars = urlHalves[1].split('&');

			for (var i = 0; i <= (urlVars.length); i++) {
				if (urlVars[i]) {
					var urlVarPair = urlVars[i].split('=');
					
					if (urlVarPair[0] && urlVarPair[0] == urlVarName.toLowerCase()) {
						urlVarValue = urlVarPair[1];
					}
				}
			}
		}
		
		return urlVarValue;
	}

	/*	Add to Cart
	---------------------------------------------------------------------- */

		function addToCart(product_id, quantity) {
			quantity = typeof(quantity) != 'undefined' ? quantity : 1;

			$.ajax({
				url: 'index.php?route=checkout/cart/add',
				type: 'post',
				data: 'product_id=' + product_id + '&quantity=' + quantity,
				dataType: 'json',
				success: function(json) {
					$('.success, .warning, .attention, .information, .error').remove();
					
					if (json['redirect']) {
						location = json['redirect'];
					}
					
					if (json['success']) {
						$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/fortuna/images/close.png" alt="" class="close" /></div>');
						
						$('.success').fadeIn('slow');
						
						$('#cart-total').html(json['total']);
						
						$('html, body').animate({ scrollTop: 0 }, 'slow'); 
					}	
				}
			});
		}

	/*	Add to Wishlist
	---------------------------------------------------------------------- */

		function addToWishList(product_id) {
			$.ajax({
				url: 'index.php?route=account/wishlist/add',
				type: 'post',
				data: 'product_id=' + product_id,
				dataType: 'json',
				success: function(json) {
					$('.success, .warning, .attention, .information').remove();
								
					if (json['success']) {
						$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/fortuna/images/close.png" alt="" class="close" /></div>');
						
						$('.success').fadeIn('slow');
						
						$('#wishlist-total').html(json['total']);
						
						$('html, body').animate({ scrollTop: 0 }, 'slow');
					}	
				}
			});
		}

	/*	Add to Compare
	---------------------------------------------------------------------- */

		function addToCompare(product_id) { 
			$.ajax({
				url: 'index.php?route=product/compare/add',
				type: 'post',
				data: 'product_id=' + product_id,
				dataType: 'json',
				success: function(json) {
					$('.success, .warning, .attention, .information').remove();
								
					if (json['success']) {
						$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/fortuna/images/close.png" alt="" class="close" /></div>');
						
						$('.success').fadeIn('slow');
						
						$('#compare-total').html(json['total']);
						
						$('html, body').animate({ scrollTop: 0 }, 'slow'); 
					}	
				}
			});
		}


	/*	Grid/List view
	---------------------------------------------------------------------- */

		function display(view) {

			if (view == 'list') {

				$('#list').addClass('active');

				$('#grid').removeClass('active');

				$('.product-grid').toggleClass('product-grid product-list');
				
				$('.product-list > div').each(function(index, element) {

					$(this).removeClass('grid-box');

					$(this).addClass('product-row');
					$(this).height('auto');

					var special = $(element).find('.onsale').html();
					
					if (special != null) {
						html = '<span class="onsale">' + special  + '</span>';
						html += '<div class="row">';
					} else {
						html = '<div class="row">';
					}
				
					var image = $(element).find('.image').html();

					if (image != null) { 
						html += '<div class="image col-sm-3">' + image + '</div>';
					} else {
						html += '<div class="image col-sm-3">&nbsp;</div>';
					}
										
					html += '<div class="name-desc col-sm-4">';

					html += '<div class="name">' + $(element).find('.name').html() + '</div>';
					var rating = $(element).find('.rating').html();
					
					if (rating != null) {
						html += '<div class="rating">' + rating + '</div>';
					}
					html += '<div class="description">' + $(element).find('.description').html() + '</div>';

					html += '</div>';
					
					var price = $(element).find('.price').html();
					
					if (price != null) {
						html += '<div class="price col-sm-2">' + price  + '</div>';
					} else {
						html += '<div class="price col-sm-2">&nbsp;</div>';
					}

					html += '<div class="actions col-sm-3">';
					html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
					
					var wishlist = $(element).find('.wishlist').html();
					if (wishlist != null) {
						html += '  <div class="wishlist">' + wishlist + '</div>';
					}

					var compare = $(element).find('.compare').html();
					if (compare != null) {
						html += '  <div class="compare">' + compare + '</div>';
					}

					html += '</div>';

					html += '</div>';

					$(element).html(html);
				});
				
				$.totalStorage('display', 'list'); 

			} else {

				$('#grid').addClass('active');
				$('#list').removeClass('active');
				
				$('.product-list').toggleClass('product-list product-grid');
				
				$('.product-grid > div').each(function(index, element) {
					
					$(this).addClass('grid-box');

					html = '';
					
					var image = $(element).find('.image').html();

					html += '<div class="inner">';

					var special = $(element).find('.onsale').html();
					
					if (special != null) {
						html += '<span class="onsale">' + special  + '</span>';
					}
					
					if (image != null) {
						html += '<div class="image">' + image + '</div>';
					}
					
					html += '<div class="name">' + $(element).find('.name').html() + '</div>';

					var rating = $(element).find('.rating').html();
					
					if (rating != null) {
						html += '<div class="rating">' + rating + '</div>';
					}

					html += '<div class="description">' + $(element).find('.description').html() + '</div>';
					
					var price = $(element).find('.price').html();
					
					if (price != null) {
						html += '<div class="price">' + price  + '</div>';
					}
								
					html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
					
					var wishlist = $(element).find('.wishlist').html();
					if (wishlist != null) {
						html += '  <div class="wishlist">' + wishlist + '</div>';
					}

					var compare = $(element).find('.compare').html();
					if (compare != null) {
						html += '  <div class="compare">' + compare + '</div>';
					}

					html += '</div>';
					
					$(element).html(html);

				});
										
				$.totalStorage('display', 'grid');

				adjustBoxHeights();

			}

			$('.tooltp').tooltip();

		}

		view = $.totalStorage('display');
		
		
		
	/*	Responsive video embeds
	---------------------------------------------------------------------- */

		/*!
		* FitVids 1.0
		*
		* Copyright 2011, Chris Coyier - http://css-tricks.com + Dave Rupert - http://daverupert.com
		* Credit to Thierry Koblentz - http://www.alistapart.com/articles/creating-intrinsic-ratios-for-video/
		* Released under the WTFPL license - http://sam.zoy.org/wtfpl/
		*
		*/

		(function( $ ){

		  $.fn.fitVids = function( options ) {
			var settings = {
			  customSelector: null
			}

			if ( options ) {
			  $.extend( settings, options );
			}

			return this.each(function(){
			  var selectors = [
				"iframe[src*='player.vimeo.com']",
				"iframe[src*='www.youtube.com']",
				"iframe[src*='www.kickstarter.com']",
				"object",
				"embed"
			  ];

			  if (settings.customSelector) {
				selectors.push(settings.customSelector);
			  }

			  var $allVideos = $(this).find(selectors.join(','));

			  $allVideos.each(function(){
				var $this = $(this);
				if (this.tagName.toLowerCase() == 'embed' && $this.parent('object').length || $this.parent('.fluid-width-video-wrapper').length) { return; }
				var height = ( this.tagName.toLowerCase() == 'object' || $this.attr('height') ) ? $this.attr('height') : $this.height(),
					width = $this.attr('width') ? $this.attr('width') : $this.width(),
					aspectRatio = height / width;
				if(!$this.attr('id')){
				  var videoID = 'fitvid' + Math.floor(Math.random()*999999);
				  $this.attr('id', videoID);
				}
				$this.wrap('<div class="fluid-width-video-wrapper"></div>').parent('.fluid-width-video-wrapper').css('padding-top', (aspectRatio * 100)+"%");
				$this.removeAttr('height').removeAttr('width');
			  });
			});
		  }
		})( jQuery );

		//$(".container").fitVids();

		if($("body").hasClass("home") || $("body").hasClass("page_external")) { /*do nothing*/ }
		else { $(".container").fitVids(); }