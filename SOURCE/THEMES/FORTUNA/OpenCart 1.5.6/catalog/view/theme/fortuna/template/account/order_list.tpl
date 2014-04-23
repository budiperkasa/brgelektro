<?php echo $header; ?>

	<?php echo $content_top; ?>

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>

	<?php 
	
	if ($column_left || $column_right) { 
		$main = "col-sm-9"; 
		if($column_left) $main.=" sideleft"; else $main.= " sideright";
	}
	else { 	$main = "col-sm-12"; } 

	?>

	<div class="row">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<header class="heading">
					<h1 class="page-header"><?php echo $heading_title; ?></h1>
				</header>

				<?php if ($orders) { ?>

					<div id="order-list">
						
						<?php foreach ($orders as $order) { ?>

							<div class="contentset separator">
								<a href="<?php echo $order['href']; ?>">
							 	<i class="icon-bookmark"></i><b><?php echo $text_order_id; ?> <?php echo $order['order_id']; ?></b></a>
							</div>

							<div class="row">
								
								<div class="col-sm-3">
									<?php echo $text_status; ?> <?php echo $order['status']; ?> <br/>
									<small><?php echo $order['date_added']; ?></small>
								</div>

								<div class="order-contents col-sm-4">
									<b><?php echo $text_customer; ?></b> <?php echo $order['name']; ?>
								</div>

								<div class="col-sm-2">
									<?php echo $text_products; ?> <?php echo $order['products']; ?> <br/>
									<b><?php echo $text_total; ?></b> <?php echo $order['total']; ?>
								</div>
								
								<div class="col-sm-3 list-actions">
									<a href="<?php echo $order['href']; ?>" class="button button-default button-sm" title="<?php echo $button_view; ?>"><?php echo $button_view; ?></a>
									<a href="<?php echo $order['reorder']; ?>" class="button button-default button-sm button-cart" title="<?php echo $button_reorder; ?>"><?php echo $button_reorder; ?></a>
								</div>

							</div>

						<?php } ?>

					</div>

					<div class="pagination"><?php echo $pagination; ?></div>

				<?php } else { ?>

					<div class="content"><?php echo $text_empty; ?></div>

				<?php } ?>

				<div class="form-actions buttons">
					<a href="<?php echo $continue; ?>" class="button button-default button-inverse"><?php echo $button_continue; ?></a>
				</div>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>