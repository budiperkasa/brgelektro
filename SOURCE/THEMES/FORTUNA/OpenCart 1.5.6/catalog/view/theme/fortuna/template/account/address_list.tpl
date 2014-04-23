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

					<?php if ($success) { ?>
					<div class="success"><?php echo $success; ?></div>
					<?php } ?>
					<?php if ($error_warning) { ?>
					<div class="warning"><?php echo $error_warning; ?></div>
					<?php } ?>

				</header>

				<div class="contentset"><?php echo $text_address_book; ?></div>

				<div id="address-list">

					<?php foreach ($addresses as $result) { ?>

						<div class="row">

							<div class="col-xs-6">
								<address>
									<?php echo $result['address']; ?>
								</address>
							</div>

							<div class="col-xs-6 list-actions">
								<a href="<?php echo $result['update']; ?>" class="button button-default button-sm" title="<?php echo $button_edit; ?>"><?php echo $button_edit; ?></a>
								<a href="<?php echo $result['delete']; ?>" class="button button-default button-sm" title="<?php echo $button_delete; ?>"><i class="icon-remove-sign"></i> <?php echo $button_delete; ?></a>
							</div>
							
						</div>

					<?php } ?>

				</div>

				<div class="form-actions buttons">
					<a href="<?php echo $back; ?>" class="button button-default"><?php echo $button_back; ?></a>
					<a href="<?php echo $insert; ?>" class="button button-default button-inverse"><?php echo $button_new_address; ?></a>
				</div>

			</div>
		
		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>
	
<?php echo $footer; ?>