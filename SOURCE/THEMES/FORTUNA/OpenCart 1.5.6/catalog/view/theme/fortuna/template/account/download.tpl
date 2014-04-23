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

		<?php echo $column_left ?>
		
		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>
				
				<header class="heading">
					<h1 class="page-header"><?php echo $heading_title; ?></h1>
				</header>

				<div id="download-list">

					<?php foreach ($downloads as $download) { ?>

						<div class="contentset">
							<b><?php echo $text_order; ?> <?php echo $download['order_id']; ?></b>
						</div>

						<div class="row">

							<div class="col-sm-4">
								<b><?php echo $text_name; ?></b> <?php echo $download['name']; ?><br />
								<b><?php echo $text_size; ?></b> <?php echo $download['size']; ?>
							</div>
											
							<div class="col-sm-3">						
								<b><?php echo $text_date_added; ?></b> <?php echo $download['date_added']; ?>
							</div>

							<div class="col-sm-3">
								<b><?php echo $text_remaining; ?></b> <?php echo $download['remaining']; ?>
							</div>

							<div class="col-sm-2 list-actions">
								<?php if ($download['remaining'] > 0) { ?>
									<a href="<?php echo $download['href']; ?>" class="button button-default button-cart button-sm"><?php echo $button_download; ?></a>
								<?php } ?>
							</div>

						</div>

					<?php } ?>

				</div>
			
				<div class="pagination"><?php echo $pagination; ?></div>
				
				<div class="form-actions buttons">

					<a href="<?php echo $continue; ?>" class="button button-default button-inverse"><?php echo $button_continue; ?></a>

				</div>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>