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

				</header>

				<div class="row">

					<div class="col-sm-6">
						<div class="contentset"><i class="icon-user"></i><?php echo $text_my_account; ?></div>

						<ul class="list">
							<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
							<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
							<li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
						</ul>
					</div>

					<div class="col-sm-6">
						<div class="contentset"><i class="icon-map-marker"></i><?php echo $text_my_tracking; ?></div>

						<ul class="list">
							<li><a href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a></li>
						</ul>
					</div>

				</div>

				<div class="row">
					<div class="col-sm-6">
						<div class="contentset"><i class="icon-bookmark"></i><?php echo $text_my_transactions; ?></div>

						<ul class="list">
							<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
						</ul>
					</div>
				</div>

			</div>

		</section> <!-- #maincontent -->

	<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>