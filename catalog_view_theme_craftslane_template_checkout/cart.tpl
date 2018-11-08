<?php echo $header; ?>
 <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/cart.css">
<?php if ($attention) { ?>

<div class="col-md-12 attention"><?php echo $attention; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>

<?php } ?>

<?php if ($success) { ?>

<div class="col-md-12 success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>

<?php } ?>

<?php if ($error_warning) { ?>

<div class="col-md-12 warning"><?php echo $error_warning; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>

<?php } ?>
<style type="text/css">
.heading{
	background-color:#666 !important;
	color:#FFF;
	
}
</style>

<div class="row">
<?php echo $column_left; ?><?php echo $column_right; ?>
        <div class="col-md-12"  style="background: #fff;">
        
        <?php echo $content_top; ?>
         
     <div class="wrap cf">
  <h1 class="projTitle"> <?php echo $heading_title; ?></h1>
  <div class="heading cf" style="background-color:#FFF !important; color:#333 !important;">
    <h1>My Cart<?php if ($weight) { ?>
     &nbsp;(<?php 
     $cart = array();
    $cart =$_SESSION['cart'];
     echo array_sum($cart);
    ?>)  <?php } ?></h1>
    <a href="<?php echo $continue; ?>" class="continue">Continue Shopping</a>
  </div>
  <div class="cart">
 
    <ul class="cartWrap">
     <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
     <?php foreach ($products as $product) { ?>
      <li class="items odd">
        
    <div class="infoWrap"> 
        <div class="cartSection">
        <?php if ($product['thumb']) { ?>

              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="itemImg" /></a>

              <?php } ?>
       
          <p class="itemNumber">#<?php echo $product['model']; ?></p>
          <h3><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
        <div>

                <?php foreach ($product['option'] as $option) { ?>

                - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />

                <?php } ?>

              </div>

              <?php if ($product['reward']) { ?>

              <small><?php echo $product['reward']; ?></small>

              <?php } ?>
           <p> <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" /> x <?php echo $product['price']; ?>
           &nbsp;&nbsp;<input type="image" src="catalog/view/theme/default/image/update.png" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" /></p>
        <?php if (!$product['stock']) { ?>
				<p class="error"> ***</p>
                <?php } else { ?> <p class="stockStatus"> In Stock</p>
              <?php } ?>
          
        </div>  
    
        
        <div class="prodTotal cartSection">
          <p><?php echo $product['total']; ?></p>
        </div>
              <div class="cartSection removeWrap">
            
           <a href="<?php echo $product['remove']; ?>" class="remove">x</a>
        </div>
      </div>
      </li>
      <?php } ?>
       </form> 
    </ul>
  </div>
  
    <?php if ($coupon_status || $voucher_status || $reward_status || $shipping_status) { ?>

  <h2><?php echo $text_next; ?></h2>

  <div class="content">

    <p><?php echo $text_next_choice; ?></p>

    <table class="table">

      <?php if ($coupon_status) { ?>

      <tr class="highlight">

        <td><?php if ($next == 'coupon') { ?>

          <input type="radio" name="next" value="coupon" id="use_coupon" checked="checked" />

          <?php } else { ?>

          <input type="radio" name="next" value="coupon" id="use_coupon" />

          <?php } ?></td>

        <td><label for="use_coupon"><?php echo $text_use_coupon; ?></label></td>

      </tr>

      <?php } ?>

      <?php if ($voucher_status) { ?>

      <tr class="highlight">

        <td><?php if ($next == 'voucher') { ?>

          <input type="radio" name="next" value="voucher" id="use_voucher" checked="checked" />

          <?php } else { ?>

          <input type="radio" name="next" value="voucher" id="use_voucher" />

          <?php } ?></td>

        <td><label for="use_voucher"><?php echo $text_use_voucher; ?></label></td>

      </tr>

      <?php } ?>

      <?php if ($reward_status) { ?>

      <tr class="highlight">

        <td><?php if ($next == 'reward') { ?>

          <input type="radio" name="next" value="reward" id="use_reward" checked="checked" />

          <?php } else { ?>

          <input type="radio" name="next" value="reward" id="use_reward" />

          <?php } ?></td>

        <td><label for="use_reward"><?php echo $text_use_reward; ?></label></td>

      </tr>

      <?php } ?>

      <?php if ($shipping_status) { ?>

      <tr class="highlight">

        <td><?php if ($next == 'shipping') { ?>

          <input type="radio" name="next" value="shipping" id="shipping_estimate" checked="checked" />

          <?php } else { ?>

          <input type="radio" name="next" value="shipping" id="shipping_estimate" />

          <?php } ?></td>

        <td><label for="shipping_estimate"><?php echo $text_shipping_estimate; ?></label></td>

      </tr>

      <?php } ?>

    </table>

  </div>

  <div class="cart-module">

    <div id="coupon" class="content" style="display: <?php echo ($next == 'coupon' ? 'block' : 'none'); ?>;">

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

        <?php echo $entry_coupon; ?>&nbsp;

        <input type="text" name="coupon" value="<?php echo $coupon; ?>" />

        <input type="hidden" name="next" value="coupon" />

        &nbsp;

        <input type="submit" value="<?php echo $button_coupon; ?>" class="button" />

      </form>

    </div>

    <div id="voucher" class="content" style="display: <?php echo ($next == 'voucher' ? 'block' : 'none'); ?>;">

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

        <?php echo $entry_voucher; ?>&nbsp;

        <input type="text" name="voucher" value="<?php echo $voucher; ?>" />

        <input type="hidden" name="next" value="voucher" />

        &nbsp;

        <input type="submit" value="<?php echo $button_voucher; ?>" class="button" />

      </form>

    </div>

    <div id="reward" class="content" style="display: <?php echo ($next == 'reward' ? 'block' : 'none'); ?>;">

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

        <?php echo $entry_reward; ?>&nbsp;

        <input type="text" name="reward" value="<?php echo $reward; ?>" />

        <input type="hidden" name="next" value="reward" />

        &nbsp;

        <input type="submit" value="<?php echo $button_reward; ?>" class="button" />

      </form>

    </div>

    <div id="shipping" class="content" style="display: <?php echo ($next == 'shipping' ? 'block' : 'none'); ?>;">

      <p><?php echo $text_shipping_detail; ?></p>

      <table>

        <tr>

          <td><span class="required">*</span> <?php echo $entry_country; ?></td>

          <td><select name="country_id">

              <option value=""><?php echo $text_select; ?></option>

              <?php foreach ($countries as $country) { ?>

              <?php if ($country['country_id'] == $country_id) { ?>

              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>

              <?php } else { ?>

              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>

              <?php } ?>

              <?php } ?>

            </select></td>

        </tr>

        <tr>

          <td><span class="required">*</span> <?php echo $entry_zone; ?></td>

          <td><select name="zone_id">

            </select></td>

        </tr>

        <tr>

          <td><span id="postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></td>

          <td><input type="text" name="postcode" value="<?php echo $postcode; ?>" /></td>

        </tr>

      </table>

      <input type="button" value="<?php echo $button_quote; ?>" id="button-quote" class="button" />

    </div>

  </div>

  <?php } ?>
   
  <div class="subtotal cf">
    <ul>
       <?php foreach ($totals as $total) { ?>
      <li class="totalRow"><span class="label"><?php echo $total['title']; ?></span><span class="value"><?php echo $total['text']; ?></span></li>
      
              <?php } ?>
      <li class="totalRow"><a href="<?php echo $checkout; ?>" class="btn continue">Checkout</a></li>
      
    </ul>
  </div>
      <?php echo $content_bottom; ?>
</div>
</div>

        </div>
































       <!-- container closed -->
     

     <!-- Footer -->
    <!-- /.container --> 
	<script>
    $(window).scroll(function() {
    if($(this).scrollTop()>5) {
        $( ".navbar-me" ).addClass("fixed-me");
    } else {
        $( ".navbar-me" ).removeClass("fixed-me");
    }
});
</script>
  <script>
    $(document).ready(function(){
       
        if($(window).width() > 480)
        {
            $("#filterPanel").removeClass("collapse");
        }
        else
        {
            $("#filterPanel").addClass("collapse");
        }
    });
    </script>
   <script>
   $(document).ready(function()
{
    var navItems = $('.admin-menu li > a');
    var navListItems = $('.admin-menu li');
    var allWells = $('.admin-content');
    var allWellsExceptFirst = $('.admin-content:not(:first)');
    
    allWellsExceptFirst.hide();
    navItems.click(function(e)
    {
        e.preventDefault();
        navListItems.removeClass('active');
        $(this).closest('li').addClass('active');
        
        allWells.hide();
        var target = $(this).attr('data-target-id');
        $('#' + target).show();
    });
});
   </script>
<script src="catalog/view/theme/default/js/pro_image.js"></script>
    <script src="catalog/view/theme/default/js/darkbox.js"></script>
    <?php echo $footer; ?>
<script type="text/javascript"><!--

$('input[name=\'next\']').bind('change', function() {

	$('.cart-module > div').hide();

	

	$('#' + this.value).show();

});

//--></script>

<?php if ($shipping_status) { ?>

<script type="text/javascript"><!--

$('#button-quote').live('click', function() {

	$.ajax({

		url: 'index.php?route=checkout/cart/quote',

		type: 'post',

		data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),

		dataType: 'json',		

		beforeSend: function() {

			$('#button-quote').attr('disabled', true);

			$('#button-quote').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');

		},

		complete: function() {

			$('#button-quote').attr('disabled', false);

			$('.wait').remove();

		},		

		success: function(json) {

			$('.success, .warning, .attention, .error').remove();			

						

			if (json['error']) {

				if (json['error']['warning']) {

					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

					

					$('.warning').fadeIn('slow');

					

					$('html, body').animate({ scrollTop: 0 }, 'slow'); 

				}	

							

				if (json['error']['country']) {

					$('select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');

				}	

				

				if (json['error']['zone']) {

					$('select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');

				}

				

				if (json['error']['postcode']) {

					$('input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');

				}					

			}

			

			if (json['shipping_method']) {

				html  = '<h2><?php echo $text_shipping_method; ?></h2>';

				html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';

				html += '  <table class="radio">';

				

				for (i in json['shipping_method']) {

					html += '<tr>';

					html += '  <td colspan="3"><b>' + json['shipping_method'][i]['title'] + '</b></td>';

					html += '</tr>';

				

					if (!json['shipping_method'][i]['error']) {

						for (j in json['shipping_method'][i]['quote']) {

							html += '<tr class="highlight">';

							

							if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {

								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';

							} else {

								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';

							}

								

							html += '  <td><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</label></td>';

							html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['text'] + '</label></td>';

							html += '</tr>';

						}		

					} else {

						html += '<tr>';

						html += '  <td colspan="3"><div class="error">' + json['shipping_method'][i]['error'] + '</div></td>';

						html += '</tr>';						

					}

				}

				

				html += '  </table>';

				html += '  <br />';

				html += '  <input type="hidden" name="next" value="shipping" />';

				

				<?php if ($shipping_method) { ?>

				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button" />';	

				<?php } else { ?>

				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button" disabled="disabled" />';	

				<?php } ?>

							

				html += '</form>';

				

				$.colorbox({

					overlayClose: true,

					opacity: 0.5,

					width: '600px',

					height: '400px',

					href: false,

					html: html

				});

				

				$('input[name=\'shipping_method\']').bind('change', function() {

					$('#button-shipping').attr('disabled', false);

				});

			}

		}

	});

});

//--></script> 

<script type="text/javascript"><!--

$('select[name=\'country_id\']').bind('change', function() {

	$.ajax({

		url: 'index.php?route=checkout/cart/country&country_id=' + this.value,

		dataType: 'json',

		beforeSend: function() {

			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');

		},

		complete: function() {

			$('.wait').remove();

		},			

		success: function(json) {

			if (json['postcode_required'] == '1') {

				$('#postcode-required').show();

			} else {

				$('#postcode-required').hide();

			}

			

			html = '<option value=""><?php echo $text_select; ?></option>';

			

			if (json['zone'] != '') {

				for (i = 0; i < json['zone'].length; i++) {

        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';

	    			

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {

	      				html += ' selected="selected"';

	    			}

	

	    			html += '>' + json['zone'][i]['name'] + '</option>';

				}

			} else {

				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';

			}

			

			$('select[name=\'zone_id\']').html(html);

		},

		error: function(xhr, ajaxOptions, thrownError) {

			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);

		}

	});

});



$('select[name=\'country_id\']').trigger('change');

//--></script>

<?php } ?>
